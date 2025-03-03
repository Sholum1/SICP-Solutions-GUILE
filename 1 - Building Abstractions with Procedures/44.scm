(define-module (chapter-1 exercise-44)
  #:use-module (chapter-1 exercise-43))

(define dx 0.0001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold f n)
  ((repeated smooth n) f))
