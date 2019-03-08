(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files '("/opt/repos/todo/todo.org"))

(provide 'init-org)
