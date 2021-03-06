; 微分した関数を返す
(define (deriv g)
  (define dx 0.00001)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(load "lib/fixed-point.scm")
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
