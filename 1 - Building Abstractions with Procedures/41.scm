(define-module (chapter-1 exercise-41))

(define (double g)
  (lambda (x) (g (g x))))

#|
  (((double (double double)) 1+) 5)
   > 21 = 5 + 16 

   N successive calls to double result in 2^^n applications of g.
  Where 2^^n is 2 tetrated to n.

   The definition of tetration can be found in:
  <https://en.wikipedia.org/wiki/Tetration/>
|#
