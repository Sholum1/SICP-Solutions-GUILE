(define-module (chapter-2 exercise-48)
  #:export (make-segment start-segment end-segment))

(define (make-segment v1 v2)
  (cons v1 v2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))
