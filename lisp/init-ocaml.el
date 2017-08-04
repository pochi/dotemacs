;;; init-ocaml.el --- Initialize Ocaml editing        -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)
(require-package 'tuareg)
(require-package 'merlin)

(require 'tuareg)
(require 'merlin)

(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)

(provide 'init-ocaml)
;;; init-ocaml.el ends here
