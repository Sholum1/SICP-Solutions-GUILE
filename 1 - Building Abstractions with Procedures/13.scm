#|
   We know that.
    * fib(n) = fib(n - 1) + fib(n - 2)
 
   Suppose there is a solution to the recursion in the format x^n.
   Doing fib(n) -> x^n:
    * x^n = x^(n - 1) + x^(n - 2)
 
   For x /= 0 we have:
    * x^2 = x^1 + x
 
   Now we have 2 solutions:
    * x'  = (1 + sqrt(5))/2 = phi
    * x'' = (1 - sqrt(5))/2 = psi
 
   So:
    * fib(n) = a(x')^n + b(x'')^n
    * fib(0) = a + b = 1
    * fib(1) = a(1 + sqrt(5))/2 + b(1 - sqrt(5))/2 = 1
 
   Solving:
    * a = -b = 1/sqrt(5)
 
   Replacing:
    * fib(n) = ((phi)^n - (psi)^n)/sqrt(5)
    * (phi)^n/sqrt(5) = fib(n) + ((psi)^n)/sqrt(5) (I)
 
   Knowing that:
    * -1/2 < (psi) < 1/2 ->
    * (-1/2)^n < (psi)^n < (1/2)^n ->
 
   But ( *1/2)^n < (-1/2)^n <= (1/2)^n < 1/2, so:
    * -1/2 < (psi)^n < 1/2 ->
    * -1/2sqrt(5) < ((psi)^n)/sqrt(5) < 1/2sqrt(5) ->
    * -1/2 < ((psi)^n)/sqrt(5) < 1/2 (II)
 
   Doing (II) in (I):
    * -1/2 < fib(n) + ((psi)^n)/sqrt(5) < 1/2
 
   Subtracting fib(n) on each side:
    * -1/2 - fib(n) < ((psi)^n)/sqrt(5) < 1/2 - fib(n)
 
   Multiplying -1 on each side:
    * fib(n) + 1/2 > ((psi)^n)/sqrt(5) > fib(n) - 1/2

   So ((psi)^n)/sqrt(5) is bounded by (fib(n) +- 1/2), proving that
  fib(n) is the closest integer to ((psi)^n)/sqrt(5).
|#
