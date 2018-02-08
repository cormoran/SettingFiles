;;
;; C++
;;

(defun my-cpp-init ()
  (message "Initializing C++ Mode")
  (turn-on-eldoc-mode)
  (use-package google-c-style
    :config
    (google-set-c-style)  
    (google-make-newline-indent)  
    (setq c-basic-offset 4)
    )
  )

;; (add-hook 'c-mode-hook 'turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'my-cpp-init)
