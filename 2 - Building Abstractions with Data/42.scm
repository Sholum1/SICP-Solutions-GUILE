(define-module (chapter-2 exercise-42)
  #:use-module (chapter-2 exercise-33)
  #:use-module (chapter-2 exercise-40))

(define (not= x y)
  (not (= x y)))

(define empty-board '())

(define (safe? k positions)
  (or (null? positions)
      (null? (cdr positions))
      (and (not= (caadr positions) (caar positions))
	   (not= (abs (- (caadr positions) (caar positions)))
		 (abs (- (cadadr positions) k)))
	   (safe? k (cons (car positions) (cddr positions))))))

(define (adjoin-position row column board)
  (cons (list row column) board))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position
		    new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))
