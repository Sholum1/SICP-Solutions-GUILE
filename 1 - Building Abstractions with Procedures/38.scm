(define-module (chapter-1 exercise-38)
  #:use-module (chapter-1 exercise-37))

(define (e k)
  (+
   (cont-frac (lambda (i) 1.0)
	      (lambda (i)
		(if (= (remainder i 3) 2)
   		    (* 2 (quotient (1+ i) 3))
		    1))
	      k)
   2))
