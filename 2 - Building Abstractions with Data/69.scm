(define-module (chapter-2 exercise-69)
  #:use-module ((chapter-2 exercise-67)
		#:select (make-leaf-set adjoin-set make-code-tree))
  #:export     (generate-huffman-tree))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (cond [(null? set) '()]
	[(null? (cdr set)) (car set)]
	[else (successive-merge
	       (adjoin-set (make-code-tree (car set) (cadr set))
			   (cddr set)))]))
