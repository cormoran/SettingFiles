(use-package visual-regexp-steroids
  :bind (
         ("M-%" . vr/query-replace)
         ("C-M-r" . vr/isearch-backward)
         ("C-M-s" . vr/isearch-forward)
         )
  :config
  (setq vr/engine 'python)
  )
