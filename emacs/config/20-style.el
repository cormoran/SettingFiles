
;;
;; C & C++
;;

(use-package google-c-style
  :init
  (defun my-c-style-init ()
    (google-set-c-style)
    (google-make-newline-indent)
    (setq c-basic-offset 4))
  (add-hook 'c-mode-common-hook 'my-c-style-init)
  )

(use-package clang-format ; brew install clang-format すると入る?
  :bind (
         ;; ("C-M-tab" . clang-format-region)
         )
  )

;;
;; python
;;

(use-package py-autopep8
  :init
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  (add-hook 'before-save-hook 'py-autopep8-before-save)
  (define-key python-mode-map (kbd "C-c F") 'py-autopep8) ; バッファ全体のコード整形
  (define-key python-mode-map (kbd "C-c f") 'py-autopep8-region); 選択リジョン内のコード整形
  )
