(define-module (chapter-2 exercise-14)
  #:use-module (chapter-2 exercise-07)
  #:use-module (chapter-2 exercise-11)
  #:use-module (chapter-2 exercise-12))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
		       (div-interval one r2)))))

(define A (make-center-percent 2 0.1))  ; -> (1.998 . 2.002)
(define B (make-center-percent 3 0.05)) ; -> (2.9985 . 3.0015)

(define A/A (div-interval A A)) ; -> (0.9980019980019982 . 1.002002002002002)
(define A/B (div-interval A B)) ; -> (0.6656671664167916 . 0.6676671669167916)

#|
   We should have obtained A/A -> (1 . 1) or better, a interval with center = 1.0
  and percent = 0%, instead we obtain a interval where the center and percentage
  are:
|#

(center A/A) ; -> 1.000002000002      ; Close to 1.0, but not exact 1
(percent A/A) ; -> 0.1999998000001888 ; Not even close to 0%

#|
   Now, testing par1 and par2, we have:
|#

(define par1-A/B (par1 A B)) ; -> (1.1973624462875987 . 1.2026424497148003)
(define par2-A/B (par2 A B)) ; -> (1.1990399279495647 . 1.2009599280503647)

#|
   This two are approximated equal, but the ideal case would return the same
  resistor.

   The problem is the propagation of the error in the calculation of the
  percentage after a division, as shown above.

   Every division result comes with a small error (the percentage), in the par1
  we make only one division, so, there is just one error propagate to the
  result, but, in par2 we make 3 divisions, each one contributes with a error,
  making the final result very different of the expected.
|#
