(define-module (chapter-2 exercise-22))

#|
   In the first case, we have that the procedure cons "add" a element in the
  beginning of the list, so, (cons (cadr list) (cons (car list) '()))
  -> ((cadr list) (car list)) and not ((car list) (cadr list)).

   In the second case, we have that cons can receive other cons as args, so,
  when (cons '(1 2) 3) is done, the result value is '((1 2) . 3) and not the
  expected '(1 2 3).
|#
