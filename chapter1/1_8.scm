(define (cbrt-iter guess pre-guess x)
  (if (good-enough? guess pre-guess)
    guess
    (cbrt-iter (improve guess x) guess x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))

(define (good-enough? guess pre-guess)
  (< (/ (abs (- guess pre-guess)) guess) 0.0001))

(define (cbrt x)
  (cbrt-iter 1.0 2.0 x))

(cbrt 8)
;Value: 2.000000000012062
(cbrt 27)
;Value: 3.0000000000000977
(cbrt 2)
;Value: 1.2599210500177698
