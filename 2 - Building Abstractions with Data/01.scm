(define-module (chapter-2 exercise-01))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline)) ; So the repl can handle it correctly

(define (make-rat n d)
  (let ((g      (gcd n d))
        ;; We are interested only in the signal of the denominator
	(sign-d (if (positive? d) 1 -1)))
    (cons (/ n g sign-d) (/ d g sign-d))))
