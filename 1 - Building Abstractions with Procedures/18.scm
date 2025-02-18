(define (double x) (+ x x))

(define (halve x)
  (if (even? x)
      (/ x 2)
      (error x "is not a even integer")))

(define (fast-mul-iter a b)
  (define (iter a b acc)
    (cond ((= b 0) acc)
	  ((even? b) (iter (double a) (halve b) acc))
	  (else (iter a (1- b) (+ a acc)))))
  (iter a b 0))
