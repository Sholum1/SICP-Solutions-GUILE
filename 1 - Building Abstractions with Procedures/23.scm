(define-module (chapter-1 exercise-23)
  #:use-module (chapter-1 exercise-22))

(define (smallest-divisor n) (find-divisor n 2))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f)) ;; slightly modified version, so there's no need to verify 2 times

#|
  (timed-prime-test 1009)     
   > new time:    791  ms
   > old time:    1067 ms
   > improvement: 134.89% 

  (timed-prime-test 1013)     
   > new time:    764 ms
   > old time:    999 ms
   > improvement: 130.76%

  (timed-prime-test 1019)
   > new time:    695 ms
   > old time:    971 ms
   > improvement: 139.71%

  (timed-prime-test 10007)
   > new time:    1929 ms
   > old time:    2851 ms
   > improvement: 147.80%

  (timed-prime-test 10009)
   > new time:    1878 ms
   > old time:    2883 ms
   > improvement: 153.51%

  (timed-prime-test 10037)
   > new time:    1824 ms
   > old time:    2938 ms
   > improvement: 161.07%

  (timed-prime-test 100003)
   > new time:    5315 ms
   > old time:    8584 ms
   > improvement: 161.51%

  (timed-prime-test 100019)
   > new time:    5461 ms
   > old time:    9181 ms
   > improvement: 168.12%

  (timed-prime-test 100043)
   > new time:    5348 ms
   > old time:    8646 ms
   > improvement: 161.67%

  (timed-prime-test 1000003)
   > new time:    17000 ms
   > old time:    27189 ms
   > improvement: 159.94%

  (timed-prime-test 1000033)
   > new time:    16740 ms
   > old time:    27919 ms
   > improvement: 166.78%

  (timed-prime-test 1000037)
   > new time:    16773 ms
   > old time:    27441 ms
   > improvement: 163.60%

  Average improvement:  154.11%
  Expected improvement: 200%

  The program doesn't run twice as fast and this could be for a number of
   reasons, such as calling a new procedure (next), performing an extra
   comparison (= n 2) and calling a new + in (+ n 2).
|#
