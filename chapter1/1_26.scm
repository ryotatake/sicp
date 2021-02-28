; O(n)のプロセス
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder
            (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m))
            m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

; O(logn)のプロセス
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

; squareを使わずにexpmodを二回呼び出すことで、一回expmodを呼び出すごとにexpmodの呼び出し回数が二倍になる。
; 1回のexpmod呼び出しでexpの値は半分になって呼び出しは倍になるので、結局O(n)になる。
