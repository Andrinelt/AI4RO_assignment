(define (domain beverage-simple)
  (:requirements :strips :typing :numeric-fluents )

  (:types 
    appliance beverage - object
    kettle coffee-maker - appliance
    tea coffee - beverage
  )

  (:predicates
    (filled ?a - appliance)
    (heated ?a - appliance)
    (make ?a - appliance ?b - beverage)
  )

  (:functions
    (current-volume ?a - appliance)
    (max-volume ?a - appliance)
    (beverage-volume ?b - beverage)
  )

  (:action fill
    :parameters (?a - appliance)
    :precondition (and
      (not (filled ?a))
      (not (heated ?a))
    )
    :effect (and
      (filled ?a)
      (assign (current-volume ?a) (max-volume ?a))
    )
  )

  (:action heat
    :parameters (?a - appliance)
    :precondition (and
      (filled ?a)
      (not (heated ?a))
    )
    :effect (and (heated ?a))
  )

  (:action prepare-serving
      :parameters (?a - appliance ?b - beverage)
      :precondition (and (filled ?a) (heated ?a) (make ?a ?b))
      :effect (and 
        (increase (beverage-volume ?b) (current-volume ?a))
        (assign (current-volume ?a) 0)
        (not (filled ?a))
        (not (heated ?a))
      )
  )
)