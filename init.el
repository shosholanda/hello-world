;; Mi configuración básica del dios emacs

;; Display spaces after lines
;; (setq-default show-trailing-whitespace t)
;; Display num-line
(global-display-line-numbers-mode)
;; Silly buttons off
(tool-bar-mode 0)
;; Auto fill mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; BYE BYE Welcome
(setq inhibit-startup-screen t)

;; Max
(setq frame-resize-pixelwise t)

(custom-set-variables
 ;; Tema oscuro por mi punto en el ojo
 '(custom-enabled-themes '(deeper-blue))
 ;; FUCK copilot a toda su reputa madre
 '(lsp-copilot-enabled nil)
 '(package-selected-packages
   '(org-journal htmlize org phps-mode php-mode python-mode treemacs-projectile which-key helm-lsp helm company yasnippet flycheck projectile lsp-ui lsp-java auctex))
 )

;; Eliminar autoguardados fuera de la carpeta actual
;; Write backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old

;; MELPA = más paquetes
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


;; Project management
(use-package projectile)
;; Real-time syntax checking
(use-package flycheck)
;; Snippets
(use-package yasnippet :config (yas-global-mode))
;; language server protocol support = más soporte de lenguajes
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration)))
;; Mostrar keybindings
(use-package hydra)
;; textito bonito para lisp
(use-package lsp-ui)
;; Posibles combinaciones
(use-package which-key :config (which-key-mode))
;; Soporte para java
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
;; Helm ??
(use-package helm-lsp)
;; completar comandos
(use-package helm
  :config (helm-mode))
;; Navegacion fácil
(use-package lsp-treemacs)



;; Soporte para python
(require 'lsp-python-ms)
(setq lsp-python-ms-auto-install-server t)
(add-hook 'python-mode-hook #'lsp) ; or lsp-deferred

(use-package lsp-python-ms
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp))))  ; or lsp-deferred


;; Journaling
(require 'org-journal)

;; Cerrar Diario al guardar

;; (defun org-journal-save-entry-and-exit()
;;   "Simple convenience function.
;;   Saves the buffer of the current day's entry and kills the window
;;   Similar to org-capture like behavior"
;;   (interactive)
;;   (save-buffer)
;;   (kill-buffer-and-window))
;; (define-key org-journal-mode-map (kbd "C-x C-s") 'org-journal-save-entry-and-exit)

;; Basic notes but instantly
(setq org-capture-templates
      '(("n" "Note Entry" entry (file+datetree "~/notes.org")
         "* %?\n%U"
         :empty-lines 1)))

;; Quick journal keybinding para notas
(global-set-key (kbd "C-c n") (lambda () (interactive) (org-capture nil "n")))
;; Quick keybind para journal
(global-set-key (kbd "C-c j") 'org-journal-new-entry)

