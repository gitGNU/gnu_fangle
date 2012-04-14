(define (fangle-initialize)
  (define-group enumerate-tag nf-chunk)
  (define-group automatic-section-tag list-of-chunks)
  (menu-extend automatic-menu
    ("List of Fangle chunks" (make-aux* "the-index*" "nf-chunk" "Code Index"))
   )
  (menu-extend texmacs-extra-menu
    (=> "Fangle"
      ("List of Fangle chunks" (make-aux* "the-index*" "nf-chunk" "Code Index"))
    ))
)

(plugin-configure fangle
  (:require #t)
  (:initialize (fangle-initialize)))
