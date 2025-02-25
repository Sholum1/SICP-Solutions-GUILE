(define (square x) (* x x))

(define (cont-frac n d k)
  (define (iter i acc)
    (if (= i 0)
	acc
	(iter (1- i) (/ (n i) (+ (d i) acc)))))
  (iter (1- k) (/ (n k) (d k))))

(define (tan-cf x k)
  (cont-frac (lambda (i)
	       (if (= i 1)
		   x
		   (- (square x))))
	     (lambda (i)
	       (+ i (1- i)))
	     k))
