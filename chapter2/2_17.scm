(define (last-pair list)
  (list-ref list (- (length list) 1)))

(last-pair (list 23 72 149 34))
;Value: 34
