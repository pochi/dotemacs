;;; init-clojure.el --- Initialize Clojure           -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;;

;;; Code:

(require 'init-elpa)
(require-package 'paredit)
(require-package 'clojure-mode)
(require-package 'clojure-mode-extra-font-locking)
(require-package 'cider)
(require-package 'clj-refactor)

(require 'paredit)
(require 'clojure-mode)
(require 'clojure-mode-extra-font-locking)
(require 'cider)
(require 'clj-refactor)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))))

(add-hook 'cider-mode-hook 'eldoc-mode)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-history-file (expand-file-name "cider-history" user-emacs-directory))
(setq cider-repl-wrap-history t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

(add-hook 'clojure-mode-hook
	  (lambda ()
	    (clj-refactor-mode 1)
	    (yas-minor-mode 1)
	    (cljr-add-keybindings-with-prefix "C-c C-m")))

(provide 'init-clojure)
;;; init-clojure.el ends here
