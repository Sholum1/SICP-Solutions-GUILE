(define-module (chapter-2 exercise-27))

(define (deep-reverse t)
  (define (recur t acc)
    (if (pair? t)
	(let ([c (car t)])
	  (recur (cdr t) (if (pair? c)
			     (cons (recur c '()) acc)
			     (cons c acc))))
	acc))
    (recur t '()))

