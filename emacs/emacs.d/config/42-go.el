;; go

;; Goのパスを通す
;;(add-to-list 'exec-path (expand-file-name "/usr/local/Cellar/go/1.5.2/bin/"))
;; go get で入れたツールのパスを通す
;;(add-to-list 'exec-path (expand-file-name "~/Program/bin"))




(add-hook 'go-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-go)

(add-hook 'go-mode-hook 'flycheck-mode)

(add-hook 'go-mode-hook
          (lambda()
            ;; gofmtをgoimportsに上書き
            (setq gofmt-command "goimports")
            ;; セーブした時にgofmtを実行する
            (add-hook 'before-save-hook 'gofmt-before-save)
            (local-set-key (kbd "M-.") 'godef-jump)
            ))


