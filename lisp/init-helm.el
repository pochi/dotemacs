(require 'helm-config)
(helm-mode 1)

(define-key global-map (kbd "C-;") 'helm-mini)
(custom-set-variables
 '(helm-mini-default-sources '(helm-source-buffers-list
                               helm-source-recentf
                               helm-source-files-in-current-dir
                               )))

(provide 'init-helm)
