(define-module (chapter-2 exercise-18))

(define (reverse l)
  (define (iter l acc)
    (if (null? l)
	acc
	(iter (cdr l) (cons (car l) acc))))
  (iter l '()))
