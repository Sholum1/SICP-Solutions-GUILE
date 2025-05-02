(define-module (chapter-2 exercise-09)
  #:use-module (chapter-2 exercise-07))

(define (width-interval x)
  (/ (+ (upper-bound x) (lower-bound x) 2)))

#|
   Let's take two generic intervals (x . y) and (a . b) without loss of
  generality.

   For the sum (or subtraction) we have:
    * (add-interval '(x . y) '(a . b)) -> ((+ x a) . (+ y b))

   The width of this interval will be:
    * (width-interval '((+ x a) . (+ y b))) -> (/ (+ (+ x a) (+ y b)) 2)
    * -> (+ (/ (+ x a) 2) (/ (+ y b) 2))

   So, the width of the sum of two intervals is the sum of the widths of
  those intervals.

  The demonstration is analogously for subtraction.
|#

#|
   First, let's take the product of the widths of two intervals
  (1 . 2) and (1/4 . 1/2):
    * (* (width-interval '(1 . 2)) (width-interval '(1/4 . 1/2))) -> 4/55

   And finally the width of the multiplication of these intervals:
    * (width-interval (mul-interval '(1 . 2) '(1/4 . 1/2))) -> 4/13

   Which are 2 different results!
|#
