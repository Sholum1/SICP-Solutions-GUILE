(define-module (chapter-1 exercise-37)
  #:use-module (ice-9 format)
  #:export     ((cont-frac-iter . cont-frac)))

(define (cont-frac-recur n d k)
  (define (recur i)
    (if (= i k)
	(/ (n i) (d i))
	(/ (n i) (+ (d i) (recur (1+ i))))))
  (recur 1))

(define (cont-frac-iter n d k)
  (define (iter i acc)
    (if (= i 0)
	acc
	(iter (1- i) (/ (n i) (+ (d i) acc)))))
  (iter (1- k) (/ (n k) (d k))))

#|
  1/ϕ ~= 0.6180

   I used the following recursion, which uses some concepts and procedures not
  described in this book, to find the number of steps needed to find 0.6180:
|#

(define (number-of-steps)
  (define (iter k)
    (let ([res (cont-frac-iter (lambda (i) 1.0)
   			       (lambda (i) 1.0)
   			       k)])
      (if (string=
   	   (string-take (format #f "~,6f" res) 6)
   	   "0.6180")
   	  (values k res)
   	  (iter (1+ k)))))
  (iter 1))

#|
   > (number-of-steps) 
     > 11
     > 0.6180555555555556

   With k = 11 we get an good enough approximation that is accurate to 4 decimal
  places of 1/ϕ
|#
