;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; start server for org-protocol and efficiency
(setq debug-on-error t)
(require 'server)
(unless (server-running-p)
  (server-start))

;; startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; define org-directory based on chezmoi.toml generated differently for each machine
(use-package toml
  :demand t
  :config
  (let* ((config (toml:read-from-file "~/.config/chezmoi/chezmoi.toml"))
         (org-dir (cdr (assoc "orgdirectory" 
                              (cdr (assoc "data" config))))))
    (setq org-directory org-dir)))

;; initial variables
(setq user-full-name "ymajan"
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

(use-package ox-hugo)


;; load in elisp config files
(load! "modules/org-mode") 
(load! "modules/macos-modifiers")
;; no-byte-compile: t
;; End:
