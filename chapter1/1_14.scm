(define (count-charge amount) (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins))
                      kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-charge 11)
; (cc 11 5)
; |- (cc 11 4)
; |  |- (cc 11 3)
; |  |  |- (cc 11 2)
; |  |  |  |- (cc 11 1)
; |  |  |  |  |- (cc 11 0)
; |  |  |  |  |  |- 0
; |  |  |  |  |- (cc 10 1)
; |  |  |  |     |- (cc 10 0)
; |  |  |  |     |  |- 0
; |  |  |  |     |- (cc 9 1)
; |  |  |  |        |- (cc 9 0)
; |  |  |  |        |  |- 0
; |  |  |  |        |- (cc 8 1)
; |  |  |  |           |- (cc 8 0)
; |  |  |  |           |  |- 0
; |  |  |  |           |- (cc 7 1)
; |  |  |  |              |- ...
; |  |  |  |- (cc 6 2)
; |  |  |     |- (cc 6 1)
; |  |  |     |  |- ...
; |  |  |     |  |- ...
; |  |  |     |- (cc 1 2)
; |  |  |        |- (cc 1 1)
; |  |  |        |  |- (cc 1 0)
; |  |  |        |  |  |- 0
; |  |  |        |  |- (cc 0 1)
; |  |  |        |     |- (cc 0 0)
; |  |  |        |     |  |- 1
; |  |  |        |     |- (cc -1 1)
; |  |  |        |        |- 0
; |  |  |        |- (cc -4 2)
; |  |  |           |- 0
; |  |  |- (cc 1 3)
; |  |     |- (cc 1 2)
; |  |     |  |- (cc 1 1)
; |  |     |  |  |- (cc 1 0)
; |  |     |  |  |  |- 0
; |  |     |  |  |- (cc 0 1)
; |  |     |  |    |- (cc 0 0)
; |  |     |  |    |  |- 1
; |  |     |  |    |- (cc -1 1)
; |  |     |  |       |- 0
; |  |     |  |- (cc -4 2)
; |  |     |     |- 0
; |  |     |- (cc -9 3)
; |  |        |- 0
; |  |- (cc -14 4)
; |     |- 0
; |- (cc -39 5)
;    |- 0


; 空間(= ネストの深さ、木の高さ)
; O(n)
;
; 例えば今回の計算では、(cc 11 1),(cc 10 1),(cc 9 1),...,(cc 0 1)まで繰り返し計算される。
; 必ず(cc n 1)~(cc 0 1)までは計算されるので、木の高さはn

; ステップ数
; O(n^k)
; k = kinds-of-coins
;
; (cc 11 1)では11セントから1セントずつ引いていくため、約11回の計算が行われる
; (cc 11 2)では(cc 11 1)と(cc 10 2)の計算が行われる。(cc 11 1)の計算は11回。(cc 10 2)は(cc 10 1)と(cc 9 2)を計算する。(cc 10 1)の計算は10回。これを繰り返すと、各階層での計算回数は1~11回で、それが11階層あるので、計算回数のオーダーは11^2
; (cc 11 3)では(cc 11 2)と(cc 10 3)の計算が行われる。上と同様に考えて、11^3
; ...
; これを一般化してオーダーはO(n^k)となる

; ref. https://github.com/DylanVann/sicp-solutions/blob/master/sicp-ex-1.14.scm
