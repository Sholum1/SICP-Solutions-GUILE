(define-module (chapter-2 exercise-19))

(define (first-denominations coin-values)        (car coin-values))
(define (except-first-denominations coin-values) (cdr coin-values))
(define (no-more? coin-values)                   (null? coin-values))

#|
   The order of the list coin-values does not affect the answer because
  the cc procedure will, recursively, look at every combination in the
  coin-values list.
|#
