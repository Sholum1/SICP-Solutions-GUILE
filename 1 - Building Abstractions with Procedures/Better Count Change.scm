(define-module (chapter-1 Better-count-change))

#|
  In page 53:
  Count-change generates a tree-recursive process with redundancies similar
  to those in our ﬁrst implementation of fib. (It will take quite a while
  for that 292 to be computed.) On the other hand, it is not obvious how
  to design a better algorithm for computing the result, and we leave this
  problem as a challenge.
|#

;; Here I will use previous knowledge, not yet covered in the chapter

(define (count-change amount) (cc amount 5))

;; Let's use memoization to speed-up the process
(define (memoize proc)
  (define mem (make-hash-table))
  (lambda args
    (or (hash-ref  mem args)
	(hash-set! mem args (apply proc args)))))

(define cc (memoize (lambda (amount kinds-of-coins)
		      (cond ((= amount 0) 1)
			    ((or (< amount 0) (= kinds-of-coins 0)) 0)
			    (else (+ (cc amount
					 (- kinds-of-coins 1))
				     (cc (- amount
					    (first-denomination kinds-of-coins))
					 kinds-of-coins)))))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 5) 50)))

(define (old-count-change amount) (old-cc amount 5))

(define (old-cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (= kinds-of-coins 0)) 0)
	(else (+ (old-cc amount
		     (- kinds-of-coins 1))
		 (old-cc (- amount
			(first-denomination
			 kinds-of-coins))
		     kinds-of-coins)))))

#|
  Comparison:

  old-version: 
  - ,time (old-count-change 100)
    - 292
    - 0.005475s real time, 0.005464s run time.  0.000000s spent in GC.
  - ,time (old-count-change 1000)
    - 801451
    - 4.197104s real time, 4.217963s run time.  0.022299s spent in GC.
  - ,time (old-count-change 1234)
    - 1773850
    - 11.488751s real time, 11.488282s run time.  0.000000s spent in GC.

  new-version:
  - ,time (count-change 100)
     - 292
     - 0.004491s real time, 0.004484s run time.  0.000000s spent in GC.

  - ,time (count-change 1000)
    - 801451
    - 0.004802s real time, 0.004798s run time.  0.000000s spent in GC.

  - ,time (count-change 1234)
     - 1773850
     - 0.009776s real time, 0.009498s run time.  0.000000s spent in GC.
|#
