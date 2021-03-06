; k項有限連分数

; 再帰プロセス
(define (cont-frac n d k)
  (define (denominator n d i)
    (if (= i k)
      (d i)
      (+ (d i) (/ (n (+ i 1)) (denominator n d (+ i 1))))))
  (/ (n 1) (denominator n d 1)))

; 線形プロセス
(define (cont-frac n d k)
  (define (iter result i)
    (if (< i 1)
      result
      (iter (/ (n i) (+ (d i) result)) (- i 1))))
  (iter 0 k))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)
;Value: .6180339887498948
