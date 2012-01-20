(define (double x) (* x 2))
(define (halve  x) (/ x 2))

(define (fast-mul a b)
  (define (fast-mul-iter a b n)
    (cond ((= b 0) n)
          ((even? b) (fast-mul-iter (double a) (halve b) n))
          (else (fast-mul-iter a (- b 1) (+ n a)))))
  (fast-mul-iter a b 0))
