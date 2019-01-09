;; 文字コード
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default 'buffer-file-coding-system 'utf-8) ; 新規作成のファイルをUTF-8に
(modify-coding-system-alist 'file "\\.bat\\'" 'shift_jis) ; .bat は shift_jis

;; キーバインド系
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-\\" nil) ; 日本語入力を無効に
(setq c-hungry-delete-key t) ; backspaceで前の空白を一気に消す
(setq-default tab-width 4 indent-tabs-mode nil) ; タブをスペース4字に

;; 各種番号を表示
(global-linum-mode t)
(column-number-mode t)
(line-number-mode t)

(load-theme 'solarized t)
(defun my-init-theme (frame)
  (set-frame-parameter frame 'background-mode 'dark)
  (set-terminal-parameter (frame-terminal frame) 'background-mode 'dark)
  (enable-theme 'solarized)
  )
;; for emacs client
(if (daemonp)
    (add-hook 'after-make-frame-functions 'my-init-theme))
(my-init-theme nil)
(setq inhibit-startup-screen t) ; スタートアップ画面なし

(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-unix "(LF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-undecided "(N/A)")

;; (set-face-foreground 'linum "white") ;; 行番号の色 (黒背景で変な時等に)
(global-hl-line-mode t) ; カーソルの行をハイライト 色が被って見えない
(show-paren-mode t) ; 括弧をハイライト
(setq show-paren-style 'mixed) ;括弧が画面をまたぐとき全体をハイライト
(transient-mark-mode t) ; 選択範囲をハイライト

;; バックアップファイルの場所
(setq backup-directory-alist
      `((".*" . ,(expand-file-name "~/.emacs.backup/"))))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.backup/") t)))

;; その他挙動
(defalias 'yes-or-no-p 'y-or-n-p) ; yesをy、noをnに
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p) ; シェバンに +x
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; 空白消す
(windmove-default-keybindings) ; windowの移動をSHIFT + arrow で
(setq windmove-wrap-around t) ; 端からくるくる
(which-function-mode 1)

;; バッファ切り替え強化
(ido-mode t)
(use-package ido-vertical-mode
  :config
  (ido-vertical-mode t)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  )

;; ref: http://emacs.rubikitch.com/highlight-symbol/
;;(use-package highlight-symbol
;;  :init
;;  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
;;  (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode) ;; M-n M-p でシンボル移動
;;  :config
;;  (setq highlight-symbol-idle-delay 2.0)
;;  )

;;C-a C-e を拡張
(use-package sequential-command-config
  :bind (("\C-a" . seq-home)
         ("\C-e" . seq-end))
  )

;; 括弧を自動補完
;; Ref: http://qiita.com/ShingoFukuyama/items/ed1af137a98e0028e025
(use-package smartparens
  :config
  (smartparens-global-mode t)
  (ad-disable-advice 'delete-backward-char 'before 'sp-delete-pair-advice)
  (ad-activate 'delete-backward-char)
  )

;; 範囲選択をいい感じで自動化
(use-package expand-region
  :bind(("C-M-@" . er/expand-region)
        ;;("C-M-@" . er/contract-region)
        )
  )

;; undo tree 表示(C-x u)
(use-package undo-tree
  :bind (("M-_" . undo-tree-redo)) ; redo
  :config (global-undo-tree-mode t)
  )
