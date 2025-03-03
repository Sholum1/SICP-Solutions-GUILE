(define-module (chapter-1 exercise-42)
  #:replace (compose))

(define (compose f g)
  (lambda (x) (f (g x))))
