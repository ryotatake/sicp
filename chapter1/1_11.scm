; 再帰プロセス
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) 
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))
(f 4)
;Value: 11

; 反復プロセス
(define (f n)
  (define (f-iter a b c count)
    (cond ((= count 0) c)
          ((= count 1) b)
          ((= count 2) a)
          (else (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))))
  (f-iter 2 1 0 n))
(f 4)
;Value: 11
(f 2)
;Value: 2
(f 1)
;Value: 1
