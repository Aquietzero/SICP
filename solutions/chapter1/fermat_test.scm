; Fermat's little theorem
;
; If n is a prime number and a is any positive integer less than n, then
; a raised to the nth power is congruent to a modulo n.
;
;   a^n 三 a (modulo n)
;
(define (expmod base exp m)
  ; Any integer raise to power 0 results 1 and 1 is the remainder for any integer divisor.
  (cond ((= exp 0) 1)
        ; Shrink a^n to a.
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fase-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fase-prime? n (- times 1)))
        (else false)))

