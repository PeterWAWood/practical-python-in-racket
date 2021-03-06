#lang racket

(define principal 500000.0)
(define rate 0.05)
(define payment 2684.11)
(define total-paid 0.0)
(define number-months 0)
(define extra-payment-start-month 61)
(define extra-payment-end-month 108)
(define extra-payment 1000)

(define (pay)
  (cond
    [(<= principal 0) total-paid]
    [else (set! number-months (add1 number-months))
          (set! principal
                (- (* principal (+ 1 (/ rate 12)))
                   payment))
          (set! total-paid (+ total-paid payment))
          (when (and (>= number-months extra-payment-start-month)
                     (<= number-months extra-payment-end-month))
            (set! total-paid (+ total-paid extra-payment))
            (set! principal (- principal extra-payment)))
          (pay)]))

(display "Total paid ")
(display (pay))
(display " in ")
(display number-months)
(displayln " months.")