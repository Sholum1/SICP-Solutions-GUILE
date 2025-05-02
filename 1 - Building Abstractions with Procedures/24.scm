(define-module (chapter-1 exercise-24)
  #:use-module (chapter-1 exercise-22)
  #:export     ((fast-prime? . prime?) expmod fermat-test))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (square (expmod base (/ exp 2) m))
	  m))
	(else
	 (remainder
	  (* base (expmod base (1- exp) m))
	  m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (1+ (random (1- n)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (1- times)))
	(else #f)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1)
      (report-prime (- (runtime) start-time))
      #f)) ;; slightly modified version, so there's no need to verify 2 times

#|
  (timed-prime-test 1009)
   > new time:    1071 ms
   > old time:    1067 ms
   > improvement: 99.63% (slower)

  (timed-prime-test 1013)
   > new time:    871 ms
   > old time:    999 ms
   > improvement: 114.70%

  (timed-prime-test 1019)
   > new time:    821 ms
   > old time:    971 ms
   > improvement: 118.27%

  (timed-prime-test 10007)
   > new time:    1097 ms
   > old time:    2851 ms
   > improvement: 259.89%

  (timed-prime-test 10009)
   > new time:    985  ms
   > old time:    2883 ms
   > improvement: 189.44%

  (timed-prime-test 10037)
   > new time:    971  ms
   > old time:    2938 ms
   > improvement: 302.57%

  (timed-prime-test 100003)
   > new time:    1153 ms
   > old time:    8584 ms
   > improvement: 744.50%

  (timed-prime-test 100019)
   > new time:    1143 ms
   > old time:    9181 ms
   > improvement: 803.24%

  (timed-prime-test 100043)
   > new time:    1297 ms
   > old time:    8646 ms
   > improvement: 666.62%

  (timed-prime-test 1000003)
   > new time:    1347  ms
   > old time:    27189 ms
   > improvement: 2017.49%

  (timed-prime-test 1000033)
   > new time:    1327  ms
   > old time:    27919 ms
   > improvement: 2103.92%

  (timed-prime-test 1000037)
   > new time:    1334  ms
   > old time:    27441 ms
   > improvement: 2057.05%

  The time required to test primes close to 1,000,000 using fast-prime? is 
   approximately equivalent to the time required to calculate primes close
   to 1,000 using prime?.
  The empirical evidence gathered from these tests indicates that as the order
   of magnitude of the prime being tested increases, the time required to execute
   the old procedure (using prime?) experiences a linear escalation, while the
   time required to run the new procedure (using fast-prime?) exhibits a
   logarithmic increase.
|#
