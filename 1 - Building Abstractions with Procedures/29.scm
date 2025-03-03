(define-module (chapter-1 exercise-29))

(define (simpsons-rule f a b n)
  (define h (/ (- b a) n))
  (define (iter sum k)
    (cond ((= k n)  (+ sum (f (+ a (* k h)))))
	  ((= k 0)  (iter (+ sum (f a))                   (1+ k)))
	  ((odd? k) (iter (+ sum (* 4 (f (+ a (* k h))))) (1+ k)))
	  (else     (iter (+ sum (* 2 (f (+ a (* k h))))) (1+ k)))))
  (* (/ h 3.0) (iter 0 0)))

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

#|
  (simpsons-rule cube 0 1 100)
   > 0.25

  (integral cube 1 0 0.01)
   > 0.24998750000000042

  (simpsons-rule cube 0 1 1000)
   > 0.25

  (integral cube 1 0 0.001)
   >  0.249999875000001
|#
