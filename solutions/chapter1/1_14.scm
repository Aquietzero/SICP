; Since drawing the expansion tree is so awkward, so I insert some
; display commands to show the inner states in the tree. The tree
; can be easily constructed through the states information and the
; given level.

(define (count-change amount)
  (cc amount 5 0))

; The auxiliairy parameter `level` can be used for better tree cons-
; truction.
(define (cc amount kind-of-coins level)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kind-of-coins 0)) 0)
        (else 

          ; temperarily remenber the recursion result.
          (let ((c1 (cc amount
                        (- kind-of-coins 1)
                        (+ level 1)))
                (c2 (cc (- amount
                           (first-denomination kind-of-coins))
                        kind-of-coins
                        (+ level 1))))

            ; display inner states.
            (begin
              (display "(")
              (display c1)
              (display ",")
              (display c2)
              (display ",")
              (display level)
              (display ")")
              (newline))

            ; return actual result.
            (+ c1 c2)))))

(define (first-denomination kind-of-coins)
  (cond ((= kind-of-coins 1) 1)
        ((= kind-of-coins 2) 5)
        ((= kind-of-coins 3) 10)
        ((= kind-of-coins 4) 25)
        ((= kind-of-coins 5) 50)))

; We have the following model:
;
;   cc(n, k) = cc(n, k-1) + cc(n-fd(k), k)
;
; , where n denotes the amount of money and k denotes the kinds of 
; coins available for money changing. Since k is a fixed number, so
; the depth of cc(n, k-1) is fixed, which is 5. So the depth of the
; tree depends on the recursion depth of cc(n-fd(k), k), which is n.
; Hence the space complexity is Theta(n). The time complexity depends
; on the number of nodes in the tree, which I don't really know...
