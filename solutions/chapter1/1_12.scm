; I found something interesting to do, which is to
; display the pascal triangle in the scheme shell.

; Print the pascal triangle.
(define (pascal n)

  (define (pascal-iter curr-line count)
    (if (not (= count n))
      (begin
        (newline)
        (print-line curr-line)
        (newline)
        (pascal-iter (+ curr-line 1) (+ count 1)))
      (newline)))

  (define (print-line curr-line)
    (define (print-line-iter n count)
      (if (= count n)
        (display 1)
        (begin
          (display (combination count n))
          (display "\t")
          (print-line-iter n (+ count 1)))))
    (print-line-iter curr-line 0))

  (pascal-iter 0 0))

; Calculate the combination of k out of n.
(define (combination k n)
  (if (or (= k 0) (= n k))
    1
    (+ (combination k (- n 1))
       (combination (- k 1) (- n 1)))))
