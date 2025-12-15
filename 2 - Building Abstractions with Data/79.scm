(define-module (chapter-2 exercise-79))

(define (equ?-pkg)
  (define (equ-rational? x y)
    (and (= (numer x) (numer y))
	 (= (denom x) (denum y))))
  (define (equ-complex? x y)
    (and (= (real-part x) (real-part y))
	 (= (imag-part x) (imag-part y))))
  (put 'equ? '(scheme-number scheme-number) =)
  (put 'equ? '(rational rational)           equ-rational?)
  (put 'equ? '(complex compled)             equ-complex?))

(equ?-pkg)

(define (equ? x y)
  (apply-generic 'equ? x y))
