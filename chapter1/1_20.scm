(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

; 正規順序評価
; 引数の評価の前に式を展開する
; ただしifについては特殊形式なので、ifの条件の評価は先に行われる
; (if (= 40 0) ; #f
;     206
;     (gcd 40 (rem 206 40)))
; 
; (if (= (rem 206 40) 0) ; #f
;     40
;     (gcd (rem 206 40) (rem 40 (rem 206 40))))
; 
; (if (= (rem 40 (rem 206 40)) 0) ; #f
;     (rem 206 40)
;     (gcd (rem 40 (rem 206 40)) (rem (rem 206 40) (rem 40 (rem 206 40)))))
; 
; (if (= (rem (rem 206 40) (rem 40 (rem 206 40))) 0) ; #f
;     (rem 40 (rem 206 40))
;     (gcd (rem (rem 206 40) (rem 40 (rem 206 40))) (rem (rem 40 (rem 206 40)) (rem (rem 206 40) (rem 40 (rem 206 40))))))
; 
; (if (= (rem (rem 40 (rem 206 40)) (rem (rem 206 40) (rem 40 (rem 206 40)))) 0) ; #t
;     (rem (rem 206 40) (rem 40 (rem 206 40)))
;     (gcd (rem (rem 40 (rem 206 40)) (rem (rem 206 40) (rem 40 (rem 206 40)))) (rem (rem (rem 40 (rem 206 40))) (rem (rem 40 (rem 206 40)) (rem (rem 206 40) (rem 40 (rem 206 40)))))))
; (rem (rem 206 40) (rem 40 (rem 206 40)))
; (rem 6 (rem 40 6))
; (rem 6 4)
; 2
; remainder演算の実行回数は18回
; ref. https://www.serendip.ws/archives/381

; 適用順序評価
; 先に引数を評価する
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 40 6)
; (gcd 6 (remainder 40 6))
; (gcd 6 4)
; (gcd 4 (remainder 6 4))
; (gcd 4 2)
; (gcd 2 (remainder 4 2))
; 2
; 4回
