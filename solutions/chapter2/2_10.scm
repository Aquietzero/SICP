(load "2_7.scm")

(define a (make-interval 4 6))
(define b (make-interval 2 2))

(print-interval (div-interval a b))
