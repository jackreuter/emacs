(add-to-list 'load-path "~/.emacs.d/site-lisp/ido")
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'qrr 'query-replace-regexp)
(setq mouse-yank-at-point t)

(setq-default indent-tabs-mode nil) ;;; force spaces instead of tab

(setq default-tab-width 2)  ;;; Set tab width to 2

;;;;Activate font-lock-mode. Syntax coloring, yay!
(global-font-lock-mode t)

;; enable winner mode
(winner-mode t)

;;;;While we are at it, always flash for parens.
(show-paren-mode 1)

;;;;Change backup behavior to save in a directory, not in a miscellany
;;;;of files all over the place.
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups


;; let the cursor stay afix when scrolling
(setq scroll-preserve-screen-position t)

;; kill the scroll bar, toolbar, menubar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


;;;;Start scrolling when 2 lines from top/bottom
  (setq scroll-margin 2)

;;;;;Push the mouse out of the way when the cursor approaches.
  (mouse-avoidance-mode 'jump)

;;;;This apparently allows seamless editting of files in a tar/jar/zip
;;;;file.
;;(auto-compression-mode 1)

;;; use ido buffer
(ido-mode 'buffer)
(setq ido-enable-flex-matching t)

;;;;Change C-x C-b behavior so it uses bs; shows only interesting
;;;;buffers.
  ;;(global-set-key "\C-x\C-b" 'bs-show)

;;;Text files supposedly end in new lines. Or they should.
(setq require-final-newline t)

;;;;This sets garbage collection to hundred times of the default.
;;;;Supposedly significantly speeds up startup time. (Seems to work
;;;;for me,  but my computer is pretty modern. Disable if you are on
;;;;anything less than 1 ghz).
;;;;This sets garbage collection to hundred times of the default.
;;;;Supposedly significantly speeds up startup time. (Seems to work
;;;;for me,  but my computer is pretty modern. Disable if you are on
;;;;anything less than 1 ghz).
(setq gc-cons-threshold 50000000)

;;;;Use ANSI colors within shell-mode
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  ;; use bubble-buffer
  (add-to-list 'load-path "~/.emacs.d/site-lisp/buffer")
  (require 'bubble-buffer)
  (setq bubble-buffer-omit-regexp "\\(^ .+$\\|\\*Messages\\*\\|*compilation\\*\\|\\*.+output\\*$\\|\\*TeX Help\\*$\\|\\*vc-diff\\*\\|\\*Occur\\*\\|\\*grep\\*\\|\\*cvs-diff\\*\\)")

;;; bind M-F12 to recentf-open-files
  ;;recentf
  (require 'recentf)
  (recentf-mode 1)
  (setq recentf-max-saved-items 1000)
  (setq recentf-max-menu-items 60)

  ;;------------

  (setq ibuffer-shrink-to-minimum-size t)
  (setq ibuffer-always-show-last-buffer nil)
  (setq ibuffer-sorting-mode 'recency)
  (setq ibuffer-use-header-line t)


(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-enable-last-directory-history nil)
(setq ido-confirm-unique-completion nil)
(setq ido-show-dot-for-dired t)
(setq ido-user-filename-at-point t)
(modify-frame-parameters (selected-frame)
  `((alpha . 100)))

(add-to-list 'load-path "~/.emacs.d/site-lisp/js-mode")
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme")
(load-file "~/.emacs.d/site-lisp/color-theme/my_darker_zenburn.el")

(load-file "~/.emacs.d/site-lisp/haml-mode.el")
(require 'haml-mode)
