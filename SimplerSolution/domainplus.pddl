; (define (domain beverage-timed)
;   (:requirements :strips :typing :numeric-fluents :time :continuous-effects :negative-preconditions)

;   (:types 
;     appliance beverage - object
;     kettle coffee-maker - appliance
;     tea coffee - beverage
;   )

;   (:predicates
;     (tap-on ?a - appliance)
;     (heated ?a - appliance)
;     (overflowed ?a - appliance)
;     (make ?a - appliance ?b - beverage)
;     (tap-in-use)
;   )

;   (:functions
;     (current-volume ?a - appliance)
;     (max-volume ?a - appliance)
;     (fill-rate ?a - appliance)
;     (prepared-volume ?b - beverage)
;     (safe-volume ?a - appliance)
;   )

;   (:action start-fill
;     :parameters (?a - appliance)
;     :precondition (and
;       (not (tap-on ?a))
;       (not (overflowed ?a))
;       (not (heated ?a))
;       (<= (current-volume ?a) (safe-volume ?a))
;       (not (tap-in-use))
;     )
;     :effect (and (tap-on ?a) (tap-in-use))
;   )

;   (:process filling
;     :parameters (?a - appliance)
;     :precondition (and (tap-on ?a))
;     :effect (and
;       (increase (current-volume ?a) (* #t (fill-rate ?a)))
;     )
;   )

;   (:event filled
;     :parameters (?a - appliance)
;     :precondition (and
;       (tap-on ?a)
;       (>= (current-volume ?a) (safe-volume ?a))
;     )
;     :effect (and (not (tap-on ?a)) (not (tap-in-use)))
;   )

;   (:event overflow
;     :parameters (?a - appliance)
;     :precondition (and
;       (tap-on ?a)
;       (> (current-volume ?a) (max-volume ?a))
;     )
;     :effect (and (overflowed ?a))
;   )

;   (:action heat
;       :parameters (?a - appliance)
;       :precondition (and (not (heated ?a)) (>= (current-volume ?a) (safe-volume ?a)))
;       :effect (and 
;         (heated ?a)
;       )
;   )
  

;   (:action prepare
;     :parameters (?a - appliance ?b - beverage)
;     :precondition (and
;       ;(not (tap-on ?a))
;       (not (overflowed ?a))
;       (heated ?a)
;       (>= (current-volume ?a) (safe-volume ?a))
;       (make ?a ?b)
;     )
;     :effect (and
;       (not (heated ?a))
;       (increase (prepared-volume ?b) (current-volume ?a))
;       (assign (current-volume ?a) 0)
;     )
;   )
; )

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
    (overflowed ?a - appliance)
    (make ?a - appliance ?b - beverage)
    (tap-in-use)
    (filled ?a)
  )

  (:functions
    (current-volume ?a - appliance)
    (max-volume ?a - appliance)
    (fill-rate ?a - appliance)
    (prepared-volume ?b - beverage)
    (safe-volume ?a - appliance)
  )

  (:action start-fill
    :parameters (?a - appliance)
    :precondition (and
      (not (tap-on ?a))
      (not (overflowed ?a))
      (not (heated ?a))
      (not (tap-in-use))
      (not (filled ?a))
    )
    :effect (and (tap-on ?a) (tap-in-use))
  )

  (:process filling
    :parameters (?a - appliance)
    :precondition (and (tap-on ?a))
    :effect (and
      (increase (current-volume ?a) (* #t (fill-rate ?a)))
    )
  )

  (:event full
    :parameters (?a - appliance)
    :precondition (and
      (tap-on ?a)
      (>= (current-volume ?a) (safe-volume ?a))
    )
    :effect (and (not (tap-on ?a)) (not (tap-in-use)) (filled ?a))
  )

  (:event overflow
    :parameters (?a - appliance)
    :precondition (and
      (tap-on ?a)
      (> (current-volume ?a) (max-volume ?a))
    )
    :effect (and (overflowed ?a))
  )

  (:action heat
      :parameters (?a - appliance)
      :precondition (and (not (heated ?a)) (filled ?a))
      :effect (and 
        (heated ?a)
      )
  )
  

  (:action prepare
    :parameters (?a - appliance ?b - beverage)
    :precondition (and
      ;(not (tap-on ?a))
      (not (overflowed ?a))
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