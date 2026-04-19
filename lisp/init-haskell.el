;;; init-haskell.el --- Initialize haskell mode    -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)
(require-package 'haskell-mode)


;; TODO: http://haskell.github.io/haskell-mode/manual/latest/Editing-Haskell-Code.html#Editing-Haskell-Code
;; TODO: (define-key haskell-mode-map (kbd "<f8>") 'haskell-navigate-imports)

(setq haskell-font-lock-symbols t)

(provide 'init-haskell)
;;; init-haskell.el ends here
