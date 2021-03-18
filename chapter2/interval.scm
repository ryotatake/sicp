(define (make-interval a b) (cons a b))

(define (upper-bound x) (max (car x) (cdr x)))
(define (lower-bound x) (min (car x) (cdr x)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (sub-interval x y)
  (make-interval (- (upper-bound x) (lower-bound y))
                 (- (lower-bound x) (upper-bound y))))

; xとyの小さい方同士でかけたものが一番小さくならないのは、どちらもマイナスの可能性があるため。
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (mul-interval2 x y)
  (let ((ux (upper-bound x))
        (lx (lower-bound x))
        (uy (upper-bound y))
        (ly (lower-bound y)))
    (cond ((positive? lx)
           (cond ((positive? ly) (make-interval (* lx ly) (* ux uy)))
                 ((negative? uy) (make-interval (* ux ly) (* lx uy)))
                 (else           (make-interval (* ux ly) (* ux uy))))
          ((negative? ux)
           (cond ((positive? ly) (make-interval (* lx uy) (* ux ly)))
                 ((negative? uy) (make-interval (* ux uy) (* lx ly)))
                 (else           (make-interval (* lx uy) (* lx ly)))))
          (else
           (cond ((positive? ly) (make-interval (* lx uy) (* ux uy)))
                 ((negative? uy) (make-interval (* ux ly) (* lx ly)))
                 (else           (make-interval (min (* ux ly) (* lx uy)) (max (* ux uy) (* lx ly))))))))))

(define (div-interval x y)
  (if (and (positive? (upper-bound y)) (negative? (lower-bound y)))
    (error "Division error (interval includes 0)" y)
    (mul-interval
      x
      (make-interval (/ 1.0 (upper-bound y))
                     (/ 1.0 (lower-bound y))))))

(define (width x)
  (/ (- (upper-bound x) (lower-bound x))
     2.0))

(define (display-interval x)
  (display (car x))
  (display ",")
  (display (cdr x)))

(define x (make-interval 1 6))
(define y (make-interval 2 3))
(display-interval (add-interval x y))
(display-interval (sub-interval x y))

; 加算では先にwidthを取って足しても、足したあとでwidthを取っても結果が同じ
(+ (width x) (width y))
;Value: 3
(width (add-interval x y))
;Value: 3

; 減算では先にwidthを取って足すのと、引いたあとでwidthを取る結果が同じ
(+ (width x) (width y))
;Value: 3
(width (sub-interval x y))
;Value: 3

; 乗算では乗算後のwidthを乗算前のwidthで表すことができない
(width x)
;Value: 2.5
(width y)
;Value: 0.5
(width (mul-interval x y))
;Value: 8

; 除算では除算後のwidthを除算前のwidthで表すことができない
(width (div-interval x y))
;Value: 1.3333333333333


(define negative (make-interval -1 1))
(div-interval x negative)
