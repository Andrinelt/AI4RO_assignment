(define (problem insufficient-capacity-tea-coffee-plus) (:domain beverage-timed)
  (:objects 
    kettle1 - kettle 
    tea1 - tea
    coffee-maker1 - coffee-maker
    coffee1 - coffee
  )
  (:init
    (= (max-volume kettle1) 500)
    (= (current-volume kettle1) 0)
    (= (prepared-volume tea1) 0)
    (= (safe-volume kettle1) 450)
    (= (fill-rate kettle1) 50)
    (= (max-volume coffee-maker1) 500)
    (= (current-volume coffee-maker1) 0)
    (= (prepared-volume coffee1) 0)
    (= (safe-volume coffee-maker1) 450)
    (= (fill-rate coffee-maker1) 50)
    (make kettle1 tea1)
    (make coffee-maker1 coffee1)
    (not (tap-in-use))
  )
  (:goal (and
      (>= (prepared-volume tea1) 700)
      (not (overflowed kettle1))
      (>= (prepared-volume coffee1) 400)
      (not (overflowed coffee-maker1))
    )
  )
)