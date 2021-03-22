(load "chapter2/interval.scm")

; r1*r2/(r1+r2) = 1/(1/r1 + 1/r2)
; => (par1 r1 r2) = (par2 r1 r2)
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one (add-interval (div-interval one r1)
                        (div-interval one r2)))))

(define r1 (make-interval 1 2))
(define r2 (make-interval 3 3))

(par1 r1 r2)
;Value: (.6000000000000001 . 1.5)
(par2 r1 r2)
;Value: (.75 . 1.2000000000000002)
; 確かに結果が異なる

(define one (make-interval 1 1))
(div-interval r1 r1)
;Value: (.5 . 2.)
(div-interval r1 r2)
;Value: (.3333333333333333 . .6666666666666666)
(div-interval one one)
;Value: (1. . 1.)
(div-intervl r1 one)
;Value: (1. . 2.)
