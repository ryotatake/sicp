(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
(a-plus-abs-b 3 3)
(a-plus-abs-b 3 -3)
(a-plus-abs-b 3 0)
; bが0より大きければ (+ a b)が評価され、そうでなければ(- a b)が評価される。
