; 再帰プロセス
(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

; 線形プロセス
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial n)
  (define (next i) (+ i 1))
  (define (term i) i)
  (product term 1 next n))

(factorial 2)
;Value: 4
(factorial 3)
;Value: 9
(factorial 4)
;Value: 27

(define (pi n)
  (define (next i) (+ i 1))
  (define (term i)
    (if (even? i)
      (/ (+ i 2) (+ i 1))
      (/ (+ i 1) (+ i 2))))
  (* 4.0 (product term 1 next n)))

(pi 10000)
;Value: 3.1417497057380523
