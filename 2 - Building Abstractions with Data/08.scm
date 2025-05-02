(define-module (chapter-2 exercise-08)
  #:use-module (chapter-2 exercise-07))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
		 (- (upper-bound x) (lower-bound y))))
