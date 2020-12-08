; Guy - ECE final project v4
; minimizes total length of all the robots based on the length of
; each action. this means that we need to encode the path length
; of each combination (loc(i)->loc(j), loc(j)->loc(i) for all connected i,j) in the task file.
; it does not take into any account the reactive nature which might elongate the path.
; encode unconnected two points with a ridiculously large cost.

(define (domain auto_warehouse)

;; Defining options for the planning system
(:requirements :adl :typing :action-costs)

;; Defining types
(:types
  forklift_a forklift_b - agent
  nodes - location
  pallet_a pallet_b - pallet
  pallet agent - physobj
  physobj operation location - object
  )

; just dummy for stopping
(:constants
      stop - operation
  )
(:functions
    (distance ?from ?to)
    (total-cost)
  )
(:predicates
    ;location of a robot or package. Either initial, pickup or dropoff
    (at ?obj - physobj ?loc - location)
    ;is a certain pallet on a certain robot?
    (on ?pkg - pallet ?robot - agent)
    ;can we use this forklift or this package
    (avail ?obj - physobj )
    ;the essentially creates the graph of the roadmap
    (connected ?x - location ?y - location)
  )

;just moves the robot between places
(:action move
    :parameters (?robot - agent ?from - location ?to - location)
    :precondition (and (at ?robot ?from) (connected ?from ?to) )
    :effect (and (at ?robot ?to) (not (at ?robot ?from)) (increase (total-cost) (distance ?from ?to)))
  )
;pickup a pallet if robot is at the location of the pallet and it's capacity
;is allowing
(:action load
    :parameters (?robot - agent ?unit - pallet ?loc - location)
    :precondition (and (avail ?robot) (avail ?unit)
                       (at ?robot ?loc) (at ?unit ?loc ) )
    :effect (and (not (avail ?unit)) (not (avail ?robot))
                 (on ?unit ?robot) (not (at ?unit ?loc ))
                 (increase (total-cost) 1))
  )

(:action unload
    :parameters   (?robot - agent ?unit - pallet ?loc - location)
    :precondition (and (at ?robot ?loc) (on ?unit ?robot) )
    :effect       (and (not (on ?unit ?robot)) (at ?unit ?loc) (avail ?robot)
                  (increase (total-cost) 1))
  )
)

