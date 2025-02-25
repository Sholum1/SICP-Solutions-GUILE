(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter count acc)
    (if (= count n)
	acc
	(iter (1+ count) (compose f acc))))
  (iter 1 f))
