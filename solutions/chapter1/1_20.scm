; Greatest common divisor.
(define (gcd a b)
  (if (= b 0)
    a
    (gcd (b (remainder a b)))))

; normal order evaluation.
; (gcd 206 40)
;
; (if (= 40 0))
; (gcd (40 (remainder 206 40)))
;
; (if (= (remainder 206 40) 0))
; (gcd ((remainder 206 40) (remainder 40 (remainder 206 40)))
; ...
; Actually, I dont quite get it here. If the `if` statement is not evaluated
; here, then the substitution process goes to infinity. Since the parameters
; do not shrink.
;
; applicative order evaluation.
; (gcd 206 40)
; (gcd (40 (remainder 206 40)))
; (gcd 40 6)
; (gcd (6 (remainder 40 6)))
; (gcd 6 4)
; (gcd (4 (remainder 6 4)))
; (gcd 4 2)
; (gcd (2 (remainder 4 2)))
; (gcd 2 0)
;
; `remainder` is evaluated for 4 times.
