;;; init-cmake.el --- Initialize cmake mode    -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)
(require-package 'cmake-mode)
(require-package 'cmake-font-lock)

(require 'cmake-mode)
(require 'cmake-font-lock)

(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

(provide 'init-cmake)
;;; init-cmake.el ends here
