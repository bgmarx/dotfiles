(set-face-attribute 'default nil
                    :family "Monaco"
                    :height 110
                    :weight 'normal
                    :width 'normal)

(when (functionp 'set-fontset-font)
  (set-fontset-font "fontset-default"
                    'unicode
                    (font-spec :family "Monaco"
                               :width 'normal
                               :size 12.4
                               :weight 'normal)))
