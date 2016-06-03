(load "2_7.scm")

; Actually there 2 ways to define subtraction in this situation. The most
; straight forward way is to define subtracton as the inverse of addition,
; which gives:
;
;   sub => i1 + (-i2)
;
; But according to the given situation, I would rather set subtraction as
; the largest interval possible. which is:
;
;   sub => (lower x - upper y, upper x- lower y)
;
(define a (make-interval -3 6))
(define b (make-interval 7 9))

(print-interval (sub-interval a b))
