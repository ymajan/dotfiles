;; my org settings
(use-package org
  :custom
  (org-id-locations-file (expand-file-name ".orgids" org-directory))
  (org-attach-id-dir (expand-file-name ".attach" org-directory))
  ;; GTD System
  (org-default-notes-file (expand-file-name "GTD/notes.org" org-directory))
  (org-agenda-files (list (expand-file-name "GTD/habits.org" org-directory)
                          (expand-file-name "GTD/next_actions.org" org-directory)))
  (org-agenda-skip-scheduled-repeats-after-deadline t)
  (org-todo-keywords '((sequence "TODO(t)" "DOING(d)" "|" "DONE(e)" "CANCELED(c)" "SKIPPED(s)")))
  (org-ellipsis " ⤷ ")
  :config
  ;; Capture templates
  (setq org-capture-templates
        '(("t" "Task Entry" entry
           (file (expand-file-name "GTD/inbox.org"))
           "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:SOURCE: %a\n:END:\n"
           :kill-buffer t)
          ("n" "Note Entry" entry
           (file org-default-notes-file)
           "* %?\n:PROPERTIES:\n:CREATED: %U\n:SOURCE: %a\n:END:\n"
           :kill-buffer t))))

;; org-journal <-> org-roam-dailies-directory
(use-package org-journal
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir (concat (file-name-as-directory org-directory) "Daily/")
        org-journal-file-type 'daily
        org-journal-file-format "%Y-%m-%d.org"
        org-journal-date-format "%Y-%m-%d"
        org-journal-date-prefix "#+TITLE: "))

(load! "note-taking/roam-config.el")
