(define-module (chapter-2 exercise-11)
  #:use-module (chapter-2 exercise-07)
  #:export     (mul-interval div-interval))

(define (mul-interval x y)
  (define (mul-res a b c d)
    (make-interval (* a b) (* c d)))
  (let ([lower-x (lower-bound x)]
	[upper-x (upper-bound x)]
	[lower-y (lower-bound y)]
	[upper-y (upper-bound y)])
    (cond
     [(positive? lower-x)
      (cond
       [(positive? lower-y) (mul-res lower-x lower-y upper-x upper-y)]   ; 1
       [(negative? upper-y) (mul-res upper-x lower-y lower-x upper-y)]   ; 2
       [else                (mul-res upper-x lower-y upper-x upper-y)])] ; 3
     [(negative? upper-x)
      (cond
       [(positive? lower-y) (mul-res lower-x upper-y upper-x lower-y)]   ; 4
       [(negative? upper-y) (mul-res upper-x upper-y lower-x lower-y)]   ; 5
       [else                (mul-res lower-x upper-y lower-x lower-y)])] ; 6
     [else
      (cond
       [(positive? lower-y) (mul-res lower-x upper-y upper-x upper-y)]   ; 7
       [(negative? upper-y) (mul-res upper-x lower-y lower-x lower-y)]   ; 8
       [else                                                             ; 9
	(make-interval
	 (min (* lower-x upper-y) (* upper-x lower-y))
	 (max (* lower-x lower-y) (* upper-x upper-y)))])])))

(define (div-interval x y)
  (let ([lower-y (lower-bound y)]
	[upper-y (upper-bound y)])
    (cond [(zero? lower-y) (error (format #f "The lower bound of ~A is 0" y))]
	  [(zero? upper-y) (error (format #f "The upper bound of ~A is 0" y))]
	  [else (mul-interval x (make-interval (/ upper-y) (/ lower-y)))])))
