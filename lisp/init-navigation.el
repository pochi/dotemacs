;;; init-navigation.el --- Modern navigation setup  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Oleksandr Manenko

;;; Commentary:
;; Navigation with projectile. Completion handled by Vertico stack.

;;; Code:

(require 'init-elpa)

;; ===== Projectile: Project management =====

(use-package projectile
  :ensure t
  :demand t
  :config
  (projectile-mode 1)
  (setq projectile-completion-system 'default  ; Use Vertico
        projectile-switch-project-action #'projectile-dired
        projectile-enable-caching t)
  ;; Set global prefix key
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; ===== Window navigation =====

;; Move between windows with Shift + arrow keys
(windmove-default-keybindings)

;; ===== Recent files =====

(use-package recentf
  :ensure nil  ; Built-in
  :init
  (recentf-mode 1)
  :config
  (setq recentf-max-menu-items 100
        recentf-max-saved-items 200
        recentf-save-file (concat user-emacs-directory ".recentf")))

(provide 'init-navigation)
;;; init-navigation.el ends here
