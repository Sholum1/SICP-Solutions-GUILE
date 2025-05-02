(define-module (chapter-1 exercise-15))

#|
  a)
  The procedure p is evaluated 5 times as showed in the tree below.

      (sine 12.15)
      |  (sine 4.05)
      |  |  (sine 1.3499999999999999)
      |  |  |  (sine 0.44999999999999996)
      |  |  |  |  (sine 0.15)
      |  |  |  |  |  (sine 0.049999999999999996)
  1-  |  |  |  |  (p 0.049999999999999996)
  2-  |  |  |  (p 0.1495)
  3-  |  |  (p 0.4351345505)
  4-  |  (p 0.9758465331678772)
  5-  (p -0.7895631144708228)
      -0.39980345741334
|#

#|
  b)
   Every iteration of (sine a) divide a by 3 if a is bigger than 0.1, so, the
  iteration process stops when a/(3^n) < 0.1, implying that:
     * 10a < 3^n
     * n > (log(a) + log(10))/log(3)
    Concluding that, for the number of steps, the order of growth of the
   sine procedure is Θ(log(a)).
    As shown by the recursion tree of a), is necessary to maintain a stack
   of calls to the sine procedure. Therefore, the order of growth in space
   is also Θ(log(a)), which is the depth of the recursion.
|#
