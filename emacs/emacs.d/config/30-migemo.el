;; migemo
;; 日本語をいい感じに検索できる
;; brew install cmigemo

(when
    (and (executable-find "cmigemo")
	 (require 'migemo nil t))
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  
  (migemo-init)
  )
