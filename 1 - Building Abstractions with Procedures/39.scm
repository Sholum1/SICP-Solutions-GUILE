(define-module (chapter-1 exercise-39)
  #:use-module (chapter-1 exercise-07)
  #:use-module (chapter-1 exercise-37))

(define (tan-cf x k)
  (cont-frac (lambda (i)
	       (if (= i 1)
		   x
		   (- (square x))))
	     (lambda (i)
	       (+ i (1- i)))
	     k))
