(define-module (chapter-1 exercise-18))

(define (fast-mul-iter a b)
  (define (iter a b acc)
    (cond ((= b 0) acc)
	  ((even? b) (iter (double a) (halve b) acc))
	  (else (iter a (1- b) (+ a acc)))))
  (iter a b 0))
