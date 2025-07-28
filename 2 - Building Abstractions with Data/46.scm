(define-module (chapter-2 exercise-46)
  #:export (make-vect xcor-vect ycor-vect
	    add-vect sub-vect scale-vect))

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (let [(new-x (+ (xcor-vect v1) (xcor-vect v2)))
	(new-y (+ (ycor-vect v1) (ycor-vect v2)))]
    (make-vect new-x new-y)))

(define (sub-vect v1 v2)
  (let [(new-x (- (xcor-vect v1) (xcor-vect v2)))
	(new-y (- (ycor-vect v1) (ycor-vect v2)))]
    (make-vect new-x new-y)))

(define (scale-vect s v)
  (let [(new-x (* s (xcor-vect v)))
	(new-y (* s (ycor-vect v)))]
    (make-vect new-x new-y)))
