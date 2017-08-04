;;; init-web-mode.el --- Initialize web-mode         -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)
(require-package 'web-mode)
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-tag-auto-close-style 2)

(provide 'init-web-mode)
;;; init-web-mode.el ends here
