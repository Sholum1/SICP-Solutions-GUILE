(define-module (chapter-2 exercise-38)
  #:use-module ((chapter-2 exercise-36)
		:select ((accumulate . fold-right)))
  #:re-export  (fold-right)
  #:export     (fold-left))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))      ;; -> 3/2
(fold-left  / 1 (list 1 2 3))      ;; -> 1/6
(fold-right list '() (list 1 2 3)) ;; -> (1 (2 (3 ())))
(fold-left  list '() (list 1 2 3)) ;; -> (((() 1) 2) 3)

#|
   For (fold-left op i s) to be equal to (fold-right op i s) op need to be
  commutative, in other words, op need to respect the following property:
    - (op x y) = (op y x)
   For example:
|#

(= (fold-left + 0 '(1 2 3)) (fold-right + 0 '(1 2 3))) ;; -> #t
(= (fold-left * 1 '(1 2 3)) (fold-right * 1 '(1 2 3))) ;; -> #t
