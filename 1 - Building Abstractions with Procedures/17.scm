(define-module (chapter-1 exercise-17))

(define (double x) (+ x x))

(define (halve x)
  (if (even? x)
      (/ x 2)
      (error x "is not a even integer")))

(define (fast-mul a b)
  (cond ((= b 0) 0)
	((even? b) (fast-mul (double a) (halve b)))
	(else (+ a (fast-mul a (1- b))))))
