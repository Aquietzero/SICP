
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

; (expmod 3 5 5)
; (remainder (* 3 (expmod 3 4 5)) 5)
; (remainder (* 3 (remainder (square (expmod 3 2 5)) 5)) 5)
; (remainder (* 3 (remainder (square (remainder (square (expmod 3 1 5)) 5)) 5)) 5)
; (remainder (* 3 (remainder (square (remainder (square (remainder (* 3 (expmod 3 0 5)) 5)) 5)) 5)) 5)
; (remainder (* 3 (remainder (square (remainder (square (remainder (* 3 1) 5)) 5)) 5)) 5)
;
; avoid squaring large numbers.

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))

; (expmod2 3 5 5)
; (remainder (fast-expt 3 5) 5)
; (remainder (* 3 (fast-expt 3 4)) 5)
; (remainder (* 3 (square (fast-expt 3 2))) 5)
; (remainder (* 3 (square (square (fast-expt 3 1)))) 5)
; (remainder (* 3 (square (square (* 3 (fast-expt 3 0))))) 5)
; (remainder (* 3 (square (square (* 3 1)))) 5)
;
; squaring large numbers.

