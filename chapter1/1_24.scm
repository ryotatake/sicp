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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; timesの回数テストを実行して、すべて成功したらtrueを返す
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes from to)
  (cond ((even? from) (search-for-primes (+ from 1) to))
        ((<= from to) (timed-prime-test from) (search-for-primes (+ from 1) to))))

; fast-prime?を使った場合、1000000に近い素数とテストするのと1000に近い素数をテストするのでは、fast-prime?はO(logn)なので、log10_1000000/log10_1000 = log1000_1000000 = 2 で2倍と考えられる

(search-for-primes 1000 1019)
; 1009 *** 0.
; 1013 *** 0.
; 1019 *** 0.
(search-for-primes 10000 10037)
; 10007 *** 0.
; 10009 *** 1.0000000000000009e-2
; 10037 *** 0.
(search-for-primes 100000 100043)
; 100003 *** 1.0000000000000009e-2
; 100019 *** 0.
; 100043 *** 9.999999999999981e-3
(search-for-primes 1000000 1000037)
; 1000003 *** 0.
; 1000033 *** 1.0000000000000009e-2
; 1000037 *** 0.

; 1000と1000000では違いが分からないので、もっと桁数の大きいところで比較する
; 10^8と10^16で比較する
(search-for-primes 100000000 100000100)
; 100000007 *** 1.0000000000000009e-2
(search-for-primes 10000000000000000 10000000000000100)
; 10000000000000069 *** 1.0000000000000009e-2

; ほぼ時間は変わらなかった。runtimeの精度によるもの？
