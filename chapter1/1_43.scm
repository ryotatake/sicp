(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter g k)
    (if (> k n)
      g
      (iter (compose f g) (+ k 1))))
  (iter f 1))

((repeated square 2) 5)
;Value 625

((repeated square 3) 2)
;Value 65536
