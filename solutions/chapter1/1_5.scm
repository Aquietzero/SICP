(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; I ran the script in scheme shell, the execution dropped
; into an infinite loop. Since SICP tells us that applicative-
; order is used in practical. So if the expression is evaluated
; in applicative-order, then infinite loop occures. The reason
; is quite obvious since in applicative-order, the procedure
; is examined in the following order:
;
;   1. evaluate (test 0 (p))
;   2. expand procedure `test` to get:
;           (if (= 0 0) 0 p)
;   3. before the evaluation of procedure `if`, its parameter
;      `p` show be evaluated first.
;   4. since procedure `p` is self-defined, so the substitution
;      process of procedure `p` is an infinite loop, which 
;      explains the consequence.
;
; While in normal-order, procedure `p` will not be evaluated 
; until it is needed. Since `x` is evaluated first, which may
; lead procedure `if` to return 0, there is no need to evaluate
; procedure `p`. So infinite loop will not occure.
