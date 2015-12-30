(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))


(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-offset    2)
  (setq web-mode-code-indent-offset 2)
  
  (setq web-mode-script-padding 1)
  (setq web-mode-style-padding 1)
  (setq web-mode-block-padding 0)
  (setq web-mode-comment-style 2)
  (set-face-attribute 'web-mode-css-rule-face nil :foreground "Pink3")

  
  (setq web-mode-extra-auto-pairs
	'(("erb"  . (("beg" "end")))
	  ("php"  . (("beg" "end")
		     ("beg" "end")))
	  ))
  (define-key web-mode-map (kbd "C-n") 'web-mode-tag-match)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-block-face t)
  (setq web-mode-enable-part-face t)
  (setq web-mode-enable-comment-keywords t)
  (setq web-mode-enable-heredoc-fontification t)

  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-ac-sources-alist
	'(("css" . (ac-source-css-property))
	  ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
  
	
  ;; auto tag closing
  ;0=no auto-closing
  ;1=auto-close with </
  ;2=auto-close with > and </
  (setq web-mode-tag-auto-close-style 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)
