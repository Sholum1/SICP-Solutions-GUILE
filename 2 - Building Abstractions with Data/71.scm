(define-module (chapter-2 exercise-71)
  #:use-module (chapter-2 exercise-69))

(generate-huffman-tree '((A 1) (B 2) (C 4) (D 8) (E 16)))
#|
  (((((leaf A 1)
      (leaf B 2) (A B) 3)
     (leaf C 4) (A B C) 7)
    (leaf D 8) (A B C D) 15)
   (leaf E 16) (A B C D E) 31)
|#

(generate-huffman-tree '((A 1)  (B 2)  (C 4)   (D 8)   (E 16)
			 (F 32) (G 64) (H 128) (I 256) (J 512)))

#|
  ((((((((((leaf A 1)
           (leaf B 2) (A B) 3)
          (leaf C 4) (A B C) 7)
         (leaf D 8) (A B C D) 15)
        (leaf E 16) (A B C D E) 31)
       (leaf F 32) (A B C D E F) 63)
      (leaf G 64) (A B C D E F G) 127)
     (leaf H 128) (A B C D E F G H) 255)
    (leaf I 256) (A B C D E F G H I) 511)
   (leaf J 512) (A B C D E F G H I J) 1023)
|#

#|
   The most frequent symbol will require always only log_2(2) = 1 bit and the
  least frequent symbol will require log_2(2^(n - 1)) = n - 1 bits.
|#
