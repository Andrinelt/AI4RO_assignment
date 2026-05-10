;Header and description

(define (domain beverage-capacity)

;remove requirements that are not needed
  (:requirements :strips :typing :numeric-fluents)
(:types 
    kettle
    beverage
)

; un-comment following line if constants are needed
;(:constants )

(:predicates 
    (heated ?k - kettle)
)

(:functions
    (current-volume ?k - kettle)
    (max-volume ?k - kettle)
    (prepared-volume ?b - beverage)
)



(:action fill-kettle
    :parameters (?k - kettle)
    :precondition (and (= (current-volume ?k) 0))
    :effect (and 
        (assign (current-volume ?k) (max-volume ?k))
    )
)

(:action heat-kettle
    :parameters (?k - kettle)
    :precondition (and (> (current-volume ?k) 0))
    :effect (and 
        (heated ?k)
    )

)

(:action prepare-beverage
    :parameters (?k - kettle ?b - beverage)
    :precondition (and (heated ?k) (> (current-volume ?k) 0))
    :effect (and 
        (increase (prepared-volume ?b) (current-volume ?k))
        (assign (current-volume ?k) 0)
        (not (heated ?k))
    )
)


;define actions here

)