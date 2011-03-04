(color-theme-zenburn)

(if (eq system-type 'windows-nt)
    (setq magit-git-executable "C:/Program Files (x86)/Git/bin/git.exe"))

(setq tab-width 4)

(setq erc-hide-list (quote ("JOIN" "PART" "QUIT"))
      erc-modules (quote (autojoin button completion fill irccontrols
                                   list match menu move-to-prompt netsplit
                                   networks noncommands readonly ring
                                   scrolltobottom stamp track))
      erc-nick "jory"
      erc-user-full-name "Jory Graham"
      erc-input-line-position -1)

(mouse-avoidance-mode)

(defun eshell/clear ()
  "Clears the shell buffer ala Unix's clear or DOS' cls"
  (interactive)
  ;; the shell prompts are read-only, so clear that for the duration
  (let ((inhibit-read-only t))
	;; simply delete the region
	(delete-region (point-min) (point-max))))

(defun count-words-region (beginning end)
  "Print number of words in the region."
  (interactive "r")
  (message "Counting words in region ... ")
  (save-excursion
    (let ((count 0))
      (goto-char beginning)
      (while (and (< (point) end)
                  (re-search-forward "\\w+\\W*" end t))
        (setq count (1+ count)))
      (cond ((zerop count)
             (message "The region does NOT have any words."))
            ((= 1 count)
             (message "The region has 1 word."))
            (t (message "The region has %d words." count))))))

(global-set-key "\C-c=" 'count-words-region)
(global-set-key "\C-co" 'occur)

(put 'narrow-to-region 'disabled nil)
