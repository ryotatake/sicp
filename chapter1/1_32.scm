; 再帰プロセス
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

; 線形プロセス
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (factorial n)
  (define (next i) (+ i 1))
  (define (term i) i)
  (product term 1 next n))

(define (sum-integers a b)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (sum identity a inc b))

(factorial 2)
;Value: 2
(factorial 3)
;Value: 6
(factorial 4)
;Value: 24

(sum-integers 1 10)
; 55
