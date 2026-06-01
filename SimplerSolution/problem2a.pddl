(define (problem sufficient-capacity-tea-plus) (:domain beverage-timed)
  (:objects 
    kettle1 - appliance 
    tea1 - beverage
  )
  (:init
    (= (max-volume kettle1) 500)
    (= (current-volume kettle1) 0)
    (= (prepared-volume tea1) 0)
    (= (fill-rate kettle1) 50)
    (make kettle1 tea1)
  )
  (:goal (and
      (>= (prepared-volume tea1) 300)
      
    )
  )
)