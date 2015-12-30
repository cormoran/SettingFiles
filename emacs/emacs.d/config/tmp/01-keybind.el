
;ctr+hでbackspace 
(define-key global-map "\C-h" 'delete-backward-char)
; esc + ?でヘルプ
(define-key global-map "\M-?" 'help-for-help)
;コード折りたたみ
(define-key global-map (kbd "C-^") 'hs-toggle-hiding)




(define-key global-map (kbd "M-,") 'enlarge-window-horizontally)
(define-key global-map (kbd "M-/") 'shrink-window-horizontally)
(define-key global-map (kbd "M-.") 'enlarge-window)
(define-key global-map (kbd "M-_") 'shrink-window)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

