(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode 1))

;; Custom keybindings
;; Note: C-h is remapped from help to delete-backward-char
;; Use F1 or M-x for help instead
(global-set-key (kbd "DEL") 'delete-backward-char)
(global-set-key "\C-u" 'undo)

(with-eval-after-load 'undo-tree
  (defalias 'redo 'undo-tree-redo)
  (global-set-key "\C-o" 'redo))

(provide 'init-customkeybind)

