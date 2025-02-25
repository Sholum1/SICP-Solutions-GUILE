(define (cont-frac n d k)
  (define (iter i acc)
    (if (= i 0)
	acc
	(iter (1- i) (/ (n i) (+ (d i) acc)))))
  (iter (1- k) (/ (n k) (d k))))

(define (e k)
  (+
   (cont-frac (lambda (i) 1.0)
	      (lambda (i)
		(if (= (remainder i 3) 2)
   		    (* 2 (quotient (1+ i) 3))
		    1))
	      k)
   2))
