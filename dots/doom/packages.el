;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! f)
(package! shrface)
(package! org-anki)
(package! leetcode)
(package! embark)
(package! pdf-tools)
(package! djvu)
(package! nov)
(package! deft)
;; (package! org-caldav) ;; hella buggy
(package! secrets)
(package! org-roam
  :recipe (:host github :repo "org-roam/org-roam" :branch "main"))
(package! mathpix.el
  :recipe (:host github :repo "jethrokuan/mathpix.el" :branch "master"))
(package! anki-editor
  :recipe (:host github :repo "anki-editor/anki-editor"))
(package! loglink
  :recipe (:host github :repo "ymajan/loglink" :branch "main"))
