;;disable backup
(setq backup-inhibited t)
;;disable auto save
(setq auto-save-default nil)

;;(setq backup-directory-alist
;;     `((".*" . , "~/.tmp")))
;;(setq auto-save-file-name-transforms
;;         `((".*" ,"~/.tmp" t)))

(display-time-mode t)
(setq inhibit-startup-message t)
(global-linum-mode t)
(setq linum-format "%d | ")
(setq-default tab-width 4 indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;(when (window-system)
 ; (tool-bar-mode -1)
 ; (scroll-bar-mode -1))

;(:eval (list (nyan-create))) 
