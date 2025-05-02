(define-module (chapter-2 exercise-05))

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

;; gptd extends for "greatest power that divides"
;; The parameter are in the following order
;;  "The greatest power *of* n that divides m"
(define (gptd n m)
  (define (iter m i)
    (let ([next (/ m n)])
      (if (integer? next)
	  (iter next (1+ i))
	  i)))
  (iter m 0))

(define (car n)
  (gptd 2 n))

(define (cdr n)
  (gptd 3 n))
