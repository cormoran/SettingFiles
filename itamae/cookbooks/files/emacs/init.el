
;;
;; パッケージの自動インストール
;;
;; 参考:
;;    http://vdeep.net/emacs-cask
;;
;; @note
;; 自身のパス : file-name-directory
;;

(global-set-key "\C-h" 'delete-backward-char) ;; 生死に関わるのでとにかく先に設定

(defun init-cask (loaded)
  (cond (loaded (cask-initialize))
	(t (message "failed to load cask!"))))

(message "System is %s." system-type)
(init-cask (require 'cask "~/local/emacs_cask/cask.el" t))

;; use-package が存在しない時のエラー対策
;; Ref: http://qiita.com/kai2nenobu/items/5dfae3767514584f5220
(unless (require 'use-package nil t) (defmacro use-package (&rest args)))

(use-package init-loader
  :init
  (init-loader-load "~/.emacs.d/config")
  ;;(cond
  ;; ((eq system-type 'darwin)     (init-loader-load "~/.emacs.d/config.mac"))
  ;; ((eq system-type 'gnu/linux)  (init-loader-load "~/.emacs.d/config.linux"))
  ;; ((eq system-type 'windows-nt) (init-loader-load "~/.emacs.d/config.win"))
  ;; )
  )
