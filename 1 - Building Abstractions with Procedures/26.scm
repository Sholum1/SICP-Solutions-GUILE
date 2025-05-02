(define-module (chapter-1 exercise-26))

#|
   Louis Reasoner's implementation of expmod transforms an efficient linear
  recursion into an inefficient tree recursion. The issue arises in the even
  case, where he calculates (expmod base (/ exp 2) m) twice instead of using
  the square function to avoid redundant calculations. This duplication of
  work leads to a significant increase in computational effort.

   The recurrence relation for Louis's implementation is:
    * T(n)=2T(n/2)+O(1),
  which evaluates to T(n)=Θ(n). This is because the problem is split into
  two subproblems of half the size, and the results are combined with a
  constant-time operation.

   The original expmod uses the square procedure, which avoids redundant
  calculations. Its recurrence relation is:
    * T(n)=T(n/2)+O(1),
  which evaluates to T(n)=Θ(log(n)). This is because the problem is split into
  a single subproblem of half the size, and the result is combined with a
  constant-time operation.
|#
