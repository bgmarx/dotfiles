;; Unset keys
(global-unset-key (kbd "C-x C-f")) ; find-file
(global-unset-key (kbd "C-x h")) ; mark-whole-buffer
(global-unset-key (kbd "C-x C-w")) ; write-file

;; Helm
(global-set-key (kbd "M-a") 'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "M-R") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h f") 'helm-apropos)
(global-set-key (kbd "C-h r") 'helm-info-emacs)
(global-set-key (kbd "C-h C-l") 'helm-locate-library)
(global-set-key (kbd "M-w") 'helm-imenu)
(global-set-key (kbd "C-o") 'helm-find-files)
(global-set-key (kbd "M-g a") 'helm-projectile-ag)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key process-menu-mode-map (kbd "C-k") 't-delete-process-at-point)
(define-key minibuffer-local-map (kbd "M-v") 'yank)

;; Ag
(global-set-key (kbd "C-x M-a") 'ag)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(global-set-key (kbd "C-x M-l") 'magit-log)
(global-set-key (kbd "C-x M-b") 'magit-blame)

;; swap `transpose-chars' key with `transpose-lines'
(global-set-key "\C-t" #'transpose-lines)
(define-key ctl-x-map "\C-t" #'transpose-chars)

(provide 'keybindings)
