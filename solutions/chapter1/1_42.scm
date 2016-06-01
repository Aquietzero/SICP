(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (+ x 1))

; => 49
((compose square inc) 6)
