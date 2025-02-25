(define dx 0.0001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter count acc)
    (if (= count n)
	acc
	(iter (1+ count) (compose f acc))))
  (iter 1 f))

(define (n-fold f n)
  ((repeated smooth n) f))
