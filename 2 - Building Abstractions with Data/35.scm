(define-module (chapter-2 exercise-35)
  #:use-module (chapter-2 exercise-33)
  #:use-module ((chapter-2 exercise-28)
		#:select ((fringe . enumerate-tree))))

(define (count-leaves t)
  (accumulate + 0 (map (const 1) (enumerate-tree t))))
