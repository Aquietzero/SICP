; If x -> g(x) is a differentiable function, then a solution of the equation g(x) = 0
; is a fixed point of the function x -> f(x) where
;
;   f(x) = x - g(x) / g'(x)
;
; and g'(x) is the derivative of g evaluated at x. Newton's method is the use of the
; fixed-point method to approximate a solution of the equation by finding a fixed
; point of the function f.
;
;   g(x) = g(x0) + g'(x0)(x - x0)
;
; Solving g(x) = 0 equals g(x0) + g'(x0)(x - x0), which gives the above approximation
; process.
;
;   x = x0 - g(x0) / g'(x0)
(load "fixed_point.scm")

(define dx 0.000001)

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

; (define (n-sqrt x)
;   (newtons-method (lambda (y) (- (square y) x)) 1.0))
;
; (n-sqrt 2) => 1.4142135623730951
