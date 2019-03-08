(require 'package)
(defun exec-path-from-shell--shell ()
  "Return the shell to use.
See documentation for `exec-path-from-shell-shell-name'."
  (or
   exec-path-from-shell-shell-name
   shell-file-name
   (getenv "SHELL")
   (error "SHELL environment variable is unset")))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(provide 'init-elpy)
