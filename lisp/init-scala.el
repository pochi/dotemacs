;;; init-cpp.el --- Initialize Scala mode    -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)
(require-package 'scala-mode)
(require-package 'ensime)
(require-package 'sbt-mode)

(require 'ensime)
(require 'scala-mode)
(require 'sbt-mode)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'init-scala)
;;; init-scala.el ends here
