(define-module (chapter-2 exercise-12)
  #:use-module (chapter-2 exercise-07)
  #:export     (make-center-percent percent center))

;; Helpers
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;; Exercise
(define (make-center-percent c p)
  (make-center-width c (/ (* c p) 100)))

(define (percent i)
  (* (/ (width i) (center i)) 100))
