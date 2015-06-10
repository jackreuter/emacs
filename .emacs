(load-file "~/.emacs.d/global_env.el")
(load-file "~/.emacs.d/global_settings.el")
;;(load-file "~/.emacs.d/load_ruby.el")
(load-file "~/.emacs.d/load_php.el")
;;(load-file "~/.emacs.d/load_jdee.el")
(load-file "~/.emacs.d/key_bindings.el")
(load-file "~/.emacs.d/my_customization.el")
(load-file "~/.emacs.d/my_custom_variable.el")

;;for openGL
;;(load-file "~/.emacs.d/glsl-mode.el")
;;(autoload 'glsl-mode "glsl-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
;;(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
;;(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
;;(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))

;;for android dev
;;(load-file "~/cedet-1.1/common/cedet.el")
;;(load-file "~/cedet-1.1/eieio/eieio.el")
;;(global-ede-mode 1)                      ; Enable the Project management system
;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;;for ios dev
(load-file "~/.emacs.d/swift-mode-master/swift-mode.el")

(when (> emacs-major-version 23)
      (require 'package)
      (package-initialize)
      (add-to-list 'package-archives 
                   '("melpa" . "http://melpa.milkbox.net/packages/")
                   'APPEND))

(defun no-window ())
(defun window-settings ()
  (load-file "~/.emacs.d/window-system-settings.el"))

(if window-system
  (window-settings)
  (no-window))


(set-frame-font "Inconsolata-dz")
(set-input-mode t nil t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; this is to enable copy and paste in mac
(defun mac-copy ()
  (shell-command-to-string "pbpaste"))

(defun mac-paste (text &optional push)
  (let ((process-connection-type nil)) 
  (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
  (process-send-string proc text)
  (process-send-eof proc))))

(defun set-mac-copy-paste ()
  (setq interprogram-cut-function 'mac-paste)
  (setq interprogram-paste-function 'mac-copy))
  
(if (eq system-type 'darwin)
  (set-mac-copy-paste))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq mac-allow-anti-aliasing nil)
(set-frame-font "-apple-Dina-medium-normal-normal--16--*-*-m-0-iso10646-1")
;; (add-to-list 'load-path "~/work/slime/")
;; (setq inferior-lisp-program "/usr/local/Cellar/sbcl/1.0.58/bin/sbcl")
;; (setq slime-js-swank-command "/usr/local/share/npm/lib/node_modules/swank-js/swank-js")


;;(slime-setup '(slime-js slime-repl))
;; (setq slime-js-swank-args '())

   ;;  (require 'slime)
   ;; (slime-setup '(slime-fancy))


;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (slime-js-minor-mode 1)))

;; (add-to-list 'load-path "~/slime/contrib/slime-js")
;; (slime-setup '(slime-js slime-repl))
;; (setq slime-js-swank-command "/usr/local/bin/swank-js")
;; (setq slime-js-swank-args '())

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(delete-by-moving-to-trash t)
 '(ecb-gzip-setup (quote cons))
 '(ecb-layout-name "han")
 '(ecb-layout-window-sizes nil)
 '(ecb-mouse-click-destination (quote left-top))
 '(ecb-options-version "2.32")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-show-sources-in-directories-buffer (quote always))
 '(ecb-source-path (quote (("/Users/cqiu1/work/" "work") ("/Users/cqiu1/work/puppet-configs/" "puppet"))))
 '(ecb-tar-setup (quote cons))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-buffer-style (quote image))
 '(ecb-tree-indent 4)
 '(ecb-tree-mouse-action-trigger (quote button-press))
 '(ecb-use-speedbar-instead-native-tree-buffer nil)
 '(ecb-vc-enable-support t)
 '(ecb-vc-supported-backends (quote ((ecb-vc-dir-managed-by-SVN . ecb-vc-state) (ecb-vc-dir-managed-by-CVS . ecb-vc-state) (ecb-vc-dir-managed-by-RCS . ecb-vc-state) (ecb-vc-dir-managed-by-SCCS . ecb-vc-state) (ecb-vc-dir-managed-by-SVN . ecb-vc-state))))
 '(ecb-wget-setup (quote cons))
 '(ecb-windows-width 0.19)
 '(grep-find-command "find . -type f -not -name \"*.svn-base\" -and -not -name \"*.tmp\" -and -not -name \"*.git\" -and -not -name \"*.log\" -print0 | xargs -0 grep -nH -ie ")
 '(gud-gdb-command-name "gdb --annotate=1")
 '(indicate-buffer-boundaries nil)
 '(jde-bug-debugger-host-address "127.0.0.1")
 '(jde-bug-jre-home "/usr/lib/jvm/java-6-sun")
 '(jde-compile-option-debug (quote ("all" (t nil nil))))
 '(jde-debugger (quote ("jdb")))
 '(jde-global-classpath (quote (("." "/usr/share/java" "/usr/lib/jvm/java-6-sun"))))
 '(jde-jdk-doc-url "/usr/share/doc/sun-java6-jdk/html/api/index.html")
 '(jde-jdk-registry (quote (("1.5" . "/usr/lib/jvm/java-6-sun"))))
 '(jde-regexp-jar-file "/usr/share/java/regexp.jar")
 '(jde-sourcepath (quote (".")))
 '(js-indent-level 2)
 '(large-file-warning-threshold nil)
 '(mac-font-panel-mode t)
 '(mac-input-method-mode t)
 '(ns-command-modifier (quote meta))
 '(ns-control-modifier (quote control))
 '(rdebug-many-windows t)
 '(rdebug-populate-common-keys-function (quote rdebug-populate-common-keys-standard))
 '(rdebug-window-layout-function (quote rdebug-window-layout-standard))
 '(safe-local-variable-values (quote ((encoding . utf-8) (js-run . "swank-protocol-tests.js") (js-run . "user-agent-tests.js") (js-run . "completion-tests.js") (js-run . t))))
 '(show-paren-mode t)
 '(x-select-enable-clipboard t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
