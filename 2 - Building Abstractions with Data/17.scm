(define-module (chapter-2 exercise-17))

(define (last-pair l)
  (if (null? (cdr l))
      l
      (last-pair (cdr l))))
