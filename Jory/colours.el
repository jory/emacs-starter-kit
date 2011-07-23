(require 'color-theme)
(require 'color-theme-github)
(require 'color-theme-railscasts)
(require 'color-theme-solarized)
(require 'color-theme-zenburn)

(defalias 'zen 'color-theme-zenburn)
(defalias 'dark 'color-theme-solarized-dark)
(defalias 'light 'color-theme-solarized-light)

(global-set-key (kbd "C-c c z") 'zen)
(global-set-key (kbd "C-c c d") 'dark)
(global-set-key (kbd "C-c c l") 'light)

(color-theme-zenburn)
