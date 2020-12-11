; Guy - ECE final project vD
; minimizes total length of all the robots based on the length of
; each action. this means that we need to encode the path length
; of each combination (loc(i)->loc(j), loc(j)->loc(i) for all connected i,j) in the task file.
; it does not take into any account the reactive nature which might elongate the path.
; encode unconnected two points with a ridiculously large cost.
; added feature: allow blocking with timed operations.

(define (domain auto_warehouse)

;; Defining options for the planning system
(:requirements :strips :equality :typing :durative-actions)

;; Defining types
(:types
  forklift_a forklift_b - agent
  nodes - location
  pallet_a pallet_b - pallet
  pallet agent - physobj
  physobj operation location - object
  )

;(:functions
;    (distance ?from ?to)
;    (total-cost)
  ;)

(:predicates
    ;location of a robot or package. Either initial, pickup or dropoff
    (is_at ?obj - physobj ?loc - location)
    ;is a certain pallet on a certain robot?
    (on ?pkg - pallet ?robot - agent)
    ;can we use this forklift or this package
    (avail ?obj - physobj )
    ;can we stack up more on this forklift 
    (full ?obj - agent )
    ;is this node available or not
    (occupied ?loc - location )
    ;the essentially creates the graph of the roadmap
    (connected ?x - location ?y - location)
  )

;just moves the robot between places
(:durative-action move
    :parameters (?robot - agent ?from - location ?to - location)
    :duration (= ?duration 5)
    :condition (and
                  (at start (avail ?robot) )
                  (at start (is_at ?robot ?from) )
                  (at start (connected ?from ?to) )
                  (over all (not (occupied ?to)) )
               )
    :effect (and 
               (at start (not (avail ?robot)) )
               (at end (avail ?robot) )
               (at end (is_at ?robot ?to) )
               (at end (not (is_at ?robot ?from)) )
               (at end (not (occupied ?from)) )
               (at end (occupied ?to) )
            )
  )

;pickup a pallet if robot is at the location of the pallet and it's capacity
;is allowing
(:durative-action load
    :parameters (?robot - agent ?unit - pallet ?loc - location)
    :duration (= ?duration 2)
    :condition (and
                  (at start (avail ?robot) )
                  (at start (not (full ?robot)) )
                  (at start (avail ?unit) )
                  (at start (is_at ?unit ?loc) )
                  (over all (is_at ?robot ?loc) )
               )
    :effect (and 
               (at start (not (avail ?unit)) )
               (at start (not (avail ?robot)) )
               (at end (avail ?robot) )
               (at end (on ?unit ?robot) )
               (at end (full ?robot) )
               (at end (not (is_at ?unit ?loc )) )
            )
  )

(:durative-action unload
    :parameters (?robot - agent ?unit - pallet ?loc - location)
    :duration (= ?duration 2)
    :condition (and
                  (at start (avail ?robot) )
                  (at start (on ?unit ?robot) )
                  (over all (is_at ?robot ?loc) )
               )
    :effect (and 
               (at start (not (avail ?robot)) )
               (at end (avail ?unit) )
               (at end (avail ?robot) )
               (at end (not (on ?unit ?robot)) )
               (at end (not (full ?robot)) )
               (at end (is_at ?unit ?loc) )
            )
  )

)

