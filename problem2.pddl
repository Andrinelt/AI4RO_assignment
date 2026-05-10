(define (problem timed-filling) (:domain beverage-capacity-plus)

(:objects 
    kettle1 - kettle
    beverage1 - beverage
)

(:init
    (= (current-volume kettle1) 0)
    (= (max-volume kettle1) 500)
    (= (prepared-volume beverage1) 0)
    (= (fill-rate kettle1) 100)
)

(:goal (and
    (>= (prepared-volume beverage1) 1000)
    (not (overflowed kettle1))
))

)