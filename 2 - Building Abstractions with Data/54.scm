(define-module (chapter-2 exercise-54))

;; This definition is different from Scheme implementation,
;; since it can't compare strings
(define (equal? a b)
  (cond [(null? a) (null? b)]
	[(and (symbol? a) (symbol? b)) (eq? a b)]
	[(and (number? a) (number? b)) (= a b)] ;; From notes
	[else (and (pair? a) (pair? b)
		   (equal? (car a) (car b))
		   (equal? (cdr a) (cdr b)))]))
