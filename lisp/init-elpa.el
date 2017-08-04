;;; init-elpa.el --- Package management              -*- lexical-binding: t; -*-

;; Author: Oleksandr Manenko <oleksandr@manenko.com>

;;; Commentary:

;; 

;;; Code:

(require 'package)

(defun require-package (package)
  "Install given PACKAGE if it was not installed before."
  (if (package-installed-p package)
      t
    (progn
      (unless (assoc package package-archive-contents)
	(package-refresh-contents))
      (package-install package))))

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(provide 'init-elpa)
;;; init-elpa.el ends here
