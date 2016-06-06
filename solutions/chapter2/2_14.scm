(load "2_07.scm")

; r1r2 / (r1 + r2)
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

; 1 / (1/r1 + 1/r2)
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one
      (add-interval (div-interval one r1)
                    (div-interval one r2)))))


(define a (make-interval 3 4))
(print-interval (par1 a a))
;   (3, 4) * (3, 4) / ((3, 4) + (3, 4))
;   (9, 16) / (6, 8)
;   (9, 16) * (1/8, 1/6)
;   (9/8, 16/6)
;   (1.125, 2.667)
(print-interval (par2 a a))
;   (1, 1) / ((1, 1) / (3, 4) + (1, 1) / (3, 4))
;   (1, 1) / ((1/4, 1/3) + (1/4, 1/3))
;   (1, 1) / (1/2, 2/3)
;   (3/2, 2)
;   (1.5, 2)


(define b (make-center-percent 3 (/ 1 3)))
(print-interval (par1 b b))
(print-interval (par2 b b))
