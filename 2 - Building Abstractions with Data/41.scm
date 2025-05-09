(define-module (chapter-2 exercise-41)
  #:use-module (chapter-2 exercise-33)
  #:use-module (chapter-2 exercise-40))

(define (unique-triples n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (cons i j))
	  (unique-pairs (1- i))))
   (enumerate-interval 1 n)))     ; k

(define (sum-=-to? lst s)
  (= (accumulate + 0 lst) ; (+ i j k)
     s))

(define (sum-=-pairs n s)
  (filter (lambda (t) (sum-=-to? t s))
	  (unique-triples n)))
