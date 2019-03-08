;;; init.el  --- The Emacs Initialization File
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-exec-path)
(require 'init-ui)
;; (require 'init-editing)
(require 'init-navigation)
;; (require 'init-miscellaneous)
(require 'init-company-mode)
(require 'init-asciidoc)
(require 'init-web-mode)
;; (require 'init-rust)
;; (require 'init-clojure)
;; (require 'init-cmake)
(require 'init-scala)
(require 'init-python)
(require 'init-markdown)
(require 'init-helm)
(require 'init-customconfig)
(require 'init-customkeybind)
(require 'init-elpy)
;; (require 'init-jedi)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cmake-ide-rc-executable (substitute-in-file-name "$HOME/.cpp-dev/bin/rc"))
 '(cmake-ide-rdm-executable (substitute-in-file-name "$HOME/.cpp-dev/bin/rdm"))
 '(helm-mini-default-sources
   (quote
    (helm-source-buffers-list helm-source-recentf helm-source-files-in-current-dir)))
 '(package-selected-packages
   (quote
    (atom-dark-theme org-bullets doom-themes elpy protobuf-mode rjsx-mode react-snippets rust-mode go-mode undo-tree markdown-mode+ helm-ag ag helm merlin tuareg web-mode smex rtags rainbow-delimiters racer pyenv-mode projectile markdown-mode ido-ubiquitous haskell-mode golden-ratio glsl-mode flycheck-rust exec-path-from-shell ensime company-anaconda cmake-ide cmake-font-lock clojure-mode-extra-font-locking clj-refactor atom-one-dark-theme adoc-mode)))
 '(rtags-path (substitute-in-file-name "$HOME/.cpp-dev/bin")))


(provide 'init)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


