(define-module (chapter-2 exercise-51)
  #:use-module (chapter-2 exercise-50))

;; a)
(define (below painter1 painter2)
  (let [(split-point (make-vect 0.0 0.5))]
    (let [(paint-bottom
	   (transform-painter
	    painter1
	    (make-vect 0.0 0.0)
	    (make-vect 1.0 0.5)
	    split-point))
	  (paint-top
	   (transform-painter
	    painter2
	    split-point
	    (make-vect 1.0 0.5)
	    (make-vect 0.0 1.0)))]
      (lambda (frame)
	(paint-bottom frame)
	(paint-top frame)))))

;; b) in terms of beside and suitable rotation operations *(from Exercise 2.50)*.

(define rotate90
  (compose rotate270 rotate180))

(define (below painter1 painter2)
  (rotate90
   (beside (rotate270 painter1)
	   (rotate270 painter2))))
