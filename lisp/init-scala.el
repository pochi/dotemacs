;;; init-scala.el --- Scala support (DEPRECATED)    -*- lexical-binding: t; -*-

;;; Commentary:
;; Scala support is disabled. ensime is deprecated.
;; If you need Scala, use metals LSP with eglot.

;;; Code:

;; Stub: Scala support is disabled in this configuration.
;; To re-enable:
;; 1. Install metals: coursier bootstrap org.scalameta:metals_2.13:latest -o metals
;; 2. Configure eglot: (add-to-list 'eglot-server-programs '(scala-mode . ("metals")))
;; 3. Install scala-mode: (use-package scala-mode :ensure t)

(provide 'init-scala)
;;; init-scala.el ends here
