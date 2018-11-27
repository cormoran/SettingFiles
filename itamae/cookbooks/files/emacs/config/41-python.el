;;
;; Python
;;

(defun my-python-init ()
  (message "Initializing Python Mode")
  (use-package elpy
    :init
    (elpy-enable)
    (elpy-mode t)
    :config
    (setq elpy-rpc-backend "jedi")
    (setq gud-pdb-command-name "python -m pdb")
    )
  (use-package py-yapf
    :init
    (py-yapf-enable-on-save)
    )
  (turn-on-eldoc-mode)
  (setq python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt")
  )

(add-hook 'python-mode-hook 'my-python-init)
