; Using mid-point theorem to search for roots of a given function.
(define (mid-point-search f a b tolerance)
  (define (average x y) (/ (+ x y) 2))
  (define (distance x y) (abs (- x y)))

  (let ((mid-point (average a b)))
    (cond
      ((< (distance mid-point a) tolerance) mid-point)
      ((< (* (f a) (f mid-point)) 0) (mid-point-search f a mid-point tolerance))
      (else (mid-point-search f mid-point b tolerance)))))

(define (search f a b)
  (let ((fa (f a)) (fb (f b)) (tolerance 0.00001))
    (cond
      ((and (positive? fa) (negative? fb)) (mid-point-search f a b tolerance))
      ((and (negative? fa) (positive? fb)) (mid-point-search f a b tolerance))
      (else (error "No roots")))))
