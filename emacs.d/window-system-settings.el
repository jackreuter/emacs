;; setting default frame settings such as 
;; 1. color of the cursor
;; 2. left fringe width -> 0
;; 3. right fringe width -> 1
(defvar my-frame-alist
  '((cursor-type . bar)
    (cursor-color . "Red")
    (left-fringe . 0)
    (right-fringe . 1)))

(setq default-frame-alist my-frame-alist)

(setq bookmark-default-file "~/.emacs.d/bookmarks" bookmark-save-flag 1)
  
(setq semantic-load-turn-everything-on t)

(require 'semantic/analyze)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)
;;  (provide 'ecb-autoloads)
;;  (require 'ecb-autoloads)
;;  (add-to-list 'load-path "~/.emacs.d/site-lisp/ecb-2.32")
  
;;  (require 'ecb)
  
;;;Require C-x C-c prompt. I've closed too often by accident.
;;;http://www.dotemacs.de/dotfiles/KilianAFoth.emacs.html
  (custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ECB
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; '(ecb-gzip-setup (quote cons))
  ;; '(ecb-layout-name "han")
  ;; '(ecb-layout-window-sizes nil)
  ;; '(ecb-mouse-click-destination (quote left-top))
  ;; '(ecb-options-version "2.32")
  ;; '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
  ;; '(ecb-show-sources-in-directories-buffer (quote always))
  ;; '(ecb-source-path (quote (("/Users/cqiu1/work/" "work") ("/Users/cqiu1/work/puppet-configs/" "puppet" ))))
  ;; '(ecb-tar-setup (quote cons))
  ;; '(ecb-tip-of-the-day nil)
  ;; '(ecb-tree-buffer-style (quote image))
  ;; '(ecb-tree-indent 4)
  ;; '(ecb-tree-mouse-action-trigger (quote button-press))
  ;; '(ecb-use-speedbar-instead-native-tree-buffer nil)
  ;; '(ecb-vc-enable-support t)
  ;; '(ecb-vc-supported-backends (quote ((ecb-vc-dir-managed-by-SVN . ecb-vc-state) (ecb-vc-dir-managed-by-CVS . ecb-vc-state) (ecb-vc-dir-managed-by-RCS . ecb-vc-state) (ecb-vc-dir-managed-by-SCCS . ecb-vc-state) (ecb-vc-dir-managed-by-SVN . ecb-vc-state))))
  ;; '(ecb-wget-setup (quote cons))
  ;; '(ecb-windows-width 0.19)
  '(gud-gdb-command-name "gdb --annotate=1")
  '(indicate-buffer-boundaries nil)
  '(large-file-warning-threshold nil)
  '(rdebug-many-windows t)
  '(rdebug-populate-common-keys-function (quote rdebug-populate-common-keys-standard))
  '(rdebug-window-layout-function (quote rdebug-window-layout-standard))
  ;; '(tags-table-list (quote ("/mnt/hanfoot/projects/octagon/tags" "/mnt/hanfoot/projects/acl/tags" "/mnt/hanfoot/projects/tmdj/tags" "/mnt/hanfoot/projects/dreamshots/tags" "/mnt/hanfoot/projects/xshop/tags" "/mnt/hanfoot/projects/tmdj_voice/tags" "/home/han/projects/vis/TAGS")))
  )
  ;(custom-set-faces
  ; custom-set-faces was added by Custom.
  ; If you edit it by hand, you could mess it up, so be careful.
  ; Your init file should contain only one such instance.
  ; If there is more than one, they won't work right.
  ; '(linum ((t (:inherit (shadow default) :background "dark-blue" :width normal)))))
  
  
  ; Blackboard Colour Theme for Emacs.
  ;
  ; Defines a colour scheme resembling that of the original TextMate Blackboard colour theme.
  ; To use add the following to your .emacs file (requires the color-theme package):
  ;
  ;(require 'color-theme)
  ; (color-theme-initialize)
  ; (load-file "~/.emacs.d/themes/color-theme-blackboard.el")
  ;
  ; And then (color-theme-blackboard) to activate it.
  ;
  ; MIT License Copyright (c) 2008 JD Huntington <jdhuntington at gmail dot com>
  ; Credits due to the excellent TextMate Blackboard theme
  ;
  ; All patches welcome
  
  (defun color-theme-blackboard ()
   "Color theme by JD Huntington, based off the TextMate Blackboard theme, created 2008-11-27"
   (interactive)
   (color-theme-install
    '(color-theme-blackboard
      ((background-color . "#0C1021")
       (background-mode . dark)
       (border-color . "black")
       (cursor-color . "#A7A7A7")
       (foreground-color . "#F8F8F8")
       (Mouse-color . "sienna1"))
      (default ((t (:background "#0C1021" :foreground "#F8F8F8"))))
      (blue ((t (:foreground "blue"))))
      (bold ((t (:bold t))))
      (bold-italic ((t (:bold t))))
      (border-glyph ((t (nil))))
      (buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))
      (font-lock-builtin-face ((t (:foreground "#F8F8F8"))))
      (font-lock-comment-face ((t (:italic t :foreground "#AEAEAE"))))
      (font-lock-constant-face ((t (:foreground "#D8FA3C"))))
      (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
      (font-lock-function-name-face ((t (:foreground "#FF6400"))))
      (font-lock-keyword-face ((t (:foreground "#FBDE2D"))))
      (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
      (font-lock-reference-face ((t (:foreground "SlateBlue"))))
  
      (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
      (font-lock-regexp-grouping-construct ((t (:foreground "red"))))
  
      (font-lock-string-face ((t (:foreground "#61CE3C"))))
      (font-lock-type-face ((t (:foreground "#8DA6CE"))))
      (font-lock-variable-name-face ((t (:foreground "#FF6400"))))
      (font-lock-warning-face ((t (:bold t :foreground "Pink"))))
      (gui-element ((t (:background "#D4D0C8" :foreground "black"))))
      (region ((t (:background "#253B76"))))
      (mode-line ((t (:background "grey75" :foreground "black"))))
;;      (highlight ((t (:background "#222222"))))
      (highlight ((t (:background "Blue"))))       
      (highline-face ((t (:background "Blue"))))
      (italic ((t (nil))))
      (left-margin ((t (nil))))
      (text-cursor ((t (:background "yellow" :foreground "black"))))
      ;;     (toolbar ((t (nil))))
      (underline ((nil (:underline nil))))
      (zmacs-region ((t (:background "snow" :foreground "ble")))))))
  
  ; (require 'color-theme)
  ;(load-file "~/.emacs.d/themes/color-theme-blackboard.el")
  ;(color-theme-initialize)
  ; (color-theme-blackboard)
  ;(zenburn)

