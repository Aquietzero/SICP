(load "rectangle.scm")

(define r1 (rectangle
  (seg (point 0 0) (point 4 3))
  (seg (point 0 0) (point -6 8))))

(rectangle-perimeter r1) ; => 30
(rectangle-area r1) ; => 50
