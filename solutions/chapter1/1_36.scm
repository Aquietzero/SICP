(define (average x y) (/ (+ x y) 2))

(define (fixed-point f guess)
  (define (distance x y) (abs (- x y)))
  (define tolerance 0.0000001)
  (define (fixed-point-iter guess n)
    (display guess)
    (display "\t")
    (display n)
    (newline)
    (let ((next (f guess)))
      (if (< (distance guess (f guess)) tolerance) next (fixed-point-iter next (+ n 1)))))
  (fixed-point-iter guess 0))

; x^x = 1000
; xlog(x) = log(1000)
; x = log(1000) / log(x) = f(x)

(define (xx)
  (fixed-point (lambda (x) (/ (log 1000.0) (log x))) 1.1))
; 47 iterations results in 4.555535672052776.

(define (xx-damp)
  (fixed-point (lambda (x) (average x (/ (log 1000.0) (log x)))) 1.1))
; 14 iterations results in 4.55553572431916.
