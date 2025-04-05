;;; bombaclatt/archived.el -*- lexical-binding: t; -*-

;; integrate org-journal with org-roam-dailies
(defun my-org-journal-add-id (&rest _)
  "Ensure there's an Org ID at the top of the buffer."
  (goto-char (point-min))
  ;; Only create an ID if there isn't one already:
  (unless (org-id-get nil 'create-if-interactive)
    (org-id-get-create)))

;; create org-roam-id when making journal entry
(advice-add 'org-journal-new-entry :after #'my-org-journal-add-id)


(use-package zotero
  :custom
  zotero-translator-dir "~/Zotero/translators"
  zotero-storage-dir "~/Zotero"
  zotero-cache-dir "/Users/ymajan/.config/emacs/.local/cache/zotero-cache"
  zotero-backend 'better-bibtex
  :config
  ;; Fetch token from auth-source instead of hardcoding
  (let ((auth-info (nth 0 (auth-source-search :host "zotero"))))
    (when auth-info
      (let ((token (plist-get auth-info :secret)))
        (when token
          (if (functionp token)
              (setq zotero-auth-token (funcall token))
            (setq zotero-auth-token token)))))))


;; org-caldav setup
(use-package org-caldav
  :custom
  (org-icalendar-timezone "America/New_York")
  (org-icalendar-include-todo 'all)
  (org-caldav-sync-todo t)
  (org-caldav-todo-deadline-schedule-warning-days t)
  (org-caldav-todo-percent-states '((0 "TODO") (20 "WAITING") (50 "DOING") (100 "CANCELED") (100 "DONE") ))
  (org-caldav-skip-conditions '((todo-p "CANCELED")))
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
