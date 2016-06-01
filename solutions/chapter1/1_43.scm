(load "1_42.scm")

(define (repeated f n)
  (if (= n 1)
    (lambda (x) (f x))
    (compose f (repeated f (- n 1)))))

((repeated square 2) 5) ; => 625
