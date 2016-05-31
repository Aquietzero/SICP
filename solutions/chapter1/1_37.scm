; Both the recursive and iterative version of continued fraction starts
; from 0.
(define (cont-frac n d k)
  (if (= k 0)
    1
    (/
      (n (- k 1))
      (+ (d (- k 1)) (cont-frac n d (- k 1))))))

(define (cont-frac-iteration n d k)
  (define (cont-frac-iter i result)
    (if (= i 0)
      result
      (cont-frac-iter
        (- i 1)
        (/ (n (- i 1))
           (+ (d (- i 1)) result)))))
  (cont-frac-iter k 1))

; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            10000)
; => 0.6180339887498948

(define (precision-test n d)
  (define (close-enough? x y) (< (abs (- x y)) 0.0001))
  (define (precision-test-iter k)
    (let
      ((curr (cont-frac n d k))
       (next (cont-frac n d (+ k 1))))
      (if (close-enough? curr next) (+ k 1) (precision-test-iter (+ k 1)))))
  (precision-test-iter 1))

(precision-test (lambda (i) 1.0) (lambda (i) 1.0))
; => 11
