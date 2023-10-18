(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; my packages
(setq package-list '( direnv ement adwaita-dark-theme counsel dashboard tuareg dune utop projectile smartparens treemacs-projectile solaire-mode treemacs treemacs-evil haskell-mode rainbow-delimiters evil doom-modeline lsp-ui lsp-mode lsp-haskell flycheck company))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(direnv-mode)
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq custom-safe-themes t)
(load-theme 'adwaita-dark t)
(setq initial-buffer-choice (lambda () (switch-to-buffer "*dashboard*")))
(setq dashboard-banner-logo-title "Welcome to Hikai")
(setq dashboard-startup-banner 'logo)
(setq dashboard-center-content t)
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))

(setq inhibit-startup-message t)
(setq select-enable-clipboard nil) 
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Mono-11:hinting=full"))

(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
						    ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(menu-bar-mode -1)  ; Leave this one on if you're a beginner!
(tool-bar-mode -1)
(scroll-bar-mode -1)
(require 'nerd-icons)
(global-display-line-numbers-mode 1)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c j") 'counsel-git-grep)

(setq pixel-scroll-precision-large-scroll-height 40.0)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'evil)
(evil-mode 1)

(setq lsp-keymap-prefix "s-l")

(require 'lsp-mode)
(add-hook 'tuareg-mode-hook #'lsp)
(add-hook 'prog-mode-hook #'lsp)
(add-hook 'after-init-hook 'global-company-mode)


(doom-modeline-mode 1)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(add-to-list 'auto-mode-alist '("\\.ml[iyl]?$" . tuareg-mode))
					; treemacs keybindings
(global-set-key (kbd "C-c n") 'treemacs)
(global-set-key (kbd "C-c b") 'treemacs-select-window)
(global-set-key (kbd "C-c ,") 'treemacs-find-file)

(require 'smartparens-config)
(add-hook 'prog-mode-hook #'smartparens-mode)

(global-set-key (kbd "C-c  down") 'sp-end-of-sexp)
(global-set-key (kbd "C-c  up") 'sp-beginning-of-sexp)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(direnv utop treemacs-projectile treemacs-evil timu-caribbean-theme solaire-mode smartparens rainbow-delimiters lsp-ui lsp-haskell flycheck ement dune dracula-theme doom-modeline dashboard counsel company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
