(require 'bitlbee)

(load "~/.emacs.d/.erc-auth")

(setq erc-autojoin-channels-alist '((".*freenode.net" "#emacs"))
      erc-hide-list '("JOIN" "PART" "QUIT")
      erc-input-line-position -1
      erc-modules '(autojoin button completion fill irccontrols
                             list match menu move-to-prompt netsplit
                             networks noncommands readonly ring
                             scrolltobottom track)
      erc-nick "jory"
      erc-pals '("aprile" "jsiracusa")
      erc-track-exclude '("&bitlbee")
      erc-track-exclude-server-buffer t
      erc-track-switch-direction 'importance
      erc-user-full-name "Jory Graham")

(defun bitlbee-identify ()
  "If we're on the bitlbee server, send the identify command to the 
 &bitlbee channel."
  (when (and (string= "localhost" erc-session-server)
             (string= "&bitlbee" (buffer-name)))
    (erc-message "PRIVMSG" (format "%s identify %s" 
                                   (erc-default-target) 
                                   bitlbee-password))))

(add-hook 'erc-join-hook 'bitlbee-identify)

;; (global-set-key "\C-cef" (lambda () (interactive)
;;                            (erc :server "irc.freenode.net" :port 6667
;;                                 :nick "jory" :password freenode-password)))

(global-set-key (kbd "\C-c t") (lambda () (interactive)
                                 (bitlbee-start)
                                 (erc :server "localhost" :port 6667
                                      :nick "jory")))
