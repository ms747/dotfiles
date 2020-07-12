(setq user-full-name "Mayur Shah"
      user-mail-address "mayur.shah.ha@gmail.com")
(setq doom-font (font-spec :family "FuraCode Nerd Font Mono" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "FuraCode Nerd Font Mono" :size 13))
(setq doom-theme 'doom-one)
(setq org-directory "~/org/")
(setq display-line-numbers-type t)
(load! "bindings")
(custom-set-variables
 '(package-selected-packages (quote (evil-multiedit lsp-mode rust-mode))))
(custom-set-faces
 )
(require 'evil-multiedit)
(evil-multiedit-default-keybinds)
