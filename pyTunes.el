(defun pyTunes-play-pause ()
  (interactive)
  (shell-command "python /Users/Jory/src/pyTunes/pyTunes.py -p"))

(defun pyTunes-next ()
  (interactive)
  (shell-command "python /Users/Jory/src/pyTunes/pyTunes.py -n"))

(defun pyTunes-rating (rating)
  (interactive "NRating: ")
  (shell-command (concat "python /Users/Jory/src/pyTunes/pyTunes.py -r" (number-to-string rating))))

(defun pyTunes-list ()
  (interactive)
  (shell-command "python /Users/Jory/src/pyTunes/pyTunes.py -l"))

(global-set-key (kbd "C-c i p") 'pyTunes-play-pause)
(global-set-key (kbd "C-c i n") 'pyTunes-next)
(global-set-key (kbd "C-c i r") 'pyTunes-rating)
(global-set-key (kbd "C-c i l") 'pyTunes-list)

(provide 'pyTunes)
