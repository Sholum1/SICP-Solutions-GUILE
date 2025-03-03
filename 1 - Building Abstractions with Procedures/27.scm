(define-module (chapter-1 exercise-27)
  #:use-module ((chapter-1 exercise-24)
		#:select (prime? expmod)))

(define (fermat-test n)
  (define (try-it a)
    (cond ((= a 1) #t)
	  ((= (expmod a n n) a) (try-it (1- a)))
	  (else #f)))
  (try-it (1- n)))

#|
  (fermat-test 561)
   > #t

  (fermat-test 1105)
   > #t

  (fermat-test 1729)
   > #t

  (fermat-test 2465)
   > #t

  (fermat-test 2821)
   > #t

  (fermat-test 6601)
   > #t
|#
