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
