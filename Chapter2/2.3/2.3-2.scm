(define merge
  (lambda (A p q r)
    (let* ([n1 (+ (- q p) 1)]
	  [n2 (- r q)]
	  [L (make-vector n1)]
	  [R (make-vector n2)])
            (do ([i 0 (+ i 1)])
	  ((>= i n1))
	(vector-set! L i (vector-ref A (- (+ p i) 1))))
      (do ([j 0 (+ j 1)])
	  ((>= j n2))
	(vector-set! R j (vector-ref A (+ q j))))
      (let loop ([i 0] [j 0] [k (- p 1)])
	(cond
	 [(= i (- n1 1)) (vector-copy! R j A k (- n2 j))]
	 [(= j (- n2 1)) (vector-copy! L i A k (- n1 i))]
	 [(<= (vector-ref L i) (vector-ref R j)) (begin
						   (vector-set! A k (vector-ref L i))
						   (loop (+ i 1) j (+ k 1)))]
	 [else (begin
		 (vector-set! A k (vector-ref R j))
		 (loop i (+ j 1) (+ k 1)))]))
      A)))
	
