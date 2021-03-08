(load "chapter2/2_02.scm")

; 2点で長方形をつくる
(define (make-rectangle bottom-left top-right) (cons bottom-left top-right))

(define (bottom-left rectangle) (car rectangle))
(define (top-right rectangle) (cdr rectangle))
(define (width rectangle)
  (- (x-point (top-right rectangle)) (x-point (bottom-left rectangle))))

(define (height rectangle)
  (- (y-point (top-right rectangle)) (y-point (bottom-left rectangle))))
(define (circumference rectangle)
  (* 2 (+ (width rectangle) (height rectangle))))
(define (area rectangle)
  (* (width rectangle) (height rectangle)))

(define rect-a (make-rectangle (make-point 0 2) (make-point 6 8)))
(circumference rect-a)
;Value: 24
(area rect-a)
;Value: 36

; 幅と高さで長方形をつくる
(define (make-rectangle width height) (cons width height))
(define (width rectangle) (car rectangle))
(define (height rectangle) (cdr rectangle))

(define rect-b (make-rectangle 6 6))
(circumference rect-b)
;Value: 24
(area rect-b)
;Value: 36
