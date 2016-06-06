
; The order of the list `coin-values` do not affect the answer produced by `cc`.
; It's based on the following combination rule.
;
;  / k \ = / k \ + /k-1\
;  \ n /   \n-1/   \n-1/
;
(define (cc amount coin-values)
  (define (no-more? coin-values) (null? coin-values))
  (define (except-first-denomination coin-values) (cdr coin-values))
  (define (first-denomination coin-values) (car coin-values))

  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))

(define us-coins (list 10 25 50 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(cc 100 us-coins) ; => 292

