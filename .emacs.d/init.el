;;; init.el --- Initialization file for Emacs
;;; Code:

;;; Commentary:
;;

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
(setq use-package-always-ensure t)

;; Store all backups and autosave file in /tmp
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)

;; turn off ui elements
(menu-bar-mode -1)
(if (display-graphic-p)
  (progn
    (tool-bar-mode 0)
    (scroll-bar-mode 0)))

;; line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; less starting noise
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; set default ident size to 2
(setq standard-indent 2)

;; spaces > tabs
(setq-default indent-tabs-mode nil)

;; highlight matching parens faster pls
(setq show-paren-delay 0)
(show-paren-mode 1)

;; evil mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode))

(use-package evil-indent-textobject
  :ensure t)

(evil-leader/set-leader ",")

;; helm
(use-package helm
  :ensure t
  :config
  (evil-leader/set-key
    "," 'helm-projectile-find-file)
  (helm-mode t))

(use-package projectile
  :ensure projectile
  :config
  (setq projectile-indexing-method 'alien))
(use-package helm-projectile
  :ensure t)
(use-package helm-ag
  :ensure t)

;; neotree
(use-package neotree
  :ensure t
  :config
  (evil-leader/set-key
    "n"  'neotree-toggle)

  (setq projectile-switch-project-action 'neotree-projectile-action)
  (add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
              (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
              (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
              (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
              (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
              (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

              (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
              (define-key evil-normal-state-local-map (kbd "i") 'neotree-enter-horizontal-split)

              (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))

;; autocomplete
(use-package company
  :ensure t
  :config
  (global-company-mode t))

(setq company-tooltip-align-annotations t)

(with-eval-after-load 'evil
  (with-eval-after-load 'company
    (define-key evil-insert-state-map (kbd "C-n") nil)
    (define-key evil-insert-state-map (kbd "C-p") nil)
    (evil-define-key nil company-active-map (kbd "C-n") #'company-select-next)
    (evil-define-key nil company-active-map (kbd "C-p") #'company-select-previous)))

;; languages

;; typescript
(use-package typescript-mode
  :ensure t
  :config
    (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode)))

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
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode)))

(use-package add-node-modules-path
  :ensure t)

(use-package prettier-js
  :ensure t)

(eval-after-load 'web-mode
  '(progn
     (add-hook 'web-mode-hook #'add-node-modules-path)
     (add-hook 'web-mode-hook #'prettier-js-mode)
     (add-hook 'web-mode-hook #'setup-tide-mode)))

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

;; editorconfig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package flycheck
  :ensure t
  :init
  (setq flycheck-indication-mode nil)
  (setq flycheck-display-errors-delay nil)
  (setq flycheck-idle-change-delay 1)
  (global-flycheck-mode))

(with-eval-after-load 'flycheck
    (flycheck-add-mode 'tsx-tide 'typescript-mode))

;; make escape quit most things
(defun minibuffer-keyboard-quit ()
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(editorconfig tide prettier-js add-node-modules-path web-mode company neotree helm-ag helm-projectile projectile helm evil-indent-textobject evil-leader evil-collection evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
