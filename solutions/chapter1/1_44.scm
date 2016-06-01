(load "1_43.scm")

(define dx 1)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smooth f n)
  (repeated (smooth f) n))
