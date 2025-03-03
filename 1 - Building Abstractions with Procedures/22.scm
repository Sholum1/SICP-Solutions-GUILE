(define-module (chapter-1 exercise-22)
  #:use-module (chapter-1 exercise-21)
  #:re-export  (square)
  #:export     (runtime report-prime))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (runtime) (get-internal-real-time))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f)) ;; slightly modified version, so there's no need to verify 2 times

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (search-for-primes n)
  (define (search-internal n count)
    (cond ((= count 3) (newline) (display "DONE\n") (newline))
	  ((timed-prime-test n) (search-internal (+ 2 n) (+ 1 count)))
	  (else (search-internal (+ 2 n) count))))
  (if (odd? n)
      (search-internal n      0)
      (search-internal (1+ n) 0)))

#|
  (search-for-primes 1000)
   - Output:
    > 1001
    > 1003
    > 1005
    > 1007
    > 1009 *** 1067
    >
    > 1011
    > 1013 *** 999
    >
    > 1015
    > 1017
    > 1019 *** 971
    >
    > DONE

   - Mean: 1022.3333333333334
  
  (search-for-primes 10000)
   - Output:
    > 10001
    > 10003
    > 10005
    > 10007 *** 2851
    >
    > 10009 *** 2883
    >
    > 10011
    > 10013
    > 10015
    > 10017
    > 10019
    > 10021
    > 10023
    > 10025
    > 10027
    > 10029
    > 10031
    > 10033
    > 10035
    > 10037 *** 2938
    >
    > DONE

   - Mean: 2890.6666666666665
  
  (search-for-primes 100000)
   - Output:
    > 100001
    > 100003 *** 8584
    >
    > 100005
    > 100007
    > 100009
    > 100011
    > 100013
    > 100015
    > 100017
    > 100019 *** 9181
    >
    > 100021
    > 100023
    > 100025
    > 100027
    > 100029
    > 100031
    > 100033
    > 100035
    > 100037
    > 100039
    > 100041
    > 100043 *** 8646
    >
    > DONE

   - Mean: 8803.666666666666
  
  (search-for-primes 1000000)
   - Output:
    > 1000001
    > 1000003 *** 27189
    >
    > 1000005
    > 1000007
    > 1000009
    > 1000011
    > 1000013
    > 1000015
    > 1000017
    > 1000019
    > 1000021
    > 1000023
    > 1000025
    > 1000027
    > 1000029
    > 1000031
    > 1000033 *** 27919
    >
    > 1000035
    > 1000037 *** 27441
    >
    > DONE

   - Mean: 27516.333333333332

   Yes! The time taken to compute the three smallest primes larger than 10,000
    is around sqrt(10) the time taken to compute the three smallest primes 
    larger than 1000.
    - (* 1022.3333333333334 (sqrt 10)) 
      -> 3232.9018612454734 ~= 2890.6666666666665

   Yes! The time taken to compute the three smallest primes larger than 100,000
    and 1,000,000 are very close to (sqrt (n)) prediction, the three primes in
    each run took a close to each other time to compute, and the primes larger
    than 1,000,000 took around (sqrt 10) times more to compute than 100,000.

   Yes! The result obtained in this test are compatible with the notion that 
    programs on my machine run in time proportional to the number of steps
    required for the computation.
|#
