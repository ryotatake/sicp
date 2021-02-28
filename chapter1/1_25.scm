(load "lib/fast-expt.scm")
(load "lib/fast-prime.scm")

(define (new-expmod base exp m)
  (remainder (fast-expt base exp) m))
(define (display-elapsed-time start-time)
  (newline)
  (display " *** ")
  (display (- (runtime) start-time)))

(define start-time (runtime))
(expmod 999999 1000000 1000000)
(display-elapsed-time start-time)
; *** .01

(define start-time (runtime))
(new-expmod 999999 1000000 1000000)
(display-elapsed-time start-time)
; 時間がかかりすぎて終わらない

; new-expmodを使った場合、先に階乗を計算してから法mによる剰余を求めることになる。
; 階乗の計算を先に行うことであまりに桁数が大きくなりすぎるため、計算スピードがとても遅くなる。
