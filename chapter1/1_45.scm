(load "lib/fixed-point.scm")

(define (average a b) (/ (+ a b) 2.0))
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter g k)
    (if (> k n)
      g
      (iter (compose f g) (+ k 1))))
  (iter f 1))

(define (nth-root x n average-damp-count)
  (fixed-point
    ((repeated average-damp average-damp-count) (lambda (y) (/ x (expt y (- n 1)))))
    1.0))

(nth-root (expt 3 2) 2 1)
(nth-root (expt 3 3) 3 1)
(nth-root (expt 3 4) 4 1)
(nth-root (expt 3 5) 5 1)
(nth-root (expt 3 6) 6 1)
(nth-root (expt 3 7) 7 1)
(nth-root (expt 3 8) 8 1)
; どれも1回だけでもうまくいっているように見えるが、、
; 実際にはlog2_n回の平均緩和が必要らしい
; https://www.serendip.ws/archives/491
