;;; init-vertico.el --- Modern completion with Vertico stack  -*- lexical-binding: t; -*-

;;; Commentary:
;; Lightweight completion/search using Vertico, Consult, Marginalia, Orderless

;;; Code:

(require 'init-elpa)

;; ===== Vertico: Vertical completion UI =====

(use-package vertico
  :ensure t
  :init
  (vertico-mode 1)
  :config
  (setq vertico-count 15
        vertico-cycle t))

;; ===== Marginalia: Rich annotations in minibuffer =====

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1)
  :config
  (setq marginalia-align 'right))

;; ===== Orderless: Flexible matching =====

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; ===== Consult: Enhanced search and navigation =====

(use-package consult
  :ensure t
  :bind (;; Buffer switching
         ("C-x b"   . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("C-x p b" . consult-project-buffer)

         ;; Navigation
         ("M-g g"   . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g i"   . consult-imenu)
         ("M-g I"   . consult-imenu-multi)

         ;; Search
         ("M-s r"   . consult-ripgrep)
         ("M-s g"   . consult-grep)
         ("M-s f"   . consult-find)
         ("M-s l"   . consult-line)
         ("M-s L"   . consult-line-multi)

         ;; Other
         ("M-y"     . consult-yank-pop)
         ("C-c h"   . consult-history))

  :config
  ;; Project integration
  (setq consult-project-function #'projectile-project-root)

  ;; Preview configuration
  (setq consult-preview-key 'any))

;; ===== Embark: Contextual actions =====

(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)
         ("C-h B" . embark-bindings))
  :config
  (setq embark-indicators
        '(embark-minimal-indicator
          embark-highlight-indicator
          embark-isearch-highlight-indicator)))

;; Embark + Consult integration
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

;; ===== which-key: Show keybinding hints =====

(use-package which-key
  :ensure t
  :init (which-key-mode 1)
  :config
  (setq which-key-idle-delay 0.5
        which-key-sort-order 'which-key-key-order-alpha))

(provide 'init-vertico)
;;; init-vertico.el ends here
