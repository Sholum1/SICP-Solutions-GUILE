(define-module (chapter-2 exercise-39)
  #:use-module ((chapter-2 exercise-38)))

(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y `(,x))) '() sequence))

(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
