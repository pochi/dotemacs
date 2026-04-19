;;; init-elpa.el --- Package management              -*- lexical-binding: t; -*-

;; Author: Oleksandr Manenko <oleksandr@manenko.com>

;;; Commentary:
;; Modern package management using use-package (built-in Emacs 29+)

;;; Code:

(require 'package)

;; Package archives
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)

;; use-package configuration (built-in Emacs 29+)
(require 'use-package)
(setq use-package-always-ensure t        ; Auto-install packages
      use-package-verbose t              ; Show loading messages
      use-package-compute-statistics t   ; Enable use-package-report
      use-package-minimum-reported-time 0.01) ; Report slow loads

;; Legacy compatibility: keep require-package for gradual migration
(defun require-package (package)
  "Install given PACKAGE if it was not installed before.
This function is kept for backward compatibility during migration."
  (if (package-installed-p package)
      t
    (progn
      (unless (assoc package package-archive-contents)
        (package-refresh-contents))
      (package-install package))))

(provide 'init-elpa)
;;; init-elpa.el ends here
