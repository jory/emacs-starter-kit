(defun blacklist-all ()
  (interactive)
  (shell-command "python /Users/Jory/src/utilities/blacklist.py --all"))

(global-set-key (kbd "C-c b a") 'blacklist-all)

(provide 'blacklist)
