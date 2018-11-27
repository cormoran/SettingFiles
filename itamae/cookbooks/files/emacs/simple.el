;;; パッケージ管理システムを用いない，控えめの設定 simple.el
;;; for emacs 24, mac and linux

;; 文字コード
(prefer-coding-system 'utf-8)
(set-default 'buffer-file-coding-system 'utf-8) ; 新規作成のファイルをUTF-8に

;; キーバインド系
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-\\" nil) ; 日本語入力を無効に
(setq c-hungry-delete-key t) ; backspaceで前の空白を一気に消す
(setq-default tab-width 4 indent-tabs-mode nil) ; タブをスペース4字に

;; 各種番号を表示
(global-linum-mode t)
(column-number-mode t)
(line-number-mode t)

;; (set-face-foreground 'linum "white") ;; 行番号の色 (黒背景で変な時等に)
;; (global-hl-line-mode t) ; カーソルの行をハイライト 色が被って見えない
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
(ido-mode t) ;バッファ切り替え強化

;;; 文法チェック
(add-hook 'c++-mode-hook 'flymake-mode)
;; at Makefile
;; check-syntax:
;; g++ -Wall -Wextra -Wshadow -fsyntax-only -std=gnu++11 $(CHK_SOURCES)

;;; ---------------------------------------------
;;; ここから挑戦的機能（外部ファイルを読み込む）
;;; ---------------------------------------------

(add-to-list 'load-path "~/.emacs.d/elisp/")

;; solarized theme 適用
(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/")
(load-theme 'solarized t)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (let ((mode (if (display-graphic-p frame) 'light 'dark)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
            (enable-theme 'solarized)))
;; sequential command
(require 'sequential-command-config)
(global-set-key "\C-a" 'seq-home)
(global-set-key "\C-e" 'seq-end)

