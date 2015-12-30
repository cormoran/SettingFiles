;;
;; Haskell Mode の基本設定
;;

(require 'haskell-mode)
(require 'haskell-cabal)

;;関連付け
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))
;;シェバンのみにも対応
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

;;ghc-mod の設定

(add-to-list 'exec-path (expand-file-name "~/.cabal/bin"))
(add-to-list 'load-path (expand-file-name "~/.cabal/share/x86_64-osx-ghc-7.10.2/ghc-mod-5.4.0.0/elisp/"))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)


(defun my-ghc-mod-setup ()
  (ghc-init)
  (setq ac-sources
	(append '(ac-source-ghc-mod) ac-sources))
  (setq flycheck-checker 'haskell-hlint)
  (flycheck-mode t)
  )

(add-hook 'haskell-mode-hook 'my-ghc-mod-setup)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)



(custom-set-variables '(haskell-tags-on-save t))
