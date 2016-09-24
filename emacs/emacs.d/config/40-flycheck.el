(add-hook 'c-mode-common-hook 'flycheck-mode)

;; ;;; 20-flycheck.el
;; ;;; Code:

;; (require 'flycheck)


(require 'flycheck-pos-tip)
;;ポップアップ表示する
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;;
;; C & C++
;;

(add-hook 'c-mode-common-hook 'flycheck-mode)

;;
;; C
;;

(defun my-flycheck-c-init ()
  (flycheck-select-checker 'c/c++-clang)
  (setq flycheck-clang-language-standard "c11")
  (flycheck-mode t)
  )

(add-hook 'c-mode-hook 'my-flycheck-c-init)

;;
;; C++
;;

 (defun my-flycheck-cpp-init ()
   ;;(flycheck-select-checker 'c/c++-clang)
   ;;(setq flycheck-clang-language-standard "c++1y")
   ;;(add-to-list 'flycheck-clang-include-path "~/Programing/program_comp/library" )
   (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
   (flycheck-mode t)
   )

(add-hook 'c++-mode-hook 'my-flycheck-cpp-init)


;;
;; STM32F3
;;

(defun my-flycheck-stm32f3-c-init ()
  (flycheck-select-checker 'c/c++-clang)
  (setq flycheck-clang-include-path nil)
  (add-to-list 'flycheck-clang-include-path "~/Programing/ARM/local/stm32/STM32CubeF3/STM32Cube_FW_F3_V1.2.0/Drivers/CMSIS/Device/ST/STM32F3xx/Include")
  (add-to-list 'flycheck-clang-include-path "~/Programing/ARM/local/stm32/STM32CubeF3/STM32Cube_FW_F3_V1.2.0/Drivers/CMSIS/Include")
  (add-to-list 'flycheck-clang-include-path "../Inc")
  (flycheck-mode t)
  )

(add-hook 'stm32f3-c-mode-hook 'my-flycheck-stm32f3-c-init)

;;
;; AVR
;;

(defun my-flycheck-avr-c-init ()
  (flycheck-select-checker 'c/c++-clang)
  (setq flycheck-clang-include-path nil)
  (add-to-list 'flycheck-clang-include-path "/usr/local/CrossPack-AVR-20131216/avr/include")
  (flycheck-mode t)
  )

(add-hook 'avr-c-mode-hook 'my-flycheck-avr-c-init)

;;
;; Python
;;

(add-hook 'python-mode-hook 'flycheck-mode)


;;
;; Ruby 
;;

(add-hook 'ruby-mode-hook 'flycheck-mode)


;;
;; rust
;;

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(provide '20-flycheck.el)
;;; flycheck.el ends here


