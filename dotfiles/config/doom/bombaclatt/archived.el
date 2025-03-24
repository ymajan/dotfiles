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
