;;; 10-settings.el --- common setings ---
;;; Code:



(setq default-buffer-file-coding-system 'utf-8)

;;
;; 見た目
;;

;;スキンの設定

(load-theme 'wombat)
;;スタートアップ画面なし
(setq inhibit-startup-screen t)
;;行番号表示
(global-linum-mode t)
;;
;; モードライン系
;;

;;カーソル位置
(column-number-mode t)
(line-number-mode t)
;;改行文字
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-unix "(LF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-undecided "(N/A)")  


;;
;; ハイライト系
;;

(global-hl-line-mode t)
;;括弧
(show-paren-mode t)
;;括弧 画面まで出るとき全体ハイライト
(setq show-paren-style 'mixed)
;;選択範囲
;;(global transient-mark-mode t) 


;;
;; 動作系
;;

;;backspaceで前の空白を一気に消す
(setq c-hungry-delete-key t)
;;yesをy、noをnに
(defalias 'yes-or-no-p 'y-or-n-p)
;; #!に実行権をつける
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)
;;バッファ切り替え強化
(iswitchb-mode t)

(require 'smartparens)
(require 'smartparens-config)
(smartparens-global-mode t)
;;http://qiita.com/ShingoFukuyama/items/ed1af137a98e0028e025
(ad-disable-advice 'delete-backward-char 'before 'sp-delete-pair-advice)
(ad-activate 'delete-backward-char)


;;
;; マウススクロール
;;

;;(xterm-mouse-mode t)
;;(mouse-wheel-mode t)
;;(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
;;(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))
;;
;; キーマップ系
;;

;;C-a C-e を拡張
(require 'sequential-command-config)
(sequential-command-setup-keys)

;;window移動をshift+Arrowに
(windmove-default-keybindings)
(setq windmove-wrap-around t)
;;バックスペース
(global-set-key "\C-h" 'delete-backward-char)


(which-function-mode 1)

(provide '10-settings)
;;; 10-settings.el ends here
