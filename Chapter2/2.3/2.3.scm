(define merge
  (lambda (A p q r)
    (let ([n1 (+ (- q p) 1)]
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
      (let ([i 0] [j 0])
	(do ([k (- p 1) (+ k 1)])
	    ((>= k r))
	  (if (<= (vector-ref L i) (vector-ref R j))
	      (begin
		(vector-set! A k (vector-ref L i))
		(set! i (+ i 1)))
	      (begin
		(vector-set! A k (vector-ref R j))
		(set! j (+ j 1)))))))))
	      
