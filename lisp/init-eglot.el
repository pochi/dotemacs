;;; init-eglot.el --- LSP with eglot (built-in)      -*- lexical-binding: t; -*-

;;; Commentary:
;; Unified Language Server Protocol support via eglot (Emacs 29+ built-in)

;;; Code:

(require 'init-elpa)

;; ===== Eglot: LSP client (built-in Emacs 29+) =====

(use-package eglot
  :ensure nil  ; Built-in
  :hook (((python-mode python-ts-mode) . eglot-ensure)
         ((js-mode js-ts-mode typescript-mode typescript-ts-mode) . eglot-ensure)
         (terraform-mode . eglot-ensure))

  :bind (:map eglot-mode-map
              ("C-c l r" . eglot-rename)
              ("C-c l a" . eglot-code-actions)
              ("C-c l f" . eglot-format)
              ("C-c l d" . eldoc-doc-buffer)
              ("C-c l o" . eglot-code-action-organize-imports))

  :config
  ;; Performance tuning
  (setq eglot-events-buffer-size 0  ; Disable event logging (performance)
        eglot-autoshutdown t        ; Shutdown server when no buffers
        eglot-sync-connect nil)     ; Async connection

  ;; Language server configurations
  (setq eglot-server-programs
        '(;; Python: pyright (Microsoft's Python LSP)
          ((python-mode python-ts-mode) . ("pyright-langserver" "--stdio"))

          ;; JavaScript/TypeScript
          ((js-mode js-ts-mode typescript-mode typescript-ts-mode)
           . ("typescript-language-server" "--stdio"))

          ;; Terraform
          (terraform-mode . ("terraform-ls" "serve")))))

;; ===== Eldoc: Inline documentation =====

(use-package eldoc
  :ensure nil  ; Built-in
  :config
  (setq eldoc-echo-area-use-multiline-p nil
        eldoc-idle-delay 0.2))

;; ===== Flymake: Syntax checking (works with eglot) =====

(use-package flymake
  :ensure nil  ; Built-in
  :hook (prog-mode . flymake-mode)
  :bind (:map flymake-mode-map
              ("C-c ! n" . flymake-goto-next-error)
              ("C-c ! p" . flymake-goto-prev-error)
              ("C-c ! l" . flymake-show-buffer-diagnostics)))

(provide 'init-eglot)
;;; init-eglot.el ends here
