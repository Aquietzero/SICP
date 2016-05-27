(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m))
                     m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))


(define (carmichael? n)
  (define (carmichael-iter a)
    (cond ((= a n) #t)
          (else
            (and (try-it a)
                 (carmichael-iter (+ a 1))))))
  (define (try-it a)
    (= a (expmod a n n)))
  (carmichael-iter 1))

; All those numbers are not primes, but they can all pass the
; Fermat test, so they are carmichael numbers.
