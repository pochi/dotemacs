;;; init-ui.el --- Init Emacs UI                     -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t
      doom-font (font-spec :family "Fira Mono" :size 14)) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.

;;(doom-themes-enable-italic t)
;;(doom-themes-enable-bold t)
;;(doom-modeline-bar ((t (:background "#6272a4"))))
(load-theme 'doom-dracula t)
;;(doom-themes-neotree-config)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; フォントサイズを指定
(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 160)

;; 行間を指定
(setq-default line-spacing 0.2)
;; ツールバーを削除
(tool-bar-mode -1)
(provide 'init-ui)
