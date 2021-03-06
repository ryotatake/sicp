(load "chapter1/1_37.scm")

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
      x
      (- (square x))))
  (cont-frac n
             (lambda (i) (+ i (- i 1)))
             k))

(tan-cf 1.0 10)
;Value: 1.557407724654902
