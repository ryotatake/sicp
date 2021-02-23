; 初期値をa, bとすると、
; a1 = bq + aq + ap
; b1 = bp + aq

; a2 = b1q + a1q + a1p
;    = (2pq + q^2)b + (2pq + q^2)a + (p^2 + q^2)q
; b2 = b1p + a1q
;    = (p^2 + q^2)b + (2pq + q^2)a

; よって、Tpqを二回適用した場合はp' = p^2 + q^2, q' = 2pq + q^2 としてあらわすことができる。

; これを利用すると、fab-iterは次のようにできる

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 0)
(fib 1)
(fib 4)
(fib 5)
(fib 6)
