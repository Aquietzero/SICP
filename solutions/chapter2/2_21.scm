(define (square-list items)
  (if (null? items)
    (list)
    (cons (square (car items)) (square-list (cdr items)))))

(define (map-square-list items)
  (map (lambda (x) (square x)) items))
