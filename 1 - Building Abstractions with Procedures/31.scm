(define-module (chapter-1 exercise-31))

(define (product-recur term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product-recur term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial x)
  (product-iter identity 1 1+ x))

(define (jhon-wallis n)
  (define (f x)
    (define term (/ (+ x 2.0) (+ x 3.0)))
    (if (even? x)
	term
	(/ 1 term)))
  (product-iter f 0 1+ n))
