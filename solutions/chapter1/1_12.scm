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


(define (beautiful-pascal n)
  ; Display n tabs.
  (define (n-tabs n)
    (if (not (= n 0))
      (begin (display "\t") (n-tabs (- n 1)))))

  ; Generate a single pascal element in a line.
  (define (gen-element k n)
    (begin
      (display (combination k n))
      (display "\t\t")))

  ; Generate a single pascal line in a triangle.
  (define (gen-line nth-line)
    (define (gen-line-iter nth-element)
      (if (not (= (+ nth-line 1) nth-element))
        (begin
          (gen-element nth-element nth-line)
          (gen-line-iter (+ nth-element 1)))))
    (gen-line-iter 0))

  (define (pascal-iter nth-line)
    (if (not (= nth-line n))
      (begin
        (newline)
        (n-tabs (- n nth-line))
        (gen-line nth-line)
        (newline)
        (pascal-iter (+ nth-line 1)))))

  (pascal-iter 0))


; Calculate the combination of k out of n.
(define (combination k n)
  (if (or (= k 0) (= n k))
    1
    (+ (combination k (- n 1))
       (combination (- k 1) (- n 1)))))
