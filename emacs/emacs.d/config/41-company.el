;; company.el
(defun my-company-setup ()
    (global-company-mode t)
  
    ;; C-n, C-pで補完候補を次/前の候補を選択
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (define-key company-search-map (kbd "C-n") 'company-select-next)
    (define-key company-search-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "C-h") nil)
    ;; 色
    (set-face-attribute 'company-tooltip nil
			:foreground "black" :background "lightgrey")
    (set-face-attribute 'company-tooltip-common nil
			:foreground "black" :background "lightgrey")
    (set-face-attribute 'company-tooltip-common-selection nil
			:foreground "white" :background "steelblue")
    (set-face-attribute 'company-tooltip-selection nil
			:foreground "black" :background "steelblue")
    (set-face-attribute 'company-preview-common nil
			:background nil :foreground "lightgrey" :underline t)
    (set-face-attribute 'company-scrollbar-fg nil
			:background "orange")
    (set-face-attribute 'company-scrollbar-bg nil
			:background "gray40")
    ;; 補完表示までの待機時間
    (setq company-idle-delay 0)
    ;; 補完開始までの文字数
    (setq company-minimum-prefix-length 1)
    ;; 候補の一番下でさらに下に行こうとすると一番上に戻る
    (setq company-selection-wrap-around t)
  )

(my-company-setup)
