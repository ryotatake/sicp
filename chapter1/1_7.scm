(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2)
(sqrt 0.00000002)
; 小さすぎると、最初からgood-enough?がtrueになってしまうので計算できない
(sqrt 200000000000000000)
; ループして終わらない



; good-enough?をguessの値の差分が十分に小さくなったら、とした場合
; https://sicp-solutions.readthedocs.io/en/latest/docs/problem-1-7.html
(define (sqrt-iter guess pre-guess x)
  (if (good-enough? guess pre-guess)
    guess
    (sqrt-iter (improve guess x) guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess pre-guess)
  (< (/ (abs (- guess pre-guess)) guess) 0.0001))

(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))

(sqrt 2)
; 1.4142135623746899
(sqrt 0.00000002)
; 1.4142135623730954e-4
(sqrt 200000000000000000)
; 447213595.4999579
; どれも計算できる
