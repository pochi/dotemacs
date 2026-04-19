;;; init-web-mode.el --- Web development with LSP   -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Oleksandr Manenko

;;; Commentary:
;; JavaScript, TypeScript, and web development with eglot LSP

;;; Code:

(require 'init-elpa)

;; ===== web-mode: HTML/CSS/JS templates =====

(use-package web-mode
  :ensure t
  :mode ("\\.html?\\'"
         "\\.jsx?\\'"
         "\\.tsx?\\'"
         "\\.vue\\'")
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-pairing t
        web-mode-enable-css-colorization t
        web-mode-enable-current-element-highlight t
        web-mode-tag-auto-close-style 2))

;; ===== js-mode / js-ts-mode: JavaScript =====

(use-package js
  :ensure nil  ; Built-in
  :mode ("\\.js\\'" . js-mode)
  :config
  (setq js-indent-level 2))

;; ===== TypeScript mode =====

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :config
  (setq typescript-indent-level 2))

;; ===== JSON mode =====

(use-package json-mode
  :ensure t
  :mode "\\.json\\'")

;; ===== CSS mode =====

(use-package css-mode
  :ensure nil  ; Built-in
  :mode "\\.css\\'"
  :config
  (setq css-indent-offset 2))

(provide 'init-web-mode)
;;; init-web-mode.el ends here
