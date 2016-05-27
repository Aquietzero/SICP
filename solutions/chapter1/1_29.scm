; Numerical integration with Simpson's Rule.
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum term (next a) next b))))

(define (integral f a b n)
  (define (inc x) (+ x 1))
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (iter k) (* (y k) (if (even? k) 2 4)))
  (* (/ h 3) (+ (y 0) (y n) (sum iter 1 inc (- n 1)))))

(define (cube n) (* n n n))
(define (integral-cube a b n) (integral cube a b n))

; (integral-cube 0 1 100) => 1/4
; (integral-cube 0 1 1000) => 1/4

