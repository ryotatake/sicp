(load "lib/rational-number.scm")

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (negative? d)
      (cons (/ (- n) g) (/ (- d) g))
      (cons (/ n g) (/ d g)))))

(print-rat (make-rat -2 -4))
(print-rat (make-rat -2 4))
(print-rat (make-rat 2 -4))
(print-rat (make-rat 2 4))
