;; Declare repositories
(setq package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "http://marmalade-repo.org/packages/")
    ("melpa" . "http://melpa.org/packages/")))

;; Package facility
(require 'package)
(package-initialize)

;;;; uncomment when init startup
;; (package-refresh-contents)

(setq packages
  '(evil
    dracula-theme
    evil-magit
    projectile
    terraform-mode
    helm
    helm-projectile
    undo-tree
    yaml-mode
    clojure-mode
    jinja2-mode
    neotree
    auto-complete
    doom
    evil-mu4e
    direx
    json-mode))

(dolist (pkg packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; themes
(load-theme 'dracula t)

;; hide toolbar, menu and scroll
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; turn off GNU Emacs tutorial buffer on startup
(setq inhibit-startup-screen t)

(require 'evil)
  (evil-mode 1)
(require 'package)
  (terraform-mode)
(require 'helm)
(setq-default helm-M-x-fuzzy-match t)
(require 'projectile)
(projectile-mode +1)
(require 'helm-projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(require 'evil-magit)
(require 'undo-tree)
(global-undo-tree-mode)

(require 'package)
(ac-config-default)
(global-auto-complete-mode t)

(setq backup-directory-alist `(("." . "~/.emacs/tmp")))
(setq auto-save-file-name-transforms `((".*" ,"~/emacs_tmp" t)))

;;neotree
(require 'neotree)
  ;; neotree evil mode
  (add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
      (define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)
      (define-key evil-normal-state-local-map (kbd "p") 'neotree-previous-line)
      (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
      (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))
      (global-set-key [f8] 'neotree-toggle)

;;  yaml mode
 (add-hook 'yaml-mode-hook
   (lambda ()
     (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; icons

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dracula-theme yaml-mode terraform-mode neotree json-mode jinja2-mode helm-projectile evil-magit clojure-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
