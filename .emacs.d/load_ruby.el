(add-to-list 'load-path "~/.emacs.d/site-lisp/ruby")

;;;;;;;;;;;;;;;;;;;;; load the ri mode for emacs;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; notice that expand-file-name method call here, without this, ri couldn't start, lame!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq ri-ruby-script (expand-file-name "~/.emacs.d/site-lisp/ri-0.2.3/ri-emacs.rb"))

  (autoload 'ri "~/.emacs.d/site-lisp/ri-0.2.3/ri-ruby.el" nil t)
  (add-hook 'ruby-mode-hook (lambda ()
                              (local-set-key [f1] 'ri)
                              (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
                              ;;(local-set-key [f4] 'ri-ruby-show-args)
                              ))
;;;;;;;;;;;;;;;;;;;;; load the outline mode for ruby ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; commented out because I suspect it is causing problems in terminals when display get messed up - 01/23/2013
;; It turns out it was iterm2 that was causing funky business - uncomment this
  (add-hook 'ruby-mode-hook '(lambda()
                               (outline-minor-mode)
                               (setq outline-regexp " *\\(before \\|it_should_\\|describe \\|def \\|class \\| module\\)")))


;;;;;;;;;;;;;;;;;;;;;;;;Ruby inf-ruby-mode;;;;;;;;;;;;
  (autoload 'ruby-mode "ruby-mode"
    "Mode for editing ruby source files")
  (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.jst$" . html-mode))
  (add-to-list 'auto-mode-alist '("\\.coffee$" . ruby-mode))
  (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
  (autoload 'run-ruby "inf-ruby"
    "Run an inferior Ruby process")
  (autoload 'inf-ruby-keys "inf-ruby"
    "Set local key defs for inf-ruby in ruby-mode")
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (inf-ruby-keys)))

;;;;;;;;;;;;;;;; Ruby debugger ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-rdebug")
  (autoload 'rdebug "rdebug" "Ruby debugging support." t)
  ;; If you have Emacs 19.2x or older, use rubydb2x
  ;;(autoload 'rubydb "rubydb3x" "Ruby debugger" t)
  ;; uncomment the next line if you want syntax highlighting

;;;;;;;;;;;;;; Ruby mode compile ;;;;;;;;;;;;;;;;;;;;;;;;;;
  (add-to-list 'load-path "~/.emacs.d/site-lisp/mode-compile")
  (autoload 'mode-compile "mode-compile"
    "Command to compile current buffer file based on the major mode" t)

  (autoload 'mode-compile-kill "mode-compile"
    "Command to kill a compilation launched by `mode-compile'" t)


  ;; If you have Emacs 19.2x or older, use rubydb2x
  ;;(autoload 'rubydb "rubydb3x" "Ruby debugger" t)
  ;; uncomment the next line if you want syntax highlighting
  (add-hook 'ruby-mode-hook 'turn-on-font-lock)


                                        ; needed for rails mode

;; =================================================================================================
;; BE AWARE, RAILS-DEV OR EMACS-RAILS LOADS A NEW AND INCOMPATIBLE SPEEDBAR THAN THE ONE THAT 
;; THE CURRENT VERSION OF ECB IS USING, SO IF YOU PLAN TO USE EMACS-RAILS, RAILS-DEV, THEN YOU ARE
;; WON'T BE ABLE TO USE ECB ALONG WITH THE SPEEDBAR
;; =================================================================================================
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/rails-dev")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/rails-dev/emacs-rails")
                                        ;(add-to-list 'load-path "~/.emacs.
;;(require 'snippet)
;;(require 'find-recursive)
                                        ; The rails require needs to go after ECB
                                        ; otherwise it loads a new incompatible speedbar
;; (require 'rails)
;; =================================================================================================


;; load icircle
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/icircle")
;;(require 'icicles)
;;(icy-mode 1)
