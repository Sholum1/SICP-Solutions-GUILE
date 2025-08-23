(define-module (chapter-2 exercise-59))

(define (element-of-set? x set)
  (cond [(null? set) #f]
	[(equal? x (car set)) #t]
	[else (element-of-set? x (cdr set))]))

(define (union-set s1 s2)
  (cond [(null? s1) s2]
	[(null? s2) s1]
	[(element-of-set? (car s1) s2) (union-set (cdr s1) s2)]
	[else (union-set (cdr s1) (cons (car s1) s2))]))
