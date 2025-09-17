;; citation management
(use-package citar
  :after org-roam
  :hook ((LaTeX-mode . citar-capf-setup)
         (org-mode . citar-capf-setup))
  :custom
  (citar-org-cite-backend t)
  (citar-bibliography (expand-file-name "biblio.bib" org-directory))
  (citar-library-paths (list (expand-file-name "~/Documents/Codex/zotero/")))
  (citar-notes-paths (list (expand-file-name "References/" org-directory)
                           (expand-file-name "Thoughts/" org-roam-directory))))

(use-package citar-embark
  :after (citar embark)
  :config
  (citar-embark-mode 1))

(use-package citar-org-roam
  :after (citar org-roam)
  :custom
  (citar-org-roam-capture-template-key "z")
  (citar-org-roam-template-fields '((:citar-url . ("url"))
                                    (:citar-keywords . ("keywords"))
                                    (:citar-file . ("file"))))
  :config (citar-org-roam-mode))


(defun ymajan/citar-keywords-to-tags (keywords)
  "Convert a comma-separated KEYWORDS string to colon-separated tags for Org."
  (if (and keywords (not (string-empty-p keywords)))
      (replace-regexp-in-string "," ":" keywords)
    ""))
