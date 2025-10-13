;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; start server for org-protocol and other services
(setq debug-on-error t)
(require 'server)
(unless (server-running-p)
  (server-start))
(require 'org-protocol)
;; startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(load! "modules/path_templates.el")
;; initial variables
(setq user-full-name "Jaynam Shah"
      doom-theme 'doom-gruvbox
      custom-file (expand-file-name "custom.el" doom-user-dir)
      gc-cons-threshold (* 50 1000 1000))

;; def search
(use-package deft
  :custom
  (deft-directory org-directory)
  (deft-extensions '("org" "md" "txt" "ipynb"))
  (deft-recursive t)
  (deft-auto-save-interval 0))

(use-package mathpix.el
  :custom ((mathpix-app-id "ymajan_65b9d5_450ec8")
           (mathpix-app-key "6eb175690078af2324a400af580c6f9a9ce7a117ce3b4be685a82197352f9c55"))
  :bind
  ("C-x m" . mathpix-screenshot))

;; anki-editor provides better media support
(use-package! anki-editor)

;; load in elisp config files
(load! "modules/org-mode")
(load! "modules/note-taking")
(load! "modules/ref-management")
(load! "modules/macos-modifiers")
;; no-byte-compile: t
;; End:

