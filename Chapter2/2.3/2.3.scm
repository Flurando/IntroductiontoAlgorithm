(define merge
  (lambda (A p q r)
    (let* ([n1 (+ (- q p) 1)]
	  [n2 (- r q)]
	  [L (make-vector (+ n1 1))]
	  [R (make-vector (+ n2 1))])
      (do ([i 0 (+ i 1)])
	  ((>= i n1))
	(vector-set! L i (vector-ref A (- (+ p i) 1))))
      (do ([j 0 (+ j 1)])
	  ((>= j n2))
	(vector-set! R j (vector-ref A (+ q j))))
      (vector-set! L n1 +inf.0)
      (vector-set! R n2 +inf.0)
      (let loop ([i 0] [j 0] [k (- p 1)])
	(unless (>= k r)
	  (if (<= (vector-ref L i) (vector-ref R j))
	      (begin
		(vector-set! A k (vector-ref L i))
		(loop (+ i 1) j (+ k 1)))
	      (begin
		(vector-set! A k (vector-ref R j))
		(loop i (+ j 1) (+ k 1)))))))
    A))
	      
(define merge-sort
  (lambda (A p r)
    (when (< p r)
      (let ([q (car (floor (/ (+ p r) 2)))])
	(merge-sort A p q)
	(merge-sort A (+ q 1) r)
	(merge A p q r)))
    A))
