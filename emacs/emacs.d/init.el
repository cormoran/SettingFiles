;;; package --- Summary
;;; Commentary:
;;; Code:

;;Package Manager(elpa)
(add-to-list 'load-path "~/.emacs.d/elpa/")
(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "https://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")
	)
      )
(package-initialize)


;;init-loader
(unless (require 'init-loader nil t)
  (package-refresh-contents)
  (package-install 'init-loader)
  )

(require 'init-loader)
(init-loader-load "~/.emacs.d/config")
