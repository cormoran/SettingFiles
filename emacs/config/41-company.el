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
  )
