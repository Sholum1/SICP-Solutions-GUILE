(define-module (chapter-2 exercise-77))

#|
   This works because, in Session 2.4.3, 'Data-Directed Programming and Additivity",
  the procedure magnitude was defined for both rectangular and polar, so it is
  only necessary to add a generic for complex.

   The procedure apply-generic will be called twice: once for complex and once
  for rectangular.
|#
