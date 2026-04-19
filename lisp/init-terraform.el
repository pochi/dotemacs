;;; init-terraform.el --- Terraform support with LSP  -*- lexical-binding: t; -*-

;;; Commentary:
;; Terraform development with eglot + terraform-ls

;;; Code:

(require 'init-elpa)

;; ===== terraform-mode =====

(use-package terraform-mode
  :ensure t
  :mode "\\.tf\\'"
  :config
  (setq terraform-indent-level 2))

;; ===== company-terraform: Completion backend =====

(use-package company-terraform
  :ensure t
  :after (company terraform-mode)
  :config
  (company-terraform-init))

;; ===== terraform format on save =====

(add-hook 'terraform-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'terraform-format-buffer nil t)))

(provide 'init-terraform)
;;; init-terraform.el ends here
