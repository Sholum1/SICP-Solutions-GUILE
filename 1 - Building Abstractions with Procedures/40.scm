(define-module (chapter-1 exercise-40))

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))
