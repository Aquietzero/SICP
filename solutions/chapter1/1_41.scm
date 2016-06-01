(define (inc x) (+ x 1))

(define (double f)
  (lambda (x) (f (f x))))

; double executes 2^n times. So the increase is 2 * 2^n. The first 2 is the result of
; a `double` and 2^n is the execution times.
(((double (double double)) inc) 5) ; 5 + 2 * 2^3 = 21

