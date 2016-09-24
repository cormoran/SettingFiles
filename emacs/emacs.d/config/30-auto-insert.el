(defun my-auto-insert-setup ()
  (require 'autoinsert)
  (setq autoinsert-user-name "cormoran")
 
  ;; テンプレートのディレクトリ
  (setq auto-insert-directory "~/.emacs.d/template")

  ;; 各ファイルによってテンプレートを切り替える
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
  (require 'cl)

  (defvar template-replacements-alists
    '(("%file%"             . (lambda () (file-name-nondirectory (buffer-file-name))))
      ("%file-without-ext%" . (lambda () (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
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
  (add-hook 'find-file-not-found-hooks 'auto-insert)
  )
(my-auto-insert-setup)
