(define (square x) (* x x))

(define (cube x) (* x x x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (improve guess x)
  (approx guess (/ x (square guess))))

(define (approx x y)
  (/ (+ (* 2 x) y) 3))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x)))
     (/ guess 1000000000000.0)))

(define (cube-root x)
  (cube-root-iter 1.0 x))
