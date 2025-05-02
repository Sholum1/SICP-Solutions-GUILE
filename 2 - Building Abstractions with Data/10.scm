(define-module (chapter-2 exercise-10)
  #:use-module (chapter-2 exercise-07))

(define (mul-interval x y)
  (let ([p1 (* (lower-bound x) (lower-bound y))]
	[p2 (* (lower-bound x) (upper-bound y))]
	[p3 (* (upper-bound x) (lower-bound y))]
	[p4 (* (upper-bound x) (upper-bound y))])
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (let ([lower-y (lower-bound y)]
	[upper-y (upper-bound y)])
    (cond [(zero? lower-y) (error (format #f "The lower bound of ~A is 0" y))]
	  [(zero? upper-y) (error (format #f "The upper bound of ~A is 0" y))]
	  [else (mul-interval x (make-interval (/ upper-y) (/ lower-y)))])))
