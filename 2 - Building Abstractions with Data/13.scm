(define-module (chapter-2 exercise-13))

#|
   Let's assume that p1 and p2 is less than 0.1% (0.001), doing
  in = [(cn - pn * cn), (cn + pn * cn)], with cn > 0, we have:
    * (mul-intervals i1 i2)
    * -> [(c1 - p1 * c1) * (c2 - p2 * c2), (c1 + p1 * c1) * (c2 + p2 * c2)]
    * -> [c1c2(1 - (p1 + p2) + p1p2), c1c2(1 + (p1 + p2) + p1p2)]

   Note that p1 * p2 << 1, so we can approximate the result to:
    * [c1c2(1 - (p1 + p2)), c1c2(1 + (p1 + p2))]
    * -> [c1c2 - c1c2*(p1 + p2), c1c2 + c1c2*(p1 + p2)]

   So, the percentage tolerance of the product of two intervals with small
  tolerance is the sum of the tolerances.
|#
