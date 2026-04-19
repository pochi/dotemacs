;;; init-glsl.el --- Initialize GLSL editing        -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)
(require-package 'glsl-mode)

(require 'glsl-mode)

;; .vert - a vertex shader
;; .tesc - a tessellation control shader
;; .tese - a tessellation evaluation shader
;; .geom - a geometry shader
;; .frag - a fragment shader
;; .comp - a compute shader
;; .glsl - any shader

(add-to-list 'auto-mode-alist (cons "\\.vert\\'" 'glsl-mode))
(add-to-list 'auto-mode-alist (cons "\\.tese\\'" 'glsl-mode))
(add-to-list 'auto-mode-alist (cons "\\.geom\\'" 'glsl-mode))
(add-to-list 'auto-mode-alist (cons "\\.frag\\'" 'glsl-mode))
(add-to-list 'auto-mode-alist (cons "\\.comp\\'" 'glsl-mode))
(add-to-list 'auto-mode-alist (cons "\\.glsl\\'" 'glsl-mode))

(provide 'init-glsl)
;;; init-glsl.el ends here
