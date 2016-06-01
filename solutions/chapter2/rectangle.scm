(load "segment.scm")

(define (rectangle w l) (cons w l))
(define (rectangle-w r) (car r))
(define (rectangle-l r) (cdr r))

(define (rectangle-area r)
  (* (seg-length (rectangle-w r))
     (seg-length (rectangle-l r))))

(define (rectangle-perimeter r)
  (* 2
     (+ (seg-length (rectangle-w r))
        (seg-length (rectangle-l r)))))

