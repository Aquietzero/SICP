; General sum.
;
; (define (<name> a b)
;   (if (> a b)
;     0
;     (+ (<term> a)
;        (<name> (<next> a) b))))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (sum-cubes a b)
  (define (cube n) (* n n n))
  (define (inc n) (+ n 1))
  (sum cube a inc b))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(define pi (* 8 (pi-sum 1 100000)))
