;;; General tunings 
(set-default 'tab-width 4)
(setq dired-isearch-filenames t)

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
(color-theme-zenburn)

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
(defalias 'dark 'color-theme-solarized-dark)
(defalias 'light 'color-theme-solarized-light)

(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)

;; Org Mode
(org-remember-insinuate)
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-log-done 'time)
(define-key global-map "\C-cr" 'org-remember)
(define-key global-map "\C-cl" 'org-store-link)

(setq org-remember-templates
      `(("Todo" ?t "* TODO %?\n %i\n %a" ,(concat org-directory "/todo.org") "Tasks")
        ("Idea" ?i "* %^{Title}\n %i\n %a" ,(concat org-directory "/ideas.org") "Ideas")
        ("Note" ?n "* %?\n %i\n %a" ,org-default-notes-file "Notes")))

;; Coffeescript
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2)
  (setq coffee-args-compile '("-c"))
  (setq coffee-debug-mode t)
  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
  (define-key coffee-mode-map [(meta R)] 'coffee-compile-file)
  (setq coffee-command "coffee.bat")
  (add-hook 'after-save-hook
            '(lambda ()
               (when (string-match "\.coffee$" (buffer-name))
                 (coffee-compile-file)))))
;; TODO: Fix this save hook / the coffee-compile-file command.

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'bitlbee)

(load "~/.emacs.d/.erc-auth")

(add-hook 'erc-join-hook 'bitlbee-identify)
(defun bitlbee-identify ()
  "If we're on the bitlbee server, send the identify command to the 
 &bitlbee channel."
  (when (and (string= "localhost" erc-session-server)
             (string= "&bitlbee" (buffer-name)))
    (erc-message "PRIVMSG" (format "%s identify %s" 
                                   (erc-default-target) 
                                   bitlbee-password))))

(global-unset-key "\C-ce")

(global-set-key "\C-cef" (lambda () (interactive)
                           (erc :server "irc.freenode.net" :port 6667
                                :nick "jory" :password freenode-password)))

(global-set-key "\C-ceb" (lambda () (interactive)
                           (bitlbee-start)
                           (erc :server "localhost" :port 6667
                                :nick "jory")))

(setq explicit-shell-file-name "zsh.exe")
