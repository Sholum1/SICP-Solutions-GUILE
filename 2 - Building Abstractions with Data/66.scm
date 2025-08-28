(define-module (chapter-2 exercise-66)
  #:use-module (chapter-2 exercise-63))

(define (key x) (car x))

(define (lookup gkey set)
  (cond [(null? set) #f]
	[(= gkey (key (entry set))) (entry set)]
	[(< gkey (key (entry set))) (lookup gkey (left-branch set))]
	[(> gkey (key (entry set))) (lookup gkey (right-branch set))]))
