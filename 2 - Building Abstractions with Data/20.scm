(define-module (chapter-2 exercise-20))

(define (same-parity . args)
  (define compare-parity
    (if (even? (car args))
	even?
	odd?))
  (define (iter l acc)
    (cond [(null? l)                (reverse acc)]
	  [(compare-parity (car l)) (iter (cdr l) (cons (car l) acc))]
	  [else                     (iter (cdr l) acc)]))
  (iter args '()))
