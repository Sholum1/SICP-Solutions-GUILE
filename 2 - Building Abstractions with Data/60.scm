(define-module (chapter-2 exercise-60))

;; O(n): same implementation
(define (element-of-set? x set)
  (cond [(null? set) #f]
	[(equal? x (car set)) #t]
	[else (element-of-set? x (cdr set))]))

;; O(1)
(define (adjoin-set x set)
  (cons x set))

;; O(n): same implementation
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1) (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

;; O(n)
(define (union-set s1 s2)
  (append s1 s2))
