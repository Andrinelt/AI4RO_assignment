(define (domain beverage-capacity-plus)

;remove requirements that are not needed
  (:requirements
    :strips
    :typing
    :negative-preconditions
    :numeric-fluents
    :durative-actions
    :continuous-effects
  )

(:types kettle beverage
)


(:predicates
    (heated ?k - kettle)
    (tap-on ?k - kettle)
    (overflowed ?k - kettle)
)


(:functions
    (current-volume ?k - kettle)
    (max-volume ?k - kettle)
    (prepared-volume ?b - beverage)
    (fill-rate ?k - kettle)
)

(:action start-filling
    :parameters (?k - kettle)
    :precondition (and (not (overflowed ?k)) (not (tap-on ?k)))
    :effect (and 
        (tap-on ?k)    
    )
)

(:action stop-filling
    :parameters (?k - kettle)
    :precondition (and (tap-on ?k))
    :effect (and 
        (not (tap-on ?k))
    )
)

(:process filling
    :parameters (?k - kettle )
    :precondition (and
        (tap-on ?k); activation condition
    )
    :effect (and
        (increase (current-volume ?k) (* #t (fill-rate ?k))); continuous effect(s)
    )
)

(:event overflow
    :parameters (?k - kettle)
    :precondition (and
        (> (current-volume ?k) (max-volume ?k)); trigger condition
    )
    :effect (and
        (overflowed ?k); discrete effect(s)
    )
)

(:action heat-kettle
    :parameters (?k - kettle)
    :precondition (and 
        (not (overflowed ?k)) 
        (not (tap-on ?k)) 
        (> (current-volume ?k) 0) 
        (<= (current-volume ?k) (max-volume ?k)))
    :effect (and 
        (heated ?k)
    )
)

(:action prepare-beverage
    :parameters (?k - kettle ?b - beverage)
    :precondition (and (heated ?k) (not (overflowed ?k)) (> (current-volume ?k) 0))
    :effect (and
        (increase (prepared-volume ?b) (current-volume ?k))
        (not (heated ?k))
        (assign (current-volume ?k) 0)

    )
)



)