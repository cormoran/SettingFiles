
(add-hook 'c++-mode-hook 'hs-minor-mode )
(add-hook 'c-mode-hook 'hs-minor-mode )
(add-hook 'scheme-mode-hook 'hs-minor-mode )
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode )
(add-hook 'lisp-mode-hook 'hs-minor-mode )
(add-hook 'python-mode-hook 'hs-minor-mode )

(use-package fold-dwim
  :bind (
         ("C-^" . hs-toggle-hiding)
         ("C-x ^" . hs-hide-all)
         ("C-x \\" . hs-show-all)
         ))

