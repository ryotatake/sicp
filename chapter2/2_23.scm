(define (for-each proc items)
  (define (iter things)
    (cond ((null? things) #f)
          (else 
            (proc (car things))
            (iter (cdr things)))))
  (iter items))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))
