(define-module (chapter-2 exercise-64)
  #:use-module (chapter-2 exercise-63)
  #:export     (list->tree)
  #:re-export  (tree->list))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
	(let ((left-result
	       (partial-tree elts left-size)))
	  (let ((left-tree (car left-result))
		(non-left-elts (cdr left-result))
		(right-size (- n (+ left-size 1))))
	    (let ((this-entry (car non-left-elts))
		  (right-result
		   (partial-tree
		    (cdr non-left-elts)
		    right-size)))
	      (let ((right-tree (car right-result))
		    (remaining-elts
		     (cdr right-result)))
		(cons (make-tree this-entry
				 left-tree
				 right-tree)
		      remaining-elts))))))))

#|
  a)  First it verifies if the length of the list is 0, if so, it returns the
     tree '(() elts), otherwise, it recurses in the first half of the list, creating
     left-result. Then it recurses in the remaining elements from the left side
     (the cdr of the left-result),creating right-result. Finally, it conses the tree
     formed by left-result, the element in the middle (for lists of odd length)
     or the first element in the "middle" (for lists of even length) and the
     right-result with the remaining elements (the cdr of right-result).

     Example:
     (list->tree '(1 2 3 4)):
      tree -> (car result)

      1) left-result:    (() 1 2 3 4)
         left-tree:      ()
         right-result:   (() 2 3 4)
         right-tree:     ()
         this-entry:     1
         remaining-elts: (2 3 4)
         result:         ((1 () ()) 2 3 4)

         tree:             1

      2) left-result:    (() 4)
         left-tree:      ()
         right-result:   (())
         right-tree:     ()
         this-entry:     4
         remaining-elts: ()
         result:         ((4 () ()))

         tree:             4

      3) left-result:    (() 3 4)
         left-tree:      ()
         right-result:   ((4 () ()))
         right-tree:     (4 () ())
         this-entry:     3
         remaining-elts: ()
         result:         ((3 () (4 () ())))

         tree:             3
                            \
                             4

      4) left-result:    ((1 () ()) 2 3 4)
         left-tree:      (1 () ())
         right-result:   ((3 () (4 () ())))
         right-tree:     (3 () (4 () ()))
         this-entry:     2
         remaining-elts: ()
         result:         ((2 (1 () ()) (3 () (4 () ()))))

         tree:             2
                          / \
                         1   3
                              \
                               4

  b)  Three `list->tree` procedure does a constant work in each node,
    so it has a O(n) order of growth. As we can see in the item a),
    where a list of 4 elements took 4 steps to complete!
|#
