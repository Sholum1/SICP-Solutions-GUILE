(define-module (chapter-2 exercise-57)
  #:use-module ((chapter-2 exercise-56)
		#:select (deriv make-sum make-product))
  #:use-module (chapter-2 exercise-33)
  #:export     (augend multiplicand))

(define (augend s)
  (accumulate make-sum 0 (cddr s)))

(define (multiplicand p)
  (accumulate make-product 1 (cddr p)))
