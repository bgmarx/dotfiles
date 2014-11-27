
(mapc 'load-file (directory-files "~/.emacs.d/init.d" t "\\.el\\'"))

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("ELPA" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(setq el-get-dir (expand-file-name "el-get" user-emacs-directory))

(add-to-list 'load-path
             (expand-file-name "el-get/el-get" user-emacs-directory))
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
                                (lambda (s) (end-of-buffer) (eval-print-last-sexp))))

(defun require-package (package)
  (setq-default highlight-tabs t)
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))
(display-time-mode t)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(global-linum-mode t)
(setq linum-format "%d | ")
(setq-default tab-width 4 indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)
(scroll-bar-mode -1)
(setq gdb-many-windows t)
;(guru-global-mode +1)
;(setq guru-warn-only t)
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)


(powerline-default-theme)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(load-theme 'monokai t)

(require 'mouse)
(defun initialise-mouse-mode (&optional frame)
  (if (not frame) ;; The initial call.
      (xterm-mouse-mode 1)
    ;; Otherwise called via after-make-frame-functions.
    (if xterm-mouse-mode
        ;; Re-initialise the mode in case of a new terminal.
        (xterm-mouse-mode 1))))
(initialise-mouse-mode)
(add-hook 'after-make-frame-functions 'initialise-mouse-mode)

(setq mouse-yank-at-point t)

(global-set-key [mouse-4] '(lambda ()
                             (interactive)
                             (scroll-down 1)))

(global-set-key [mouse-5] '(lambda ()
                             (interactive)
                             (scroll-up 1)))
(add-to-list 'auto-mode-alist
             '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
                            '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(add-to-list 'load-path "which-folder-ace-jump-mode-file-in/")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(yas-global-mode 1)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(require 'git-gutter)

(global-git-gutter-mode t)
(global-git-gutter-mode +1)

(setq backup-directory-alist
   `((".*" . , "~/.tmp")))
(setq auto-save-file-name-transforms
   `((".*" ,"~/.tmp" t)))
(require 'haml-mode)
(projectile-global-mode)

(setq gc-cons-threshold 20000000)
;;(persp-mode)
;;(require 'persp-projectile)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'after-init-hook #'global-flycheck-mode)
(global-set-key (kbd "C-c r r") 'inf-ruby)

(define-key ruby-mode-map (kbd "C-c C-c") 'xmp)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)

;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(setq multi-term-program "/bin/zsh")

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
