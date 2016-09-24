;;; 30-fold-dwm.el ---
;;; Code:

;;コードフォールディング　折りたたみ
(add-hook 'c++-mode-hook
	  '(lambda()
	     (hs-minor-mode 1)))
(add-hook 'c-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
(add-hook 'scheme-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
(add-hook 'lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
(add-hook 'python-mode-hook
          '(lambda ()
	     (hs-minor-mode 1)))

(define-key global-map (kbd "C-^") 'hs-toggle-hiding)
(define-key global-map (kbd "C-x ^") 'hs-hide-all)
(define-key global-map (kbd "C-x \\") 'hs-show-all)
