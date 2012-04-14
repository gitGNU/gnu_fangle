(define (fangle-initialize)
  (define-group enumerate-tag nf-chunk)
)

(plugin-configure fangle
  (:require #t)
  (:initialize (fangle-initialize)))
