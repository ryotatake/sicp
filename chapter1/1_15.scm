(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

(sine 12.15)

; pの適用回数
; 5回
;
; 置き換えモデルで考える
; (sine 12.15)
; (p (sine 4.05))
; (p (p (sine 1.35)))
; (p (p (p (sine 0.45))))
; (p (p (p (p (sine 0.15)))))
; (p (p (p (p (p (sine 0.05))))))


; (sine a)の空間とステップ数の増加オーダー
; a = 1のとき
; (sine 1)
; (p (sine 0.33))
; (p (p (sine 0.11)))
; (p (p (p (sine 0.037))))
; 空間: 3
; ステップ数: 3

; 1ステップごとにaは1/3になり、それが0.1より小さくなるまで繰り返される
; 1/3にする回数 = ステップ数。また、ステップ数と同じだけネストも増えるので、ステップ数=空間
; a * (1/3)^n < 0.1 をみたすnが答え
; (1/3)^n < 0.1/a
; 両辺を10を底として対数を取って
; log(1/3)^n < log(0.1/a)
; n < log(0.1/a) / log(1/3)
; n < (log0.1 - loga) / (log1 - log3)
; n < (1 + loga) / log3

; 定数部分は無視するので、
; O(loga / log3) = O(log3_a) （底を3に変換した）
