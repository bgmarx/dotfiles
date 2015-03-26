;; (require 'mouse)
;; (defun initialise-mouse-mode (&optional frame)
;;   (if (not frame) ;; The initial call.
;;       (xterm-mouse-mode 1)
;; ;    ;; Otherwise called via after-make-frame-functions.
;;     (if xterm-mouse-mode
;; ;        ;; Re-initialise the mode in case of a new terminal.
;;         (xterm-mouse-mode 1))))
;; (initialise-mouse-mode)
;; (add-hook 'after-make-frame-functions 'initialise-mouse-mode);

;; (setq mouse-yank-at-point t)
;; ;
;; (global-set-key [mouse-4] '(lambda ()
;;                              (interactive)
;;                              (scroll-down 1)))
;; ;
;; (global-set-key [mouse-5] '(lambda ()
;;                              (interactive)
;;                              (scroll-up 1)))



;; ;(setq mouse-wheel-follow-mouse 't)
;; ;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
