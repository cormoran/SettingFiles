(use-package flycheck
  :init
  (add-hook 'c-mode-common-hook 'flycheck-mode)
  (add-hook 'c-mode-hook 'flycheck-mode)
  (add-hook 'c++-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'ruby-mode-hook 'flycheck-mode)
  :config
  (flycheck-pos-tip-mode)
  )


(use-package flycheck-pos-tip
  :init
  (add-hook 'flycheck-mode-hook 'flycheck-pos-tip-mode)
  )

;; c, c++ の include path 等の設定
(use-package flycheck-irony
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  )

