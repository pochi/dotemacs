;;; init-cpp.el --- Initialize C++ mode    -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)
(require-package 'flycheck)
(require-package 'rtags)
(require-package 'cmake-ide)

(require 'electric)
(require 'eldoc)
(require 'flycheck)
(require 'company-clang)
(require 'rtags)
(require 'flycheck-rtags)
(require 'cmake-ide)

(add-hook 'c++-mode-common-hook (lambda ()
                                  (flycheck-select-checker 'rtags)
                                  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
                                  (setq-local flycheck-check-syntax-automatically nil)))

;(setq rtags-autostart-diagnostics t)
;(rtags-diagnostics)
;(setq rtags-completions-enabled t)
;(push 'company-rtags company-backends)
(rtags-enable-standard-keybindings)

(cmake-ide-setup)
(electric-pair-mode 1)

(setq c-default-style "k&r"
      c-basic-offset 4)

(setq-default indent-tabs-mode nil)

(provide 'init-cpp)
;;; init-cpp.el ends here
