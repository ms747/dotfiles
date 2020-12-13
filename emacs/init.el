(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)

(set-face-attribute 'default nil :font "FuraCode Nerd Font Mono" :height 150)

(load-theme 'tango-dark)

;; Package Manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Create new window and switch to it
(defun split-and-move(vertical)
  (interactive)
  (if (vertical t)
      ((split-window-vertically) (other-window 1))
    (split-window-horizontally))
  )

;; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-x C-5") (split-and-move nil))
(global-set-key (kbd "C-x C-'") (split-and-move t))
(global-set-key (kbd "C-x C-x") 'delete-window)

(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))
