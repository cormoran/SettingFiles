;; ;;; 20-eldoc.el --- install required packages ---
;; ;;; Code:

;; (require 'eldoc)

;; ;;
;; ;; Common
;; ;;

(setq eldoc-idle-delay 0.2)
(setq eldoc-echo-area-use-multiline-p t)

;; ;;
;; ;; emacs lisp
;; ;;

(require 'eldoc-extension)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)



;; ;;
;; ;; C & C++
;; ;;

;; ;;(require 'c-eldoc)
;; ;;(setq c-eldoc-buffer-regenerate-time 60)
;; ;;(concatenate 'c-eldoc-includes "/usr/local/include")
;; ;;(concatenate 'c-eldoc-includes "/usr/local/include/c++/5.1.0")
;; ;;(concatenate 'c-eldoc-includes "~/Programing/program_comp/library")

;; ;;(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
;; ;;(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)


;; ;;
;; ;; go
;; ;;

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)



;; (provide '20-eldoc)
;; ;;; 20-eldoc.el ends here

