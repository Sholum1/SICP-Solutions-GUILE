(define-module (chapter-1 exercise-06))

#|
   The program will never terminate, because the new-if will always evaluate
  the arguments (predicate then-clause and else-clause).
   So, the (sqrt-iter (impreve guess x) x) will always be evaluated, making a
  infinite recursion.
#|
