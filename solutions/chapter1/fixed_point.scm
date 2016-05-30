; Using continue guess to approximate fix point for given function.
;
; f(x) -> x
;
; Guesses: f(x), f(f(x)), ... , f^n(x)
(define (fixed-point f guess)
  (define (distance x y) (abs (- x y)))
  (define tolerance 0.0000001)
  (define (fixed-point-iter guess)
    (let ((next (f guess)))
      (if (< (distance guess (f guess)) tolerance) next (fixed-point-iter next))))
  (fixed-point-iter guess))

