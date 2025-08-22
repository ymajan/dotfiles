;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! secrets)
(package! f)
(package! shrface)
(package! org-anki)
(package! leetcode)
(package! embark)
(package! pdf-tools)
(package! djvu)
(package! nov)

(package! nov-xwidget
  :recipe (:host github :repo "chenyanming/nov-xwidget"))
(package! org-roam
  :recipe (:host github :repo "org-roam/org-roam" :branch "main"))
(package! mathpix.el
  :recipe (:host github :repo "jethrokuan/mathpix.el" :branch "master"))
(package! anki-editor
  :recipe (:host github :repo "anki-editor/anki-editor"))
(package! wakatime-mode
  :recipe (:host github :repo "wakatime/wakatime-mode"))
;; PAST used packages
;; (package! loglink
;;   :recipe (:host github :repo "ymajan/loglink" :branch "main")) ;; logseq org-roam integration was a lil too buggy, possibility in the future

;; (package! org-caldav) ;; can be buggy at times
