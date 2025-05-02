(define-module (chapter-2 exercise-31))

(define (tree-map proc t)
  (map (lambda (sub)
	 (if (pair? sub)
	     (tree-map proc sub)
	     (proc sub)))
       t))
