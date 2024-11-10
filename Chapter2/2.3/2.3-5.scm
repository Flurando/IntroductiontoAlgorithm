(define (list-head lst index)
  (if (zero? index) '()
      (cons (car lst) (list-head (cdr lst) (- index 1)))))

(define index-to-insert 0)
(define 1/2-sort
  (lambda (v p)
    (cond
     [(zero? (car p))
      (begin
	(set! index-to-insert (+ 1 index-to-insert))
	'(v))]
     [(> v (list-ref (cdr p) (car p)))
      (let ([a (car p)] [b (cdr p)])
	(let* ([f (floor (/ a 2))] [h (- a f)])
	  (set! index-to-insert (+ index-to-insert f))
	  (1/2-sort v (h . (list-tail b f)))))]
     [(<= v (list-ref (cdr p) (car p)))
      (let ([f (floor (/ a 2))])
	(set! index-to-insert f)
	(1/2-sort v (f . (list-head (cdr p) f))))])))

;;;Under the worst situation, every next input is either the largest or the smallest. Considering n=2^k we have that each time we need k-1 steps approximately and maybe 1 or 2 steps to make the insertion thus the time is theta(lgn)
