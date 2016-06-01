(define (rational-number n d)
  (if (< d 0) (cons (- n) (- d)) (cons n d)))
(define (numerator x) (car x))
(define (denominator x) (cdr x))

(define (add x y)
  (rational-number
    (+ (* (numerator x) (denominator y))
       (* (denominator x) (numerator y)))
    (* (denominator x) (denominator y))))

(define (sub x y)
  (rational-number
    (- (* (numerator x) (denominator y))
       (* (denominator x) (numerator y)))
    (* (denominator x) (denominator y))))

(define (mul x y)
  (rational-number
    (* (numerator x) (numerator y))
    (* (denominator x) (denominator y))))

(define (div x y)
  (rational-number
    (* (numerator x) (denominator y))
    (* (denominator x) (numerator y))))

(define (equal-rational-number? x y)
  (= (* (numerator x) (denominator y))
     (* (denominator x) (numerator y))))

(define (print-rational-number x)
  (newline)
  (display (numerator x))
  (display "/")
  (display (denominator x)))
