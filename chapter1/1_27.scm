(load "lib/fast-prime.scm")

; カーマイケル数nがフェルマーテストをだますことを確認する
(define (all-number-fermat-test n)
  (define (try-it a)
    (cond ((>= a n) true)
          (else (cond ((= (expmod a n n) a) (try-it (+ a 1)))
                      (else false)))))
  (try-it 1))

(define (fast-prime? n)
  (cond ((all-number-fermat-test n) true)
        (else false)))

(fast-prime? 2)
;Value: #t
(fast-prime? 3)
;Value: #t
(fast-prime? 6)
;Value: #f
(fast-prime? 7)
;Value: #t
(fast-prime? 8)
;Value: #f
(fast-prime? 561)
;Value: #t
; 素数でないのにカーマイケル数なので素数と判定されている
