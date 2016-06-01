(load "newtons_method.scm")

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

(define (cubic-root a b c)
  (newtons-method (cubic a b c) 1.0))

