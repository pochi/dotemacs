;;; init-ui.el --- Terminal-first UI configuration   -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Oleksandr Manenko

;;; Commentary:
;; Modern terminal-first UI with modus-themes (built-in Emacs 29+)

;;; Code:

(require 'init-elpa)

;; ===== Theme Configuration =====

;; Use modus-themes (built-in, terminal-optimized)
(use-package modus-themes
  :ensure nil  ; Built-in package
  :init
  ;; Theme customization
  (setq modus-themes-bold-constructs t
        modus-themes-italic-constructs t
        modus-themes-mixed-fonts t
        modus-themes-subtle-line-numbers t
        modus-themes-org-blocks 'gray-background
        modus-themes-headings '((t . (rainbow))))

  ;; Load theme (modus-vivendi = dark, modus-operandi = light)
  (load-theme 'modus-vivendi t)

  :config
  ;; Optional: toggle themes with F5
  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))

;; ===== GUI-specific settings (only in graphical mode) =====

(when (display-graphic-p)
  ;; Font configuration (only for GUI Emacs)
  (set-face-attribute 'default nil
                      :family "Ricty"
                      :height 160))

;; ===== Terminal-specific enhancements =====

;; Mouse support in terminal
(unless (display-graphic-p)
  (xterm-mouse-mode 1)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

;; ===== UI cleanup (works in both GUI and terminal) =====

;; Disable visual clutter
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

;; Line spacing (improves readability)
(setq-default line-spacing 0.2)

;; Show line numbers in programming modes
(use-package display-line-numbers
  :ensure nil  ; Built-in
  :hook (prog-mode . display-line-numbers-mode)
  :config
  (setq display-line-numbers-type 'relative))

;; Visual line mode for text editing
(add-hook 'text-mode-hook #'visual-line-mode)

;; Highlight current line
(use-package hl-line
  :ensure nil  ; Built-in
  :hook (prog-mode . hl-line-mode))

;; Show matching parentheses
(use-package paren
  :ensure nil  ; Built-in
  :init (show-paren-mode 1)
  :config
  (setq show-paren-delay 0
        show-paren-style 'mixed))

;; Rainbow delimiters for better readability
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-ui)
;;; init-ui.el ends here
