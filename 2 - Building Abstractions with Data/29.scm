(define-module (chapter-2 exercise-29))

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; a)
(define (left-branch  m) (car m))
(define (right-branch m) (car (cdr m)))

(define (branch-length    b) (car b))
(define (branch-structure b) (car (cdr b)))

(define (mobile? m) (pair? m))

;; b)
(define (total-weight m)
  (if (mobile? m)
      (+ (total-weight (left-branch  m))
	 (total-weight (right-branch m)))
      m))

;; c)
(define (torque-branch b)
  (* (branch-length    b)
     (total-weight     (branch-structure b))))

(define (balanced? m)
  (define (balanced-structure? b)
    (let ([s (branch-structure b)])
      (or (not (mobile? s)) (balanced? s))))
  (let ([l (left-branch  m)]
	[r (right-branch m)])
    (and (= (torque-branch l) (torque-branch r))
	 (balanced-structure? l)
	 (balanced-structure? r))))

;; d)
(define (make-mobile left right) (cons left right))
(define (make-branch length structure)
  (cons length structure))

;; I need to change just the right-branch and branch-structure selectors
(define (right-branch     m) (cdr m))
(define (branch-structure m) (cdr m))
