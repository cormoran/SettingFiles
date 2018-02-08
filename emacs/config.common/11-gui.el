(when window-system
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (setq frame-title-format (format "%%f - Emacs@%s" (system-name)))
  (set-frame-parameter nil 'alpha 95)
  ;;Macなら環境変数をshellから引き継ぐ
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)
    )
  )
