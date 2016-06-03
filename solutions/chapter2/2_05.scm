(define (power a n)
  (cond
    ((= n 0) 1)
    ((even? n) (square (power a (/ n 2))))
    (else (* a (power a (- n 1))))))

(define (fac product base)
  (define (fac-iter product base n)
    (if (= (modulo product base) 0)
      (fac-iter (/ product base) base (+ n 1))
      n))
  (fac-iter product base 0))

; a and b are nonnegative intergers.
(define (cons a b)
  (lambda (x) (x (* (power 2 a) (power 3 b)))))

(define (car p) (p (lambda (product) (fac product 2))))
(define (cdr p) (p (lambda (product) (fac product 3))))

