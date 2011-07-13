;; Coffeescript
(require 'coffee-mode)

(defun coffee-outline-level () 
  (let (buffer-invisibility-spec) 
    (save-excursion 
      (skip-chars-forward "\t ") 
      (current-column))))

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
                 (coffee-compile-file))))
  (setq outline-regexp "[ \t]*\\(class\\|.*\\(-\\|=\\)>$\\)")
  (setq outline-level 'coffee-outline-level)
  (outline-minor-mode t))

(add-hook 'coffee-mode-hook 'coffee-custom)
