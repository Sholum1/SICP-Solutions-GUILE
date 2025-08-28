(define-module (chapter-2 exercise-63)
  #:export (entry left-branch right-branch make-tree
	    (tree->list-2 . tree->list)))

#|
  a)  The two procedures produce the same result.
      The first one appends from right to left (adding in the end)
     and the second one conses from left to right (adding in the beginning),
     so the result will always be the same.
|#

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define tree-1 '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))
(define tree-2 '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ())))))
(define tree-3 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
	      (cons (entry tree)
		    (tree->list-1
		     (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list
			     (right-branch tree)
			     result-list)))))
  (copy-to-list tree '()))

(tree->list-1 tree-1) ; -> (1 3 5 7 9 11)
(tree->list-2 tree-1) ; -> (1 3 5 7 9 11)

(tree->list-1 tree-2) ; -> (1 3 5 7 9 11)
(tree->list-2 tree-2) ; -> (1 3 5 7 9 11)

(tree->list-1 tree-3) ; -> (1 3 5 7 9 11)
(tree->list-2 tree-3) ; -> (1 3 5 7 9 11)

#|
  b)  The `tree->list-1` procedure uses `append` in every recursion, so it does
     linear work in node, this way, having a O(nlog(n)) order of growth.
      The `tree->list-2` procedure uses `cons` in every recursion, so it have a
     constant work in each node, this way, having a O(n) order of growth.
|#
