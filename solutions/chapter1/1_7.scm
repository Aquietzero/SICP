; If the number is too small, maybe even smaller than the
; given initial guess, then the procedure `good-enough?`
; can never work properly because the initial guess is good
; enough in this situation. On the other hand, if the number
; is too large, then the difference between the number and
; the guess will be ignored by accuracy.

(define accuracy 0.001)

; square of x.
(define (square x) (* x x))

; average of x and y.
(define (average x y)
  (/ (+ x y) 2))

; a better square root.
(define (better-sqrt x)

  ; main iteration.
  (define (better-sqrt-iter guess prev-guess)
    (if (good-enough? guess prev-guess)
      guess
      (better-sqrt-iter (improve guess) guess)))

  ; decide whether the current result is good enough.
  (define (good-enough? guess prev-guess)
    (< (/ (abs (- guess prev-guess)) guess) accuracy))

  ; Newton iteration.
  (define (improve guess)
    (average guess (/ x guess)))
 
  ; begin the iteration.
  (better-sqrt-iter 1.0 0))

