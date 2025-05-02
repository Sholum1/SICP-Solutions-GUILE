(define-module (chapter-2 exercise-04))

#|
   Take z as (lambda (m) (m x y))
    * (car z) -> ((lambda (m) (m x y)) (lambda (p q) p)) ->
    * ((lambda (p q) p) x y) -> x
   Proving that (car z) yields x for any objects x and y
|#

(define (cdr z)
  (z (lambda (p q) q)))
