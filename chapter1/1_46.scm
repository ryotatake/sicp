(define (iterative-improvement good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
      guess
      ((iterative-improvement good-enough? improve) (improve guess))))))

(load "lib/average.scm")

(define (sqrt x)
  ((iterative-improvement
    (lambda (guess) (< (abs (- (square guess) x)) 0.001))
    (lambda (guess) (average guess (/ x guess))))
  1.0))

(sqrt 9.0)
;Value: 3.00009155413138

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  ((iterative-improvement
     (lambda (guess) (< (abs (- guess (f guess))) tolerance))
     f)
   first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
;Value: 1.6180371352785146
