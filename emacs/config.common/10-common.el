;;
;; 文字コードの設定
;;
;; 参考:
;;    http://yohshiy.blog.fc2.com/blog-entry-273.html

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default 'buffer-file-coding-system 'utf-8) ; 新規作成のファイル
(modify-coding-system-alist 'file "\\.bat\\'" 'shift_jis) ; 拡張子ごとに設定を変更


;;
;; 基本的なキーバインド
;;

(global-set-key "\C-h" 'delete-backward-char) ;バックスペース
(global-set-key "\C-\\" nil) ; 日本語入力の設定を無効にする

;;
;; ウィンドウの見た目
;;



(load-theme 'solarized t)
(set-terminal-parameter nil 'background-mode 'dark)
(enable-theme 'solarized)

(setq inhibit-startup-screen t) ; スタートアップ画面なし
(global-linum-mode t) ; 行番号表示
(column-number-mode t) ; カーソル位置
(line-number-mode t)
(setq eol-mnemonic-dos "(CRLF)") ; 改行文字の表記方法
(setq eol-mnemonic-unix "(LF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-undecided "(N/A)")  

;;
;; ハイライト
;;

(global-hl-line-mode t) ; カーソルの行をハイライト
(show-paren-mode t) ; 括弧をハイライト
(setq show-paren-style 'mixed) ;括弧が画面をまたぐとき全体をハイライト
(transient-mark-mode t) ; 選択範囲をハイライト



;;
;; その他
;; 

(setq-default tab-width 4 indent-tabs-mode nil) ; タブをスペース4字に
(setq backup-directory-alist ; バックアップファイル(~, #) の保存場所変更
      `((".*" . ,(expand-file-name "~/.emacs.backup/"))))
(setq auto-save-file-name-transforms 
      `((".*" ,(expand-file-name "~/.emacs.backup/") t)))

(setq c-hungry-delete-key t) ; backspaceで前の空白を一気に消す
(defalias 'yes-or-no-p 'y-or-n-p) ; yesをy、noをnに
(add-hook 'after-save-hook ; シェバン(#!)に実行権をつける
	  'executable-make-buffer-file-executable-if-script-p)
(windmove-default-keybindings) ; windowの移動をSHIFT + arrow で
(setq windmove-wrap-around t) ; 端からくるくる
(which-function-mode 1)


;;
;; 外部パッケージ
;;

;;C-a C-e を拡張
(use-package
  sequential-command-config
  :bind (("\C-a" . seq-home)
         ("\C-e" . seq-end))
  :config  
  )

;; 括弧を自動補完
(use-package
  smartparens
  :config 
  (smartparens-global-mode t)
  (ad-disable-advice 'delete-backward-char 'before 'sp-delete-pair-advice)
  (ad-activate 'delete-backward-char)
  ;; 参考
  ;;    http://qiita.com/ShingoFukuyama/items/ed1af137a98e0028e025
  )

;; mark をいい感じに自動化

(use-package
  expand-region
  :bind(("C-M-@" . er/expand-region)
        ;;("C-M-@" . er/contract-region)
        )
  )

;; C-x u で undo tree 表示
;; redo 機能追加(M-_)
(use-package
  undo-tree
  :bind (("M-_" . undo-tree-redo)
         )
  :config
  :init
  (global-undo-tree-mode t)
  )

(use-package
  highlight-symbol
  ;;ref:  http://emacs.rubikitch.com/highlight-symbol/
  :init
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode) ;; M-n M-p でシンボル移動
  :config
  (setq highlight-symbol-idle-delay 2.0)  
  )

;;バッファ切り替え強化
(ido-mode t)
(use-package ido-vertical-mode
  :init
  (ido-vertical-mode t)
  :config
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  )

