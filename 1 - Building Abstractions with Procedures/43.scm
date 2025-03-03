(define-module (chapter-1 exercise-43)
  #:use-module (chapter-1 exercise-42)
  #:export     (repeated))

(define (repeated f n)
  (define (iter count acc)
    (if (= count n)
	acc
	(iter (1+ count) (compose f acc))))
  (iter 1 f))
