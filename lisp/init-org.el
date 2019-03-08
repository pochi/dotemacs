(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files '("/opt/repos/todo/todo.org"))
(setq org-directory '("/opt/repos/todo"))
(setq org-default-notes-file "/opt/repos/todo/notes.org")

(setq org-capture-templates
    '(("t" "Todo" entry (file+headline "/opt/repos/todo/tasks.org" "Tasks")
       "* TODO %?\n%U" :empty-lines 1)
      ("n" "Note" entry (file+headline "/opt/repos/todo/notes.org" "Notes")
       "* NOTE %?\n%U" :empty-lines 1)
      )
)

(provide 'init-org)
