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
  )

  (:functions
    (current-portions ?a - appliance)
    (max-portions ?a - appliance)
    (beverage-portions ?b - beverage)
  )

  (:action fill-portion
    :parameters (?a - appliance)
    :precondition (and
      (not (heated ?a))
      (< (current-portions ?a) (max-portions ?a))
    )
    :effect (and
      (increase (current-portions ?a) 1)
    )
  )

  (:action heat
    :parameters (?a - appliance)
    :precondition (and
      (not (heated ?a))
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

  (:action refill-portion
      :parameters (?a - appliance ?b - beverage)
      :precondition (and 
        (heated ?a)
        (make ?a ?b)
        (< (current-portions ?a) 1)
      )
      :effect (and 
        (not (heated ?a))
        (increase (current-portions ?a) 1)
      )
  )
  
)