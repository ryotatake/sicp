(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else (+ (cc amount
                     (except-first-denomination coin-values))
                 (cc (- amount (first-denomination coin-values))
                      coin-values)))))
(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))

(define us-coins (list 50 25 10 5 1))
(cc 100 us-coins)
;Value: 292
;リストの順番は影響しない。すべての組み合わせで計算しているため。
