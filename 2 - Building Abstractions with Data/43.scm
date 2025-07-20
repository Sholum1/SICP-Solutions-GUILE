(define-module (chapter-2 exercise-43))

#|
   The problem with this exchange is that the queen-col recursions will occur for every
  element of (enumerate-interval 1 board-size), so it will occur for a number of
  board-size elements.

   Thus, the first version runs in O(n!), while the Louis version runs in
  in O(n^n), where n = board size. So, in summary, the Louis version is exponentially
  slower than the first version.
|#
