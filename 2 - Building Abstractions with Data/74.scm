(define-module (chapter-2 exercise-74))

#|
  a) Each division's file should have a tag such as 'operational and install
    a `get-record` procedure that receives a tagged file and name with tag 'name
    and deals with the internal record structure.
|#

(define (get-record file employee-name)
  (let ([tag         (type-tag file)]
	[tagged-name (attach-tag 'name employee-name)])
    (attach-tag tag (apply-generic 'get-record file tagged-name))))

#|
  b) Each division should install a `get-salary` so we can just use our generic
    `get-record` implementation.
|#

(define (get-salary record)
  (apply-generic 'get-salary record)

;; c)
(define (find-employee-record employee-name files)
  (if (null? files)
      #f
      (or (get-record (car files) employee-name)
	  (find-employee-record employee-name (cdr files)))))

#|
  d) Insatiable needs to tag the new files and install all necessary procedures,
    such as `get-record` and `get-salary`.
|#
