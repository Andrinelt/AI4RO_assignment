(define (domain beverage-timed)
  (:requirements :strips :typing :numeric-fluents :time :continuous-effects :negative-preconditions)

  (:types 
    appliance beverage - object
    kettle coffee-maker - appliance
    tea coffee - beverage
  )

  (:predicates
    (tap-on ?a - appliance)
    (heated ?a - appliance)
    (make ?a - appliance ?b - beverage)
    (tap-in-use)
    (filled ?a - appliance)
  )

  (:functions
    (current-volume ?a - appliance)
    (max-volume ?a - appliance)
    (fill-rate ?a - appliance)
    (prepared-volume ?b - beverage)
  )

  (:action start-fill
    :parameters (?a - appliance)
    :precondition (and
      (not (tap-on ?a))
      (not (heated ?a))
      (not (tap-in-use))
      (not (filled ?a))
    )
    :effect (and 
    (tap-on ?a) 
    (tap-in-use)
    )
  )

  (:process filling
    :parameters (?a - appliance)
    :precondition (and (tap-on ?a))
    :effect (and
      (increase (current-volume ?a) (* #t (fill-rate ?a)))
    )
  )
  
  (:event overflow
    :parameters (?a - appliance)
    :precondition (and
      (tap-on ?a)
      (>= (current-volume ?a) (max-volume ?a))
    )
    :effect (and 
      (not (tap-on ?a)) 
      (not (tap-in-use)) 
      (filled ?a)
      (assign (current-volume ?a) (max-volume ?a))
    )
  )

  (:action heat
      :parameters (?a - appliance)
      :precondition (and 
        (not (heated ?a)) 
        (filled ?a) 
      )
      :effect (and 
        (heated ?a)
      )
  )

  (:action prepare
    :parameters (?a - appliance ?b - beverage)
    :precondition (and
      (heated ?a)
      (filled ?a)
      (make ?a ?b)
    )
    :effect (and
      (not (heated ?a))
      (not (filled ?a))
      (increase (prepared-volume ?b) (current-volume ?a))
      (assign (current-volume ?a) 0)
    )
  )
)