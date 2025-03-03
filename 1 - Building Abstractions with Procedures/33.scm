(define-module (chapter-1 exercise-33))

(define (filtered-accumulate combiner null-value term a next b pred?)
  (define (iter a result)
    (cond ((> a b) result)
	  ((pred? a) (iter (next a) (combiner result (term a))))
	  (else      (iter (next a) result))))
  (iter a null-value))

(define (sum-square-prime a b)
  (filtered-accumulate + 0 square a 1+ b prime?))

(define (product-relatively-prime n)
  (define (relatively-prime? i)
    (= (gcd i n) 1))
  (filtered-accumulate * 1 identity 1 1+ (1- n) relatively-prime?))
