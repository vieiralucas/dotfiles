
(setq user-full-name "Lucas Vieira")
(setq user-mail-address "vieiralucas4@gmail.com")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; turn off menu-bar
(menu-bar-mode -1)

;; who needs a map?
(setq inhibit-startup-message t)

;; disable auto-save
(setq auto-save-default nil)

;; disable file backups
(setq make-backup-files nil)

;; line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; improve default indentation settings
(setq standard-indent 2)
(setq-default indent-tabs-mode nil)

;; scroll rules
(setq scroll-step 1)
(setq scroll-margin 0)

;; matching paren
(setq show-paren-delay 0)
(show-paren-mode 1)

(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package fzf
  :ensure t)

(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "f" 'format-all-buffer)
  (evil-leader/set-key
    "," 'fzf)
  (global-evil-leader-mode))

(use-package evil
  :ensure t
  :after (evil-leader undo-tree)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-tree))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; autocomplete
(use-package company
  :ensure t
  :after (evil)
  :config
  (global-company-mode t)
  (define-key evil-insert-state-map (kbd "C-n") nil)
  (define-key evil-insert-state-map (kbd "C-p") nil)
  (evil-define-key nil company-active-map (kbd "C-n") #'company-select-next)
  (evil-define-key nil company-active-map (kbd "C-p") #'company-select-previous))

;; autoformat
(use-package format-all
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'format-all-mode))

;; typescript
(use-package typescript-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode)))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-idle-change-delay 1)
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :config
  (company-mode +1)
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
  (setq tide-tsserver-executable "node_modules/.bin/tsserver")
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

;; web
(use-package web-mode
  :ensure t
  :init
  (setq web-mode-content-types-alist '(("jsx" . "\\.tsx\\'")))
  (setq web-mode-content-types-alist '(("jsx" . "\\.js\\'")))
  :config
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-hook 'web-mode-hook #'setup-tide-mode))

;; purescript
(use-package psc-ide
  :ensure t
  :config
  (setq psc-ide-use-npm-bin t))

(use-package purescript-mode
  :ensure t
  :after (psc-ide)
  :config
  (add-hook 'purescript-mode-hook
            (lambda ()
              (psc-ide-mode)
              (company-mode)
              (flycheck-mode)
              (turn-on-purescript-indentation))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(tide company typescript-mode evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
