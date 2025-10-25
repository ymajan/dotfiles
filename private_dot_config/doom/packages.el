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
(package! anki-editor-view)
(package! chezmoi)
(package! toml)
(package! ox-hugo)

(package! nov-xwidget
  :recipe (:host github :repo "chenyanming/nov-xwidget"))
(package! org-roam
  :recipe (:host github :repo "org-roam/org-roam" :branch "main"))
(package! mathpix.el
  :recipe (:host github :repo "jethrokuan/mathpix.el" :branch "master"))
(package! anki-editor
  :recipe (:host github :repo "anki-editor/anki-editor"))
(package! orgnote
  :recipe (:host github :repo "artawower/orgnote.el"))
