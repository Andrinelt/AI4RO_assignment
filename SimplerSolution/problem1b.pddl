(define (problem insufficient-capacity-tea) (:domain beverage-simple)
  (:objects 
    kettle1 - kettle 
    tea1 - tea
    coffee-maker1 - coffee-maker
    coffee1 - coffee
  )
  (:init
    (= (max-volume kettle1) 500)
    (= (current-volume kettle1) 0)
    (= (beverage-volume tea1) 0)
    (= (max-volume coffee-maker1) 500)
    (= (current-volume coffee-maker1) 0)
    (= (beverage-volume coffee1) 0)
    (make kettle1 tea1)
    (make coffee-maker1 coffee1)

  )
  (:goal (and
      (>= (beverage-volume tea1) 700)
      (>= (beverage-volume coffee1) 700)
    )
  )
)

; It overshoots
