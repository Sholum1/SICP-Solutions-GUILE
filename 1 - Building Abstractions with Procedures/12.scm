(define-module (chapter-1 exercise-12))

(define (pascal row col)
  (cond ((or (= col 0) (= col row))        1)
	((or (= col 1) (= col (1- row))) row)
	(else
	 (+ (pascal (1- row) (1- col))
	    (pascal (1- row) col)))))
