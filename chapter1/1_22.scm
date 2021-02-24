(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

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

(timed-prime-test 2)

(define (search-for-primes from to)
  (cond ((even? from) (search-for-primes (+ from 1) to))
        ((<= from to) (timed-prime-test from) (search-for-primes (+ from 1) to))))

(search-for-primes 1000 1019)
; 1009 *** 0.
; 1013 *** 0.
; 1019 *** 0.
(search-for-primes 10000 10037)
; 10007 *** 0.
; 10009 *** 0.
; 10037 *** 0.
(search-for-primes 100000 100043)
; 100003 *** 0.
; 100019 *** 0.
; 100043 *** 0.
(search-for-primes 1000000 1000037)
; 1000003 *** 0.
; 1000033 *** 9.999999999999787e-3
; 1000037 *** 0.
(search-for-primes 10000000 10000100)
(search-for-primes 100000000 100000100)
; 100000081 *** 2.0000000000000018e-2
(search-for-primes 1000000000 1000000100)
; 1000000087 *** 5.0000000000000044e-2
