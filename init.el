;;; Mi configuración básica del dios emacs

;; Mostrar espacios en blanco después de linea
;; (setq-default show-trailing-whitespace t)
;; Mostrar número de línea
(global-display-line-numbers-mode)
;; Eliminar botones de edición
(tool-bar-mode 0)
;; Auto fill mode (M-q automático)
;; Configurar margen: C-x f
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; BYE BYE Welcome
(setq inhibit-startup-screen t)
;; If org-mode doesnt show italics correctly
(set-face-attribute 'italic nil :family "Hack" :slant 'italic
:underline nil)



;; Eliminar autoguardados fuera de la carpeta actual
;; Write backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(deeper-blue))
 '(package-selected-packages
   '(org htmlize treemacs-projectile projectile company helm-lsp lsp-ui lsp-mode helm yasnippet-snippets yasnippet flycheck which-key use-package))
 '(tool-bar-mode nil))


;; MELPA = más paquetes
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; Instalar M-x install-package RET use-package
(require 'use-package)
;; Mostrar opciones a mitad de comando
(use-package which-key :config (which-key-mode))
;; Mostrar errores de sintaxis, semántica en varios lenguajes
(use-package flycheck)
;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; Autocompletar código.
(use-package yasnippet :config (yas-global-mode))
;; Mostrar lista de completaciones
(use-package company)
;; (add-hook 'after-init-hook 'global-company-mode)
;; Autocompletar buffers filtrando resultados
(use-package helm :config (helm-mode) (global-set-key (kbd "C-x C-f") 'helm-find-files))
;; WTF
(use-package helm-lsp)
;; IDE mode
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration)))
;; textito bonito para emacs
(use-package lsp-ui)

