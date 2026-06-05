(define (problem insufficient-capacity-discrete) (:domain beverage-discrete)
  (:objects 
    kettle1 - kettle 
    tea1 - tea
    coffee-maker1 - coffee-maker
    coffee1 - coffee
  )
  (:init
    (= (max-portions kettle1) 5)
    (= (current-portions kettle1) 0)
    (= (beverage-portions tea1) 0)
    (= (max-portions coffee-maker1) 5)
    (= (current-portions coffee-maker1) 0)
    (= (beverage-portions coffee1) 0)
    (make kettle1 tea1)
    (make coffee-maker1 coffee1)
  )
  (:goal (and
      (>= (beverage-portions tea1) 7)
      (>= (beverage-portions coffee1) 7)
    )
  )
)