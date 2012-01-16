; The procedure calculates the sum of a and
; the absolute value of b. The definition of
; this procedure also tells us that condition
; expression can not only examine the expressions
; but also it can examine the procedure.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
