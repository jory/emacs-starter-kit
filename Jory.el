;;; General tunings 
(setq tab-width 4
      dired-isearch-filenames t)

;;; Javascript
(remove-hook 'espresso-mode-hook 'esk-paredit-nonlisp)

(setq espresso-indent-level 4)
(setq espresso-auto-indent-flag nil)

;;; Auto-complete mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "ac-dict"))
(ac-config-default)

;;; Windows specific tunings
(if (eq system-type 'windows-nt)
    (progn
      (setq magit-git-executable "C:/Program Files (x86)/Git/bin/git.exe")
      (require 'pyTunes)
      (require 'blacklist)))

(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-solarized-dark)

;;; ERC
(setq erc-hide-list (quote ("JOIN" "PART" "QUIT"))
      erc-modules (quote (autojoin button completion fill irccontrols
                                   list match menu move-to-prompt netsplit
                                   networks noncommands readonly ring
                                   scrolltobottom stamp track))
      erc-nick "jory"
      erc-user-full-name "Jory Graham"
      erc-input-line-position -1
      erc-autojoin-channels-alist '((".*freenode.net" "#emacs")))


;;; Useful minor modes
(winner-mode)
(put 'narrow-to-region 'disabled nil)

;;; Some defuns
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

;;; Keys
(global-set-key "\C-c=" 'count-words-region)
(global-set-key "\C-co" 'occur)

;;; Aliases
(defalias 'ia 'info-apropos)

(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)

;; Org Mode
(org-remember-insinuate)
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-log-done 'time)
(define-key global-map "\C-cr" 'org-remember)
