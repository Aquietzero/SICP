; According to the transform, we have:
;
;            T_pq
;   (a, b) --------> (bq + aq + ap, bp + aq)
;
; let a' = bq + aq + ap, b' = bp + aq, we have:
;
;              T_pq
;   (a', b') --------> (b'q + a'q + a'p, b'p + a'q)
;
; Expand (b'q + a'q + a'p) and (b'p + a'q), we have:
;
;   b'q + a'q + a'p = (bp + aq)q + (bq + aq + ap)(p + q)
;                   = bpq + aqq + bpq + bqq + apq + aqq + app + apq
;                   = 2bpq + 2apq + 2aqq + bqq + app
;                   = b(qq + 2pq) + a(qq + 2pq) + a(pp + qq)
;                   = bq' + aq' + ap'
;
;   b'p + a'q = (bp + aq)p + (bq + aq + ap)q
;             = bpp + apq + bqq + aqq + apq
;             = bpp + bqq + aqq + 2apq
;             = b(pp + qq) + a(qq + 2pq)
;             = bp' + aq'
;
; According to the expansion, we have:
;
;   p' = pp + qq
;   q' = qq + 2pq
;
; Hence (T_pq)^2 = T_p'q'

(define (square x) (* x x))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (square q) (* 2 (* p q)))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
