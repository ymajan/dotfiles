(use-package mathpix.el
  :custom ((mathpix-app-id "ymajan_65b9d5_450ec8")
           (mathpix-app-key "6eb175690078af2324a400af580c6f9a9ce7a117ce3b4be685a82197352f9c55"))
  :bind
  ("C-x m" . mathpix-screenshot))

;; anki-editor provides better media support
(use-package! anki-editor)
