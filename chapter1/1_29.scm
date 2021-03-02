(load "lib/sum.scm")

(define (cube x) (* x x x))

(define (integral-with-simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (next k) (+ k 1))
  (define (term k)
    (cond ((= k 0) (y k))
          ((= k n) (y k))
          ((even? k) (* 2 (y k)))
          ((odd? k) (* 4 (y k)))))
  (* (/ h 3.0)
     (sum term 0 next n)))

(integral-with-simpson cube 0 1 100)
