(load "2_7.scm")

; The reason is that the result of the sum or difference between
; 2 given intervals is the linear combination of them.
(define a (make-interval -3 6))
(define b (make-interval 7 9))

(= (interval-width (add-interval a b))
   (+ (interval-width a) (interval-width b)))
(= (interval-width (sub-interval a b))
   (+ (interval-width a) (interval-width b)))
