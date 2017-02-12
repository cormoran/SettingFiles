

(use-package eldoc
  :init
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'c-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'c++-mode-hook 'turn-on-eldoc-mode)
  :config
  (setq eldoc-idle-delay 0.2)
  (setq eldoc-echo-area-use-multiline-p t)
  (use-package eldoc-extension)
  )


(use-package go-eldoc
  :init
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  )
