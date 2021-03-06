(load "chapter1/1_37.scm")

(define (d i)
  (let ((remain (remainder (- i 2) 3)))
    (if (= remain 0)
      (* 2
         (+ (/ (- i 2) 3)
            1))
      1)))

(define (e)
  (+ 2
    (cont-frac (lambda (i) 1.0)
               d
               100)))
(e)
