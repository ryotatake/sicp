(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))
(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (new-sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))
(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(sqrt 9)
(new-sqrt 9)

; new-ifを使ったものは無限ループに入ってしまう
;(new-sqrt 9)
;=> (new-sqrt-iter 1.0 9))
;=> (new-if (good-enough? 1.0 9)
;     1.0
;     (new-sqrt-iter (improve 1.0 9) 9)))
; 適用順序評価なので、次はnew-ifの引数を評価する
; 引数を評価する際に(new-sqrt-iter (improve 1.0 9) 9)を評価するが、ここで無限ループになる
;
; 一方でif式を使うと、predicateのみを評価するので無限ループにならない。
; これがif式を特殊形式として提供する必要性。
; > if 式を評価するにあたって、インタプリタは最初に式の ⟨predicate⟩ の部分を評価します。もし ⟨predicate⟩ の評価結果が真である場合、インタプリタは⟨consequent⟩ を評価し、その値を返します。そうでなければ ⟨alternative⟩ を評価し、その値を返します。（p.19）
; ref. https://sicp-solutions.readthedocs.io/en/latest/docs/problem-1-6.html
