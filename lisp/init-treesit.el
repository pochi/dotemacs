;;; init-treesit.el --- Tree-sitter configuration   -*- lexical-binding: t; -*-

;;; Commentary:
;; Tree-sitter support for enhanced syntax highlighting (Emacs 29+)

;;; Code:

(require 'init-elpa)

;; ===== Tree-sitter configuration =====

(use-package treesit
  :ensure nil  ; Built-in Emacs 29+
  :when (treesit-available-p)
  :config
  ;; Automatically remap major modes to tree-sitter versions
  (setq major-mode-remap-alist
        '((python-mode . python-ts-mode)
          (js-mode . js-ts-mode)
          (typescript-mode . typescript-ts-mode)
          (json-mode . json-ts-mode)
          (css-mode . css-ts-mode)))

  ;; Language grammar sources (auto-install)
  (setq treesit-language-source-alist
        '((python "https://github.com/tree-sitter/tree-sitter-python")
          (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
          (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
          (json "https://github.com/tree-sitter/tree-sitter-json")
          (css "https://github.com/tree-sitter/tree-sitter-css")))

  ;; Install missing grammars automatically
  (dolist (lang '(python javascript typescript tsx json css))
    (unless (treesit-language-available-p lang)
      (message "Installing tree-sitter grammar for %s..." lang)
      (treesit-install-language-grammar lang))))

(provide 'init-treesit)
;;; init-treesit.el ends here
