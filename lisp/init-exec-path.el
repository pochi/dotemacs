;;; init-exec-path.el --- Ensure environment variables inside Emacs look the same as in the user's shell.  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)

(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
;;; init-exec-path.el ends here
