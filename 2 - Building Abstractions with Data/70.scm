(define-module (chapter-2 exercise-70)
  #:use-module (chapter-2 exercise-69)
  #:use-module (chapter-2 exercise-68))

(define 90s-rock-tree
  (generate-huffman-tree '((A 2)    (GET 2) (SHA 3) (WAH 1)
			   (BOOM 1) (JOB 2) (NA 16) (YIP 9))))

(encode '(GET A JOB
	  SHA NA NA NA NA NA NA NA NA
	  GET A JOB
	  SHA NA NA NA NA NA NA NA NA
	  WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
	  SHA BOOM)
	90s-rock-tree)
#|
   1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1
   0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 0

   84 bits needed to encode the song.

   Using a fixed-length code would require three bits for each symbol. As the song contains 36 symbols,
   This would require a storage capacity of 108 bits, which is an increase of 22.2%.
|#
