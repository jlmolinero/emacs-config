;;; package --- Sumary

;;; Commentary:

;; requires
(require 'package)
(require 'undo-tree)
(require 'auto-complete)
(require 'helm)

;; Personal Information
(setq user-full-name "Name"
      user-mail-address "email@example.com")
(setq calendar-latitude 42.2)
(setq calendar-longitude -71.1)
(setq calendar-location-name "Madrid, ES")

;;; Code:

;; goto-line
(global-set-key (kbd "C-c C-g C-l") 'goto-line)

;; welcome screen deactivate
(setq inhibit-startup-message t)

;; Change window size
(if (display-graphic-p) (set-frame-size (selected-frame) 230 80))

;; hide
(if (display-graphic-p) (tool-bar-mode -1))
(if (display-graphic-p) (menu-bar-mode 1))
(if (display-graphic-p) (scroll-bar-mode -1))

;; Move cursor with mouse scroll
(defun scroll-down-keep-cursor ()
  "Use to move the cursor when scroll down."
  (interactive)
  (scroll-down 1))
(defun scroll-up-keep-cursor ()
  "Use to move the cursor when scroll up."
  (interactive)
  (scroll-up 1))

;; Melpa
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org lsp-jedi yasnippet aggressive-indent highlight-symbol all-the-icons neotree doom-themes shell-pop flycheck engine-mode which-key smartparens helm-google swiper-helm expand-region mode-icons auto-complete mmm-mode minimap ## undo-tree magit))
 '(shell-pop-autocd-to-working-dir t)
 '(shell-pop-cleanup-buffer-at-process-exit t)
 '(shell-pop-default-directory "/Users/kyagi/git")
 '(shell-pop-full-span t)
 '(shell-pop-restore-window-configuration t)
 '(shell-pop-shell-type
   '("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 30)
 '(shell-pop-window-sºize 30))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "blue" :foreground "yellow"))))
 '(mode-line-inactive ((t (:background "dim grey"))))
 '(region ((t (:extend t :background "dark green")))))

;; Reload Emacs configuration
(defun reload-dotemacs-file ()
  "Reload your .emacs file without restarting Emacs."
  (interactive)
  (load-file "~/.emacs") )


;; Expan-region
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C-?") 'er/contract-region))


;; engine-mode
(use-package engine-mode
  :ensure t
  :config
  (engine-mode t)
  (defengine duckduckgo
    "https://duckduckgo.com/?q=%s"
    :keybinding "d")

  (defengine google
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
    :keybinding "g")
  )

;; Minimap
(if (display-graphic-p)
    (use-package minimap
      :ensure t
      :config
      (setq minimap-window-location 'right)
      (setq minimap-always-recenter -1)
      (setq minimap-minimum-width '0)
      (setq minimap-width-fraction 0.1)
      (global-set-key [f7] 'minimap-kill)
      (global-set-key [f6] 'minimap-create)))

;; which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

;; Helm
(use-package helm
  :ensure t
  :config
  (helm-autoresize-mode t)
  (helm-mode t)
  (global-set-key (kbd "C-x C-f") 'helm-find-files);
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action))

(use-package swiper-helm
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper-helm)
  (global-set-key "\C-r" 'swiper-helm)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

;; Neotree
(use-package neotree
  :ensure t
  :config
  ;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (global-set-key [f8] 'neotree-toggle))

;; auto-complete
(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  (global-auto-complete-mode t)
  (setq ac-modes '(c++-mode csharp-mode python-mode cmake-mode sql-mode)))

(add-hook 'org-mode-hook 'auto-complete-mode)

;;flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; chsarp-mode
(use-package csharp-mode
  :ensure t
  :init)

;; python-mode
(use-package python-mode
  :ensure t
  :init)

;; cmake-mode
(use-package cmake-mode
  :ensure t
  :init)

;; org
(use-package org
  :ensure t
  :init
  (org-mode))

;; xcscope need to install cscope
;; Windows https://code.google.com/archive/p/cscope-win32/downloads
(use-package xcscope
  :ensure t
  :init)

;; Magit
(use-package magit
  :ensure t)
(global-set-key (kbd "M-g") 'magit-status)

;; shell-pop
(use-package shell-pop
  :ensure t
  :init
  (global-set-key [f9] 'shell-pop))

;; doom-temes
(if (display-graphic-p)
    (use-package doom-themes
      :ensure t
      :config
      ;; Global settings (defaults)
      (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
            doom-themes-enable-italic t) ; if nil, italics is universally disabled
      (load-theme 'doom-1337 t)

      ;; Enable flashing mode-line on errors
      (doom-themes-visual-bell-config)
      ;; Enable custom neotree theme (all-the-icons must be installed!)
      ;; (doom-themes-neotree-config)
      ;; or for treemacs users
      (customize-set-variable 'doom-themes-treemacs-theme "doom-colors")
      (doom-themes-treemacs-config)
      ;; Corrects (and improves) org-mode's native fontification.
      (doom-themes-org-config)))

;; C++ mode
(defun file-in-directory-list-p (file dirlist)
  "Return TRUE if the FILE specified is contained within one of the directories in the DIRLIST. The directories must also exist."
  (let ((dirs (mapcar 'expand-file-name dirlist))
        (filedir (expand-file-name (file-name-directory file))))
    (and
     (file-directory-p filedir)
     (cl-member-if (lambda (x) ; Check directory prefix matches
                     (string-match (substring x 0 (min(length filedir) (length x))) filedir))
                   dirs))))

(defun buffer-standard-include-p ()
  "Return TRUE if the current buffer is contained within one of the directories in the INCLUDE environment variable."
  (and (getenv "INCLUDE")
       (file-in-directory-list-p buffer-file-name (split-string (getenv "INCLUDE") path-separator))))

(add-to-list 'magic-fallback-mode-alist '(buffer-standard-include-p . c++-mode))

					; style I want to use in c++ mode
(c-add-style "my-style"
	     '("stroustrup"
	       (indent-tabs-mode . nil)        ; use spaces rather than tabs
	       (c-basic-offset . 4)            ; indent by four spaces
	       (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
				   (brace-list-open . 0)
				   (statement-case-open . +)))))

(defun my-c++-mode-hook ()
  (c-set-style "my-style")
  (auto-fill-mode)
  (c-toggle-auto-hungry-state 1))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; File finish with empty line
(setq require-final-newline 'ask)

;; Clean whitespaces and empty lines
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
(setq delete-trailing-whitespace-p t)

;; modes
(helm-autoresize-mode 1)
(helm-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(if (display-graphic-p) (beacon-mode 1))
(if (display-graphic-p) (minimap-mode 1))
(show-paren-mode 1)
(winner-mode 1)
(ido-mode 1)
(csharp-mode)
(c++-mode)
(python-mode)
(cmake-mode)

;; globals
(global-display-line-numbers-mode)
(global-hl-line-mode)
(global-auto-revert-mode)
(global-aggressive-indent-mode)

;; Modes

(setq fixme-modes '(erlang-mode csharp-mode java-mode c-mode emacs-lisp-mode scheme-mode latex-mode c++-mode python-mode makefile-mode sql-mode))
(make-face 'font-lock-fixme-face)
(mapc (lambda (mode)
        (font-lock-add-keywords
         mode
         '(("\\<\\(FIXME\\)" 1 'font-lock-fixme-face t))))
      fixme-modes)
(modify-face 'font-lock-fixme-face "Red" "Yellow" nil t nil t nil nil)

(setq todo-modes '(erlang-mode csharp-mode java-mode c-mode emacs-lisp-mode scheme-mode latex-mod c++-mode python-mode makefile-mode sql-mode))
(make-face 'font-lock-todo-face)
(mapc (lambda (mode)
        (font-lock-add-keywords
         mode
         '(("\\<\\(TODO\\)" 1 'font-lock-todo-face t))))
      todo-modes)
(modify-face 'font-lock-todo-face "Yellow" "Red" nil t nil t nil nil)

(setq name-modes '(erlang-mode csharp-mode java-mode c-mode emacs-lisp-mode scheme-mode latex-mod c++-mode python-mode makefile-mode sql-mode))
(make-face 'font-lock-name-face)
(mapc (lambda (mode)
        (font-lock-add-keywords
         mode
         '(("\\<\\(NAME\\)" 1 'font-lock-name-face t))))
      todo-modes)
(modify-face 'font-lock-name-face "Red" "Green" nil t nil t nil nil)


;;; .emacs ends here
