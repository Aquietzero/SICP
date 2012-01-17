; recursive version
(define (fr n)
  (if (< n 3) 
    n 
    (+ (fr (- n 1))
       (* 2 (fr (- n 2)))
       (* 3 (fr (- n 3))))))

; iteration version
(define (fi n)

  (define (fi-iter a b c n)
    (if (= n 0)
      a
      (fi-iter b c (+ c (* 2 b) (* 3 a)) (- n 1))))

  (fi-iter 0 1 2 n))
