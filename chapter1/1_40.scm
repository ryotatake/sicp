(load "lib/newtons-method.scm")
(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

(newtons-method (cubic 2 3 4) 1)
;Value: -1.6506291914330982
; https://keisan.casio.jp/exec/system/1256966554 での計算結果とほぼ等しい
