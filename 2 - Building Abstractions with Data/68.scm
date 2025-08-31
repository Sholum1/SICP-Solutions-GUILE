(define-module (chapter-2 exercise-68)
  #:use-module (chapter-2 exercise-60)
  #:use-module ((chapter-2 exercise-67)
		#:select (symbols right-branch left-branch leaf?
			  decode sample-message sample-tree))
  #:export     (encode))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
	      (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-1 tree)
    (cond [(leaf? tree) '()]
          [(element-of-set? symbol (symbols (left-branch tree)))
           (cons 0 (encode-1 (left-branch tree)))]
          [(element-of-set? symbol (symbols (right-branch tree)))
           (cons 1 (encode-1 (right-branch tree)))]
          [else (error "bad symbol: ENCODE-SYMBOL" symbol)]))
  (encode-1 tree))

(equal? (encode (decode sample-message sample-tree) sample-tree) sample-message) ; -> #t
(encode '(A D A B B C V) sample-tree) ; -> bad symbol: ENCODE-SYMBOL V
