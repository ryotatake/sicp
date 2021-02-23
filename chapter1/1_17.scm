(define (* a b)
  (cond ((= b 1) a)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1)))))))
(define (double a) (+ a a))
(define (halve a) (/ a 2))

(* 8 5)
(* 8 4)
