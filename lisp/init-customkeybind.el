(global-undo-tree-mode 1)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-u" 'undo)
(defalias 'redo 'undo-tree-redo)
(global-set-key "\C-o" 'redo)
(provide 'init-customkeybind)

