(setq package-enable-at-startup nil)
(package-initialize)

(require 'cask "/usr/local/Cellar/cask/0.7.4/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(add-to-list 'load-path (expand-file-name "bundle" user-emacs-directory))

(require 'autocomplete)
(require 'defaults)
;;(require 'dir-ed)
(require 'display)
(require 'elixir)
(require 'elm-mode)
(require 'helmconfig)
(require 'html)
(require 'ido-config)
(require 'keybindings)
(require 'mag-it)
(require 'org-config)
(require 'ruby)
(require 'rust-mode)
(require 'smart-parens)
(require 'writer)
(require 'ya-snippet)

(provide 'init)

;;; init.el ends here
