; The general Newton iteration has the following form:
;
;       x[k+1] = x[k] - f(x[k]) / f'(x[k])
;
; So in the calculation of cubic root, we are actually finding
; the root of function f(x) = x^3 - A, where A is the number
; whose cubic root we are pursuing.
;
;       f'(x) = 3x^2
;       x[k+1] = x[k] - f(x[k]) / f'(x[k])
;              = x[k] - (x[k]^3 - A) / 3x[k]^2
;              = (2x[k]^3 - A) / 3x[k]^2

(define accuracy 0.001)

(define (square x) (* x x))

; cubic root of x.
(define (cubic-root x)

  ; cubic root iteration
  (define (cubic-root-iter guess prev-guess)
    (if (good-enough? guess prev-guess)
      guess
      (cubic-root-iter (improve guess) guess)))

  ; test to see if the guess if good enough.
  (define (good-enough? guess prev-guess)
    (< (/ (abs (- guess prev-guess))
          guess)
       accuracy))

  ; Newton iteration.
  (define (improve guess)
    (/ (+ (/ x (square guess))
          (* 2 guess))
       3))

  (cubic-root-iter 1.0 0))
