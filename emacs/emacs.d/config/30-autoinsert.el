(use-package autoinsert
  :init
  (add-hook 'find-file-not-found-hooks 'auto-insert)
  :config
  (setq autoinsert-user-name "cormoran")
  (setq auto-insert-directory "~/.emacs.d/template")
  
  (setq auto-insert-alist
        (nconc '(
                 ("\\.comp.cpp$" . ["template.comp.cpp" my-template])
                 ("\\.cpp$" . ["template.cpp" my-template])
                 ("\\.c$" . ["template.c" my-template])
                 ("\\.py$" . ["template.py" my-template])
                 ("\\.sh$" . ["template.sh" my-template])
                 ("\\.html$" . ["template.html" my-template])
                 ("makefile" . ["makefile" my-template])
                 ("CMakeLists.txt" . ["template.cmakelists.txt" my-template])
                 ) auto-insert-alist))
  (use-package cl)
  
  (defvar template-replacements-alists
    '(("%file%"             . (lambda ()
                                (file-name-nondirectory
                                 (buffer-file-name))))
      ("%file-without-ext%" . (lambda ()
                                (file-name-sans-extension
                                 (file-name-nondirectory
                                  (buffer-file-name)))))
      ("%date%" . (lambda () (format-time-string "%Y-%m-%d")))
      ("%author%" . (lambda () (identity autoinsert-user-name)))
      ("%procon%" . (lambda () ""))
      ))  
  (defun my-template ()
    (time-stamp)
    (mapc #'(lambda(c)
              (progn
                (goto-char (point-min))
                (replace-string (car c) (funcall (cdr c)) nil)))
          template-replacements-alists)
    (goto-char (point-max))
    (message "done."))    
  )
