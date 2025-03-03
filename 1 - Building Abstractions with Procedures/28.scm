(define-module (chapter-1 exercise-28)
  #:use-module (chapter-1 exercise-07))

(define (not= x y) (not (= x y)))

(define (remainder-verified expm m)
  (define sqr (square expm))
  (if (and (not= expm 1)
           (not= expm (- m 1))
           (= (remainder sqr m) 1))
      0
      (remainder sqr m)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder-verified (expmod base (/ exp 2) m) m))
	(else
	 (remainder
	  (* base (expmod base (- exp 1) m))
	  m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (1- n) n) 1))
  (try-it (1+ (random (1- n)))))

(define (fast-prime? n times)
  (cond ((= times 0)           #t)
	((miller-rabin-test n) (fast-prime? n (- times 1)))
	(else                  #f)))

#|
  (miller-rabin-test 2)
   > #t

  (miller-rabin-test 3)
   > #t

  (miller-rabin-test 4)
   > #f

  (miller-rabin-test 5)
   > #t

  (miller-rabin-test 6)
   > #f

  (miller-rabin-test 7)
   > #t

  (miller-rabin-test 8)
   > #f

  (miller-rabin-test 9)
   > #t                ; Probabilistic error

  (miller-rabin-test 10)
   > #f

  (miller-rabin-test 11)
   > #t

  (miller-rabin-test 12)
   > #f

  (miller-rabin-test 13)
   > #t

  (miller-rabin-test 14)
   > #t                 ; Probabilistic error

  (miller-rabin-test 15)
   > #f

  (miller-rabin-test 16)
   > #f

  (miller-rabin-test 17)
   > #t

  (miller-rabin-test 18)
   > #f

  (miller-rabin-test 19)
   > #t

  (miller-rabin-test 20)
   > #f

|#

;; To get better results, you can simply define a procedure such as:
(define (fast-prime? n times)
  (cond ((= times 0) #t)
   	((miller-rabin-test n) (fast-prime? n (- times 1)))
   	(else #f)))

;;  and pass a sufficiently large "times".
;; Because for each additional run, the chance of the test failing is smaller.
