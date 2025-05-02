(define-module (chapter-1 exercise-45)
  #:use-module ((chapter-1 exercise-07)
		#:select (average))
  #:use-module (chapter-1 exercise-16)
  #:use-module (chapter-1 exercise-35)
  #:use-module (chapter-1 exercise-43))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (number-of-damps-per-nth-root x nth number-of-damps)
  (fixed-point
   ((repeated average-damp number-of-damps)
    (lambda (y)
      (/ x (expt y (1- nth)))))
   1.0))

;; Let's make some tests with the biggest fixnum possible 2305843009213693951:
(define fixnum 2305843009213693951)
  
;; The following loop will display the procedure being evaluated and the result,
;; if it hangs, I will try with a bigger number-of-damps:

(define (loop n number-of-damps)
  (format #t "* (number-of-damps-per-nth-root fixnum ~A ~A)~% > ~A~%~%"
          n number-of-damps (number-of-damps-per-nth-root
     			     fixnum n number-of-damps))
  (loop (1+ n) number-of-damps))

#|
   First try:
     * (number-of-damps-per-nth-root fixnum 1 1)
      > 2305843009213694000.0

     * (number-of-damps-per-nth-root fixnum 2 1)
      > 1518500249.9880247

     * (number-of-damps-per-nth-root fixnum 3 1)
      > 1321122.9748166597

   It hangs in the 4th-root.
   Second try:
     * (number-of-damps-per-nth-root fixnum 4 2)
      > 38967.93874440917

     * (number-of-damps-per-nth-root fixnum 5 2)
      > 4705.068462582614

     * (number-of-damps-per-nth-root fixnum 6 2)
      > 1149.4011357062298

     * (number-of-damps-per-nth-root fixnum 7 2)
      > 420.0117057678675

   It hangs on another power of 2, the 8th-root.
   Third try:
     * (number-of-damps-per-nth-root fixnum 8 3)
      > 197.40298565221644

     * (number-of-damps-per-nth-root fixnum 9 3)
      > 109.72723079401828

     * (number-of-damps-per-nth-root fixnum 10 3)
      > 68.5935021140869

     * (number-of-damps-per-nth-root fixnum 11 3)
      > 46.70336447884993

     * (number-of-damps-per-nth-root fixnum 12 3)
      > 33.902816697465894

     * (number-of-damps-per-nth-root fixnum 13 3)
      > 25.85385499999959

     * (number-of-damps-per-nth-root fixnum 14 3)
      > 20.494182870414445

     * (number-of-damps-per-nth-root fixnum 15 3)
      > 16.75670139358163

    Again, it hangs on a power of 2, the 16th-root.
    Forth try:
     * (number-of-damps-per-nth-root fixnum 16 4)
      > 14.050017282986396

     * (number-of-damps-per-nth-root fixnum 17 4)
      > 12.027253425813242

     * (number-of-damps-per-nth-root fixnum 18 4)
      > 10.475076366491042

     * (number-of-damps-per-nth-root fixnum 19 4)
      > 9.256883381115294

     * (number-of-damps-per-nth-root fixnum 20 4)
      > 8.28211992997782

     * (number-of-damps-per-nth-root fixnum 21 4)
      > 7.488940779252993

     * (number-of-damps-per-nth-root fixnum 22 4)
      > 6.833984262381559

     * (number-of-damps-per-nth-root fixnum 23 4)
      > 6.28613966131147

     * (number-of-damps-per-nth-root fixnum 24 4)
      > 5.822615619599516

     * (number-of-damps-per-nth-root fixnum 25 4)
      > 5.426414558624596

     * (number-of-damps-per-nth-root fixnum 26 4)
      > 5.084672705180627

     * (number-of-damps-per-nth-root fixnum 27 4)
      > 4.78745302360196

     * (number-of-damps-per-nth-root fixnum 28 4)
      > 4.527046711970369

     * (number-of-damps-per-nth-root fixnum 29 4)
      > 4.297356938259297

     * (number-of-damps-per-nth-root fixnum 30 4)
      > 4.093499666659778

     * (number-of-damps-per-nth-root fixnum 31 4)
      > 3.911558888826838

    Yeah, that's it, it always hangs n is a power of 2 and 2^number-of-damps
   is less than n.
    So, we have that, number-of-damps needs to be the greatest integer less than
   or equal to log_(n)

    So, we have:
|#

(define (damps x)
  (floor (/ (log x) (log 2))))

(define (nth-root x nth)
  (fixed-point
   ((repeated average-damp (damps nth))
    (lambda (y)
      (/ x (expt y (1- nth)))))
   1.0))
