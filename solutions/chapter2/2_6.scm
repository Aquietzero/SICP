; Church numeral.
;
; It is the function itself and not its end result is the Church numeral. The Church
; numeral n means simply ot do anything n times.
;
; 0 => 0 f x = x           => 0 = λf.λx.x
; 1 => 1 f x = f x         => 1 = λf.λx.f x
; 2 => 2 f x = f (f x)     => 2 = λf.λx.f (f x)
; 3 => 3 f x = f (f (f x)) => 3 = λf.λx.f (f (f x))
;
; add = λm.λn.λf.λx.m f (n f x)
;
(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f (f x)))))
(define two (lambda (f) (lambda (x) (f (f (f x))))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; It applies f b times on x and then a times on the previous result.
(define (add a b)
  (lambda (f) (lambda (x) (((a f) ((b f) x))))))
