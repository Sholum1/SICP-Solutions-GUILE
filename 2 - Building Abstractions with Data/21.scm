(define-module (chapter-2 exercise-21))

;; First
(define (square-list items)
  (if (null? items)
      '()
      (cons (expt (car items) 2) (square-list (cdr items)))))

;; Second
(define (square-list items)
  (map (lambda (x) (* x x)) items))
