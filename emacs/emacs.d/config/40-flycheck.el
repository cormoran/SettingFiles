(use-package flycheck
  :init
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode))
  )


(use-package flycheck-pos-tip
  :init
  (add-hook 'flycheck-mode-hook 'flycheck-pos-tip-mode)
  )

(use-package flycheck-irony
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  )
