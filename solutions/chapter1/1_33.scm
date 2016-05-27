(load "prime.scm")

(define (filtered-accumulate combiner filter null-value term a next b)
  (define (accumulate-iter a result)
    (if (> a b)
      result
      (accumulate-iter
        (next a)
        (combiner (if (filter a) a null-value) result))))
  (accumulate-iter a null-value))

(define (sum-primes a b)
  (define (inc x) (+ x 1))
  (define (identity x) x)
  (define (combiner x y) (+ x y))
  (filtered-accumulate combiner prime? 0 identity a inc b))

(define (product-primes n)
  (define (inc x) (+ x 1))
  (define (identity x) x)
  (define (combiner x y) (* x y))
  (define (relative-prime? x) (= (gcd x n) 1))
  (filtered-accumulate combiner relative-prime? 1 identity 1 inc n))
