(define-module (chapter-2 exercise-07)
  #:export (make-interval lower-bound upper-bound))

(define (make-interval a b) (cons a b))

(define (lower-bound int) (car int))

(define (upper-bound int) (cdr int))
