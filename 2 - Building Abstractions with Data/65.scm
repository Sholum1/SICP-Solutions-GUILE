(define-module (chapter-2 exercise-65)
  #:use-module (chapter-2 exercise-64)
  #:use-module (chapter-2 exercise-62))

(define (union-set-tree s1 s2)
  (list->tree (union-set (tree->list s1) (tree->list s2))))

(define (intersection-set-tree s1 s2)
  (list->tree (intersection-set (tree->list s1) (tree->list s2))))
