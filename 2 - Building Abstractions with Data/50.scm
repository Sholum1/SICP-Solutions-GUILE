(define-module (chapter-2 exercise-50)
  #:use-module ((chapter-2 exercise-46)
		#:select (make-vect))
  #:export     (rotate180 rotate270)
  #:re-export  (make-vect))


;; (define (transform-painter painter origin corner1 corner2)
;;   (lambda (frame)
;;     (let ((m (frame-coord-map frame)))
;;       (let ((new-origin (m origin)))
;; 	(painter (make-frame
;; 		  new-origin
;; 		  (sub-vect (m corner1) new-origin)
;; 		  (sub-vect (m corner2) new-origin)))))))

(define (flip-horiz painter)
  (transform-painter painter
		     (make-vect 1.0 0.0)
		     (make-vect 0.0 0.0)
		     (make-vect 1.0 1.0)))

(define (rotate180 painter)
  (transform-painter painter
		     (make-vector 1.0 1.0)
		     (make-vector 0.0 1.0)
		     (make-vector 1.0 0.0)))

(define (rotate270 painter)
  (transform-painter painter
		     (make-vector 0.0 1.0)
		     (make-vector 0.0 0.0)
		     (make-vector 1.0 1.0)))
