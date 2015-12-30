;;; 30-fold-dwm.el ---
;;; Code:

;;コードフォールディング　折りたたみ
;; C++ coding style
(add-hook 'c++-mode-hook
	  '(lambda()
	     (hs-minor-mode 1)))
;; C coding style
(add-hook 'c-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Scheme coding style
(add-hook 'scheme-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Elisp coding style
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Lisp coding style
(add-hook 'lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Python coding style
(add-hook 'python-mode-hook
          '(lambda ()
	     (hs-minor-mode 1)))

(define-key global-map (kbd "C-^") 'hs-toggle-hiding)
(define-key global-map (kbd "C-x ^") 'hs-hide-all)
(define-key global-map (kbd "C-x \\") 'hs-show-all)
