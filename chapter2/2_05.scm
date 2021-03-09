(define (cons a b) (* (expt 2 a) (expt 3 b)))
; 2で割れなくなるまで割る
(define (car z)
  (define (iter result count)
    (if (= (remainder result 2) 0)
      (iter (/ result 2) (+ count 1))
      count)))
; 3で割れなくなるまで割る
(define (cdr z)
  (define (iter result count)
    (if (= (remainder result 3) 0)
      (iter (/ result 3) (+ count 1))
      count)))

(define pair (cons 1 2))
(car pair)
;Value: 1
(cdr pair)
;Value: 2
