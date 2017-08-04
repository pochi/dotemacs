;;; init-asciidoc.el --- Initialize asciidoc mode    -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)
(require-package 'adoc-mode)

(add-to-list 'auto-mode-alist (cons "\\.asciidoc\\'" 'adoc-mode))
(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))

(provide 'init-asciidoc)
;;; init-asciidoc.el ends here
