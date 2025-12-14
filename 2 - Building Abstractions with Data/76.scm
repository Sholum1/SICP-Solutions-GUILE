(define-module (chapter-2 exercise-76))

#|
   When using explicit dispatch for each new type, a new case should also be
  added to all procedures, and each new procedure should be generic in order
  to handle all types.
   When using the data-directed style, for each new type, every operation should
  be installed, and for each new procedure, it should have a generic
  implementation and install implementations for every type.
   Finally, when using the message-passing style, a new procedure that handles
  all operations should be created for each new type, and a case for every
  type should be included in each new procedure.

   For a system in which new types are often added, the message-passing style
  is the best choice because only a new procedure needs to be created.

   For systems in which new operations must often be added, explicit dispatch
  is the best choice because it only requires the new operation to be generic.
|#
