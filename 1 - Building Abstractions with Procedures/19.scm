#|
  * Tpq(a, b) = (bq + aq + ap, bp + aq)
  * Tpq(Tpq(a, b)) = Tpq(bq + aq + ap, bp + aq) =
  * ((bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p, (bp + aq)p + (bq + aq + ap)q) =
  * (b(2pq + q²) + b(p² + q²) + a(2pq + q²), b(p² + q²) + a(2pq + q²))

  * Tp'q'(a, b) = (bq' + aq' + ap', bp' + aq') = (b(2pq + q²) + b(p² + q²) + a(2pq + q²), b(p² + q²) + a(2pq + q²))
  So q' = 2pq + q² and p' = p² + q²
|#

(define (fib n)
  (define (fib-iter a b p q count)
    (define p²  (* p p))
    (define q²  (* q q))
    (define 2pq (* 2 p q))
    (define p'  (+ p² q²))
    (define q'  (+ 2pq q²))
    (define bq  (* b q))
    (define aq  (* a q))
    (define ap  (* a p))
    (define bp  (* b p))
    (define a'  (+ bq aq ap))
    (define b'  (+ bp aq))
    (cond ((= count 0) b)
	  ((even? count) (fib-iter a  b  p' q' (/ count 2)))
	  (else          (fib-iter a' b' p  q  (1- count)))))
  (fib-iter 1 0 0 1 n))
