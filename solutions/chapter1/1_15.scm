; Compute the sine of an given angle.
;
; Shrink x by the following trigonometric identity.
;
;   sin(x) = 3 * sin(x/3) - 4 * (sin(x/3))^3
;
; Then approximate sinx by sin(x) ~ x when x is small;
;
; So construct the following logic:
;
;   sin(x) = if abs(x) < 0.1(enough small) the return x as the approximation of sin(x)
;   else sin(x) = 3 * sin(x/3) - 4 * (sin(x/3))^3
;
;   p is the abstraction of the above process.
;
(define (sine angle)
  (define (cube x) (* x x x))
  (define (p sine-function) (- (* 3 sine-function) (* 4 (cube sine-function))))

  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

; And the result shows that `p` is applied 5 times.
; And it is easy to see that in each iteration the angle shrinks at a linear speed(x -> x/3),
; so the order of growth in space is O(n).
; Suppose the number of steps is `n`, then we have a * 3^n > 0.1. Solve the equation we have
; n = ceil(abs((log(0.1) - log(a)) / log(3)))
(define (sine-with-counter angle)
  (define (cube x) (* x x x))
  (define (p sine-function) (- (* 3 sine-function) (* 4 (cube sine-function))))

  (define (sine-iter angle counter)
    (if (not (> (abs angle) 0.1))
      angle
      (begin
        (display counter)
        (display "\t")
        (display angle)
        (newline)
        (p (sine-iter (/ angle 3.0) (+ counter 1))))))

  (sine-iter angle 1))

