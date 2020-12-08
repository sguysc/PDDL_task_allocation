; Guy - ECE final project

(define (domain auto_warehouse)

;; Defining options for the planning system    :adl
(:requirements :adl :typing)

;; Defining types
(:types
  forklift_a forklift_b - agent
  initial pickup dropoff - location
  pallet_a pallet_b - pallet
  pallet agent - physobj
  physobj operation location - object
)

; just dummy for stopping
(:constants
      stop - operation
)

(:predicates
    ;location of a robot or package. Either initial, pickup or dropoff
    (at ?obj - physobj ?loc - location)
    ;is a certain pallet on a certain robot?
    (on ?pkg - pallet ?robot - agent)
    ;can we use this forklift or this package
    (avail ?obj - physobj )
  )

;just moves the robot between places
(:action move
    :parameters (?robot - agent ?from - location ?to - location)
    :precondition (at ?robot ?from)
    :effect (and (at ?robot ?to) (not (at ?robot ?from)))
)

;pickup a pallet if robot is at the location of the pallet and it's capacity
;is allowing 
(:action load
    :parameters (?robot - agent ?unit - pallet ?loc - pickup)
    :precondition (and (avail ?robot) (avail ?unit)
                       (at ?robot ?loc) (at ?unit ?loc ) )
    :effect (and (not (avail ?unit)) (not (avail ?robot))
                 (on ?unit ?robot) (not (at ?unit ?loc )) )
  )

(:action unload
    :parameters   (?robot - agent ?unit - pallet ?loc - dropoff)
    :precondition (and (at ?robot ?loc) (on ?unit ?robot) )
    :effect       (and (not (on ?unit ?robot)) (at ?unit ?loc) (avail ?robot) )
  )

)
