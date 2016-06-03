(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

; (define z (cons 1 2))
; z => (lambda (m) (m 1 2))
; (car z)
; => (car ((lambda (m) (m 1 2)) (lambda (p q) p)))
; Here `(lambda (p q) p))` is as the argument `m` and passed into the
; body of the lambda function `(lambda (m) (m 1 2))`, where
;
; ((lambda (p q) p) 1 2) gives 1.
(define (cdr z)
  (z (lambda (p q) q)))

