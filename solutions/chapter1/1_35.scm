; Using x -> 1 + 1/x to approximate the golden ratio.
;
; golden-ratio = (1 + √5) / 2
;
; f(x) = 1 + 1/x = x
; x² - x + 1 = 0, whose root is the golden-ratio.
(load "fixed_point.scm")

(define (golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
