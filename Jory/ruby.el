;; Ruby

;; (global-set-key (kbd "C-c C-s") 'inf-ruby)

(defun turn-off-comint-echo ()
  (setq comint-process-echoes t))

(add-hook 'inf-ruby-mode-hook 'turn-off-comint-echo)
