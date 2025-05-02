(define-module (chapter-2 exercise-03)
  #:use-module (chapter-2 exercise-02))

(define (length-segment s)
  (let ([ps (start-segment s)]
	[pe (end-segment   s)])
    (let ([xs (x-point ps)]
	  [ys (y-point ps)]
	  [xe (x-point pe)]
	  [ye (y-point pe)])
      (sqrt (+ (expt (- xs xe) 2) (expt (- ys ye) 2))))))

;; We can define a rectangle with the diagonals.
(define (make-rectangle-d d1 d2)
  (let ([ps1 (start-segment    d1)]
	[pe1 (end-segment      d1)]
	[pm1 (midpoint-segment d1)]
	[ps2 (start-segment    d2)]
	[pe2 (end-segment      d2)]
	[pm2 (midpoint-segment d2)])
    (if (and (equal? pm1 pm2) (= (length-segment d1) (length-segment d2)))
	(cons (cons (make-segment ps1 ps2) (make-segment ps1 pe2))
	      (cons (make-segment pe1 ps2) (make-segment pe1 pe2)))
	(display "The segments aren't diagonals of a rectangle\n"))))

;; Selectors
(define (rectangle-height r)
  (length-segment (car (car r))))

(define (rectangle-width r)
  (length-segment (cdr (car r))))

(define (rectangle-perimeter r)
  (* 2 (+ (rectangle-height r) (rectangle-width r))))

(define (rectangle-area r)
  (* (rectangle-height r) (rectangle-width r)))

;; We can also define a rectangle with 4 points, which
;; will represent a rectangle if they form 4 segments
;; that have 4 internal angles of 90 degrees.
(define (make-rectangle-p p1 p2 p3 p4)
  (let ([s1-2 (make-segment p1 p2)]
	[s2-3 (make-segment p2 p3)]
	[s3-4 (make-segment p3 p4)]
	[s4-1 (make-segment p4 p1)]
	[d1-3 (make-segment p1 p3)]
	[d2-4 (make-segment p2 p4)])
    (if (and (= (length-segment s1-2) (length-segment s3-4))
	     (= (length-segment s2-3) (length-segment s4-1))
	     (= (length-segment d1-3) (length-segment d2-4)))
	(cons (cons s1-2 s4-1) (cons s2-3 s3-4))
	(display "This points doesn't form a rectangle"))))
