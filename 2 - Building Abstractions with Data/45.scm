(define-module (chapter-2 exercise-45))

(define (split op1 op2)
  (define (x-split painter n)
    (if (zero? n)
	painter
	(let [(smaller (x-split painter (1- n)))]
	  (op1 painter (op2 smaller smaller)))))
  x-split)
