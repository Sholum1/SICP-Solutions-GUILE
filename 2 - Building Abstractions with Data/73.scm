(define-module (chapter-2 exercise-73)
  #:use-module (chapter-2 exercise-56))

#|
  a) The code implements the `deriv` procedure in a data-directed style.
    It uses `get` to find the procedure that takes the derivative of an
    operator such as +, -, *, and /.
     The `number?` and `variable?` predicates cannot be assigned directly
    to the data-directed dispatch because they do not have an operator,
    so there is no `tag`.
|#

;; b)
;; sum
(define (deriv-sum exp var)
  (make-sum (deriv (addend exp) var)
	    (deriv (augend exp) var)))

(put 'deriv '(+) deriv-sum)

;; product
(define (deriv-prod exp var)
  (make-sum (make-product
	     (multiplier exp)
	     (deriv (multiplicand exp) var))
	    (make-product
	     (deriv (multiplier exp) var)
	     (multiplicand exp))))

(put 'deriv '(*) deriv-prod)

;; c)
(define (deriv-exp exp var)
  (make-product (exponent exp)
		(make-product (make-exponentiation (base exp)
						   (1- (exponent exp)))
			      (deriv (base exp) var))))

(put 'deriv '(**) deriv-exp)

#|
  d) The `deriv` tag and the derivation procedure would need to be added to each
    operator, such as:
      * (put '(*) 'deriv deriv-prod).
      * (put '(+) 'deriv deriv-sum)`
|#
