;;; init-helpful.el --- Better help buffers         -*- lexical-binding: t; -*-

;;; Commentary:
;; Enhanced help with helpful package

;;; Code:

(require 'init-elpa)

;; ===== helpful: Better help buffers =====

(use-package helpful
  :ensure t
  :bind (("<f1> f" . helpful-callable)
         ("<f1> v" . helpful-variable)
         ("<f1> k" . helpful-key)
         ("<f1> x" . helpful-command)
         ("C-c C-d" . helpful-at-point)))

;; ===== avy: Jump to visible text =====

(use-package avy
  :ensure t
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)))

;; ===== deadgrep: Better ripgrep interface =====

(use-package deadgrep
  :ensure t
  :bind ("C-c s" . deadgrep))

(provide 'init-helpful)
;;; init-helpful.el ends here
