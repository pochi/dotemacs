;;; init-company-mode.el --- Modern completion      -*- lexical-binding: t; -*-

;;; Commentary:
;; Company-mode with eglot integration

;;; Code:

(require 'init-elpa)

;; ===== Company: Completion framework =====

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection)
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous))
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1
        company-tooltip-align-annotations t
        company-tooltip-limit 10
        company-show-numbers t
        company-require-match nil
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil))

;; ===== Company-capf: Integration with eglot =====
;; eglot uses completion-at-point-functions (capf), which company-capf bridges

(use-package company-capf
  :ensure nil  ; Part of company
  :after company
  :config
  ;; Ensure company-capf is prioritized for LSP
  (setq company-backends
        '((company-capf :with company-yasnippet)
          (company-dabbrev-code company-keywords)
          company-files
          company-dabbrev)))

(provide 'init-company-mode)
;;; init-company-mode.el ends here
