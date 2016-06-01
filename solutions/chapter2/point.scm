(define (point x y) (cons x y))
(define (point-x p) (car p))
(define (point-y p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (point-x p))
  (display ",")
  (display (point-y p))
  (display ")"))
