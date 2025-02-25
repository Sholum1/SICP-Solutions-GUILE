(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (square (expmod base (/ exp 2) m))
	  m))
	(else
	 (remainder
	  (* base (expmod base (- exp 1) m))
	  m))))

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
