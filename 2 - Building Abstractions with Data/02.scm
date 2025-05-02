(define-module (chapter-2 exercise-02)
  #:use-module ((chapter-1 exercise-07)
	       #:select (average))
  #:export (;; Segments
	    make-segment
	    start-segment
	    end-segment
	    midpoint-segment

	    ;; Points
	    make-point
	    x-point
	    y-point))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (midpoint-segment s)
  (let ((p1 (start-segment s))
	(p2 (end-segment   s)))
    (let ((x1 (x-point p1))
	  (x2 (x-point p2))
	  (y1 (y-point p1))
	  (y2 (y-point p2)))
      (make-point (average x1 x2) (average y1 y2)))))
