(require 'color-theme-solarized)
(defalias 'zen 'color-theme-zenburn)
(defalias 'dark 'color-theme-solarized-dark)
(defalias 'light 'color-theme-solarized-light)
(zenburn)

(global-set-key (kbd "C-c c z") 'zen)
(global-set-key (kbd "C-c c d") 'dark)
(global-set-key (kbd "C-c c l") 'light)
