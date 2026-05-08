(require 'package)
(require 'org)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package meow
  :ensure t
  :pin nongnu)

(use-package dracula-theme
  :ensure t
  :defer)

(use-package solaire-mode
	:ensure t
	:init
	(solaire-global-mode t))

(use-package demap
	:ensure t
	:defer)

(use-package elfeed
  :ensure t
  :defer)

(use-package corfu
  ;; Optional customizations
  :ensure t
  :defer
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match 'insert) ;; Configure handling of exact matches

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  :init
	;; Enable auto completion, configure delay, trigger and quitting
	(setq corfu-auto t
      corfu-auto-delay 0.2) 

  ;; Recommended: Enable Corfu globally.  Recommended since many modes provide
  ;; Capfs and Dabbrev can be used globally (M-/).  See also the customization
  ;; variable `global-corfu-modes' to exclude certain modes.
  (global-corfu-mode)

  ;; Enable optional extension modes:
  ;; (corfu-history-mode)
  (corfu-popupinfo-mode))

(use-package eldoc-box
	:ensure t
	:defer)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
							("C-c C-e" . markdown-do)))

(use-package pdf-tools
  :ensure t
  :pin nongnu
  :defer)
																				;(use-package shrface
																				;	:ensure t
																				;	:pin melpa
																				;	:defer)

(use-package emms
	:ensure t
	:defer)

(use-package git-gutter
	:ensure t
	:defer
	:hook (prog-mode . git-gutter-mode))

(setq emms-player-list '(emms-player-mpv)
			emms-info-functions '(emms-info-native))

(use-package web-mode
  :ensure t
  :mode
  (("\\.phtml\\'" . web-mode)
		("\\.php\\'" . web-mode)
		("\\.[jt]sx?\\'" . web-mode)
		("\\.tpl\\'" . web-mode)
		("\\.[agj]sp\\'" . web-mode)
		("\\.as[cp]x\\'" . web-mode)
		("\\.erb\\'" . web-mode)
		("\\.mustache\\'" . web-mode)
		("\\.twig\\'" . web-mode)
		("\\.djhtml\\'" . web-mode)))

(use-package vterm
  :ensure t
	:defer)

(use-package olivetti
  :ensure t
  :defer)

(use-package treemacs
	:ensure t
	:defer
	:init
	(setq treemacs-follow-after-init t)
	(setq treemacs-file-follow-delay 0.01)
	;; I don't know if I'm supposed to set this
	(setq treemacs--project-follow-delay 0)
	(treemacs-project-follow-mode t))
																				;(use-package apheleia
																				;  :ensure t
																				;  :defer)
																				;(apheleia-global-mode +1)

(setq-default shr-inhibit-images t)
(editorconfig-mode 1)
(load-theme 'dracula t)
(setq-default shr-max-image-proportion 0.75)
(setq-default olivetti-body-width 100)
(setq-default shr-indentation 8)
(setq-default shr-width 100)
(set-face-attribute 'default nil :height 140)
(setq-default line-spacing 0.2)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq-default tab-width 2)
(setq-default org-indent-mode t)
(scroll-bar-mode -1)

(setq backup-directory-alist '(("." . "~/.config/emacs/backups/")))

(defun open-config-directory ()
	"Start looking for files in the config directory"
	(interactive)
	(let ((default-directory user-emacs-directory))
				(call-interactively 'find-file)))

(defun open-init-file ()
	"Open the init file"
	(interactive)
	(find-file user-init-file))

(defun open-org-directory ()
	"Open the org directory"
	(interactive)
	(let ((default-directory (concat org-directory "/")))
				(call-interactively 'find-file)))


 (defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
		'("j" . meow-next)
		'("k" . meow-prev)
		'("<escape>" . ignore))
  (meow-leader-define-key
		;; Use SPC (0-9) for digit arguments.
		'("1" . meow-digit-argument)
		'("2" . meow-digit-argument)
		'("3" . meow-digit-argument)
		'("4" . meow-digit-argument)
		'("5" . meow-digit-argument)
		'("6" . meow-digit-argument)
		'("7" . meow-digit-argument)
		'("8" . meow-digit-argument)
		'("9" . meow-digit-argument)
		'("0" . meow-digit-argument)
		'("/" . meow-keypad-describe-key)
		'("?" . meow-cheatsheet))
  (meow-normal-define-key
		'("0" . meow-expand-0)
		'("9" . meow-expand-9)
		'("8" . meow-expand-8)
		'("7" . meow-expand-7)
		'("6" . meow-expand-6)
		'("5" . meow-expand-5)
		'("4" . meow-expand-4)
		'("3" . meow-expand-3)
		'("2" . meow-expand-2)
		'("1" . meow-expand-1)
		'("-" . negative-argument)
		'(";" . meow-reverse)
		'("," . meow-inner-of-thing)
		'("." . meow-bounds-of-thing)
		'("[" . meow-beginning-of-thing)
		'("]" . meow-end-of-thing)
		'("a" . meow-append)
		'("A" . meow-open-below)
		'("b" . meow-back-word)
		'("B" . meow-back-symbol)
		'("c" . meow-change)
		'("d" . meow-delete)
		'("D" . meow-backward-delete)
		'("e" . meow-next-word)
		'("E" . meow-next-symbol)
		'("f" . meow-find)
		'("g" . meow-cancel-selection)
		'("G" . meow-grab)
		'("h" . meow-left)
		'("H" . meow-left-expand)
		'("i" . meow-insert)
		'("I" . meow-open-above)
		'("j" . meow-next)
		'("J" . meow-next-expand)
		'("k" . meow-prev)
		'("K" . meow-prev-expand)
		'("l" . meow-right)
		'("L" . meow-right-expand)
		'("m" . meow-join)
		'("n" . meow-search)
		'("o" . meow-block)
		'("O" . meow-to-block)
		'("p" . meow-yank)
		'("q" . meow-quit)
		'("Q" . meow-goto-line)
		'("r" . meow-replace)
		'("R" . meow-swap-grab)
		'("s" . meow-kill)
		'("t" . meow-till)
		'("u" . meow-undo)
		'("U" . meow-undo-in-selection)
		'("v" . meow-visit)
		'("w" . meow-mark-word)
		'("W" . meow-mark-symbol)
		'("x" . meow-line)
		'("X" . meow-goto-line)
		'("y" . meow-save)
		'("Y" . meow-sync-grab)
		'("z" . meow-pop-selection)
		'("'" . repeat)
		'("<escape>" . ignore))
  ;; Custom configuration
  (meow-leader-define-key
		'("."   . find-file)
		;; File commands
		'("f s" . save-buffer)
		'("f e" . eval-buffer)
		;; Application commands
		'("a w" . eww)
		'("a r" . elfeed)
		'("a t" . vterm)
		;; Buffer commands
		'("b i" . ibuffer)
		'("b n" . next-buffer)
		'("b p" . previous-buffer)
		'("b r" . olivetti-mode)
		'("b d" . kill-current-buffer)
		;; Code commands
		'("C m" . demap-toggle)
		'("C c" . eglot)
		'("C r" . eglot-rename)
		'("C /" . eglot-find-declaration)
		;; Emacs Config commands
		'("e ." . open-config-directory)
		'("e i" . open-init-file)
		;; Window commands
		'("w s" . split-window-vertically)
		'("w v" . split-window-horizontally)
		'("w d" . delete-window)
		'("w n" . other-window)
		'("w l" . windmove-right)
		'("w k" . windmove-up)
		'("w j" . windmove-down)
		'("w h" . windmove-left)
		'("w p" . previous-window-any-frame)
		;; Org commands
		'("o ." . open-org-directory)
		;; Projects
		'("p p" . project-switch-project)
		'("p ." . project-find-file)
		'("p b" . project-list-buffers-ibuffer)
		'("p s" . treemacs)
		'("p t" . project-eshell))
  (meow-normal-define-key
		'("/" . meow-visit)
		'(":" . execute-extended-command)
		'("s-/" . comment-line))
  )

(meow-setup)
(meow-global-mode 1)

(setq-default inhibit-startup-screen t)

(pixel-scroll-precision-mode 1)

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)
