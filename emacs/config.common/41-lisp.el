;;
;; list
;;

(defun my-lisp-init ()
  (message "Initializing Lisp Mode")
  (turn-on-eldoc-mode)
  )

(add-hook 'lisp-mode 'my-lisp-init)

;; (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
