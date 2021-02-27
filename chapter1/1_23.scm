(define (new-smallest-divisor n) (new-find-divisor n 2))
(define (new-find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (new-find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))

(define (next test-divisor)
  (if (= test-divisor 2)
    3
    (+ test-divisor 2)))

(define (prime? n)
  (= n (new-smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes from to)
  (cond ((even? from) (search-for-primes (+ from 1) to))
        ((<= from to) (timed-prime-test from) (search-for-primes (+ from 1) to))))

(search-for-primes 100000000 100000100)
; before
; 100000007 *** 2.9999999999999805e-2
; 100000037 *** .04999999999999982
; 100000039 *** 2.0000000000000018e-2

; after
; 100000007 *** 2.0000000000000018e-2
; 100000037 *** 2.0000000000000018e-2
; 100000039 *** 2.0000000000000018e-2

; 平均すると1.5倍くらい
; 単純に倍にならないのは、(next)内でIFの処理が行われているためだと思われる
