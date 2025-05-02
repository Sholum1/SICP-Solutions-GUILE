(define-module (chapter-2 exercise-06))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add n m)
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))
