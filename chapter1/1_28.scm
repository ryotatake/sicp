; フェルマーの小定理を利用したO(logn)の素数判定
; Miller-Rabinテストを利用する
; このアルゴリズムについては https://ochaochaocha3.hateblo.jp/entry/2015/04/29/sicp-ex-1-28 が分かりやすかった

; ある平方根xの二乗x^2がnを法として剰余1となる場合があるかを調べる。そのようなxが存在すれば素数ではない。
; このとき、x = 1, -1についてはあらゆるnについて剰余1となる（1の自明な平方根）ので、判定から除く。
; この x = -1というのは、nを法としたときの話（1~nまでの有限体）なので、n-1のことである。

(define (expmod base exp m)
  ; xが1の非自明な平方根かを調べる
  ; xが1やm-1なら1の自明な平方根なので1を返す
  (define (check-nontrivial-sqrt-1 x)
    (cond ((= x 1) 1)
          ((= x (- m 1)) 1)
          (else
            (let ((r (remainder (square x) m)))
              (if (= r 1)
                0 ; 1の非自明な平方根であることを示すシグナル。0を返すと、miller-rabin-test内のtry-itでfalseが返るので素数でないと判定できる
                r)))))
  (cond ((= exp 0) 1)
        ((even? exp)
          (check-nontrivial-sqrt-1 (expmod base (/ exp 2) m)))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

; timesの回数テストを実行して、すべて成功したらtrueを返す
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 2 10)
(fast-prime? 3 10)
(fast-prime? 7 10)
(fast-prime? 55 10)

(fast-prime? 561 10)
; カーマイケル数でも騙されない
