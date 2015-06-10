
;;;### (autoloads (ecb-byte-compile ecb-minor-mode ecb-activate)
;;;;;;  "ecb" "ecb.el" (19916 46131))
;;; Generated autoloads from ecb.el

(autoload 'ecb-activate "ecb" "\
Activates ECB and creates the special buffers for the choosen layout.
For the layout see `ecb-layout-name'. This function raises always the
ECB-frame if called from another frame. This is the same as calling
`ecb-minor-mode' with a positive argument.

\(fn)" t nil)

(autoload 'ecb-minor-mode "ecb" "\
Toggle ECB minor mode.
With prefix argument ARG, turn on if positive, otherwise off. Return non-nil
if the minor mode is enabled.

\\{ecb-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'ecb-byte-compile "ecb" "\
Byte-compiles the ECB package.
This is done for all lisp-files of ECB if FORCE-ALL is not nil or for each
lisp-file FILE.el which is either newer than FILE.elc or if FILE.elc doesn't
exist.

\(fn &optional FORCE-ALL)" t nil)

;;;***

;;;### (autoloads (ecb-show-help) "ecb-help" "ecb-help.el" (19916
;;;;;;  46131))
;;; Generated autoloads from ecb-help.el

(autoload 'ecb-show-help "ecb-help" "\
Shows the online help of ECB in Info or HTML-format.
The format depends on the setting in `ecb-show-help-format'. If called with
prefix argument, i.e. if FORMAT is not nil then the user is prompted to choose
the format of the help (Info or Html).

If an error about not finding the needed help-file occurs please take a look
at the options `ecb-help-info-start-file' and `ecb-help-html-start-file'!

Note: If you got ECB as a standard XEmacs-package maybe the
HTML-online-documentation is not included.

\(fn &optional FORMAT)" t nil)

;;;***

;;;### (autoloads nil "ecb-util" "ecb-util.el" (19916 46131))
;;; Generated autoloads from ecb-util.el

(defconst ecb-running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

;;;***

;;;### (autoloads nil nil ("../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-analyse.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-autogen.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-autoloads.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-common-browser.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-compatibility.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-compilation.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-create-layout.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-cycle.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-eshell.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-examples.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-face.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-file-browser.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-help.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-jde.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-layout-defs.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-layout.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-method-browser.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-mode-line.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-navigate.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-semantic-wrapper.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-speedbar.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-symboldef.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-tod.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-upgrade.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-util.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb-winman-support.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/ecb.el" "../../../../../../.emacs.d/site-lisp/ecb-2.32/silentcomp.el"
;;;;;;  "../../../../../../.emacs.d/site-lisp/ecb-2.32/tree-buffer.el"
;;;;;;  "ecb-help.el" "ecb-util.el" "ecb.el") (20017 31446 714727))

;;;***

(provide 'ecb-autoloads)
