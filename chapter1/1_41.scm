(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))
  (lambda (x) (+ x 1)))

((double inc) 1)
;Value 3

(((double (double double)) inc) 5)
; (double double) -> (double (double x))
; (double (double double)) -> (double (double (double (double x))))
; 2^4でincが16回繰り返されると考えられる
;Value 21
