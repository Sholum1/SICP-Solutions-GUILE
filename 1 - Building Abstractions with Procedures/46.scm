(define-module (chapter-1 exercise-46))

(define (iterative-improve good-enough? improve)
"  Procedure: iterative-improve [good-enough? improve]
   - good-enough takes 2 parameters, where the second
      is be the improved version of the first.
   - improve takes 1 parameter and generates the next one.

   Returns a procedure that iterates over a guess until it finds
    a good-enough answer, and then returns it."
  (define (iter guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
	  next
	  (iter next))))
  iter)

(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess next)
    (< (abs (- guess next))
       (/ guess 1000000000000.0)))
  ((iterative-improve good-enough? improve) 1.0))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? guess next)
    (< (abs (- guess next))
       tolerance))
  ((iterative-improve close-enough? f) first-guess))
