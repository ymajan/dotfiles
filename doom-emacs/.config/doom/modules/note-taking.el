;; org-roam configuration
(use-package org-roam
  :custom
  (org-roam-db-location "~/Documents/Codex/Roameo/org-roam.db")
  (org-roam-directory (concat (file-name-as-directory org-directory) "Roameo"))
  (org-roam-dailies-directory (concat (file-name-as-directory org-roam-directory) "Log"))
  (org-roam-database-connector 'sqlite-builtin)
  (org-roam-completion-everywhere t)
  (org-roam-db-update-on-save t)
  (org-roam-link-auto-replace t)
  (org-roam-node-display-template (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-dailies-capture-templates
   '(("d" "default" entry
      "* %?"
      :target (file+head "%<%Y-%m-%d>.org"
                         "#+title: %<%Y-%m-%d>\n"))))
  (org-roam-capture-templates
   '(
     ("z" "zotero zettel, very scholarly"
      plain
      "%?"
      :target (file+head
               "Thoughts/${citar-citekey}.org"
               "#+title: ${note-title}
#+filetags: :zotero:%(ymajan/citar-keywords-to-tags\"${citar-keywords}\")
%(let ((url \"${citar-url}\"))
   (if (and url (not (string-empty-p url)))
       (concat \"#+url: \" url \"\n\")
       \"\"))")
      :unnarrowed t)
     ("r" "web zettel, a wettel"
      plain
      "%?"
      :target (file+head
               "Thoughts/${slug}.org"
               "#+title: ${title}
%(let ((url \"${citar-url}\"))
   (if (and url (not (string-empty-p url)))
       (concat \"#+url: \" url \"\n\")
       \"\"))")
      :unnarrowed t)
     ("n" "org-roam note"
      plain
      "%?"
      :target (file+head "Thoughts/${slug}.org"
                         "#+title: ${title}")
      :unnarrowed t))))


;; tag new nodes as zygoat if not a journal file
(defun ymajan/tag-new-node-as-zygoat ()
  (unless (string-match-p "Log" (buffer-file-name))
    (org-roam-tag-add '("zygoat"))))

(add-hook 'org-roam-capture-new-node-hook #'ymajan/tag-new-node-as-zygoat)

;; Set Default Anki Deck
(defun ymajan/add-anki-deck-property ()
  (unless (string-match-p "Log" (buffer-file-name))
    (org-set-property "ANKI_DECK" "FAQ")))

(add-hook 'org-roam-capture-new-node-hook #'ymajan/add-anki-deck-property)


(cl-defmethod org-roam-node-type ((node org-roam-node))
  "Return the TYPE of NODE."
  (condition-case nil
      (file-name-nondirectory
       (directory-file-name
        (file-name-directory
         (file-relative-name (org-roam-node-file node) org-roam-directory))))
    (error "")))

(use-package org-noter
  :after (:all org pdf-tools djvu)
  :custom
  (org-noter-notes-search-path (list (expand-file-name "Thoughts" org-roam-directory)))
  (org-noter-default-notes-file-names '("deletemeyoufdup.org"))
  ;; (org-noter-always-create-frame nil)
  ;; (org-noter-auto-save-last-location t)
  ;; (org-noter-highlight-selected-text t)
  ;; (org-noter-insert-selected-text-inside-note t)
  ;; (org-noter-kill-frame-at-session-end nil)
  ;; (org-noter-insert-note-no-questions t)
  (org-noter-doc-split-fraction '(0.6 . 0.4)))

(use-package! nov
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  (setq nov-text-width 80)
  (setq nov-text-size 1.0))

(use-package! pdf-tools
  :config
  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode)))

(use-package! anki-editor-view
  :config
  (setq anki-editor-view-files (list  (concat (file-name-as-directory org-roam-directory) "Thoughts")  )))
