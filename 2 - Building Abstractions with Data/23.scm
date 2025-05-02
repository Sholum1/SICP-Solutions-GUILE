(define-module (chapter-2 exercise-23))

(define (for-each proc list)
  (when (not (null? list))
    (proc (car list)) (for-each proc (cdr list))))
