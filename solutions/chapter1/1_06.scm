; Since scheme evaluate the expression in applicative-order,
; every time the procedure `sqrt-iter` is called, `new-if`
; is evaluated. And when `new-if` is evaluated, `sqrt-iter`
; will be evaluated again. Such kind of cross procedure calls
; between two procedures may lead to an infinite loop. Only
; when procedure `good-enough?` is evaluated can the loop
; terminate, but it just cannot happen if `new-if` is not a
; basic procedure.
