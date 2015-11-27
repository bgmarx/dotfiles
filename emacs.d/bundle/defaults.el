(require 'github-browse-file)
(require 'multiple-cursors)
;; Use bin/bash as default shell for Emacs to work around PATH issues with zsh
;;(setq shell-file-name "/usr/local/bin/zsh")

(setq-default indent-tabs-mode nil)

;; delete the selection with a keypress
(delete-selection-mode t)

;; revert buffers automatically when underlying files are changed
(global-auto-revert-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; write a PID file for the emacs-server
(setq pidfile "~/.emacsserver.pid")

(add-hook 'emacs-startup-hook
    (lambda ()
      (with-temp-file pidfile
        (insert (number-to-string (emacs-pid))))))

(add-hook 'kill-emacs-hook
    (lambda ()
      (when (file-exists-p pidfile)
        (delete-file pidfile))))

;; `gc-cons-threshold'

;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Garbage-Collection.html
;;
;; I have a modern machine ;)
;;
(setq gc-cons-threshold 20000000)

(setq delete-old-versions t)
(setq make-backup-files nil)
(setq create-lockfiles nil)

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq ring-bell-function 'ignore)

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(add-hook 'before-save-hook 'whitespace-cleanup)
(display-time-mode t)
(global-linum-mode t)
(setq linum-format "%d | ")
(setq-default tab-width 2 indent-tabs-mode nil)

(define-key global-map (kbd "RET") 'newline-and-indent)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;(require 'ansi-color)
;(global-whitespace-mode 1)

;; Disable lockfiles
create-lockfiles nil

;; Always follow symbolic links to version controlled files
vc-follow-symlinks t
;; Allow this Emacs process to be a server for client processes.
(server-start)



(setq github-browse-file-show-line-at-point t)
(setq tab-width 2)

(global-set-key (kbd "C-c m e") 'mc/edit-lines)

(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)

(provide 'defaults)
