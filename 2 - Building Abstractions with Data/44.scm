(define-module (chapter-2 exercise-44))

(define (up-split painter n)
  (if (zero? n)
      painter
      (let [(smaller (up-split painter (1- n)))]
	(below painter (beside smaller smaller)))))
