(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else (filtered-accumulate combiner null-value term (next a) next b filter))))

; aからbの区間の素数の二乗の和
(define (filtered-sum term a next b filter)
  (filtered-accumulate + 0 term a next b filter))

(load "lib/fast-prime.scm")

(define (prime-square-sum a b)
  (define (next i) (+ i 1))
  (define (term i) (square i))
  (define (filter i) (fast-prime? i 10))
  (filtered-sum term a next b filter))

(prime-square-sum 2 4)
;Value: 13


; nと互いに素であるn未満のすべての正の整数の積
(define (filtered-product term a next b filter)
  (filtered-accumulate * 1 term a next b filter))

(load "lib/gcd.scm")

(define (coprime-product n)
  (define (next i) (+ i 1))
  (define (term i) i)
  (define (filter i) (= (gcd i n) 1))
  (filtered-product term 1 next n filter))

(coprime-product 6)
;Value: 5
(coprime-product 7)
;Value: 720
