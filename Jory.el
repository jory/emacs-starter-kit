(add-to-list 'load-path "~/.emacs.d/vendor/")

;;; Windows specific tunings
(if (eq system-type 'windows-nt)
    (progn
      (setq magit-git-executable "C:/Program Files (x86)/Git/bin/git.exe")))

(mouse-avoidance-mode 'banish)
(winner-mode t)

(put 'narrow-to-region 'disabled nil)
