(load "2_7.scm")

; The reason is that the result of the sum or difference between
; 2 given intervals is the linear combination of them.
(define a (make-interval -3 6))
(define b (make-interval 7 9))

(= (width (add-interval a b))
   (+ (width a) (width b)))
(= (width (sub-interval a b))
   (+ (width a) (width b)))
