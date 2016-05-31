; Calculate tangent using continued fraction.
(load "1_37.scm")

(define (tan-cf x k)
  (define (n i) (if (= i 0) x (- 0 (square x))))
  (define (d i) (+ (* i 2) 1))
  (cont-frac n d k))

(tan-cf (/ 3.14 4) 1000)
