(define-module (chapter-1 exercise-20))

#|
  Mormal-order evaluation:

  * (gcd 206 40) 
  * (if (= 40 0)
        40
        (gcd 40 (remainder 206 40))) 
  * (gcd 40 (remainder 206 40))
  * (if (= (remainder 206 40) 0)
        40
        (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
  * (if (= 6 0)                                                         ; 1
        (remainder 206 40)
        (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
  * (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
  * (if (= (remainder 40 (remainder 206 40)) 0)                         ; 2
        (remainder 206 40)
        (gcd (remainder 40 (remainder 206 40))
             (remainder (remainder 206 40)
                        (remainder 40 (remainder 206 40)))))
   * (if (= 4 0)
         (remainder 206 40)
         (gcd (remainder 40 (remainder 206 40))
              (remainder (remainder 206 40)
              (remainder 40 (remainder 206 40)))))
   * (gcd (remainder 40 (remainder 206 40))
          (remainder (remainder 206 40)
                     (remainder 40 (remainder 206 40))))
   * (if (= (remainder (remainder 206 40)                               
                       (remainder 40 (remainder 206 40))) 0)            ; 4
         (remainder 40 (remainder 206 40))
         (gcd
	   (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
	   (remainder (remainder 40 (remainder 206 40))
		      (remainder (remainder 206 40)
				 (remainder 40 (remainder 206 40))))))
   * (if (= 2 0)
         (remainder 40 (remainder 206 40))
         (gcd
	   (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
	   (remainder (remainder 40 (remainder 206 40))
		      (remainder (remainder 206 40)
				 (remainder 40 (remainder 206 40))))))
   * (gcd
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
       (remainder (remainder 40 (remainder 206 40))
		  (remainder (remainder 206 40)
			     (remainder 40 (remainder 206 40)))))
   * (if
      (= (remainder
	  (remainder 40 (remainder 206 40))
	  (remainder (remainder 206 40)
		     (remainder 40 (remainder 206 40)))) 0)             ; 7
      (remainder (remainder 206 40)
		 (remainder 40 (remainder 206 40)))
      (gcd
	(remainder (remainder 40 (remainder 206 40))
		   (remainder
		    (remainder 206 40)
		    (remainder 40 (remainder 206 40))))
	(remainder a (remainder
		      (remainder 40 (remainder 206 40))
		      (remainder (remainder 206 40)
				 (remainder 40 (remainder 206 40)))))))
   * (if (= 0 0)
      (remainder (remainder 206 40)
		 (remainder 40 (remainder 206 40)))
      (gcd
	(remainder (remainder 40 (remainder 206 40))
		   (remainder
		    (remainder 206 40)
		    (remainder 40 (remainder 206 40))))
	(remainder a (remainder
		      (remainder 40 (remainder 206 40))
		      (remainder (remainder 206 40)
				 (remainder 40 (remainder 206 40)))))))
   * (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))                      ; 4


   Total = 1 + 2 + 4 + 7 + 4 = 18 remainders evaluated

   Applicative-order evaluation:

   * (gcd 206 40)
   * (if (= 40 0)
        206
        (gcd 40 (remainder 206 40)))                                   ; 1
   * (gcd 40 6)
   * (if (= 6 0)
        40
        (gcd 6 (remainder 40 6)))                                      ; 1
   * (gcd 6 4)
   * (if (= 4 0)
        6
        (gcd 4 (remainder 6 4)))                                       ; 1
   * (gcd 4 2)
   * (if (= 2 0)
        4
        (gcd 2 (remainder 4 2)))                                       ; 1
   * (gcd 2 0)
   * (if (= 0 0)
        2
        (gcd 0 (remainder 2 0)))

   Total = 1 + 1 + 1 + 1 = 4 remainders evaluated
|#
