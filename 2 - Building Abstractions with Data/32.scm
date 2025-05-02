(define-module (chapter-2 exercise-32))

(define (subsets s)
  (if (null? s)
      (list '())
      (let ([rest (subsets (cdr s))])
	(append rest (map (lambda (e) (cons (car s) e)) rest)))))

#|
   The procedure generates all subsets of a set s by leveraging recursion:
    * Base Case: If s is empty, the only subset is the empty set.
    *
    * Recursive Case:
    *  > Compute all subsets of (cdr s). -> rest
    *  > For each subset in rest, create a new subset that includes (car s).
    *  > Combine the original rest with the new subsets including (car s).
|#
