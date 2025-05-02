(define-module (chapter-2 exercise-30))

;; First
(define (square-tree t)
  (cond [(null? t) '()]
	[(not (pair? t)) (* t t)]
	[else (cons (square-tree (car t))
		    (square-tree (cdr t)))]))
;; Second
(define (square-tree t)
  (map (lambda (sub)
	 (if (pair? sub)
	     (square-tree sub)
	     (* sub sub)))
       t))
