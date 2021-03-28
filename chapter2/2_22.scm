(define (square-list items)
  (define (iter things answer)
    (if (null? things)
     answer
     (iter (cdr things)
           (cons (square (car things)) 
                 answer))))
  (iter items '()))
(square-list (list 1 2 3 4))
;Value: (16 9 4 1)
;iterのthingsとanswerの変化を見ればわかる
;things: (1 2 3 4), answer: ()
;things: (2 3 4), answer: (1)
;things: (3 4), answer: (4 1)
;things: (4), answer: (9 4 1)
;things: (), answer: (16 9 4 1)

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
     answer
     (iter (cdr things)
           (cons answer
                 (square (car things))))))
  (iter items '()))
(square-list (list 1 2 3 4))
;Value: ((((() . 1) . 4) . 9) . 16)
;consの第一引数にリストを渡しているためこのようになってしまう。

; 次のようにすればうまくいく
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
     answer
     (iter (cdr things)
           (append answer
                 (list (square (car things)))))))
  (iter items '()))
(square-list (list 1 2 3 4))
