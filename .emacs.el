;; (load-library "python-pylint")
;; (global-set-key (kbd "C-x y") 'python-pylint)
;; (global-set-key (kbd "C-x M-f") 'find-file)
(global-set-key "\C-x\M-b" 'buffer-menu)
(defun p4-write-attempt (data context caller)
  ;; If it's a buffer that has a filename (not a special buffer like
  ;; *Messages* or *Completions*) and it's read-only and you wrote to it
  (if (and (buffer-file-name) (eq 'buffer-read-only (car data)))
      ;; And the user wants to checked out
      (if (y-or-n-p "Checkout in Perforce?")
          (a4-edit (buffer-file-name)) ) ) )
(setq command-error-function 'p4-write-attempt)

(add-to-list 'auto-mode-alist '("\\.\\(fdl\\|fin\\|fdp\\)$" . python-mode))
(add-hook 'tac-mode-hook
          (lambda ()
            (local-set-key "\M-p" 'a4-nav-imenu-prev)
            (local-set-key "\M-n" 'a4-nav-imenu-next)
            ))

(add-hook 'c-mode-hook
          (lambda ()
            (local-set-key "\M-p" 'a4-nav-imenu-prev)
            (local-set-key "\M-n" 'a4-nav-imenu-next)
            ))
;; (require 'xcscope)
(global-linum-mode t)

(set-face-attribute 'region nil :background "#E74C3C" :foreground "#ffffff")

(setq linum-format "%d ")
(setq scroll-step 1 scroll-conservatively  10000)
(setq-default cursor-type 'bar)
(setq tab-width 3)
(setq search-whitespace-regexp "[-_ \n]")
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("92cfc474738101780aafd15a378bb22476af6e8573daa8031a9e4406b69b9eb8" default)))
 '(indent-tabs-mode nil)
 '(package-selected-packages
   (quote
    (flex-autopair origami multiple-cursors monokai-theme ivy elscreen autopair auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hi-blue ((t (:background "#008787" :foreground "brightwhite"))))
 '(hi-green ((t (:background "#5F8700" :foreground "brightwhite"))))
 '(hi-pink ((t (:background "#AF0087" :foreground "brightwhite"))))
 '(hi-yellow ((t (:background "#878700" :foreground "brightwhite"))))
 '(isearch ((t (:inherit region :background "green" :foreground "color-236"))))
 '(lazy-highlight ((t (:inherit highlight :background "brightred" :foreground "brightwhite"))))
 '(mc/cursor-bar-face ((t (:background "brightmagenta" :height 1))))
 '(popup-scroll-bar-foreground-face ((t (:background "brightblue"))))
 '(tool-bar ((t (:foreground "brightwhite" :box (:line-width 1 :style released-button)))))
 '(vertical-border ((t (:foreground "brightwhite")))))
(load-theme 'monokai t)

(electric-indent-mode 1)

;; (require 'mouse)
;; (xterm-mouse-mode t)
;; (defun track-mouse (e))
;; (setq mouse-sel-mode t)

(progn
  (require 'windmove)
  ;; use Shift+arrow_keys to move cursor around split panes
  (windmove-default-keybindings)
  ;; when cursor is on edge, move to the other side, as in a torus space
  (setq windmove-wrap-around t )
)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
   ("marmalade" . "https://marmalade-repo.org/packages/")
   ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140414/dict")
(ac-config-default)

(require 'multiple-cursors)
(global-set-key (kbd "M-S-c M-S-c") 'mc/edit-lines)
(global-set-key (kbd "M-r") 'mc/mark-next-like-this-word)
(global-set-key (kbd "M-S-r") 'mc/mark-previous-like-this-word)
(global-set-key (kbd "M-S-a") 'mc/mark-all-like-this-word)

(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)
 
;; (global-set-key (kbd "C-d") 'kill-whole-line)
(global-set-key (kbd "C-q") 'backward-word)
(global-set-key (kbd "C-p") 'previous-line)
(global-set-key (kbd "C-f") 'forward-word)
(global-set-key (kbd "C-b") 'backward-word)
(global-set-key (kbd "C-x C-z") 'suspend-emacs)
(global-set-key (kbd "M-i") 'windmove-up)
(global-set-key (kbd "M-k") 'windmove-down)
(global-set-key (kbd "M-j") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-|") 'split-window-right)
(global-set-key (kbd "M-_") 'split-window-below)

(defun indent-region(numSpaces)
  (progn
                                        ; default to start and end of current line
    (setq regionStart (line-beginning-position))
    (setq regionEnd (line-end-position))

                                        ; if there's a selection, use that instead of the current line
    (when (use-region-p)
      (setq regionStart (region-beginning))
      (setq regionEnd (region-end))
      )

    (save-excursion ; restore the position afterwards
      (goto-char regionStart) ; go to the start of region
      (setq start (line-beginning-position)) ; save the start of the line
      (goto-char regionEnd) ; go to the end of region
      (setq end (line-end-position)) ; save the end of the line

      (indent-rigidly start end numSpaces) ; indent between start and end
      (setq deactivate-mark nil) ; restore the selected region
      )
    )
  )

(defun untab-region (N)
  (interactive "p")
  (indent-region -3)
)

(defun tab-region (N)
  (interactive "p")
  (if (use-region-p)
      (indent-region 3) ; region was selected, call indent-region
      (insert "   ") ; else insert four spaces as expected
   )
)

(global-set-key (kbd "M-~") 'untab-region)
(global-set-key (kbd "M-`") 'tab-region)
(global-set-key (kbd "ESC <C-i>") 'indent-for-tab-command)

(add-to-list 'load-path "/path/to/autopair") ;; comment if autopair.el is in standard load path
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers
(load "server")
(unless (server-running-p) (server-start))
(global-set-key (kbd "M-d") (quote a4-gid-defs))
(global-set-key (kbd "M-/") (quote a4-gid))
(global-set-key (kbd "M-'") (quote a4-gid-go-back))
(global-set-key (kbd "M-\"") (quote a4-gid-kill))
(global-set-key (kbd "M-D") (quote a4-gid-defs-repeat))
(global-set-key (kbd "M-?") (quote a4-gid-repeat))
;; (global-set-key (kbd "M-b") (quote previous-error))
(global-set-key (kbd "M-m") (quote next-error))

(global-set-key (kbd "M-1") (quote a4-nav-add-to-nav-ring))
(global-set-key (kbd "M-0") (quote a4-nav-del-from-nav-ring))

(global-set-key (kbd "M-=") (quote a4-nav-ring-next))
(global-set-key (kbd "M--") (quote a4-nav-ring-prev))

(global-set-key (kbd "C-x M-=") (quote a4-nav-ring-reset))
(global-set-key (kbd "C-x M-l") (quote a4-nav-ring-show))
(global-set-key (kbd "C-x M-k") (quote a4-nav-ring-kill-other-buffers))

(setq a4-gid-highlight-target t)

(which-function-mode 1)
;; (require 'which-func)
;; (add-to-list 'which-func-modes 'tac-mode t)

(defvar cp-map)
(define-prefix-command 'cp-map)

(if (getenv "WP")
    (setq server-name (getenv "WP")))

(elscreen-start)
(setq elscreen-display-tab nil)
(load-library "hideshow")

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
                      (1+ (current-column))))))

(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
              (hs-toggle-hiding)
            (error t))
          (hs-show-all))
    (toggle-selective-display column)))

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'tac-mode             'hs-minor-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(require 'origami)
(global-origami-mode)
(global-set-key (kbd "C-t") 'origami-toggle-node)

(global-set-key (kbd "C-x C-e") 'read-only-mode)

(show-paren-mode 1)

;; (require 'paren)
;; (setq show-paren-style 'parenthesis)
;; (show-paren-mode +1)
(put 'downcase-region 'disabled nil)
;; (define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
;; (define-key comint-mode-map (kbd "<down>") 'comint-next-input)
