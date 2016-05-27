; A more general accumulation process.
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iterative combiner null-value term a next b)
  (define (accumulate-iter a result)
    (if (> a b)
      result
      (accumulate-iter (next a) (combiner a result))))
  (accumulate-iter a null-value))

(define (sum term a next b)
  (define (combiner a b) (+ a b))
  (accumulate-iterative combiner 0 term a next b))

(define (product term a next b)
  (define (combiner a b) (* a b))
  (accumulate combiner 1 term a next b))


(define (sum-integers a b)
  (define (inc x) (+ x 1))
  (define (identity x) x)
  (sum identity a inc b))

