;(define (max a b)
;  (if (>= a b)
;    a
;    b))

(define (sum-of-max2 a b c)
  (+ (max a b) (max b c)))
