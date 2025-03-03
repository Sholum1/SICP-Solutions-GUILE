(define-module (chapter-1 exercise-07)
  #:export (square average))

#|
   For smaller numbers, the problem with `good-enough?' is that the precision is
  fixed at is fixed to 0.001. So, for any number smaller than 0.001,
  the program will before getting a good result.

  Example:
    - (sqrt 0.001)         -> 0.04124542607499115
    - (sqrt 0.00000000004) -> 0.03125000042625
|#


#|
   For larger numbers, the problem with `good-enough?' is that, as noted in the
  in the book: "the precision of arithmetic operations is almost always
  with limited precision".
   So, if the difference between two successive guesses is less than the precision that the
  allowed by the machine, the numbers are represented as the same, and the
  `sqrt-iter' recursion will never end.

  Example:
    - (sqrt 10000000000000) -> hangs
      -> Hangs on guess = 3162277.6601683795
      -> (improve 3162277.6601683795 10000000000000) -> 3162277.6601683795

    - (sqrt 123123123123123) -> hangs
      -> gets stuck on guess = 11096085.937082633
      -> (improve 11096085.937082633 123123123123123) -> 11096085.937082633
|#

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x)))
     (/ guess 1000000000000.0)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

#|
  With this new versions of `good-enough?' we have:
   - (sqrt 0.001)           -> 0.03162277660168433
   - (sqrt 0.00000000004)   -> 6.324555320336758e-6
   - (sqrt 10000000000000)  -> 3162277.6601683795
   - (sqrt 123123123123123) -> 11096085.937082633
|#
