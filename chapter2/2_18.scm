(define (reverse items)
  (define (reverse-iter reversed ref)
    (if (< ref 0)
      reversed
      (reverse-iter (append reversed (list (list-ref items ref))) (- ref 1))))
  (reverse-iter '() (- (length items) 1)))

(reverse (list 1 2 3 4))
