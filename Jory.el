(color-theme-zenburn)

(if (eq system-type 'windows-nt)
    (setq magit-git-executable "C:/Program Files (x86)/Git/bin/git.exe"))
(setq erc-hide-list (quote ("JOIN" "PART" "QUIT"))
      erc-modules (quote (autojoin button completion fill irccontrols
                                   list match menu move-to-prompt netsplit
                                   networks noncommands readonly ring
                                   scrolltobottom stamp track))
      erc-nick "jory"
      erc-user-full-name "Jory Graham"
      erc-input-line-position -1)
