;;
;; C & C++
;;

(require 'google-c-style)

(defun my-c-style-init ()
  (google-set-c-style)
  (google-make-newline-indent)
  (setq c-basic-offset 4)
  )

(add-hook 'c-mode-common-hook 'my-c-style-init)
(add-hook 'c++-mode-hook 'my-c-style-init)

;;
;; Python
;;

(defun my-python-style-init ()
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq python-indent 4)
  (require 'py-autopep8)
  (py-autopep8-enable-on-save)
  )

(add-hook 'python-mode-hook 'my-python-style-init)

;;
;; Javascript
;;


(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
