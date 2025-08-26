;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; start server for org-protocol and other services
(setq debug-on-error t)
(require 'server)
(unless (server-running-p)
  (server-start))

;; startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'exec-path "/home/ymajan/.guix-profile/bin") ;; TODO WHY'D I ADD THIS?

;; initial variables
(setq user-full-name "Jaynams Ahh"
      doom-theme 'doom-henna
      custom-file (expand-file-name "custom.el" doom-user-dir)
      gc-cons-threshold (* 50 1000 1000))

(use-package auth-source
  :config
  (setq auth-source-sources '("~/secrets/.authinfo.gpg")
        auth-source-cache-expiry 3600))

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

(use-package wakatime-mode
  :init
  (global-wakatime-mode))

;; no-byte-compile: t
;; End:

