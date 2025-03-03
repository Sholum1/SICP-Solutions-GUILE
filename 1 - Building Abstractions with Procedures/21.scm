(define-module (chapter-1 exercise-21)
  #:use-module ((chapter-1 exercise-07)
		#:select (square))
  #:re-export (square)
  #:export    (smallest-divisor find-divisor))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

#|
  (smallest-divisor 199)   -> 199  (prime)

  (smallest-divisor 1999)  -> 1999 (prime)

  (smallest-divisor 1999)  -> 7 

|#
