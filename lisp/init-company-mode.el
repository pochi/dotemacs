;;; init-company-mode.el --- Initialize company-mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)
(require-package 'company)
(require 'company)

(setq company-tooltip-align-annotations t)
(add-hook 'prog-mode-hook 'company-mode)

(provide 'init-company-mode)
;;; init-company-mode.el ends here
