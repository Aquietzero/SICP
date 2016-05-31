(load "1_37.scm")

(define (e)
  (define n (lambda (i) 1.0))
  (define d (lambda (i)
    (if (= (modulo i 3) 1)
      (* 2 (+ (/ (- i 1) 3) 1))
      1)))
  (+ 2 (cont-frac n d 1000)))

(e)
