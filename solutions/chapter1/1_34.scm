(define (f g) (g 2))

(f square)
(f (lambda (z) (* z (+ z 1))))

; When f is passed as an argument to f itself, it is going to be invoke with
; argument 2. But it lies within the definition body of f itself, so it is
; not callable.

