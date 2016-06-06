(define (same-parity . numbers)
  (define first (car numbers))
  (define (pass? x) (= (remainder x 2) (remainder first 2)))
  (define (same-parity-iter rst numbers)
    (if (null? numbers) rst
      (if (pass? (car numbers))
        (same-parity-iter (append rst (list (car numbers))) (cdr numbers))
        (same-parity-iter rst (cdr numbers)))))
  (same-parity-iter (list) numbers))
