(define-module (chapter-1 exercise-11))

;; Recursive version
(define (f-recur n)
  (if (< n 3)
      n
      (+
       (f-recur (- n 1))
       (* 2 (f-recur (- n 2)))
       (* 3 (f-recur (- n 3))))))

;; Iterative version
(define (f-iter n)
  (define (iter a b c counter)
    (cond ((< counter 0) counter)
	  ((< counter 3) a)
	  (else (iter (+ a (* 2 b) (* 3 c)) a b (- counter 1)))))
  (iter 2 1 0 n))

#|
  Comparison:

  recursive:
  - ,t (f-recur 20)
    - 10771211
    - 0.005815s real time, 0.005802s run time.  0.000000s spent in GC.

  - ,t (f-recur 30)
    - 61354575194
    - 0.451502s real time, 0.451437s run time.  0.000000s spent in GC.

  - ,t (f-recur 35)
    - 4630608915694
    - 9.321903s real time, 9.321605s run time.  0.000000s spent in GC.

  - ,t (f-recur 40) -> hangs

  iterative:
  - ,t (f-iter 20)
    - 10771211
    - 0.005300s real time, 0.005290s run time.  0.000000s spent in GC.

  - ,t (f-iter 30)
    - 61354575194
    - 0.005130s real time, 0.005119s run time.  0.000000s spent in GC.

  - ,t (f-iter 35)
    - 4630608915694
    - 0.007979s real time, 0.007952s run time.  0.000000s spent in GC.

   - ,t (f-iter 40)
    - 349485574054925
    - 0.004957s real time, 0.004948s run time.  0.000000s spent in GC.
|#
