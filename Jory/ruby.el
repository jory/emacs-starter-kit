;; Ruby

(add-to-list 'auto-mode-alist '("\\.html\\.erb$" . eruby-nxhtml-mumamo))

(defun turn-off-comint-echo ()
  (setq comint-process-echoes t))

(add-hook 'inf-ruby-mode-hook 'turn-off-comint-echo)
