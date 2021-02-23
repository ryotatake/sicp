(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (mul a b) (mul-iter a b 0))
(define (mul-iter a b n)
  (cond ((= b 0) n)
        ((even? b) (mul-iter (double a) (halve b) n))
        (else (mul-iter a (- b 1) (+ n a))))))

; 不変量は a * b + n とした。
(mul 8 5)
(mul 8 4)
