(define-module (chapter-1 exercise-04))

#|
   The function uses an if expression to choose either the addition
  if b is positive, or the subtraction operator (-) if b is negative.
  Then it applies the chosen operator to a and b.
|#

(define (a-plus-abs-b a b)
  ((if     
    (> b 0)          ;; If b is bigger than 0
    +                ;; then apply the + operator
    -)               ;; else apply the - operator
   a b))	     ;; in a and b


#|
  Examples:
   - (a-plus-abs-b 2 3)  -> (+ 2 3)  -> 5
   - (a-plus-abs-b 2 -3) -> (- 2 -3) -> 5
|#
