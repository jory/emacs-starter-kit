(add-to-list 'load-path "~/.emacs.d/vendor/")

;;; Windows specific tunings
(if (eq system-type 'windows-nt)
    (progn
      (setq magit-git-executable "C:/Program Files (x86)/Git/bin/git.exe")))

(mouse-avoidance-mode 'banish)
(winner-mode t)
(server-mode t)

(put 'narrow-to-region 'disabled nil)

(load "~/.emacs.d/vendor/nxhtml/autostart.el")

;; These options came from the Rinari install instructions, and thus
;; should be considered with a grain of salt.

(setq nxhtml-global-minor-mode t
      mumamo-chunk-coloring 'submode-colored
      nxhtml-skip-welcome t
      indent-region-mode t
      rng-nxml-auto-validate-flag nil
      nxml-degraded t)
