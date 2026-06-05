(define (domain beverage-discrete)
  (:requirements :strips :typing :numeric-fluents )

  (:types 
    appliance beverage - object
    kettle coffee-maker - appliance
    tea coffee - beverage
  )

  (:predicates
    (heated ?a - appliance)
    (make ?a - appliance ?b - beverage)
    (tap-in-use)
    (fill-appliance ?a - appliance)
  )

  (:functions
    (current-portions ?a - appliance)
    (max-portions ?a - appliance)
    (beverage-portions ?b - beverage)
  )

  (:action start-fill
      :parameters (?a - appliance)
      :precondition (and (not (tap-in-use)) (not (heated ?a)))
      :effect (and 
        (tap-in-use)
        (fill-appliance ?a)
      )
  )
  
  (:action fill-portion
    :parameters (?a - appliance)
    :precondition (and
      (fill-appliance ?a)
      (< (current-portions ?a) (max-portions ?a))
    )
    :effect (and
      (increase (current-portions ?a) 1)
    )
  )

  (:action stop-fill
      :parameters (?a - appliance)
      :precondition (and (>= (current-portions ?a) (max-portions ?a)) (fill-appliance ?a))
      :effect (and
        (not (fill-appliance ?a)) 
        (not (tap-in-use))
      )
  )
  

  (:action heat
    :parameters (?a - appliance)
    :precondition (and
      (not (heated ?a))
      (> (current-portions ?a) 0)
      (not (fill-appliance ?a)) 
    )
    :effect (and (heated ?a))
  )

  (:action prepare-serving-portion
      :parameters (?a - appliance ?b - beverage)
      :precondition (and (heated ?a) (make ?a ?b) (> (current-portions ?a) 0))
      :effect (and 
        (increase (beverage-portions ?b) 1)
        (decrease (current-portions ?a) 1)
      )
  )

  (:action done-preparing
    :parameters (?a - appliance ?b - beverage)
    :precondition (and (heated ?a) (= (current-portions ?a) 0) (make ?a ?b))
    :effect (not (heated ?a))
)

  
)