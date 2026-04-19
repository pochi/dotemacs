;;; init-miscellaneous.el --- Initialize miscellaneous things  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; No need for ~ files when editing
(setq create-lockfiles nil)

(provide 'init-miscellaneous)
;;; init-miscellaneous.el ends here
