;; jedi
;; (python auto complete)

(defun my-jedi-setup ()
      (setq jedi:complete-on-dot t)
      (add-hook 'python-mode-hook 'jedi:setup)  
  )

(my-jedi-setup)

(defun my-company-jedi-setup ()
      (add-to-list 'company-backends 'company-jedi)
  )

(my-company-jedi-setup)
