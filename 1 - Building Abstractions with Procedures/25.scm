(define-module (chapter-1 exercise-25)
  #:use-module (chapter-1 exercise-24)
  #:use-module (chapter-1 exercise-16))

(define (expmod-alyssa base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test-alyssa n)
  (define (try-it a)
    (= (expmod-alyssa a n n) a))
  (try-it (1+ (random (1- n)))))

#|
  Theoretically, Alyssa's version would work and obtain the same result, but 
   in practice, the intermediate values of (fast-expt base exp) would get larger
   and larger, depending on the language:

    1. cause an overflow;
    2. promote to a bignum.

  In the first case we would have computational errors, where 
   (fast-expt base exp) would compute to negative values, and in the second case
   we would have a loss of performance because promoting and working with bignum
   is costly!

  For example (Guile auto-promotes to bignum):
   fermat-test:
   * ,t (fermat-test 1009)
     > 0.002080s real time, 0.002074s run time.  0.000000s spent in GC.

   * ,t (fermat-test 1013)
     > 0.004751s real time, 0.004741s run time.  0.000000s spent in GC.

   * ,t (fermat-test 1019)
     > 0.004592s real time, 0.004583s run time.  0.000000s spent in GC.

   * ,t (fermat-test 10007)
     > 0.004739s real time, 0.004731s run time.  0.000000s spent in GC.

   * ,t (fermat-test 10013)
     > 0.002872s real time, 0.002867s run time.  0.000000s spent in GC.

   * ,t (fermat-test 10037)
     > 0.002349s real time, 0.002345s run time.  0.000000s spent in GC.
      
   * ,t (fermat-test 100003)
     > 0.004639s real time, 0.004632s run time.  0.000000s spent in GC.
      
   * ,t (fermat-test 100019)
     > 0.006044s real time, 0.006024s run time.  0.000000s spent in GC.
      
   * ,t (fermat-test 100043)
     > 0.004808s real time, 0.004800s run time.  0.000000s spent in GC.
      
   * ,t (fermat-test 1000003)
     > 0.004909s real time, 0.004900s run time.  0.000000s spent in GC.

   * ,t (fermat-test 1000033)
     > 0.012064s real time, 0.040636s run time.  0.030898s spent in GC.
   
   * ,t (fermat-test 1000037)
     > 0.005122s real time, 0.005115s run time.  0.000000s spent in GC.

   fermat-test-alyssa:
   * ,t (fermat-test-alyssa 1009)
     > 0.009733s real time, 0.009716s run time.  0.000000s spent in GC.

   * ,t (fermat-test-alyssa 1013)
     > 0.005801s real time, 0.005795s run time.  0.000000s spent in GC.

   * ,t (fermat-test-alyssa 1019)
     > 0.004002s real time, 0.003995s run time.  0.000000s spent in GC.

   * ,t (fermat-test-alyssa 10007)
     > 0.010435s real time, 0.010428s run time.  0.000000s spent in GC.

   * ,t (fermat-test-alyssa 10013)
     > 0.015545s real time, 0.015539s run time.  0.000000s spent in GC.

   * ,t (fermat-test-alyssa 10037)
     > 0.013878s real time, 0.013871s run time.  0.000000s spent in GC.

   * ,t (fermat-test-alyssa 100003)
     > 0.555605s real time, 0.554579s run time.  0.000000s spent in GC.

   * ,t (fermat-test-alyssa 100019)
     > 0.485272s real time, 0.485221s run time.  0.000000s spent in GC.

   * ,t (fermat-test-alyssa 100043)
     > 0.408383s real time, 0.408347s run time.  0.000000s spent in GC.

   * ,t (fermat-test-alyssa 1000003)
     > 107.290310s real time, 107.285744s run time.  0.014150s spent in GC.

   * ,t (fermat-test-alyssa 1000033)
     > hangs

   * ,t (fermat-test-alyssa 1000037)
     > hangs
|#
