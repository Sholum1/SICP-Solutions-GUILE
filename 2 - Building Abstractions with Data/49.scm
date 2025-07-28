(define-module (chapter-2 exercise-49)
  #:use-module ((chapter-2 exercise-46)
		#:select (make-vect))
  #:use-module ((chapter-2 exercise-48)
		#:select (make-segment)))

;; (define (segments->painter segment-list)
;;   (lambda (frame)
;;     (for-each
;;      (lambda (segment)
;;        (draw-line
;; 	((frame-coord-map frame)
;; 	 (start-segment segment))
;; 	((frame-coord-map frame)
;; 	 (end-segment segment))))
;;      segment-list)))

;; a)
(define marcus-the-outliner
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect 1 0))
         (make-segment (make-vect 0 0) (make-vect 0 1))
         (make-segment (make-vect 0 1) (make-vect 1 1))
         (make-segment (make-vect 1 0) (make-vect 1 1)))))

;; b)
(define julio-the-x-maker
  (segments->painter
   (list (make-segment (make-vect 0 1) (make-vect 1 0))
	 (make-segment (make-vect 0 0) (make-vect 1 1)))))

;; c)
(define howard-the-jeweler ;; Yes, this is a reference to Uncut Gems
  (segments->painter
   (list (make-segment (make-vect 0.0 0.5) (make-vect 0.5 0.0))
	 (make-segment (make-vect 0.0 0.5) (make-vect 0.5 1.0))
	 (make-segment (make-vect 0.5 1.0) (make-vect 1.0 0.5))
	 (make-segment (make-vect 0.5 0.0) (make-vect 1.0 0.5)))))

;; d)
(define medina-the-waver-maker
  (segments->painter
   (list (make-segment (make-vect 0.00 0.33) (make-vect 0.22 0.55))
	 (make-segment (make-vect 0.22 0.45) (make-vect 0.00 0.28))
	 (make-segment (make-vect 0.22 0.55) (make-vect 0.39 0.42))
	 (make-segment (make-vect 0.37 0.22) (make-vect 0.46 0.34))
	 (make-segment (make-vect 0.37 0.33) (make-vect 0.22 0.45))
	 (make-segment (make-vect 0.39 0.42) (make-vect 0.31 1.00))
	 (make-segment (make-vect 0.39 1.00) (make-vect 0.50 0.68))
	 (make-segment (make-vect 0.46 0.00) (make-vect 0.37 0.22))
	 (make-segment (make-vect 0.46 0.34) (make-vect 0.37 0.33))
	 (make-segment (make-vect 0.50 0.68) (make-vect 0.61 1.00))
	 (make-segment (make-vect 0.54 0.00) (make-vect 0.63 0.22))
	 (make-segment (make-vect 0.54 0.34) (make-vect 0.63 0.33))
	 (make-segment (make-vect 0.61 0.42) (make-vect 0.69 1.00))
	 (make-segment (make-vect 0.63 0.22) (make-vect 0.54 0.34))
	 (make-segment (make-vect 0.63 0.33) (make-vect 1.00 0.67))
	 (make-segment (make-vect 1.00 0.72) (make-vect 0.61 0.42)))))
