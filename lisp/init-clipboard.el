;;; init-clipboard.el --- Clipboard integration with Cmd keys  -*- lexical-binding: t; -*-

;;; Commentary:
;; Cmd+c/v/x for clipboard operations (macOS)
;; Preserves traditional Emacs keybindings (C-c prefix, C-v page-down)
;; Fully integrated with system clipboard

;;; Code:

(require 'init-elpa)

;; ===== System Clipboard Integration =====

;; Use system clipboard for kill/yank operations
(setq select-enable-clipboard t
      select-enable-primary t
      save-interprogram-paste-before-kill t)

;; ===== Terminal Clipboard (OSC 52) =====

;; clipetty for terminal clipboard integration via OSC 52
(use-package clipetty
  :ensure t
  :hook (after-init . global-clipetty-mode)
  :config
  (setq clipetty-assume-nested-mux t))

;; ===== Mouse Selection to Clipboard =====

;; Copy mouse selection to clipboard automatically
(setq mouse-drag-copy-region t)

;; ===== Additional Clipboard Helpers =====

;; Simplify clipboard operations
(defun copy-to-clipboard ()
  "Copy region to system clipboard."
  (interactive)
  (when (use-region-p)
    (clipboard-kill-ring-save (region-beginning) (region-end))
    (message "Copied to clipboard")))

(defun cut-to-clipboard ()
  "Cut region to system clipboard."
  (interactive)
  (when (use-region-p)
    (clipboard-kill-region (region-beginning) (region-end))
    (message "Cut to clipboard")))

(defun paste-from-clipboard ()
  "Paste from system clipboard."
  (interactive)
  (clipboard-yank)
  (message "Pasted from clipboard"))

;; ===== Cmd key bindings for clipboard (macOS) =====

;; Cmd+c/v/x for copy/paste/cut (keeps C-c/C-v/C-x as normal Emacs keys)
(global-set-key (kbd "s-c") 'copy-to-clipboard)   ; Cmd-c: Copy
(global-set-key (kbd "s-v") 'paste-from-clipboard) ; Cmd-v: Paste
(global-set-key (kbd "s-x") 'cut-to-clipboard)    ; Cmd-x: Cut

;; Alternative: F8 for copy (for testing)
(global-set-key (kbd "<f8>") 'copy-to-clipboard)

;; Traditional Emacs keys remain unchanged:
;; C-c = prefix key for user commands
;; C-v = scroll-up-command (page down)
;; C-x = prefix key for file/buffer commands
;; M-w = copy (kill-ring-save)
;; C-y = paste (yank)

;; ===== Visual Feedback =====

;; Briefly highlight copied region
(use-package pulsar
  :ensure t
  :config
  (setq pulsar-pulse t
        pulsar-delay 0.055
        pulsar-iterations 10
        pulsar-face 'pulsar-magenta
        pulsar-highlight-face 'pulsar-yellow)

  ;; Pulse after copy
  (advice-add 'copy-to-clipboard :after
              (lambda (&rest _)
                (when (use-region-p)
                  (pulsar-pulse-region (region-beginning) (region-end))))))

(provide 'init-clipboard)
;;; init-clipboard.el ends here
