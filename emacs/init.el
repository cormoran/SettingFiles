
;;
;; パッケージの自動インストール
;;
;; 参考:
;;    http://vdeep.net/emacs-cask
;;
;; @note
;; 自身のパス : file-name-directory
;;


(when (eq system-type 'darwin) ; Mac
  ;; brew install cask 仮定
  (require 'cask)
  )
(when (eq system-type 'gnu/linux) ; Linux
  ;; 未検証
  ;; (require 'cask "~/.cask/cask.el")
)
(when (eq system-type 'windows-nt) ; Windows
  
)

(cask-initialize)

;;
;; 自動インストールはしないパッケージのインストール
;;
;; TODO : 
;;    競合しない？

(add-to-list 'load-path "~/.emacs.d/elpa/")
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")
	)
      )


;;
;; 各種設定のロード
;;
;; 参考:
;;    http://qiita.com/kai2nenobu/items/5dfae3767514584f5220

(require 'init-loader)
(require 'use-package)
(init-loader-load "~/.emacs.d/mysetting/config")

