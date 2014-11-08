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
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))
(display-time-mode t)

(if (member "Monaco" (font-family-list))
    (set-face-attribute
          'default nil :font "Monaco 12"))

(global-linum-mode t)
(setq linum-format "%d ")
(setq-default tab-width 4 indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)
(scroll-bar-mode -1)
(setq gdb-many-windows t)
(guru-global-mode +1)
(setq guru-warn-only t)
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)
(powerline-default-theme)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(load-theme 'cyberpunk t)
                                        ; Mouse in terminal
(require 'mouse)

;; mouse mode must be initialised for each new terminal
;; see http://stackoverflow.com/a/6798279/27782
(defun initialise-mouse-mode (&optional frame)
  "Initialise mouse mode for the current terminal."
  (if (not frame) ;; The initial call.
      (xterm-mouse-mode 1)
    ;; Otherwise called via after-make-frame-functions.
    (if xterm-mouse-mode
        ;; Re-initialise the mode in case of a new terminal.
        (xterm-mouse-mode 1))))
(setq x-select-enable-clipboard t)
;; Evaluate both now (for non-daemon emacs) and upon frame creation
;; (for new terminals via emacsclient).
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
