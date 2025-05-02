(define-module (chapter-2 exercise-24))

(list 1 (list 2 (list 3 4))) ; -> (1 (2 (3 4)))

#|
   Box-and-pointer:
    * [1 | ]
    *     |
    *     -> [2 | ]
    *            |
    *            -> [3 | ]
    *                   |
    *                   -> [4 |/]

   Tree:
    * (1 (2 (3 4)))
    *      / \
    *     1   (2 (3 4))
    *           / \
    *          2   (3 4)
    *               / \
    *              3   4
|#
