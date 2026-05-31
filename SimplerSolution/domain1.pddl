(define (domain beverage-simple1)
  (:requirements :strips :typing :numeric-fluents )

  (:types 
    appliance beverage - object
    kettle coffee-maker - appliance
    tea coffee - beverage

  )

  (:predicates
    (filled ?a - appliance)
    (heated ?a - appliance)
    ;(makes ?a - appliance ?b - beverage)
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

  (:action prepare-tea
      :parameters (?k - kettle ?t - tea)
      :precondition (and (filled ?k) (heated ?k))
      :effect (and 
        (increase (beverage-volume ?t) (current-volume ?k))
        (assign (current-volume ?k) 0)
        (not (filled ?k))
        (not (heated ?k))
      )
  )

    (:action prepare-coffee
      :parameters (?cm - coffee-maker ?c - coffee)
      :precondition (and (filled ?cm) (heated ?cm))
      :effect (and 
        (increase (beverage-volume ?c) (current-volume ?cm))
        (assign (current-volume ?cm) 0)
        (not (filled ?cm))
        (not (heated ?cm))
      )
  )
)