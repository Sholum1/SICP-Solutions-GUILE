#|
  Lets make x = 1 + 1/x, so x² = x + 1, or better, x² - x - 1 = 0,
   implying that x = (1 + sqrt(5)) / 2 or x = (1 - sqrt(5)) / 2, so
   the golden ration (ϕ = (1 + sqrt(5)) / 2) is a fixed point of the
   transformation x -> 1 + 1/x.
|#

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

#|
  (fixed-point (lambda (x) (+ 1 (/ x))) 1.0)
   > 1.6180327868852458 ~= (1 + sqrt(5)) / 2 = ϕ
|#
