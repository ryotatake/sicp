(define (fast-expt2 b n)
  (expt-iter b n 1))

(define (expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (expt-iter (* b b) (/ n 2) a))
        (else (expt-iter b (- n 1) (* b a)))))
(fast-expt2 2 4)
(fast-expt2 2 5)

;(expt-iter b n a)について、ab^nは一定になっている
;(expt-iter 2 5 1)
;(expt-iter 2 4 2)
;(expt-iter 4 2 2)
;(expt-iter 16 1 2)
;(expt-iter 16 0 32)

; ref. https://www.serendip.ws/archives/373
