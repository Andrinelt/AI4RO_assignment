(define (problem sufficient-capacity) (:domain beverage-capacity)
(:objects 
    kettle1 - kettle
    beverage1 - beverage
)

(:init
    (= (current-volume kettle1) 0)
    (= (max-volume kettle1) 500)
    (= (prepared-volume beverage1) 0)
)

(:goal (and
    (>= (prepared-volume beverage1) 500)
))

)
