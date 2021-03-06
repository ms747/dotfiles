;;      _____                           _____              __ _       
;;     |  ___|                         /  __ \            / _(_)      
;;     | |__ _ __ ___   __ _  ___ ___  | /  \/ ___  _ __ | |_ _  __ _ 
;;     |  __| '_ ` _ \ / _` |/ __/ __| | |    / _ \| '_ \|  _| |/ _` |
;;     | |__| | | | | | (_| | (__\__ \ | \__/\ (_) | | | | | | | (_| |
;;     \____/_| |_| |_|\__,_|\___|___/  \____/\___/|_| |_|_| |_|\__, |
;;                                                               __/ |
;;                                                              |___/ 

(setq require-final-newline nil)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(set-face-attribute 'default nil :font "FuraCode Nerd Font Mono" :height 120)

(load-theme 'doom-palenight t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "M-TAB") 'completion-at-point)
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

(defun dw/org-mode-setup ()
  (org-indent-mode)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(use-package org
  :defer t
  :hook (org-mode . dw/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"))

(use-package org-superstar
  :hook (org-mode . org-superstar-mode)
    :custom
    (org-superstar-remove-leading-stars t)
    (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package command-log-mode)

(use-package swiper
  :ensure t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 5)))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package doom-themes)

(use-package drag-stuff
  :config
  (drag-stuff-global-mode 1))

(use-package evil-nerd-commenter)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-j") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-a") 'evil-insert-line)
  (define-key evil-insert-state-map (kbd "C-e") 'evil-append-line)
  (define-key evil-normal-state-map (kbd "C-w C-q") 'evil-quit)
  (define-key evil-normal-state-map (kbd "M-j") 'drag-stuff-down)
  (define-key evil-normal-state-map (kbd "M-k") 'drag-stuff-up)
  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(electric-pair-mode 1)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-leader
  :config
  (evil-leader/set-key
    "c" 'evilnc-comment-or-uncomment-lines
    "q" 'evil-goto-error
    "e" 'eval-buffer)
  (global-evil-leader-mode))

(use-package magit)

(use-package rust-mode)
;; (use-package lsp-mode
;;   :ensure
;;   :commands lsp
;;   :custom
;;   (lsp-rust-analyzer-cargo-watch-command "clippy")
;;   (lsp-eldoc-render-all t)
;;   (lsp-idle-delay 0.6))

;; (use-package company
;;   :ensure
;;   :custom
;;   (company-idle-delay 0.5))

;; (use-package flycheck :ensure)

;; (use-package rustic
;;   :config
;;   (setq rustic-format-on-save t))

(use-package all-the-icons)

(use-package projectile)

(use-package paren
  :config
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))

(use-package general
  :config

  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

   ;; Magit
   "g" '(:ignore t :which-key "Git client")
   "gg" 'magit-status

   ;; Compilation
   "c" '(:ignore t :which-key "Git client")
   "cc" 'compile
   "SPC" 'recompile

   ;; Dired
   "d" '(:ignore t :which-key "Dired")
   "dd" 'dired-jump

   ;; Helm
   "\\" 'helm-projectile-rg

   ;; Applications
   "a" '(:ignore t :which-key "Applications")
   "ar" 'ranger
   "ad" 'dired))

(defun dw/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :defer t
  :hook (org-mode . dw/org-mode-visual-fill))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))

(use-package go-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode)))

(use-package helm-projectile)
;; Align with spaces only
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
  (let ((indent-tabs-mode nil))
    ad-do-it))
(ad-activate 'align-regexp)

;; (use-package evil-smartparens)
(use-package auto-complete
  :config
  (global-auto-complete-mode))

(use-package evil-mc
  :config
  (global-evil-mc-mode 1))

(global-set-key [f2]
  '(lambda () (interactive)
      (condition-case nil (next-error)
         (error (next-error 1 t)))))

(add-hook 'rust-mode-hook 'cargo-minor-mode)

(use-package yasnippet
  :config
  (yas-global-mode 1))
