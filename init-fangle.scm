(define (fangle-initialize)
  (define-group enumerate-tag nf-chunk)
  (define-group automatic-section-tag list-of-chunks)
  (menu-extend automatic-menu
    ("List of Fangle chunks" (make-aux* "the-index*" "nf-chunk" "Code Index"))
   )
  (menu-extend texmacs-extra-menu
    (=> "Fangle"
      ("New chunk" (make-nf-chunk))
      ("New chunk reference" (make-nf-ref))
      ("List of Fangle chunks" (make-aux* "the-index*" "nf-chunk" "Code Index"))
      ("Extract All" (fangle-extract-all))
    ))
  (kbd-map
    ("M-c" (make-nf-chunk))
    ("M-r" (make-nf-ref))
  )
)

; (make (string->symbol "nf-chunk"))
(define (make-nf-chunk)
  (insert '(nf-chunk "" "" "" (tuple "")))
)

(define (make-nf-ref)
  (make (string->symbol "nf-ref"))
)

(define (fangle-extract-all)
  (let* ((name (string-append (url->system (current-buffer)) ".txt"))
         (tmp-name (string-append name "~")) )
    (export-buffer-main (current-buffer) tmp-name "verbatim" (list :overwrite))
    (system-2 "fangle-refresh" name tmp-name)
  )
)

(plugin-configure fangle
  (:require #t)
  (:initialize (fangle-initialize)))
