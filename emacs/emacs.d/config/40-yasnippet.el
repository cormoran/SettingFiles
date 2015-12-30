

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/mysnippets"))
(setq yas/use-menu nil)
(yas-global-mode t)

;;コメントやリテラルではスニペットを展開しない
(setq yas/buffer-local-condition
      '(or (not (or (string= "font-lock-comment-face"
			     (get-char-property (point) 'face))
		    (string= "font-lock-string-face"
			     (get-char-property (point) 'face))))
	   '(require-snippet-condition . force-in-comment)))
