;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; start server for org-protocol and other services
(setq debug-on-error t)
(require 'server)
(unless (server-running-p)
  (server-start))

;; startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'exec-path "/home/ymajan/.guix-profile/bin")

;; initial variables
(setq user-full-name "Jaynams Ahh"
      doom-theme 'doom-henna
      custom-file (expand-file-name "custom.el" doom-user-dir)
      display-line-numbers-type t
      load-prefer-newer t
      search-highlight t
      search-whitespace-regexp ".*?"
      gc-cons-threshold (* 50 1000 1000) ; 50 MB
      ispell-program-name "hunspell"
      ispell-dictionary "en_US")

;; used with org-roam-publish-ui
(setq org-directory "~/Documents/Codex/Org/")
(setq org-roam-directory "~/Documents/Codex/Org/Roameo/")

;; load in elisp config files
(load! "modules/org/note-taking")
(load! "modules/org/org-mode")
(load! "modules/os/macos-modifiers")
(load! "modules/reference/ref-management")

;; def search
(use-package deft
  :custom
  (deft-directory "~/Documents/Codex/")
  (deft-extensions '("org" "md" "txt" "ipynb"))
  (deft-recursive t)
  (deft-use-filename-as-title t)
  (deft-auto-save-interval 0))

(use-package mathpix.el
  :custom ((mathpix-app-id "ymajan_65b9d5_450ec8")
           (mathpix-app-key "6eb175690078af2324a400af580c6f9a9ce7a117ce3b4be685a82197352f9c55"))
  :bind
  ("C-x m" . mathpix-screenshot))

;; plantuml diagrams
(setq plantuml-jar-path "~/.config/emacs/.local/etc/plantuml.jar")
;; anki-editor provides better media support
(use-package! anki-editor)
;; org-anki has better card creation scheme for cloze cards
(use-package! org-anki)


;; no-byte-compile: t
;; End:

