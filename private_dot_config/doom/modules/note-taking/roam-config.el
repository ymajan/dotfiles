;; org-roam configuration
(use-package org-roam
  :defer t
  :custom
  (org-roam-directory (concat (file-name-as-directory org-directory) "Roameo"))
  (org-roam-db-location (expand-file-name "org-roam.db" org-roam-directory))
  (org-roam-dailies-directory org-journal-dir) ;; outside the org-roam-directory
  (org-roam-database-connector 'sqlite-builtin)
  (org-roam-completion-everywhere t)
  (org-roam-db-update-on-save t)
  (org-roam-link-auto-replace t)
  (org-roam-node-display-template "${title:60} ${tags:*}")
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
               ;; could also be ${citar-citekey}
               "${slug}.org"
               ;; could also be ${note-title}
               "#+title: ${title}
#+filetags: %(ymajan/citar-keywords-to-tags\"${citar-keywords}\")
%(let ((url \"${citar-url}\"))
   (if (and url (not (string-empty-p url)))
       (concat \"#+url: \" url \"\n\")
       \"\"))")
      :unnarrowed t)
     ("w" "web zettel, a wettel"
      plain
      "%?"
      :target (file+head
               "${slug}.org"
               "#+title: ${title}
%(let ((url \"${citar-url}\"))
   (if (and url (not (string-empty-p url)))
       (concat \"#+url: \" url \"\n\")
       \"\"))")
      :unnarrowed t)
     ("n" "note"
      plain
      "%?"
      :target (file+head "${slug}.org"
                         "#+title: ${title}")
      :unnarrowed t))))

(load! "roam-support.el")
(load! "ref-management")
