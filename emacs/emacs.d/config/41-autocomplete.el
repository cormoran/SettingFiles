;;; autocomplete.el
;;; Code:

(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")


;;
;; Common
;;

(defun my-ac-common-setup ()
  ;;メニューの高さ
  (setq ac-menu-height 20)
  (setq ac-limit 20)
  ;;結果をいい感じにソート
  (setq ac-use-comphist t)
  ;;0.05s後に起動
  (setq ac-delay 0.05)
  ;;大小文字の区別なし
  (setq completion-ignore-case t)
  (setq read-file-name-completion-ignore-case t)
  ;; 曖昧補完
  (setq ac-use-fuzzy t)
  ;;C-n と C-pで補完を選択
  (setq ac-use-menu-map t)
;;  (define-key ac-completing-map (kbd "C-p") 'ac-previous)
;;  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (setq-default ac-sources '(ac-source-filename ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (message "Common Autocompelete Setting")
  )

;(my-ac-common-setup)
;; (add-hook 'auto-complete-mode-hook 'my-ac-common-setup)
;;これするとcommonモードの後に実行されてしまう!
;;ac-config-defaultはしない!



;;
;; Lisp
;;

(defun my-ac-emacs-lisp-setup ()
    (setq ac-sources (append '(ac-source-features ac-source-functions ac-source-yasnippet ac-source-variables ac-source-symbols) ac-sources)))

;(add-hook 'emacs-lisp-mode-hook 'my-ac-emacs-lisp-setup)


;;
;; C & C++
;;

(defvar my/use-ac-clang nil)
;(add-to-list 'load-path "~/.emacs.d/emacs-clang-complete-async/")
;(when (and (file-executable-p "~/.emacs.d/emacs-clang-complete-async/clang-complete")
;	   (require 'auto-complete-clang-async nil t))
;  (require 'auto-complete-clang-async)
;  (setq ac-clang-complete-executable "~/.emacs.d/emacs-clang-complete-async/clang-complete")
;  (setq my/use-ac-clang t)
;  )

;(require 'auto-complete-c-headers)


;;
;; C
;;

(defun my-ac-c-setup ()
  (when my/use-ac-clang
    (setq ac-sources '(ac-source-clang-async))
    (add-to-list 'ac-clang-cflags "-std=c11")
    (ac-clang-launch-completion-process)
    )
  (setq ac-sources (append ac-sources '(ac-source-c-headers)))
  (message "C Autocompelete Setting")
  )

;(add-hook 'c-mode-hook 'my-ac-c-setup)	

;;
;; C++
;;

(defun my-ac-cpp-setup ()
  (when my/use-ac-clang
    (setq ac-sources '(ac-source-clang-async ac-source-c-headers))
    (setq ac-clang-set-flags nil)
    ;;(add-to-list 'ac-clang-cflags "-I/usr/local/include/c++/5.1.0")
    (add-to-list 'ac-clang-cflags "-I/usr/local/Cellar/gcc/5.3.0/include/c++/5.3.0")
    (add-to-list 'ac-clang-cflags "-I/usr/local/Cellar/gcc/5.3.0/include/c++/5.3.0/x86_64-apple-darwin15.0.0")
    (add-to-list 'ac-clang-cflags "-I/usr/local/Cellar/gcc/5.3.0/include/c++/5.3.0/backward")
    (add-to-list 'ac-clang-cflags "-I/usr/local/Cellar/gcc/5.3.0/lib/gcc/5/gcc/x86_64-apple-darwin15.0.0/5.3.0/include")
    (add-to-list 'ac-clang-cflags "-I/usr/local/Cellar/gcc/5.3.0/include")
    (add-to-list 'ac-clang-cflags "-I/usr/local/Cellar/gcc/5.3.0/lib/gcc/5/gcc/x86_64-apple-darwin15.0.0/5.3.0/include-fixed")
    (add-to-list 'ac-clang-cflags "-I/usr/include")
    (add-to-list 'ac-clang-cflags "-I/usr/local/include")  
    (add-to-list 'ac-clang-cflags "-std=c++14")
    (ac-clang-launch-completion-process)
    )
  ;;autocomplete-c-header
  (setq achead:include-directories nil)
  (add-to-list 'achead:include-directories ".")
  (add-to-list 'achead:include-directories "/usr/local/Cellar/gcc/5.3.0/include/c++/5.3.0")
  (add-to-list 'achead:include-directories "/usr/local/Cellar/gcc/5.3.0/include/c++/5.3.0/x86_64-apple-darwin15.0.0")
  (add-to-list 'achead:include-directories "/usr/local/Cellar/gcc/5.3.0/include/c++/5.3.0/backward")
  (add-to-list 'achead:include-directories "/usr/local/Cellar/gcc/5.3.0/lib/gcc/5/gcc/x86_64-apple-darwin15.0.0/5.3.0/include")
  (add-to-list 'achead:include-directories "/usr/local/Cellar/gcc/5.3.0/include")
  (add-to-list 'achead:include-directories "/usr/local/Cellar/gcc/5.3.0/lib/gcc/5/gcc/x86_64-apple-darwin15.0.0/5.3.0/include-fixed")
  (add-to-list 'achead:include-directories "/usr/include")
  (add-to-list 'achead:include-directories "/usr/local/include")  
;;  (add-to-list 'achead:include-directories "/usr/include/c++/4.2.1")
;;  (add-to-list 'achead:include-directories "~/Programing/program_comp/library")

  (setq ac-sources (append ac-sources '(ac-source-c-headers)))
  
  (message "C++ Autocompelete Setting")
  )

;(add-hook 'c++-mode-hook 'my-ac-cpp-setup)


;;
;; C(STM32F3)
;;

(defun my-ac-stm32f3-c-setup ()
  (setq ac-sources '(ac-source-clang-async ac-source-c-headers))
  (add-to-list 'ac-clang-cflags "-I~/Programing/ARM/local/stm32/STM32CubeF3/STM32Cube_FW_F3_V1.2.0/Drivers/CMSIS/Device/ST/STM32F3xx/Include")
  (add-to-list 'ac-clang-cflags "-I~/Programing/ARM/local/stm32/STM32CubeF3/STM32Cube_FW_F3_V1.2.0/Drivers/CMSIS/Include")
  (ac-clang-launch-completion-process)
  (message "STM32F3 C Autocompelete Setting")
  )

;(add-hook 'stm32f3-c-mode 'my-ac-stm32f3-c-setup)


;;
;; AVR
;;

(defun my-ac-avr-c-setup ()
  (setq ac-sources '(ac-source-clang-async ac-source-c-headers))
  (add-to-list 'ac-clang-cflags "-I/usr/local/CrossPack-AVR-20131216/avr/include")
  (ac-clang-launch-completion-process)
  (message "Avr C Autocompelete Setting")
  )

;(add-hook 'avr-c-mode 'my-ac-avr-c-setup)

;;
;; 有効化
;;

;(global-auto-complete-mode t)

;;; autocomplete.el ends here
