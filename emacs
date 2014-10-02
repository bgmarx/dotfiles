(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

(require 'cl)
(require 'package)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://github.com/dimitri/el-get/raw/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))
(require 'iso-transl)
(require 'evil)
(evil-mode 1)
(require 'powerline)
;;(require 'powerline-evil)
;;(powerline-evil-vim-color-theme)
(require 'helm-config)
(helm-mode 1)
(display-time-mode t)
(set-default-font "Monaco 13")
(global-linum-mode t)
(setq linum-format "%d ")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)
(define-key evil-normal-state-map (kbd "C-w t") 'elscreen-create) ;creat tab
(define-key evil-normal-state-map (kbd "C-w x") 'elscreen-kill) ;kill tab
(setq-default tab-width 4 indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)
(scroll-bar-mode -1)
(setq gdb-many-windows t)
 ;; use Emacs keybindings when in insert mode }:)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(global-set-key (kbd "M-x") 'helm-M-x)

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
      (if (and delete-selection-mode transient-mark-mode mark-active)
            (setq deactivate-mark  t)
	        (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
		    (abort-recursive-edit)))
		    (define-key evil-normal-state-map [escape] 'keyboard-quit)
		    (define-key evil-visual-state-map [escape] 'keyboard-quit)
		    (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
		    (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
		    (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
		    (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
		    (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
		    (global-set-key [escape] 'evil-exit-emacs-state)
(add-hook 'after-init-hook #'global-flycheck-mode)