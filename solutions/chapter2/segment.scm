(load "point.scm")

(define (seg p1 p2) (cons p1 p2))
(define (seg-p1 s) (car s))
(define (seg-p2 s) (cdr s))

(define (mid-point s)
  (point (/ (+ (point-x (seg-p1 s)) (point-x (seg-p2 s))) 2)
         (/ (+ (point-y (seg-p1 s)) (point-y (seg-p2 s))) 2)))

(define (seg-length s)
  (let ((delta-x (- (point-x (seg-p1 s)) (point-x (seg-p2 s))))
        (delta-y (- (point-y (seg-p1 s)) (point-y (seg-p2 s)))))
  (sqrt (+ (square delta-x) (square delta-y)))))
