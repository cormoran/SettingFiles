
(defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
        'irony-completion-at-point-async))

(use-package irony
  :init  
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)  
  (add-hook 'objc-mode-hook 'irony-mode)  
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'irony-mode-hook 'irony-eldoc)
  :config
  (use-package company-irony)
  (use-package company-irony-c-headers)
  (add-to-list 'company-backends '(company-irony-c-headers company-irony))
  )

