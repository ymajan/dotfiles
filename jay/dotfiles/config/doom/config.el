;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; start server for org-protocol and other services
(setq debug-on-error t)
(require 'server)
(unless (server-running-p)
  (server-start))

(setq auth-sources '("~/.authinfo" "~/.authinfo.gpg"))

;; startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; initial variables
(setq user-full-name "Jaynams Ahh"
      doom-theme 'doom-henna
      custom-file (expand-file-name "custom.el" doom-user-dir)
      display-line-numbers-type t
      load-prefer-newer t
      search-highlight t
      search-whitespace-regexp ".*?"
      gc-cons-threshold (* 50 1000 1000)) ; 50 MB

(setq org-directory "~/Documents/Codex/Org/")
(setq org-roam-directory "~/Documents/Codex/Org/Roameo/")

;; load in elisp config files
(load! "bombaclatt/note-taking")
(load! "bombaclatt/org-mode")
(load! "bombaclatt/macos-modifiers")
(load! "bombaclatt/ref-management")

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

;; leetcode
(use-package! leetcode
  :config
  (setq leetcode-prefer-language "python3")
  (setq leetcode-prefer-sql "mysql"))

;; org-caldav setup
(use-package org-caldav
  :custom
  (org-icalendar-timezone "America/New_York")
  (org-icalendar-include-todo 'all)
  (org-caldav-sync-todo t)
  (org-icalendar-categories '(local-tags))
  (org-caldav-calendars
   `((:calendar-id "personal"
      :url "https://cloud.jaynam.me/remote.php/dav/calendars/ymajan"
      :files ("~/Documents/Codex/Org/GTD/calendar.org")
      :inbox "~/Documents/Codex/Org/GTD/calendar.org")
     (:calendar-id "inbox-1"  ;; gtd personal tasker
      :url "https://cloud.jaynam.me/remote.php/dav/calendars/ymajan"
      :files ("~/Documents/Codex/Org/GTD/archive/canceled.org")
      :inbox "~/Documents/Codex/Org/GTD/inbox.org")
     (:calendar-id "next-actions"
      :url "https://cloud.jaynam.me/remote.php/dav/calendars/ymajan"
      :files ("~/Documents/Codex/Org/GTD/archive/past.org")
      :inbox "~/Documents/Codex/Org/GTD/next_actions.org")
     (:calendar-id "incubator-1"
      :url "https://cloud.jaynam.me/remote.php/dav/calendars/ymajan"
      :files ("~/Documents/Codex/Org/GTD/archive/incubated.org")
      :inbox "~/Documents/Codex/Org/GTD/incubator.org")
     )))

;; no-byte-compile: t
;; End:

