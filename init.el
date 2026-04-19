;;; init.el  --- Modern Emacs Configuration for Terminal Use
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;; Terminal-first Emacs configuration (2024-2026)
;; Optimized for Python, JavaScript/TypeScript, Terraform development
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; ===== Performance optimization (startup) =====

;; Reduce garbage collection during startup
(setq gc-cons-threshold (* 50 1000 1000))

;; Restore after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 2 1000 1000))))

;; ===== Package initialization =====

;; Package.el must come before configurations
(package-initialize)

;; Load path configuration
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; ===== Core modules =====

(require 'init-elpa)           ; Package management (use-package)
(require 'init-exec-path)      ; Environment PATH setup
(require 'init-ui)             ; Terminal-first UI (modus-themes)
(require 'init-clipboard)      ; Clipboard integration (C-c/C-v/C-x)
(require 'init-navigation)     ; Projectile, window navigation
(require 'init-vertico)        ; Modern completion (Vertico/Consult)
(require 'init-company-mode)   ; Completion framework
(require 'init-customconfig)   ; Custom configurations
(require 'init-customkeybind)  ; Custom keybindings

;; ===== LSP and language support =====

(require 'init-eglot)          ; Unified LSP (built-in eglot)
(require 'init-python)         ; Python + pyright LSP
(require 'init-web-mode)       ; JavaScript/TypeScript + LSP
(require 'init-terraform)      ; Terraform + terraform-ls
(require 'init-treesit)        ; Tree-sitter (Emacs 29+)

;; ===== Additional modes =====

(require 'init-asciidoc)       ; Asciidoc support
(require 'init-markdown)       ; Markdown support
(require 'init-org)            ; Org-mode setup
(require 'init-magit)          ; Git integration

;; ===== Helpful tools =====

(require 'init-helpful)        ; Better help + avy + deadgrep

;; ===== Deprecated modules (stubbed out) =====

;; These are no longer actively used but kept for reference:
;; (require 'init-scala)       ; DEPRECATED: ensime is dead, use metals if needed
;; (require 'init-elpy)        ; DEPRECATED: replaced by eglot
;; (require 'init-helm)        ; REMOVED: replaced by Vertico/Consult

;; ===== Custom settings (managed by Emacs) =====

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
