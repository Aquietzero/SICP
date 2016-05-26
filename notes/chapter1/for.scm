
(define (for n iteration result)
  (define (for-iter n counter result)
    (if (= n counter)
      result
      (for-iter n (+ counter 1) (iteration counter result))))
  (for-iter n 0 result))

(define (fac n)
  (define (product counter result) (* counter result))
  (for n (product) 1))
