
;;
;; for stm32f3
;;

(defun stm32f3-c-mode ()
  "STM32F3 Mode "
  (interactive)
  (c-mode)
  (setq mode-name "STM32F3-C")
  (setq major-mode 'stm32f3-c-mode)
  (run-hooks 'stm32f3-c-mode-hook)
  )


;;
;; for avr
;;


(defun avr-c-mode ()
  "Avr Mode "
  (interactive)
  (c-mode)
  (setq mode-name "AVR-C")
  (setq major-mode 'avr-c-mode)
  (run-hooks 'avr-c-mode-hook)
  )
