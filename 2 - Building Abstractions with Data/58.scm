(define-module (chapter-2 exercise-58)
  #:use-module ((chapter-2 exercise-56)
		#:select (=number? variable? same-variable?))
  #:duplicates (replace)
  #:export     (memq))

;; a) We need to modify only the
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list a1 '+ a2))))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

(define (augend s) (caddr s))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list m1 '* m2))))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p) (caddr p))

;; b)
(define (take-until-op op l)
  "Receives a predicate and a list, and takes the elements of the list until the
predicate evaluates to #t."
  (define (pred? x)
    (eq? x op))

  (define (iter l out)
    (cond [(null? l) l]
	  [(pred? (car l)) (if (null? (cdr out))
			       (car out)
			       (reverse! out))]
	  [else (iter (cdr l) (cons (car l) out))]))
  (iter l '()))

(define (drop-until-op op l)
  "Receives a predicate and a list, and drops the elements of the list until the
predicate evaluates to #t."
  (define (pred? x)
    (eq? x op))

  (define (iter l)
    (cond [(null? l) l]
	  [(pred? (car l)) (if (null? (cddr l))
			       (cadr l)
			       (cdr l))]
	  [else (iter (cdr l))]))
  (iter l))

(define (memq item x)
  (cond ((null? x) #f)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(define (search op exp)
  (and (pair? exp) (memq op exp)))

(define (sum? x) (search '+ x))

(define (addend s)
  (take-until-op '+ s))

(define (augend s)
  (drop-until-op '+ s))

(define (product? x) (search '* x))

(define (multiplier p)
  (take-until-op '* p))

(define (multiplicand p)
  (drop-until-op '* p))

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	((sum? exp) (make-sum (deriv (addend exp) var)
			      (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	  (make-product (multiplier exp)
			(deriv (multiplicand exp) var))
	  (make-product (deriv (multiplier exp) var)
			(multiplicand exp))))
	(else
	 (error "unknown expression type: DERIV" exp))))
