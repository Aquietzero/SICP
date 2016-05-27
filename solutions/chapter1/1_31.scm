; General product procedure.
(define (product-recursive term a next b)
  (if (> a b)
    1
    (* (term a)
       (product-recursive term (next a) next b))))

(define (product-iterative term a next b)
  (define (product-iter a result)
    (if (> a b)
      result
      (product-iter (next a) (* result (term a)))))
  (product-iter a 1))

(define product product-iterative)

(define (factorial a b)
  (define (inc x) (+ x 1))
  (define (identity x) x)
  (product identity a inc b))

(define (pi-product n)
  (define (term x) (/ (- (square x) 1.0) (square x)))
  (define (next x) (+ x 2))
  (* 4 (product term 3 next n)))

(define pi (pi-product 1000000))
