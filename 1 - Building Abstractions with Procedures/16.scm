(define-module (chapter-1 exercise-16)
  #:export ((iter-fast-expt . fast-expt)))

(define (iter-fast-expt b n)
  (define (iter b n acc)
    (cond ((= n 0) acc)
	  ((even? n) (iter (* b b) (/ n 2) acc))
	  (else (iter b (1- n) (* b acc)))))
  (iter b n 1))
