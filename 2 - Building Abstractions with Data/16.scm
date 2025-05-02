(define-module (chapter-2 exerciser-16))

#|
   The problem of constructing equivalent algebraic expressions that always
  return the same result for the same interval is called Dependency Problem
  <https://en.wikipedia.org/wiki/Interval_arithmetic#Dependency_problem/>.

   The dependency problem in interval arithmetic occurs when the same variable
  is used multiple times in calculations, leading to overestimation of
  uncertainty due to correlated intervals rather than treating them as
  independent.

   This problem is known to not have a solution, this is, there is no general
  method to eliminate all dependencies while still accurately representing
  the uncertainty of the results.

   So, it is impossible to write an interval-arithmetic package that does not
  have the this shortcoming.
|#
