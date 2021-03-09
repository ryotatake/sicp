; https://w.atwiki.jp/selflearn/pages/16.html#id_e78ae615 が分かりやすかった。

; チャーチ数では、fを適用する回数で数値を表す。
; zeroはfを一度も適用しない
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; 表示用に、手続きfとしてincを用意
(define inc (lambda (x) (+ x 1)))
((zero inc) 0)
;Value: 0
(((add-1 zero) inc) 0)
;Value: 1

;(add-1 zero)は次のような手続きを返す
;(lambda (f) (lambda (x) (f ((zero f) x)))))
;((zero f) x)は、((zero inc) 0)とおなじ形。つまりzeroを普通に使った場合の形。
;なので、ここで返ってきた手続きは、zeroを普通に使った場合の形にさらに手続きfを適用したもの。
;つまり、(add-1 n)は、nに対して手続きfをもう一度適用した手続きを返す。

;-------------------------------------------------------------------------

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

; 表示用の手続きfを準備
(define inc (lambda (x) (+ x 1)))

((one inc) 0)
;Value: 1
((two inc) 0)
;Value: 2

; ※incで+を使っているので、ここでは+を上書きしてはいけない。
(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))

(((add one two) inc) 0)
;Value: 3
(((add two two) inc) 0)
;Value: 4
