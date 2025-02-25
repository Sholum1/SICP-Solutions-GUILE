(define (accumulate-recur combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate-recur combiner null-value term (next a) a b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate-iter + 0 term a next b))

(define (product term a next b)
  (accumulate-iter * 1 term a next b))
