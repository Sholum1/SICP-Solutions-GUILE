(define-module (chapter-2 exercise-72))

#|
   The procedure 'encode-symbol' takes n steps at each node to search for a symbol.
   Since element-of-set? is O(n), encode-symbol is O(n²) in the worst case
  (least common symbol) and O(1) in the best case (most common symbol).
|#
