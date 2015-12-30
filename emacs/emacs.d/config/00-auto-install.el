;;; 00-auto-install.el --- install required packages ---
;;; Code:

;;自動バイトコンパイル
(unless (require 'auto-async-byte-compile nil t)
  (package-refresh-contents)
  (package-install 'auto-async-byte-compile)
  )
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(defvar my/favorite-packages
  '(
    sequential-command

    auto-complete

    flycheck

    ido-vertical-mode

    flycheck-pos-tip

    auto-complete-clang-async

    auto-complete-c-headers
    
    eldoc-extension

    c-eldoc

    go-eldoc

    smart-compile

    yasnippet

    google-c-style

    smartparens

    clang-format

    iedit

    google-translate

    haskell-mode

    cmake-mode

    fuzzy
    
    )
  )


;;インストールされていないパッケージを入れる
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package))
  )


(provide '00-auto-install)
;;; 00-auto-install.el ends here
