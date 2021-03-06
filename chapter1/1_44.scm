(define (smooth f)
  (define dx 0.00001)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx)))
                 3)))

(load "chapter1/1_43.scm")

(define (repeated-smooth f n)
  ((repeated smooth n) f))

(define (inc x) (+ x 1))

((repeated-smooth inc 2) 5)
;Value: 6.
