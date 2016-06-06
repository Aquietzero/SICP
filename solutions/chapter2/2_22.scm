; It doesn't work since the iteration process goes from head
; to tail but each of the squared result is appended to the
; head of the result list. So the result is reversed.
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons (square (car things)) answer))))
  (iter items (list)))

; `cons` consider the first argument as the **element** while the
; second argument as the list. Since `answer` here is a list,
; the result whill by a nested list with multi levels.
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons answer (square (car things))))))
  (iter items (list)))
