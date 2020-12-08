(define (problem auto_warehouse_easy)
  (:domain auto_warehouse)
  (:objects
    p1 p2 p3 - pallet
    robot1 robot2 - agent
    x1 x2 - initial 
    Loc1 Loc2 Loc3 - pickup
    Loc4 Loc5 Loc6 - dropoff
  )
  (:init (at p1 Loc1) (at p2 Loc2) (at p3 Loc3)
         (at robot1 x1) (at robot2 x2) 
         (avail robot1) (avail robot2) 
         (avail p1) (avail p2) (avail p3) 
  )
  (:goal (and (at p1 Loc4) (at p2 Loc5) (at p3 Loc6)) 
  )
)
