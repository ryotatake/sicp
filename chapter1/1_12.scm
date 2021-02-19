; x: 横
; y: 縦
(define (pascal x y)
  (cond ((= x 1) 1)
        ((= x y) 1)
        (else (+ (pascal (- x 1) (- y 1)) (pascal x (- y 1))))))

(pascal 1 1)
;Value: 1
(pascal 2 3)
;Value: 2
(pascal 3 5)
;Value: 6
