(define (same-parity . items)
  (let ((parity? (if (even? (car items)) even? odd?)))
    (define (iter i)
      (cond ((null? i) '())
            ((parity? (car i))
             (cons (car i) (iter (cdr i))))
            (else
              (iter (cdr i)))))
    (iter items))))

(same-parity 1 2 3 4 5 6 7)
;Value: (1 3 5 7)
(same-parity 2 3 4 5 6 7)
;Value: (2 4 6)
