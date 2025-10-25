;; TODO OrgNote CLI syncing
;; (use-package! orgnote
;;  :hook (org-mode . orgnote-sync-mode))

;; org-noter very useful obviously
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package org-noter                                                                                     ;;
;;   :after (:all org pdf-tools djvu)                                                                         ;;
;;   :custom                                                                                                  ;;
;;   (org-noter-notes-search-path (list org-roam-directory                                                    ;;
;;                                      (concat (file-name-as-directory org-directory) "Org-Noter"))))        ;;
;;                                                                                                            ;;
;; (use-package! nov                                                                                          ;;
;;   :config                                                                                                  ;;
;;   (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))                                                ;;
;;   (setq nov-text-width 80)                                                                                 ;;
;;   (setq nov-text-size 1.0))                                                                                ;;
;;                                                                                                            ;;
;; (use-package! pdf-tools                                                                                    ;;
;;   :config                                                                                                  ;;
;;   (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode)))                                           ;;
;;                                                                                                            ;;
;; (use-package! anki-editor-view                                                                             ;;
;;   :config                                                                                                  ;;
;;   (setq anki-editor-view-files (list  (concat (file-name-as-directory org-roam-directory) "Thoughts")  ))) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
