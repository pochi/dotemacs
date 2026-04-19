;;; init-python.el --- Modern Python with LSP       -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Oleksandr Manenko

;;; Commentary:
;; Python development with eglot + pyright LSP

;;; Code:

(require 'init-elpa)

;; ===== Python mode =====

(use-package python
  :ensure nil  ; Built-in
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (setq python-indent-offset 4
        python-shell-interpreter "python3"))

;; ===== pyenv-mode: Python environment switching =====

(use-package pyenv-mode
  :ensure t
  :hook (python-mode . pyenv-mode)
  :config
  ;; Auto-switch pyenv version based on project name
  (defun projectile-pyenv-mode-set ()
    "Set pyenv version matching project name."
    (let ((project (projectile-project-name)))
      (if (member project (pyenv-mode-versions))
          (pyenv-mode-set project)
        (pyenv-mode-unset))))

  (add-hook 'projectile-switch-project-hook #'projectile-pyenv-mode-set))

;; ===== pyvenv: Virtual environment support =====

(use-package pyvenv
  :ensure t
  :hook (python-mode . pyvenv-mode)
  :config
  (setq pyvenv-mode-line-indicator '(pyvenv-virtual-env-name ("[venv:" pyvenv-virtual-env-name "] "))))

;; ===== Python-specific keybindings =====

(use-package python
  :ensure nil
  :bind (:map python-mode-map
              ("C-c C-c" . python-shell-send-buffer)
              ("C-c C-r" . python-shell-send-region)))

(provide 'init-python)
;;; init-python.el ends here
