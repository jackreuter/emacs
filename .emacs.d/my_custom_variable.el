(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; JDE
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   '(jde-bug-debugger-host-address "127.0.0.1")
   '(jde-bug-jre-home "/usr/lib/jvm/java-6-sun")
   '(jde-compile-option-debug (quote ("all" (t nil nil))))
   '(jde-debugger (quote ("jdb")))
   '(jde-jdk-doc-url "/usr/share/doc/sun-java6-jdk/html/api/index.html")
   '(jde-jdk-registry (quote (("1.5" . "/usr/lib/jvm/java-6-sun"))))
   '(jde-global-classpath (quote (("." "/usr/share/java" "/usr/lib/jvm/java-6-sun"))))
   '(jde-regexp-jar-file "/usr/share/java/regexp.jar")
   '(jde-sourcepath (quote (".")))
   '(delete-by-moving-to-trash t)
   '(grep-find-command "find . -type f -not -name \"*.svn-base\" -and -not -name \"*.tmp\" -and -not -name \"*.git\" -and -not -name \"*.log\" -print0 | xargs -0 grep -nH -ie ")
   ;; '(grep-find-command "find . -name \"*.rb\" -print0 | xargs -0 grep -nH -ie ")
   '(gud-gdb-command-name "gdb --annotate=1")
   '(indicate-buffer-boundaries nil)
   '(js-indent-level 2)
   '(large-file-warning-threshold nil)
   '(mac-font-panel-mode t)
   '(mac-input-method-mode t)
   '(ns-command-modifier (quote meta))
   '(ns-control-modifier (quote control))
   '(rdebug-many-windows t)
   '(rdebug-populate-common-keys-function (quote rdebug-populate-common-keys-standard))
   '(rdebug-window-layout-function (quote rdebug-window-layout-standard))
   '(show-paren-mode t)
   '(x-select-enable-clipboard t)
   '(c-basic-offset 2)

   )
