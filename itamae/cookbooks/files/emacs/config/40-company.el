(use-package company
  :config
  (global-company-mode t)
  ;; key bind
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-h") nil)
  ;; 色は solarized がいい感じにやってくれる
  ;; 補完表示までの待機時間
  (setq company-idle-delay 0)
  ;; 補完開始までの文字数
  (setq company-minimum-prefix-length 1)
  ;; 候補の一番下でさらに下に行こうとすると一番上に戻る
  (setq company-selection-wrap-around t)
  ;; 色
  (defun set-my-company-face ()
    (set-face-attribute 'company-tooltip nil
                        :foreground "black" :background "lightgrey")
    (set-face-attribute 'company-tooltip-common nil
                        :foreground "black" :background "lightgrey")
    (set-face-attribute 'company-preview-common nil
                        :background nil :foreground "white" :underline t)

    (set-face-attribute 'company-scrollbar-fg nil
                        :background "orange")
    (set-face-attribute 'company-scrollbar-bg nil
                        :background "grey60")

    (set-face-attribute 'company-tooltip-annotation nil
                        :foreground "magenta" :background "lightgrey")
    (set-face-attribute 'company-tooltip-annotation-selection nil
                        :foreground "magenta" :background "steelblue")

    (set-face-attribute 'company-tooltip-selection nil
                        :foreground "black" :background "steelblue")
    (set-face-attribute 'company-tooltip-common-selection nil
                        :foreground "white" :background "steelblue")
    (message "set face")
    )
  (add-hook 'company-mode-hook 'set-my-company-face)
  )
