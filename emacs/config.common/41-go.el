;;
;; Golang
;;

(defun my-go-init ()
  (message "Initializing Go Mode")
  (use-package go-eldoc
    :init
    (go-eldoc-setup)
    )
  )

;; (add-hook 'c-mode-hook 'turn-on-eldoc-mode)
(add-hook 'go-mode-hook 'my-go-init)
