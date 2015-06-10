<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icicles-cmd.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-cmd.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icicles-cmd.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-cmd.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for icicles-cmd.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-cmd.el" /><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icicles-cmd.el%22">icicles-cmd.el</a></h1></div><div class="wrapper"><div class="content browse"><p><a href="http://www.emacswiki.org/emacs/download/icicles-cmd.el">Download</a></p><pre class="code"><span class="linecomment">;;; icicles-cmd.el --- Top-level commands for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-cmd.el</span>
<span class="linecomment">;; Description: Top-level commands for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2009, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:25:04 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Sat Feb 28 12:05:56 2009 (-0800)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 17857</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-cmd.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `apropos', `apropos-fn+var', `avoid', `cl', `color-theme',</span>
<span class="linecomment">;;   `cus-edit', `cus-face', `cus-load', `cus-start', `doremi',</span>
<span class="linecomment">;;   `easymenu', `ffap', `ffap-', `frame-cmds', `frame-fns',</span>
<span class="linecomment">;;   `hexrgb', `icicles-fn', `icicles-mac', `icicles-mcmd',</span>
<span class="linecomment">;;   `icicles-opt', `icicles-var', `kmacro', `levenshtein',</span>
<span class="linecomment">;;   `misc-fns', `mwheel', `pp', `pp+', `ring', `ring+', `strings',</span>
<span class="linecomment">;;   `subr-21', `thingatpt', `thingatpt+', `wid-edit', `wid-edit+',</span>
<span class="linecomment">;;   `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  top-level commands (and a few non-interactive functions used in</span>
<span class="linecomment">;;  those commands).  For commands to be used mainly in the minibuffer</span>
<span class="linecomment">;;  or buffer *Completions*, see `icicles-mcmd.el'.  For Icicles</span>
<span class="linecomment">;;  documentation, see `icicles.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you use the byte-compiled version of this library,</span>
<span class="linecomment">;;  `icicles-cmd.elc', in Emacs 23, then it must be byte-compiled</span>
<span class="linecomment">;;  using Emacs 23.  Otherwise, Icicles key completion (and perhaps</span>
<span class="linecomment">;;  other things?) will not work correctly.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here - (+) means a multi-command:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (+) `a', (+) `any', (+)`buffer', (+)`clear-option', (+)`file',</span>
<span class="linecomment">;;    (+)`icicle-add-buffer-candidate', (+)`icicle-add-buffer-config',</span>
<span class="linecomment">;;    `icicle-add-entry-to-saved-completion-set', `icicle-add-region',</span>
<span class="linecomment">;;    (+)`icicle-anything', (+)`icicle-apply', `icicle-apropos',</span>
<span class="linecomment">;;    `icicle-apropos-command', `icicle-apropos-function',</span>
<span class="linecomment">;;    `icicle-apropos-option', `icicle-apropos-variable',</span>
<span class="linecomment">;;    `icicle-apropos-zippy', `icicle-bbdb-complete-name',</span>
<span class="linecomment">;;    (+)`icicle-bookmark', (+)`icicle-bookmark-cmd',</span>
<span class="linecomment">;;    `icicle-bookmark-jump', `icicle-bookmark-jump-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-other-window', (+)`icicle-buffer',</span>
<span class="linecomment">;;    (+)`icicle-buffer-config', (+)`icicle-buffer-list',</span>
<span class="linecomment">;;    (+)`icicle-buffer-other-window', (+)`icicle-clear-history',</span>
<span class="linecomment">;;    (+)`icicle-clear-current-history', (+)`icicle-color-theme',</span>
<span class="linecomment">;;    (+)`icicle-comint-command', `icicle-comint-dynamic-complete',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-complete-filename',</span>
<span class="linecomment">;;    `icicle-comint-replace-by-expanded-filename',</span>
<span class="linecomment">;;    (+)`icicle-comint-search', (+)`icicle-command-abbrev',</span>
<span class="linecomment">;;    (+)`icicle-compilation-search', (+)`icicle-complete-keys',</span>
<span class="linecomment">;;    `icicle-complete-thesaurus-entry', (+)`icicle-completing-yank',</span>
<span class="linecomment">;;    `icicle-customize-apropos', `icicle-customize-apropos-faces',</span>
<span class="linecomment">;;    `icicle-customize-apropos-groups',</span>
<span class="linecomment">;;    `icicle-customize-apropos-options',</span>
<span class="linecomment">;;    `icicle-customize-apropos-options-of-type',</span>
<span class="linecomment">;;    (+)`icicle-customize-face', `icicle-customize-icicles-group',</span>
<span class="linecomment">;;    `icicle-dabbrev-completion', (+)`icicle-delete-file',</span>
<span class="linecomment">;;    (+)`icicle-delete-window', (+)`icicle-delete-windows',</span>
<span class="linecomment">;;    (+)`icicle-describe-option-of-type', (+)`icicle-directory-list',</span>
<span class="linecomment">;;    `icicle-dired-chosen-files',</span>
<span class="linecomment">;;    `icicle-dired-chosen-files-other-window',</span>
<span class="linecomment">;;    `icicle-dired-project', `icicle-dired-project-other-window',</span>
<span class="linecomment">;;    `icicle-dired-saved-file-candidates',</span>
<span class="linecomment">;;    `icicle-dired-saved-file-candidates-other-window',</span>
<span class="linecomment">;;    `icicle-dired-save-marked',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-as-project',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-more',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-persistently',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-to-variable', (+)`icicle-doc',</span>
<span class="linecomment">;;    `icicle-ess-complete-filename',</span>
<span class="linecomment">;;    `icicle-ess-complete-object-name',</span>
<span class="linecomment">;;    `icicle-ess-internal-complete-object-name',</span>
<span class="linecomment">;;    `icicle-ess-R-complete-object-name',</span>
<span class="linecomment">;;    (+)`icicle-exchange-point-and-mark',</span>
<span class="linecomment">;;    (+)`icicle-execute-extended-command',</span>
<span class="linecomment">;;    (+)`icicle-execute-named-keyboard-macro', (+)`icicle-face-list',</span>
<span class="linecomment">;;    (+)`icicle-file', (+)`icicle-file-list',</span>
<span class="linecomment">;;    (+)`icicle-file-other-window', (+)`icicle-find-file',</span>
<span class="linecomment">;;    (+)`icicle-find-file-absolute',</span>
<span class="linecomment">;;    (+)`icicle-find-file-absolute-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-other-window', (+)`icicle-find-first-tag',</span>
<span class="linecomment">;;    (+)`icicle-find-first-tag-other-window', (+)`icicle-find-tag',</span>
<span class="linecomment">;;    (+)`icicle-font', (+)`icicle-frame-bg', (+)`icicle-frame-fg',</span>
<span class="linecomment">;;    (+)`icicle-fundoc', (+)`icicle-goto-global-marker',</span>
<span class="linecomment">;;    (+)`icicle-goto-global-marker-or-pop-global-mark',</span>
<span class="linecomment">;;    (+)`icicle-goto-marker',</span>
<span class="linecomment">;;    (+)`icicle-goto-marker-or-set-mark-command',</span>
<span class="linecomment">;;    `icicle-grep-saved-file-candidates',</span>
<span class="linecomment">;;    `icicle-gud-gdb-complete-command', (+)`icicle-imenu',</span>
<span class="linecomment">;;    (+)`icicle-imenu-command',</span>
<span class="linecomment">;;    (+)`icicle-imenu-non-interactive-function',</span>
<span class="linecomment">;;    (+)`icicle-Info-goto-node', (+)`icicle-Info-goto-node-cmd',</span>
<span class="linecomment">;;    (+)`icicle-Info-index', (+)`icicle-Info-index-20',</span>
<span class="linecomment">;;    (+)`icicle-Info-index-cmd', (+)`icicle-Info-menu',</span>
<span class="linecomment">;;    `icicle-Info-menu-cmd', `icicle-insert-char',</span>
<span class="linecomment">;;    (+)`icicle-insert-thesaurus-entry', (+)`icicle-keyword-list',</span>
<span class="linecomment">;;    (+)`icicle-kill-buffer', (+)`icicle-kmacro',</span>
<span class="linecomment">;;    `icicle-lisp-complete-symbol', (+)`icicle-locate-file',</span>
<span class="linecomment">;;    (+)`icicle-locate-file-other-window',</span>
<span class="linecomment">;;    `icicle-non-whitespace-string-p', (+)`icicle-object-action',</span>
<span class="linecomment">;;    (+)`icicle-occur', (+)`icicle-other-window-or-frame',</span>
<span class="linecomment">;;    (+)`icicle-plist', `icicle-pop-tag-mark',</span>
<span class="linecomment">;;    `icicle-pp-eval-expression', `icicle-read-color',</span>
<span class="linecomment">;;    `icicle-read-kbd-macro', (+)`icicle-recent-file',</span>
<span class="linecomment">;;    (+)`icicle-recent-file-other-window', (+)`icicle-regexp-list',</span>
<span class="linecomment">;;    `icicle-region-open-all-files',</span>
<span class="linecomment">;;    (+)`icicle-remove-all-regions-in-buffer',</span>
<span class="linecomment">;;    (+)`icicle-remove-buffer-candidate',</span>
<span class="linecomment">;;    (+)`icicle-remove-buffer-config',</span>
<span class="linecomment">;;    `icicle-remove-entry-from-saved-completion-set',</span>
<span class="linecomment">;;    (+)`icicle-remove-region',</span>
<span class="linecomment">;;    (+)`icicle-remove-saved-completion-set',</span>
<span class="linecomment">;;    `icicle-repeat-complex-command',</span>
<span class="linecomment">;;    (+)`icicle-reset-option-to-nil',</span>
<span class="linecomment">;;    `icicle-save-string-to-variable', (+)`icicle-search',</span>
<span class="linecomment">;;    (+)`icicle-search-all-regions', (+)`icicle-search-buffer',</span>
<span class="linecomment">;;    (+)`icicle-search-buff-menu-marked',</span>
<span class="linecomment">;;    (+)`icicle-search-char-property',</span>
<span class="linecomment">;;    (+)`icicle-search-dired-marked', (+)`icicle-search-file',</span>
<span class="linecomment">;;    (+)`icicle-search-generic', `icicle-search-highlight-cleanup',</span>
<span class="linecomment">;;    (+)`icicle-search-ibuffer-marked', (+)`icicle-search-keywords',</span>
<span class="linecomment">;;    (+)`icicle-search-overlay-property', (+)`icicle-search-region',</span>
<span class="linecomment">;;    (+)`icicle-search-text-property', (+)`icicle-search-word',</span>
<span class="linecomment">;;    (+)`icicle-select-frame', `icicle-select-frame-by-name',</span>
<span class="linecomment">;;    (+)`icicle-select-region', (+)`icicle-select-window',</span>
<span class="linecomment">;;    `icicle-select-window-by-name', `icicle-send-bug-report',</span>
<span class="linecomment">;;    (+)`icicle-set-option-to-t',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-command',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-environment-variable',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-filename',</span>
<span class="linecomment">;;    (+)`icicle-tags-search', (+)`icicle-toggle-option',</span>
<span class="linecomment">;;    (+)`icicle-vardoc', (+)`icicle-where-is',</span>
<span class="linecomment">;;    (+)`icicle-yank-maybe-completing', (+)`toggle',</span>
<span class="linecomment">;;    (+)`what-which-how'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `custom-variable-p', `icicle-add-key+cmd',</span>
<span class="linecomment">;;    `icicle-anything-candidate-value', `icicle-apply-action',</span>
<span class="linecomment">;;    `icicle-apply-list-action', `icicle-binary-option-p',</span>
<span class="linecomment">;;    `icicle-bookmark-cleanup', `icicle-bookmark-jump-1',</span>
<span class="linecomment">;;    `icicle-char-properties-in-buffer',</span>
<span class="linecomment">;;    `icicle-char-properties-in-buffers',</span>
<span class="linecomment">;;    `icicle-choose-anything-candidate',</span>
<span class="linecomment">;;    `icicle-choose-candidate-of-type', `icicle-clear-history-1',</span>
<span class="linecomment">;;    `icicle-clear-history-entry', `icicle-color-help',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-complete-as-filename',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-simple-complete',</span>
<span class="linecomment">;;    `icicle-comint-hook-fn',</span>
<span class="linecomment">;;    `icicle-comint-replace-orig-completion-fns',</span>
<span class="linecomment">;;    `icicle-comint-search-get-final-choice',</span>
<span class="linecomment">;;    `icicle-comint-search-get-minibuffer-input',</span>
<span class="linecomment">;;    `icicle-comint-search-send-input',</span>
<span class="linecomment">;;    `icicle-command-abbrev-action',</span>
<span class="linecomment">;;    (+)`icicle-command-abbrev-command',</span>
<span class="linecomment">;;    `icicle-command-abbrev-matching-commands',</span>
<span class="linecomment">;;    `icicle-command-abbrev-record', `icicle-command-abbrev-regexp',</span>
<span class="linecomment">;;    `icicle-compilation-hook-fn',</span>
<span class="linecomment">;;    `icicle-compilation-search-in-context-fn',</span>
<span class="linecomment">;;    `icicle-complete-keys-1', `icicle-complete-keys-action',</span>
<span class="linecomment">;;    `icicle-customize-faces', `icicle-dabbrev--abbrev-at-point',</span>
<span class="linecomment">;;    `icicle-delete-file-or-directory',</span>
<span class="linecomment">;;    `icicle-delete-region-from-alist', `icicle-describe-opt-action',</span>
<span class="linecomment">;;    `icicle-describe-opt-of-type-complete', `icicle-doc-action',</span>
<span class="linecomment">;;    `icicle-edmacro-parse-keys',</span>
<span class="linecomment">;;    `icicle-execute-extended-command-1', `icicle-explore',</span>
<span class="linecomment">;;    `icicle-find-first-tag-action',</span>
<span class="linecomment">;;    `icicle-find-first-tag-other-window-action',</span>
<span class="linecomment">;;    `icicle-find-tag-action', `icicle-find-tag-define-candidates',</span>
<span class="linecomment">;;    `icicle-find-tag-define-candidates-1',</span>
<span class="linecomment">;;    `icicle-find-tag-final-act', `icicle-find-tag-help',</span>
<span class="linecomment">;;    `icicle-find-tag-quit-or-error', `icicle-flat-list',</span>
<span class="linecomment">;;    `icicle-fn-doc-minus-sig', `icicle-funvardoc-action',</span>
<span class="linecomment">;;    `icicle-get-anything-actions-for-type',</span>
<span class="linecomment">;;    `icicle-get-anything-cached-candidates',</span>
<span class="linecomment">;;    `icicle-get-anything-candidates',</span>
<span class="linecomment">;;    `icicle-get-anything-candidates-of-type',</span>
<span class="linecomment">;;    `icicle-get-anything-default-actions-for-type',</span>
<span class="linecomment">;;    `icicle-get-anything-input-delay',</span>
<span class="linecomment">;;    `icicle-get-anything-req-pat-chars',</span>
<span class="linecomment">;;    `icicle-get-anything-types', `icicle-goto-marker-1',</span>
<span class="linecomment">;;    `icicle-goto-marker-1-action', `icicle-group-regexp',</span>
<span class="linecomment">;;    `icicle-imenu-command-p', `icicle-imenu-in-buffer-p',</span>
<span class="linecomment">;;    `icicle-imenu-non-interactive-function-p',</span>
<span class="linecomment">;;    `icicle-Info-book-order-p',</span>
<span class="linecomment">;;    `icicle-Info-build-node-completions',</span>
<span class="linecomment">;;    `icicle-Info-build-node-completions-fix-*',</span>
<span class="linecomment">;;    `icicle-Info-goto-node-1', `icicle-Info-goto-node-action',</span>
<span class="linecomment">;;    `icicle-Info-index-action', `icicle-Info-read-node-name',</span>
<span class="linecomment">;;    `icicle-insert-for-yank',</span>
<span class="linecomment">;;    `icicle-insert-thesaurus-entry-cand-fn',</span>
<span class="linecomment">;;    `icicle-keys+cmds-w-prefix',</span>
<span class="linecomment">;;    `icicle-kill-a-buffer-and-update-completions',</span>
<span class="linecomment">;;    `icicle-kmacro-action',</span>
<span class="linecomment">;;    `icicle-make-color-candidate',`icicle-make-file+date-candidate',</span>
<span class="linecomment">;;    `icicle-make-frame-alist', `icicle-make-window-alist',</span>
<span class="linecomment">;;    `icicle-marker+text', `icicle-markers',</span>
<span class="linecomment">;;    `icicle-next-single-char-property-change',</span>
<span class="linecomment">;;    `icicle-read-single-key-description',</span>
<span class="linecomment">;;    `icicle-read-var-value-satisfying', `icicle-region-add-buffers',</span>
<span class="linecomment">;;    `icicle-region-help', `icicle-region-or-buffer-limits',</span>
<span class="linecomment">;;    `icicle-region-sorted', `icicle-remove-all-regions-action',</span>
<span class="linecomment">;;    `icicle-remove-buffer-candidate-action',</span>
<span class="linecomment">;;    `icicle-remove-buffer-config-action',</span>
<span class="linecomment">;;    `icicle-remove-color-duplicates',</span>
<span class="linecomment">;;    `icicle-remove-saved-set-action', `icicle-search-action',</span>
<span class="linecomment">;;    `icicle-search-char-property-scan',</span>
<span class="linecomment">;;    `icicle-search-choose-buffers', `icicle-search-cleanup',</span>
<span class="linecomment">;;    `icicle-search-define-candidates',</span>
<span class="linecomment">;;    `icicle-search-define-candidates-1', `icicle-search-final-act',</span>
<span class="linecomment">;;    `icicle-search-help',</span>
<span class="linecomment">;;    `icicle-search-highlight-all-input-matches',</span>
<span class="linecomment">;;    `icicle-search-highlight-and-maybe-replace',</span>
<span class="linecomment">;;    `icicle-search-highlight-input-matches-here',</span>
<span class="linecomment">;;    `icicle-search-in-context-default-fn',</span>
<span class="linecomment">;;    `icicle-search-property-args', `icicle-search-quit-or-error',</span>
<span class="linecomment">;;    `icicle-search-read-context-regexp', `icicle-search-read-word',</span>
<span class="linecomment">;;    `icicle-search-regexp-scan', `icicle-search-region-action',</span>
<span class="linecomment">;;    `icicle-select-region-action',</span>
<span class="linecomment">;;    `icicle-search-replace-candidate',</span>
<span class="linecomment">;;    `icicle-search-replace-fixed-case-p',</span>
<span class="linecomment">;;    `icicle-search-replace-match',</span>
<span class="linecomment">;;    `icicle-search-replace-search-hit', `icicle-search-where-arg',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-as-command',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-as-environment-variable',</span>
<span class="linecomment">;;    `icicle-this-command-keys-prefix'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `dabbrev.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `dabbrev-completion' - Use Icicles minibuffer completion when there</span>
<span class="linecomment">;;                         are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `bbdb-com.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE.</span>
<span class="linecomment">;;              (BBDB is available here: http://bbdb.sourceforge.net/.)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `bbdb-complete-name' - Use Icicles minibuffer completion when there</span>
<span class="linecomment">;;                         are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `lisp.el' have</span>
<span class="linecomment">;;              been REDEFINED in Icicles:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `lisp-complete-symbol' - Selects *Completions* window even if on</span>
<span class="linecomment">;;                           another frame.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following function defined in `simple.el' has</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `repeat-complex-command' - Use `completing-read' to read command.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `cus-edit.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `customize-apropos', `customize-apropos-faces',</span>
<span class="linecomment">;;  `customize-apropos-groups', `customize-apropos-options' -</span>
<span class="linecomment">;;     Use `completing-read' to read the regexp.</span>
<span class="linecomment">;;  `customize-face', `customize-face-other-window' - Multi-commands.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Key bindings made by Icicles: See "Key Bindings" in `icicles.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  For descriptions of changes to this file, see `icicles-chg.el'.</span>
 
<span class="linecomment">;;(@&gt; "Index")</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you have library `linkd.el' and Emacs 22 or later, load</span>
<span class="linecomment">;;  `linkd.el' and turn on `linkd-mode' now.  It lets you easily</span>
<span class="linecomment">;;  navigate around the sections of this doc.  Linkd mode will</span>
<span class="linecomment">;;  highlight this Index, as well as the cross-references and section</span>
<span class="linecomment">;;  headings throughout this file.  You can get `linkd.el' here:</span>
<span class="linecomment">;;  http://dto.freeshell.org/notebook/Linkd.html.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  (@&gt; "Icicles multi-commands")</span>
<span class="linecomment">;;  (@&gt; "Other top-level Icicles commands")</span>
 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or</span>
<span class="linecomment">;; modify it under the terms of the GNU General Public License as</span>
<span class="linecomment">;; published by the Free Software Foundation; either version 2, or (at</span>
<span class="linecomment">;; your option) any later version.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(eval-when-compile (require 'cl)) <span class="linecomment">;; loop, pushnew</span>
                                  <span class="linecomment">;; plus, for Emacs &lt; 21: dolist, push</span>
                                  <span class="linecomment">;; plus, for Emacs &lt; 20: when, unless</span>
(eval-when-compile (when (&gt;= emacs-major-version 22) (require 'edmacro))) <span class="linecomment">;; edmacro-subseq</span>
(eval-when-compile (when (&gt;= emacs-major-version 21) (require 'recentf))) <span class="linecomment">;; recentf-mode</span>

(eval-when-compile (require 'dabbrev))
  <span class="linecomment">;; dabbrev-case-fold-search, dabbrev-upcase-means-case-search, dabbrev--last-obarray,</span>
  <span class="linecomment">;; dabbrev--last-completion-buffer, dabbrev--last-abbreviation, dabbrev--check-other-buffers,</span>
  <span class="linecomment">;; dabbrev-case-replace, dabbrev--reset-global-variables, dabbrev--minibuffer-origin,</span>
  <span class="linecomment">;; dabbrev--find-all-expansions, dabbrev--substitute-expansion</span>
(eval-when-compile (require 'bookmark))
  <span class="linecomment">;; bookmark-all-names, bookmark-buffer-name, bookmark-current-bookmark</span>
(eval-when-compile (require 'comint))
  <span class="linecomment">;; comint-check-proc, comint-completion-addsuffix, comint-completion-autolist,</span>
  <span class="linecomment">;; comint-completion-fignore, comint-completion-recexact, comint-copy-old-input,</span>
  <span class="linecomment">;; comint-directory, comint-dynamic-complete-filename, comint-dynamic-complete-functions,</span>
  <span class="linecomment">;; comint-get-old-input, comint-input-ring, comint-line-beginning-position,</span>
  <span class="linecomment">;; comint-match-partial-filename, comint-mode-map, comint-prompt-regexp, comint-quote-filename,</span>
  <span class="linecomment">;; comint-send-input</span>
(eval-when-compile (require 'shell)) <span class="linecomment">;; shell-backward-command, shell-completion-execonly,</span>
  <span class="linecomment">;; shell-dynamic-complete-command, shell-dynamic-complete-environment-variable,</span>
  <span class="linecomment">;; shell-dynamic-complete-filename, shell-match-partial-variable</span>
(eval-when-compile (require 'imenu)) <span class="linecomment">;; imenu-syntax-alist</span>
(eval-when-compile (require 'compile)) <span class="linecomment">;; compilation-find-buffer</span>
(eval-when-compile (require 'info)) <span class="linecomment">;; Info-goto-node</span>
(eval-when-compile (require 'etags))
  <span class="linecomment">;; file-of-tag, find-tag, find-tag-default, find-tag-history, find-tag-marker-ring,</span>
  <span class="linecomment">;; find-tag-other-window, goto-tag-location-function, snarf-tag-function,</span>
  <span class="linecomment">;; tag-find-file-of-tag-noselect, tags-case-fold-search, tags-complete-tag,</span>
  <span class="linecomment">;; tags-lazy-completion-table, tags-table-files, visit-tags-table-buffer</span>

<span class="linecomment">;; Commented out because `synonyms.el' soft-requires Icicles.</span>
<span class="linecomment">;; (eval-when-compile (require 'synonyms nil t)) ;; (no error if not found):</span>
  <span class="linecomment">;; synonyms-ensure-synonyms-read-from-cache, synonyms-obarray</span>
(eval-when-compile (require 'misc-cmds nil t)) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; kill-buffer-and-its-windows</span>
(eval-when-compile (when (&gt; emacs-major-version 21)
                     (require 'anything nil t))) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; anything-candidate-cache, anything-get-sources, anything-idle-delay, anything-pattern,</span>
  <span class="linecomment">;; anything-sources, anything-transform-candidates</span>
(eval-when-compile (require 'bbdb nil t) (require 'bbdb-com nil t)) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; bbdb-auto-fill-function, bbdb-complete-name, bbdb-complete-name-allow-cycling,</span>
  <span class="linecomment">;; bbdb-complete-name-cleanup, bbdb-complete-name-hooks, bbdb-completion-display-record,</span>
  <span class="linecomment">;; bbdb-completion-predicate, bbdb-completion-type, bbdb-display-records-1,</span>
  <span class="linecomment">;; bbdb-dwim-net-address, bbdb-expand-mail-aliases, bbdb-extract-address-components-func,</span>
  <span class="linecomment">;; bbdb-gag-messages, bbdb-hashtable, bbdb-mapc, bbdb-pop-up-bbdb-buffer, bbdb-record-aka,</span>
  <span class="linecomment">;; bbdb-record-name, bbdb-record-net, bbdb-search-intertwingle, bbdb-string-trim</span>
(eval-when-compile (require 'yow nil t)) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; apropos-zippy, yow-after-load-message, yow-file, yow-load-message</span>
(eval-when-compile (require 'cookie1 nil t)) <span class="linecomment">;; (no error if not found): cookie-cache</span>
(require 'cus-edit)
  <span class="linecomment">;; customize-apropos, customize-apropos-faces, customize-apropos-groups,</span>
  <span class="linecomment">;; customize-apropos-options, custom-buffer-create, custom-buffer-order-groups, customize-face,</span>
  <span class="linecomment">;; customize-face-other-window, custom-sort-items</span>
(require 'misc-fns nil t)   <span class="linecomment">;; (no error if not found): another-buffer</span>
(require 'apropos-fn+var nil t) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; apropos-command, apropos-function, apropos-option, apropos-variable</span>
(require 'frame-cmds nil t) <span class="linecomment">;; (no error if not found): delete-windows-on (my version)</span>
(when window-system (require 'hexrgb nil t))
                         <span class="linecomment">;; (no error if not found): hexrgb-color-name-to-hex,</span>
                         <span class="linecomment">;; hexrgb-hex-to-rgb, hexrgb-read-color, hexrgb-rgb-to-hsv</span>
(require 'strings nil t) <span class="linecomment">;; (no error if not found): read-number (my version)</span>

(eval-when-compile (require 'icicles-mac))
  <span class="linecomment">;; icicle-define-command, icicle-define-file-command, icicle-define-add-to-alist-command</span>
(require 'icicles-mcmd) <span class="linecomment">;; icicle-search-define-replacement, icicle-yank</span>
(require 'icicles-var)
  <span class="linecomment">;; icicle-bookmark-history, icicle-buffer-config-history, icicle-candidate-action-fn,</span>
  <span class="linecomment">;; icicle-candidate-entry-fn, icicle-candidate-nb, icicle-candidates-alist,</span>
  <span class="linecomment">;; icicle-char-property-value-history, icicle-color-history, icicle-color-theme-history,</span>
  <span class="linecomment">;; icicle-complete-keys-alist, icicle-completion-candidates, icicle-completion-set-history,</span>
  <span class="linecomment">;; icicle-current-input, icicle-dictionary-history,</span>
  <span class="linecomment">;; icicle-extra-candidates, icicle-font-name-history, icicle-frame-name-history,</span>
  <span class="linecomment">;; icicle-function-name-history, icicle-incremental-completion-p, icicle-kill-history,</span>
  <span class="linecomment">;; icicle-kmacro-alist, icicle-kmacro-history, icicle-must-match-regexp,</span>
  <span class="linecomment">;; icicle-must-not-match-regexp, icicle-must-pass-predicate, icicle-re-no-dot,</span>
  <span class="linecomment">;; icicle-saved-completion-candidates, icicle-search-command, icicle-search-current-overlay,</span>
  <span class="linecomment">;; icicle-search-final-choice, icicle-search-history, icicle-search-overlays,</span>
  <span class="linecomment">;; icicle-search-refined-overlays, icicle-variable-name-history</span>
(require 'icicles-opt)
  <span class="linecomment">;; icicle-add-proxy-candidates-flag, icicle-alternative-sort-function, icicle-buffer-configs,</span>
  <span class="linecomment">;; icicle-buffer-extras, icicle-buffer-ignore-space-prefix-flag, icicle-buffer-match-regexp,</span>
  <span class="linecomment">;; icicle-buffer-no-match-regexp, icicle-buffer-predicate, icicle-buffer-require-match-flag,</span>
  <span class="linecomment">;; icicle-buffer-sort, icicle-color-themes, icicle-complete-keys-self-insert-flag,</span>
  <span class="linecomment">;; icicle-ignore-space-prefix-flag, icicle-incremental-completion-flag, icicle-input-string,</span>
  <span class="linecomment">;; icicle-key-descriptions-use-&lt;&gt;-flag, icicle-region-alist, icicle-regions-name-length-max,</span>
  <span class="linecomment">;; icicle-require-match-flag, icicle-saved-completion-sets, icicle-search-cleanup-flag,</span>
  <span class="linecomment">;; icicle-search-highlight-all-current-flag, icicle-search-highlight-threshold,</span>
  <span class="linecomment">;; icicle-search-hook, icicle-show-Completions-initially-flag, icicle-sort-function,</span>
  <span class="linecomment">;; icicle-transform-function, icicle-update-input-hook</span>
(require 'icicles-fn) <span class="linecomment">;; icicle-assoc-delete-all, icicle-completing-read-history,</span>
                      <span class="linecomment">;; icicle-get-alist-candidate, icicle-highlight-lighter, icicle-kill-a-buffer,</span>
                      <span class="linecomment">;; icicle-read-from-minibuf-nil-default.</span>



<span class="linecomment">;; Byte-compiling this file, you will likely get some byte-compiler warning messages.</span>
<span class="linecomment">;; These are probably benign - ignore them.  Icicles is designed to work with multiple</span>
<span class="linecomment">;; versions of Emacs, and that fact provokes compiler warnings.  If you get byte-compiler</span>
<span class="linecomment">;; errors (not warnings), then please report a bug, using `M-x icicle-send-bug-report'.</span>

<span class="linecomment">;;; Some defvars to quiet byte-compiler a bit:</span>

(when (&lt; emacs-major-version 21)
  (defvar eval-expression-debug-on-error))

(when (&lt; emacs-major-version 22)
  (defvar compilation-current-error)
  (defvar compilation-highlight-overlay)
  (defvar cookie-cache)
  (defvar icicle-complete-keys-alist)   <span class="linecomment">; In `icicles-var.el'</span>
  (defvar icicle-kmacro-alist)          <span class="linecomment">; In `icicles-var.el'</span>
  (defvar Info-menu-entry-name-re)      <span class="linecomment">; In `info.el'</span>
  (defvar Info-read-node-completion-table) <span class="linecomment">; In `info.el'</span>
  (defvar kmacro-ring)                  <span class="linecomment">; In `kmacro.el'</span>
  (defvar next-error-hook)              <span class="linecomment">; In `simple.el'</span>
  (defvar recentf-list)                 <span class="linecomment">; In `recentf.el'</span>
  (defvar tags-case-fold-search)        <span class="linecomment">; In `etags.el'</span>
  (defvar yow-after-load-message)
  (defvar yow-file)
  (defvar yow-load-message))

(when (&lt; emacs-major-version 23)
  (defvar read-file-name-completion-ignore-case)) <span class="linecomment">; In `minibuffer.el'</span>

(defvar anything-sources)               <span class="linecomment">; In `anything.el'</span>
(defvar anything-candidate-cache)       <span class="linecomment">; In `anything.el'</span>
(defvar anything-idle-delay)            <span class="linecomment">; In `anything.el'</span>
(defvar bbdb-complete-name-allow-cycling) <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-extract-address-components-func) <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-expand-mail-aliases)       <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-complete-name-hooks)       <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-completion-display-record) <span class="linecomment">; In `bbdb.el'</span>
(defvar bbdb-completion-type)           <span class="linecomment">; In `bbdb.el'</span>
(defvar ess-current-process-name)       <span class="linecomment">; In `ess-inf.el'</span>
(defvar ess-mode-syntax-table)          <span class="linecomment">; In `ess-cust.el'</span>
(defvar ess-use-R-completion)           <span class="linecomment">; In `ess-cust.el'</span>
(defvar filesets-data)                  <span class="linecomment">; In `filesets.el'</span>
(defvar find-tag-marker-ring)           <span class="linecomment">; In `etags.el'</span>
(defvar goto-tag-location-function)     <span class="linecomment">; In `etags.el'</span>
(defvar icicle-clear-history-hist)      <span class="linecomment">; In `icicle-clear-history-1',`icicle-clear-current-history'</span>
(defvar icicle-search-ecm)              <span class="linecomment">; In `icicle-search'</span>
(defvar icicle-track-pt)                <span class="linecomment">; In `icicle-insert-thesaurus-entry'</span>
(defvar icicle-window-alist)            <span class="linecomment">; In `icicle-select-window'</span>
(defvar replace-count)                  <span class="linecomment">; In `replace.el'</span>
(defvar shell-completion-execonly)      <span class="linecomment">; In `shell.el'</span>
(defvar snarf-tag-function)             <span class="linecomment">; In `etags.el'</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>



<span class="linecomment">;;; Commands -----------------------------------------------</span>


<span class="linecomment">;;; Redefined standard commands.............................</span>


<span class="linecomment">;; REPLACE ORIGINAL `pp-eval-expression' defined in `pp.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This is essentially the same as `pp-eval-expression' defined in `pp+.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Use no `emacs-lisp-mode-hook'.</span>
<span class="linecomment">;; 2. Read with completion, using `icicle-read-expression-map'.</span>
<span class="linecomment">;; 3. Call font-lock-fontify-buffer.</span>
<span class="linecomment">;; 4. Progress message added.</span>
<span class="linecomment">;; 5. Added optional arg and insertion behavior.</span>
<span class="linecomment">;; 6. Respect `icicle-pp-eval-expression-print-length', `icicle-pp-eval-expression-print-level',</span>
<span class="linecomment">;;    and `eval-expression-debug-on-error'.</span>
<span class="linecomment">;; 7. Adjusted to work in different Emacs releases.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-pp-eval-expression (expression <span class="linecomment">; Bound to `M-:' in Icicle mode.</span>
                                  &optional insert-value)
  "<span class="quote">Evaluate Emacs-Lisp sexp EXPRESSION and pretty-print its value.
Add the value to the front of the variable `values'.
With a prefix arg, insert the value into the current buffer at point.
With no prefix arg:
 If the value fits on one line (frame width) show it in the echo area.
 Otherwise, show the value in buffer *Pp Eval Output*.

With a negative prefix arg, if the value is a string, then insert it
into the buffer without double-quotes (`\"').

This command respects options
`icicle-pp-eval-expression-print-length',
`icicle-pp-eval-expression-print-level', and
`eval-expression-debug-on-error'.

Emacs-Lisp mode completion and indentation bindings are in effect.

By default, Icicle mode remaps all key sequences that are normally
bound to `eval-expression' or `pp-eval-expression' to
`icicle-pp-eval-expression'.  If you do not want this remapping, then
customize option `icicle-top-level-key-bindings'.</span>"
  (interactive
   (list (read-from-minibuffer "<span class="quote">Eval: </span>" nil icicle-read-expression-map t 'read-expression-history)
         current-prefix-arg))
  (message "<span class="quote">Evaluating...</span>")
  (if (or (not (boundp 'eval-expression-debug-on-error))
          (null eval-expression-debug-on-error))
      (setq values  (cons (eval expression) values))
    (let ((old-value  (make-symbol "<span class="quote">t</span>"))
          new-value)
      <span class="linecomment">;; Bind debug-on-error to something unique so that we can</span>
      <span class="linecomment">;; detect when evaled code changes it.</span>
      (let ((debug-on-error  old-value))
	(setq values     (cons (eval expression) values)
              new-value  debug-on-error))
      <span class="linecomment">;; If evaled code has changed the value of debug-on-error,</span>
      <span class="linecomment">;; propagate that change to the global binding.</span>
      (unless (eq old-value new-value)
	(setq debug-on-error  new-value))))
  (let ((print-length  icicle-pp-eval-expression-print-length)
	(print-level   icicle-pp-eval-expression-print-level))
    (cond (insert-value
           (message "<span class="quote">Evaluating...done. Value inserted.</span>")
           (setq insert-value  (prefix-numeric-value insert-value))
           (if (or (not (stringp (car values))) (wholenump insert-value))
               (pp (car values) (current-buffer))
             (princ (car values) (current-buffer))))
          (t
           (let* ((old-show-function  temp-buffer-show-function)
                  <span class="linecomment">;; Use this function to display the buffer.</span>
                  <span class="linecomment">;; This function either decides not to display it at all</span>
                  <span class="linecomment">;; or displays it in the usual way.</span>
                  (temp-buffer-show-function
                   (function
                    (lambda (buf)
                     (save-excursion
                       (set-buffer buf)
                       (goto-char (point-min))
                       (end-of-line 1)
                       (if (or (&lt; (1+ (point)) (point-max))
                               (&gt;= (- (point) (point-min)) (frame-width)))
                           (let ((temp-buffer-show-function  old-show-function)
                                 (old-selected               (selected-window))
                                 (window                     (display-buffer buf)))
                             (goto-char (point-min)) <span class="linecomment">; expected by some hooks ...</span>
                             (make-frame-visible (window-frame window))
                             (unwind-protect
                                  (progn
                                    (select-window window)
                                    (run-hooks 'temp-buffer-show-hook))
                               (select-window old-selected)
                               (message "<span class="quote">Evaluating...done.  See buffer *Pp Eval Output*.</span>")))
                         (message "<span class="quote">%s</span>" (buffer-substring (point-min) (point)))))))))
             (with-output-to-temp-buffer "<span class="quote">*Pp Eval Output*</span>"
               (pp (car values))
               (with-current-buffer standard-output
                 (setq buffer-read-only  nil)
                 (let ((emacs-lisp-mode-hook    nil)
                       (change-major-mode-hook  nil))
                   (emacs-lisp-mode))
                 (set (make-local-variable 'font-lock-verbose) nil)
                 (font-lock-fontify-buffer))))))))


<span class="linecomment">;; REPLACE ORIGINAL `comint-dynamic-complete' defined in `comint.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses Icicles completion when there are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-comint-dynamic-complete () <span class="linecomment">; Bound to `TAB' in Comint (and Shell) mode.</span>
  "<span class="quote">Dynamically perform completion at point.
Calls the functions in `comint-dynamic-complete-functions', but with
Icicles functions substituted, to perform completion until a function
returns non-nil, at which point completion is assumed to have
occurred.

Uses Icicles completion.</span>"
  (interactive)
  <span class="linecomment">;; Need a symbol for `run-hook-with-args-until-success', so bind one.</span>
  (let ((hook  (icicle-comint-replace-orig-completion-fns)))
    (run-hook-with-args-until-success 'hook)))

(defun icicle-comint-replace-orig-completion-fns ()
  "<span class="quote">Return `comint-dynamic-complete-functions', but with Icicles functions.</span>"
  (let ((old  comint-dynamic-complete-functions)
        (new  ()))
    (while old
      (push (eval `(case (car old)
                    ,@icicle-comint-dynamic-complete-replacements
                    (otherwise  (car old))))
            new)
      (setq old  (cdr old)))
    (nreverse new)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-comint-dynamic-complete-filename ()
  "<span class="quote">Dynamically complete the filename at point.
Completes if after a filename.  See `comint-match-partial-filename' and
`icicle-comint-dynamic-complete-as-filename'.
This function is similar to `comint-replace-by-expanded-filename', except that
it won't change parts of the filename already entered in the buffer; it just
adds completion characters to the end of the filename.  A completions listing
may be shown in a help buffer if completion is ambiguous.

Completion is dependent on the value of `comint-completion-addsuffix',
`comint-completion-recexact' and `comint-completion-fignore', and the timing of
completions listing is dependent on the value of `comint-completion-autolist'.

Returns t if successful.

Uses Icicles completion.</span>"
  (interactive)
  (when (comint-match-partial-filename)
    (unless (window-minibuffer-p (selected-window)) (message "<span class="quote">Completing file name...</span>"))
    (icicle-comint-dynamic-complete-as-filename)))

(defun icicle-comint-dynamic-complete-as-filename ()
  "<span class="quote">Dynamically complete at point as a filename.
See `icicle-comint-dynamic-complete-filename'.
Returns t if successful.</span>"
  (let* ((completion-ignore-case         (if (boundp 'read-file-name-completion-ignore-case)
                                             read-file-name-completion-ignore-case
                                           (memq system-type '(ms-dos windows-nt cygwin))))
	 (completion-ignored-extensions  comint-completion-fignore)
	 (minibuffer-p                   (window-minibuffer-p (selected-window)))
	 (success                        t)
	 (dirsuffix                      (cond ((not comint-completion-addsuffix)         "<span class="quote"></span>")
                                               ((not (consp comint-completion-addsuffix)) "<span class="quote">/</span>")
                                               (t  (car comint-completion-addsuffix))))
	 (filesuffix                     (cond ((not comint-completion-addsuffix)         "<span class="quote"></span>")
                                               ((not (consp comint-completion-addsuffix)) "<span class="quote"> </span>")
                                               (t  (cdr comint-completion-addsuffix))))
	 (filename                       (comint-match-partial-filename))
	 (filename-beg                   (if filename (match-beginning 0) (point)))
	 (filename-end                   (if filename (match-end 0) (point)))
	 (filename                       (or filename "<span class="quote"></span>"))
	 (filedir                        (file-name-directory filename))
	 (filenondir                     (file-name-nondirectory filename))
	 (directory                      (if filedir (comint-directory filedir) default-directory))
	 (completion                     (file-name-completion filenondir directory)))
    (cond ((null completion)
	   (if minibuffer-p
	       (minibuffer-message (format "<span class="quote"> [No completions of `%s']</span>" filename))
	     (message "<span class="quote">No completions of `%s'</span>" filename))
	   (setq success  nil))
	  ((eq completion t)            <span class="linecomment">; Already completed: "the-file".</span>
	   (insert filesuffix)
	   (unless minibuffer-p (message "<span class="quote">Sole completion</span>")))
	  ((string-equal completion "<span class="quote"></span>") <span class="linecomment">; A directory: "dir/" - complete it.</span>
           (condition-case nil
               (let* ((icicle-show-Completions-initially-flag      t)
                      (icicle-incremental-completion-p             'display)
                      (icicle-top-level-when-sole-completion-flag  t)
                      (choice
                       (save-excursion
                         (save-window-excursion (read-file-name "<span class="quote">Complete: </span>" directory nil t)))))
                 (when (and choice (not (string= choice directory)))
                   (insert (comint-quote-filename
                            (file-name-nondirectory (directory-file-name choice))))
                   (insert (if (file-directory-p choice) dirsuffix filesuffix))))
             (error nil)))
	  (t                            <span class="linecomment">; COMPLETION is the common prefix string.</span>
	   (let ((file            (concat (file-name-as-directory directory) completion))
                 (use-dialog-box  nil)) <span class="linecomment">; Inhibit use of open-file dialog box if called from menu.</span>
	     <span class="linecomment">;; Insert completion.  The completion string might have a different case from</span>
             <span class="linecomment">;; what's in the prompt, if `read-file-name-completion-ignore-case' is non-nil.</span>
	     (delete-region filename-beg filename-end)
	     (if filedir (insert (comint-quote-filename filedir)))
	     (insert (comint-quote-filename (directory-file-name completion)))
	     (cond ((symbolp (file-name-completion completion directory))
		    <span class="linecomment">;; We inserted a unique completion.  Add suffix.</span>
		    (insert (if (file-directory-p file) dirsuffix filesuffix))
		    (unless minibuffer-p (message "<span class="quote">Completed</span>")))
		   ((and comint-completion-recexact comint-completion-addsuffix
			 (string-equal filenondir completion)
			 (file-exists-p file))
		    <span class="linecomment">;; It's not unique, but user wants shortest match.</span>
		    (insert (if (file-directory-p file) dirsuffix filesuffix))
		    (unless minibuffer-p (message "<span class="quote">Completed shortest</span>")))
		   ((or comint-completion-autolist (string-equal filenondir completion))
                    (condition-case nil <span class="linecomment">; It's not unique.  Let user choose a completion.</span>
                        (let* ((icicle-show-Completions-initially-flag      t)
                               (icicle-incremental-completion-p             'display)
                               (icicle-top-level-when-sole-completion-flag  t)
                               (choice
                                (save-excursion
                                  (save-window-excursion
                                    (read-file-name
                                     "<span class="quote">Complete: </span>" directory completion nil completion
                                     (and (&gt; emacs-major-version 21)
                                          (lambda (f) (string-match completion f))))))))
                          (when choice
                            (delete-backward-char (length completion))
                            (insert (comint-quote-filename
                                     (file-name-nondirectory (directory-file-name choice))))
                            (insert (if (file-directory-p choice) dirsuffix filesuffix))))
                      (error nil)))
		   (t (unless minibuffer-p (message "<span class="quote">Partially completed</span>")))))))
    success))

<span class="linecomment">;;;###autoload</span>
(defun icicle-shell-dynamic-complete-command ()
  "<span class="quote">Dynamically complete the command at point.
Similar to `icicle-comint-dynamic-complete-filename', but this
searches `exec-path' (minus the trailing Emacs library path) for
completion candidates.  Note that this may not be the same as the
shell's idea of the path.

Completion is dependent on the value of `shell-completion-execonly',
plus those that effect file completion.
See `icicle-shell-dynamic-complete-as-command'.

Returns t if successful.

Uses Icicles completion.</span>"
  (interactive)
  (let ((filename  (comint-match-partial-filename)))
    (if (and filename
	     (save-match-data (not (string-match "<span class="quote">[~/]</span>" filename)))
	     (eq (match-beginning 0) (save-excursion (shell-backward-command 1) (point))))
	(prog2 (unless (window-minibuffer-p (selected-window))
		 (message "<span class="quote">Completing command name...</span>"))
	    (icicle-shell-dynamic-complete-as-command)))))

(defun icicle-shell-dynamic-complete-as-command ()
  "<span class="quote">Dynamically complete text at point as a command.
See `icicle-shell-dynamic-complete-filename'.
Return t if successful.</span>"
  (let* ((filename       (or (comint-match-partial-filename) "<span class="quote"></span>"))
	 (filenondir     (file-name-nondirectory filename))
	 (path-dirs      (cdr (reverse exec-path)))
	 (cwd            (file-name-as-directory (expand-file-name default-directory)))
	 (ignored-extensions
	  (and comint-completion-fignore
	       (mapconcat (function (lambda (x) (concat (regexp-quote x) "<span class="quote">$</span>")))
			  comint-completion-fignore "<span class="quote">\\|</span>")))
	 (dir            "<span class="quote"></span>")
         (comps-in-dir   ())
	 (file           "<span class="quote"></span>")
         (abs-file-name  "<span class="quote"></span>")
         (completions    ()))
    (while path-dirs                    <span class="linecomment">; Go thru each dir in the search path, finding completions.</span>
      (setq dir           (file-name-as-directory (comint-directory (or (car path-dirs) "<span class="quote">.</span>")))
	    comps-in-dir  (and (file-accessible-directory-p dir)
			       (file-name-all-completions filenondir dir)))
      (while comps-in-dir               <span class="linecomment">; Go thru each completion, to see whether it should be used.</span>
	(setq file           (car comps-in-dir)
	      abs-file-name  (concat dir file))
	(when (and (not (member file completions))
                   (not (and ignored-extensions (string-match ignored-extensions file)))
                   (or (string-equal dir cwd) (not (file-directory-p abs-file-name)))
                   (or (null shell-completion-execonly) (file-executable-p abs-file-name)))
          (setq completions  (cons file completions)))
	(setq comps-in-dir  (cdr comps-in-dir)))
      (setq path-dirs  (cdr path-dirs)))
    (let ((success  (let ((comint-completion-addsuffix  nil)
                          (icicle-candidate-help-fn
                           (lambda (cand)
                             (shell-command (concat "<span class="quote">apropos </span>" (shell-quote-argument cand))
                                            "<span class="quote">*Help*</span>"))))
                      (icicle-comint-dynamic-simple-complete filenondir completions))))
      (when (and (memq success '(sole shortest)) comint-completion-addsuffix
                 (not (file-directory-p (comint-match-partial-filename))))
        (insert "<span class="quote"> </span>"))
      success)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-comint-replace-by-expanded-filename ()
  "<span class="quote">`comint-replace-by-expanded-filename', but uses Icicles completion.
Dynamically complete, expand, and canonicalize the filename at point.</span>"
  (interactive)
  (let ((filename  (comint-match-partial-filename)))
    (when filename
      (replace-match (expand-file-name filename) t t)
      (icicle-comint-dynamic-complete-filename))))

(defun icicle-comint-dynamic-simple-complete (stub candidates)
  "<span class="quote">Dynamically complete STUB from CANDIDATES list.
Inserts completion characters at point by completing STUB from the
strings in CANDIDATES.  Uses Icicles completion if completion is
ambiguous.

Returns nil if no completion was inserted.
Returns `sole' if completed with the only completion match.
Returns `shortest' if completed with the shortest of the completion matches.
Returns `partial' if completed as far as possible with the completion matches.
Returns `listed' if a completion listing was shown.

See also `icicle-comint-dynamic-complete-filename'.</span>"
  (let* ((completion-ignore-case  (memq system-type '(ms-dos windows-nt cygwin)))
	 (minibuffer-p            (window-minibuffer-p (selected-window)))
	 (suffix                  (cond ((not comint-completion-addsuffix)         "<span class="quote"></span>")
                                        ((not (consp comint-completion-addsuffix)) "<span class="quote"> </span>")
                                        (t  (cdr comint-completion-addsuffix))))
         (candidates              (mapcar #'list candidates))
	 (completions             (all-completions stub candidates)))
    (cond ((null completions)
	   (if minibuffer-p
	       (minibuffer-message (format "<span class="quote"> [No completions of `%s']</span>" stub))
	     (message "<span class="quote">No completions of `%s'</span>" stub))
	   nil)
	  ((= 1 (length completions))
	   (let ((completion  (car completions)))
	     (if (string-equal completion stub)
		 (unless minibuffer-p (message "<span class="quote">Sole completion</span>"))
	       (insert (substring completion (length stub)))
	       (unless minibuffer-p (message "<span class="quote">Completed</span>")))
	     (insert suffix)
	     'sole))
	  (t				<span class="linecomment">; There's no unique completion.</span>
	   (let ((completion  (try-completion stub candidates)))
	     <span class="linecomment">;; Insert the longest substring.</span>
	     (insert (substring completion (length stub)))
	     (cond ((and comint-completion-recexact comint-completion-addsuffix
			 (string-equal stub completion)
			 (member completion completions))
		    (insert suffix)     <span class="linecomment">; User wants shortest match.</span>
		    (unless minibuffer-p (message "<span class="quote">Completed shortest</span>"))
		    'shortest)
		   ((or comint-completion-autolist (string-equal stub completion))
                    (condition-case nil <span class="linecomment">;  Let user choose a completion.</span>
                        (let* ((icicle-show-Completions-initially-flag      t)
                               (icicle-incremental-completion-p             'display)
                               (icicle-top-level-when-sole-completion-flag  t)
                               (choice (save-excursion
                                         (completing-read "<span class="quote">Complete: </span>" (mapcar #'list completions)
                                                          nil t nil nil completion))))
                          (when choice
                            (delete-backward-char (length completion))
                            (insert choice suffix)))
                      (error nil))
		    'listed)
		   (t
		    (unless minibuffer-p (message "<span class="quote">Partially completed</span>"))
		    'partial)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-shell-dynamic-complete-filename ()
  "<span class="quote">Dynamically complete the filename at point.
Completes only if point is at a suitable position for a filename
argument.</span>"
  (interactive)
  (let ((opoint  (point))
	(beg     (comint-line-beginning-position)))
    (when (save-excursion
	    (goto-char (if (re-search-backward "<span class="quote">[;|&]</span>" beg t) (match-end 0) beg))
	    (re-search-forward "<span class="quote">[^ \t][ \t]</span>" opoint t))
      (icicle-comint-dynamic-complete-as-filename))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-shell-dynamic-complete-environment-variable ()
  "<span class="quote">`shell-dynamic-complete-environment-variable' but uses Icicles completion.</span>"
  (interactive)
  (require 'shell)
  (let ((variable  (shell-match-partial-variable)))
    (if (and variable (string-match "<span class="quote">^\\$</span>" variable))
	(prog2 (unless (window-minibuffer-p (selected-window))
		 (message "<span class="quote">Completing variable name...</span>"))
	    (icicle-shell-dynamic-complete-as-environment-variable)))))

(defun icicle-shell-dynamic-complete-as-environment-variable ()
  "<span class="quote">`shell-dynamic-complete-as-environment-variable' but uses Icicles completion.</span>"
  (require 'shell)
  (let* ((var                          (or (shell-match-partial-variable) "<span class="quote"></span>"))
	 (variable                     (substring var (or (string-match "<span class="quote">[^$({]\\|$</span>" var) 0)))
	 (variables                    (mapcar (lambda (x) (substring x 0 (string-match "<span class="quote">=</span>" x)))
                                               process-environment))
	 (addsuffix                    comint-completion-addsuffix)
	 (comint-completion-addsuffix  nil)
	 (success                      (icicle-comint-dynamic-simple-complete variable variables)))
    (if (memq success '(sole shortest))
	(let* ((var           (shell-match-partial-variable))
	       (variable      (substring var (string-match "<span class="quote">[^$({]</span>" var)))
	       (protection    (cond ((string-match "<span class="quote">{</span>" var) "<span class="quote">}</span>")
                                    ((string-match "<span class="quote">(</span>" var) "<span class="quote">)</span>")
                                    (t "<span class="quote"></span>")))
	       (suffix        (cond ((null addsuffix) "<span class="quote"></span>")
                                    ((file-directory-p
                                      (comint-directory (getenv variable))) "<span class="quote">/</span>")
                                    (t "<span class="quote"> </span>"))))
	  (insert protection  suffix)))
    success))

<span class="linecomment">;;;###autoload</span>
(defun icicle-ess-complete-object-name (&optional listcomp)
  "<span class="quote">`ess-complete-object-name', but uses Icicles completion.
Complete `ess-language' object preceding point.
This is `icicle-ess-R-complete-object-name' if `ess-use-R-completion',
and `icicle-ess-internal-complete-object-name' otherwise.</span>"
  (interactive "<span class="quote">P</span>")
  (if ess-use-R-completion
      (icicle-ess-R-complete-object-name)
    (icicle-ess-internal-complete-object-name listcomp)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-ess-internal-complete-object-name (&optional listcomp)
  "<span class="quote">`ess-internal-complete-object-name', but uses Icicles completion.
Complete `ess-language' object preceding point.</span>"
  (interactive "<span class="quote">P</span>")
  (ess-make-buffer-current)
  (if (memq (char-syntax (preceding-char)) '(?w ?_))
      (let* ((comint-completion-addsuffix  nil)
	     (end                          (point))
	     (buffer-syntax                (syntax-table))
	     (beg                          (unwind-protect
                                                (save-excursion
                                                  (set-syntax-table ess-mode-syntax-table)
                                                  (backward-sexp 1)
                                                  (point))
                                             (set-syntax-table buffer-syntax)))
	     (full-prefix                  (buffer-substring beg end))
	     (pattern                      full-prefix)
	     (listname                  <span class="linecomment">; See if we're indexing a list with `$'</span>
              (and (string-match "<span class="quote">\\(.+\\)\\$\\(\\(\\sw\\|\\s_\\)*\\)$</span>" full-prefix)
                   (setq pattern  (if (not (match-beginning 2))
                                      "<span class="quote"></span>"
                                    (substring full-prefix (match-beginning 2) (match-end 2))))
                   (substring full-prefix (match-beginning 1) (match-end 1))))
	     (classname                 <span class="linecomment">; Are we trying to get a slot via `@' ?</span>
              (and (string-match "<span class="quote">\\(.+\\)@\\(\\(\\sw\\|\\s_\\)*\\)$</span>" full-prefix)
                   (setq pattern  (if (not (match-beginning 2))
                                      "<span class="quote"></span>"
                                    (substring full-prefix (match-beginning 2) (match-end 2))))
                   (progn (ess-write-to-dribble-buffer (format "<span class="quote">(ess-C-O-Name : slots..) : patt=%s</span>"
                                                               pattern))
                          (substring full-prefix (match-beginning 1) (match-end 1)))))
	     (components
              (if listname
                  (ess-object-names listname)
                (if classname
                    (ess-slot-names classname)
                  <span class="linecomment">;; Default case: It hangs here when options (error=recoves):</span>
                  (ess-get-object-list ess-current-process-name)))))
	<span class="linecomment">;; Return non-nil to prevent history expansions</span>
	(or (icicle-comint-dynamic-simple-complete  pattern components) 'none))))

(defun icicle-ess-complete-filename ()
  "<span class="quote">`ess-complete-filename', but uses Icicles completion.
Do file completion only within strings, or when `!' call is used.</span>"
  (if (comint-within-quotes
       (1- (process-mark (get-buffer-process (current-buffer)))) (point))
      (progn (if (featurep 'xemacs)
                 (icicle-comint-dynamic-complete-filename) <span class="linecomment">; Work around XEmacs bug.  GNU Emacs and</span>
               (icicle-comint-replace-by-expanded-filename)) <span class="linecomment">; a working XEmacs return t in a string</span>
             t)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-ess-R-complete-object-name ()
  "<span class="quote">`ess-R-complete-object-name', but uses Icicles completion.
Completion in R.</span>"
  (interactive)
  (ess-make-buffer-current)
  (let* ((comint-completion-addsuffix  nil)
	 (beg-of-line                  (save-excursion (comint-bol nil) (point)))
	 (end-of-line                  (point-at-eol))
	 (line-buffer                  (buffer-substring beg-of-line end-of-line))
	 (NS                           (if (ess-current-R-at-least '2.7.0)
                                           "<span class="quote">utils:::</span>"
                                         "<span class="quote">rcompgen:::</span>"))
	 (token-string                  <span class="linecomment">; Setup, including computation of the token</span>
	  (progn
	    (ess-command (format (concat NS "<span class="quote">.assignLinebuffer('%s')\n</span>") line-buffer))
	    (ess-command (format (concat NS "<span class="quote">.assignEnd(%d)\n</span>") (- (point) beg-of-line)))
	    (car (ess-get-words-from-vector (concat NS "<span class="quote">.guessTokenFromLine()\n</span>")))))
	 (possible-completions          <span class="linecomment">; Compute and retrieve possible completions</span>
	  (progn
	    (ess-command (concat NS "<span class="quote">.completeToken()\n</span>"))
	    (ess-get-words-from-vector (concat NS "<span class="quote">.retrieveCompletions()\n</span>")))))
    (or (icicle-comint-dynamic-simple-complete token-string possible-completions) 'none)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-gud-gdb-complete-command (&optional command a b)
  "<span class="quote">`gud-gdb-complete-command', but uses Icicles completion.
Perform completion on the GDB command preceding point.</span>"
  (interactive)
  (if command
      (setq command  (concat "<span class="quote">p </span>" command)) <span class="linecomment">; Used by gud-watch in mini-buffer.</span>
    (let ((end  (point)))               <span class="linecomment">; Used in GUD buffer.</span>
      (setq command  (buffer-substring (comint-line-beginning-position) end))))
  (let* ((command-word
	  <span class="linecomment">;; Find the word break.  This match will always succeed.</span>
	  (and (string-match "<span class="quote">\\(\\`\\| \\)\\([^ ]*\\)\\'</span>" command)
	       (substring command (match-beginning 2))))
	 (complete-list
	  (gud-gdb-run-command-fetch-lines (concat "<span class="quote">complete </span>" command)
					   (current-buffer)
					   <span class="linecomment">;; From string-match above.</span>
					   (match-beginning 2))))
    <span class="linecomment">;; Protect against old versions of GDB.</span>
    (and complete-list
	 (string-match "<span class="quote">^Undefined command: \"complete\"</span>" (car complete-list))
	 (error "<span class="quote">This version of GDB doesn't support the `complete' command</span>"))
    <span class="linecomment">;; Sort the list like readline.</span>
    (setq complete-list  (sort complete-list (function string-lessp)))
    <span class="linecomment">;; Remove duplicates.</span>
    (let ((first   complete-list)
	  (second  (cdr complete-list)))
      (while second
	(if (string-equal (car first) (car second))
	    (setcdr first (setq second  (cdr second)))
	  (setq first   second
		second  (cdr second)))))
    <span class="linecomment">;; Add a trailing single quote if there is a unique completion</span>
    <span class="linecomment">;; and it contains an odd number of unquoted single quotes.</span>
    (and (= (length complete-list) 1)
	 (let ((str    (car complete-list))
	       (pos    0)
	       (count  0))
	   (while (string-match "<span class="quote">\\([^'\\]\\|\\\\'\\)*'</span>" str pos)
	     (setq count  (1+ count)
		   pos    (match-end 0)))
	   (and (= (mod count 2) 1)
		(setq complete-list  (list (concat str "<span class="quote">'</span>"))))))
    <span class="linecomment">;; Let comint handle the rest.</span>
    (icicle-comint-dynamic-simple-complete command-word complete-list)))


<span class="linecomment">;; REPLACE ORIGINAL `dabbrev-completion' defined in `dabbrev.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You can complete from an empty abbrev also.</span>
<span class="linecomment">;; Uses Icicles completion when there are multiple candidates.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-dabbrev-completion)
(fset 'old-dabbrev-completion (symbol-function 'dabbrev-completion)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dabbrev-completion (&optional arg) <span class="linecomment">; Bound to `C-M-/' globally.</span>
  "<span class="quote">Completion on current word.
Like \\[dabbrev-expand], but finds all expansions in the current buffer
and presents suggestions for completion.

With a prefix argument, it searches all buffers accepted by
`dabbrev-friend-buffer-function', to find the completions.

If the prefix argument is 16 (which comes from `C-u C-u'), then it
searches *ALL* buffers.

With no prefix argument, it reuses an old completion list
if there is a suitable one already.</span>"
  (interactive "<span class="quote">*P</span>")
  (unless (featurep 'dabbrev)
    (unless (require 'dabbrev nil t) (error "<span class="quote">Library `dabbrev' not found</span>"))
    (icicle-mode 1))                    <span class="linecomment">; Redefine `dabbrev-completion' to Icicles version.</span>
  (dabbrev--reset-global-variables)
  (let* ((dabbrev-check-other-buffers  (and arg t))
         (dabbrev-check-all-buffers    (and arg (= (prefix-numeric-value arg) 16)))
         (abbrev                       (icicle-dabbrev--abbrev-at-point))
         (ignore-case-p                (and (if (eq dabbrev-case-fold-search 'case-fold-search)
                                                case-fold-search
                                              dabbrev-case-fold-search)
                                            (or (not dabbrev-upcase-means-case-search)
                                                (string= abbrev (downcase abbrev)))))
         (my-obarray                   dabbrev--last-obarray)
         init)
    <span class="linecomment">;; If new abbreviation to expand, then expand it.</span>
    (save-excursion
      (unless (and (null arg)
                   my-obarray
                   (or (eq dabbrev--last-completion-buffer (current-buffer))
                       (and (window-minibuffer-p (selected-window))
                            (eq dabbrev--last-completion-buffer
                                (dabbrev--minibuffer-origin))))
                   dabbrev--last-abbreviation
                   (&gt;= (length abbrev) (length dabbrev--last-abbreviation))
                   (string= dabbrev--last-abbreviation
                            (substring abbrev 0 (length dabbrev--last-abbreviation)))
                   (setq init  (try-completion abbrev my-obarray)))
        (setq dabbrev--last-abbreviation  abbrev)
        (let ((completion-list         (dabbrev--find-all-expansions abbrev ignore-case-p))
              (completion-ignore-case  ignore-case-p))
          <span class="linecomment">;; Make an obarray with all expansions</span>
          (setq my-obarray  (make-vector (length completion-list) 0))
          (unless (&gt; (length my-obarray) 0)
            (error "<span class="quote">No dynamic expansion for \"%s\" found%s</span>" abbrev
                   (if dabbrev--check-other-buffers "<span class="quote"></span>" "<span class="quote"> in this-buffer</span>")))
          (dolist (string completion-list)
            (cond ((or (not ignore-case-p) (not dabbrev-case-replace))
                   (intern string my-obarray))
                  ((string= abbrev (upcase abbrev))
                   (intern (upcase string) my-obarray))
                  ((string= (substring abbrev 0 1) (upcase (substring abbrev 0 1)))
                   (intern (capitalize string) my-obarray))
                  (t (intern (downcase string) my-obarray))))
          (setq dabbrev--last-obarray            my-obarray
                dabbrev--last-completion-buffer  (current-buffer)
                <span class="linecomment">;; Find the expanded common string.</span>
                init                             (try-completion abbrev my-obarray)))))
    <span class="linecomment">;; Let the user choose between the expansions</span>
    (unless (stringp init) (setq init  abbrev))
    (cond
      ((and (not (string-equal init "<span class="quote"></span>"))
            (not (string-equal (downcase init) (downcase abbrev)))
            (&lt;= (length (all-completions init my-obarray)) 1))
       (message "<span class="quote">Completed (no other completions)</span>")
       (if (&lt; emacs-major-version 21)
           (dabbrev--substitute-expansion nil abbrev init)
         (dabbrev--substitute-expansion nil abbrev init nil))
       (when (window-minibuffer-p (selected-window)) (message nil)))
<span class="linecomment">;;$$       ;; Complete text only up through the common root. NOT USED.</span>
<span class="linecomment">;;       ((and icicle-dabbrev-stop-at-common-root-p</span>
<span class="linecomment">;;             (not (string-equal init ""))</span>
<span class="linecomment">;;             (not (string-equal (downcase init) (downcase abbrev))))</span>
<span class="linecomment">;;        (message "Use `%s' again to complete further"</span>
<span class="linecomment">;;                 (icicle-key-description (this-command-keys)</span>
<span class="linecomment">;;                                         (not icicle-key-descriptions-use-&lt;&gt;-flag)))</span>
<span class="linecomment">;;        (if (&lt; emacs-major-version 21)</span>
<span class="linecomment">;;            (dabbrev--substitute-expansion nil abbrev init)</span>
<span class="linecomment">;;          (dabbrev--substitute-expansion nil abbrev init nil))</span>
<span class="linecomment">;;        (when (window-minibuffer-p (selected-window)) (message nil))) ; $$ NEEDED?</span>
      (t
       <span class="linecomment">;; String is a common root already.  Use Icicles completion.</span>
       (icicle-highlight-lighter)
       (message "<span class="quote">Making completion list...</span>")
       (search-backward abbrev)
       (replace-match "<span class="quote"></span>")
       (condition-case nil
           (let* ((icicle-show-Completions-initially-flag  t)
                  (icicle-incremental-completion-p         'display)
                  (minibuffer-completion-table             my-obarray)
                  (choice
                   (completing-read "<span class="quote">Complete: </span>" my-obarray nil nil init nil init)))
             (when choice (insert choice)))
         (quit (insert abbrev)))))))

(defun icicle-dabbrev--abbrev-at-point ()
  "<span class="quote">Like `dabbrev--abbrev-at-point', but returns \"\" if there is no match.
Vanilla `dabbrev--abbrev-at-point' raises an error if no match.</span>"
  (let ((abv "<span class="quote"></span>"))
    (setq dabbrev--last-abbrev-location  (point)) <span class="linecomment">; Record the end of the abbreviation.</span>
    (unless (bobp)
      (save-excursion                   <span class="linecomment">; Return abbrev at point</span>
        <span class="linecomment">;; If we aren't right after an abbreviation, move point back to just after one.</span>
        <span class="linecomment">;; This is so the user can get successive words by typing the punctuation followed by M-/.</span>
        (save-match-data
          (when (and (save-excursion
                       (forward-char -1)
                       (not (looking-at
                             (concat "<span class="quote">\\(</span>" (or dabbrev-abbrev-char-regexp "<span class="quote">\\sw\\|\\s_</span>") "<span class="quote">\\)+</span>"))))
                     (re-search-backward (or dabbrev-abbrev-char-regexp "<span class="quote">\\sw\\|\\s_</span>") nil t))
            (forward-char 1)))
        (dabbrev--goto-start-of-abbrev) <span class="linecomment">; Now find the beginning of that one.</span>
        (setq abv  (buffer-substring-no-properties dabbrev--last-abbrev-location (point)))))
    abv))


<span class="linecomment">;; REPLACE ORIGINAL `bbdb-complete-name' defined in `bbdb-com.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;; Note: BBDB, the Insidious Big Brother Database, is available here:</span>
<span class="linecomment">;;       http://bbdb.sourceforge.net/.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses Icicles completion when there are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Free vars here: `bbdb-*' are bound in `bbdb-com.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-bbdb-complete-name (&optional start-pos)
  "<span class="quote">Complete the user full-name or net-address before point.
Completes only up to the preceding newline, colon, or comma, or the
value of START-POS.

If what has been typed is unique, insert an entry of the form \"User
Name &lt;net-addr&gt;\" (but see `bbdb-dwim-net-address-allow-redundancy').
If it is a valid completion but not unique, you can choose from the
list of completions using Icicles completion.

If your input is completed and `bbdb-complete-name-allow-cycling' is
true, then you can repeat to cycle through the nets for the matching
record.

When called with a prefix arg, display a list of all nets.  You can
control completion behaviour using `bbdb-completion-type'.</span>"
  (interactive)
  (unless (and (require 'bbdb nil t) (require 'bbdb-com nil t))
    (error "<span class="quote">`icicle-bbdb-complete-name' requires BBDB</span>"))
  (let* ((end                  (point))
         (beg                  (or start-pos (save-excursion (re-search-backward
                                                              "<span class="quote">\\(\\`\\|[\n:,]\\)[ \t]*</span>")
                                                             (goto-char (match-end 0)) (point))))
         (orig                 (buffer-substring beg end))
         (typed                (downcase orig))
         (pattern              (bbdb-string-trim typed))
         (ht                   (bbdb-hashtable))
         <span class="linecomment">;; Make a list of possible completion strings (all-the-completions), and a flag to</span>
         <span class="linecomment">;; indicate if there's a single matching record or not (only-one-p)</span>
         (only-one-p           t)
         (all-the-completions  nil)
         (pred
          (lambda (sym)
            (when (bbdb-completion-predicate sym)
              (when (and only-one-p all-the-completions
                         (or
                          <span class="linecomment">;; Not sure about this. more than one record</span>
                          <span class="linecomment">;; attached to the symbol? Does that happen?</span>
                          (&gt; (length (symbol-value sym)) 1)
                          <span class="linecomment">;; This is the doozy, though. Multiple syms</span>
                          <span class="linecomment">;; which all match the same record</span>
                          (delete t (mapcar (lambda(x)
                                              (equal (symbol-value x) (symbol-value sym)))
                                            all-the-completions))))
                (setq only-one-p  nil))
              (if (memq sym all-the-completions)
                  nil
                (setq all-the-completions  (cons sym all-the-completions))))))
         (completion           (progn (all-completions pattern ht pred)
                                      (try-completion pattern ht)))
         (exact-match          (eq completion t)))
    (cond
      <span class="linecomment">;; No matches found OR you're trying completion on an</span>
      <span class="linecomment">;; already-completed record. In the latter case, we might have to</span>
      <span class="linecomment">;; cycle through the nets for that record.</span>
      ((or (null completion)
           (and bbdb-complete-name-allow-cycling
                exact-match             <span class="linecomment">; Which is a net of the record</span>
                (member orig (bbdb-record-net (car (symbol-value (intern-soft pattern ht)))))))
       (bbdb-complete-name-cleanup)     <span class="linecomment">; Clean up the completion buffer, if it exists</span>
       <span class="linecomment">;; Check for cycling</span>
       (unless (catch 'bbdb-cycling-exit
                 <span class="linecomment">;; Jump straight out if we're not cycling</span>
                 (unless bbdb-complete-name-allow-cycling (throw 'bbdb-cycling-exit nil))
                 <span class="linecomment">;; Find the record we're working on.</span>
                 (let* ((addr  (funcall bbdb-extract-address-components-func orig))
                        (rec  (and (listp addr)
                                   <span class="linecomment">;; For now, we ignore the case where this returns more than one</span>
                                   <span class="linecomment">;; record. Ideally, the last expansion would be stored in a</span>
                                   <span class="linecomment">;; buffer-local variable, perhaps.</span>
                                   (car (bbdb-search-intertwingle (caar addr) (car (cdar addr)))))))
                   (unless rec (throw 'bbdb-cycling-exit nil))
                   (if current-prefix-arg
                       <span class="linecomment">;; Use completion buffer</span>
                       (let ((standard-output  (get-buffer-create "<span class="quote">*Completions*</span>")))
                         <span class="linecomment">;; A previously existing buffer has to be cleaned first</span>
                         (save-excursion (set-buffer standard-output)
                                         (setq buffer-read-only  nil)
                                         (erase-buffer))
                         (display-completion-list
                          (mapcar (lambda (n) (bbdb-dwim-net-address rec n))
                                  (bbdb-record-net rec)))
                         (delete-region beg end)
                         (switch-to-buffer standard-output))
                     <span class="linecomment">;; Use next address</span>
                     (let* ((addrs      (bbdb-record-net rec))
                            (this-addr  (or (cadr (member (car (cdar addr)) addrs))
                                            (nth 0 addrs))))
                       (if (= (length addrs) 1)
                           (throw 'bbdb-cycling-exit t) <span class="linecomment">; No alternatives. don't signal an error.</span>
                         <span class="linecomment">;; Replace with new mail address</span>
                         (delete-region beg end)
                         (insert (bbdb-dwim-net-address rec this-addr))
                         (run-hooks 'bbdb-complete-name-hooks)
                         (throw 'bbdb-cycling-exit t))))))
         <span class="linecomment">;; FALL THROUGH.  Check mail aliases</span>
         (when (and (or (not bbdb-expand-mail-aliases) (not (expand-abbrev)))
                    bbdb-complete-name-hooks)
           (message "<span class="quote">No completion for `%s'</span>" pattern) (icicle-ding)))) <span class="linecomment">; no matches</span>
      <span class="linecomment">;; Match for a single record. If cycling is enabled then we don't</span>
      <span class="linecomment">;; care too much about the exact-match part.</span>
      ((and only-one-p (or exact-match bbdb-complete-name-allow-cycling))
       (let* ((sym   (if exact-match (intern-soft pattern ht) (car all-the-completions)))
              (recs  (symbol-value sym))
              the-net match-recs lst primary matched)
         (while recs
           (when (bbdb-record-net (car recs))
             <span class="linecomment">;; Did we match on name?</span>
             (let ((b-r-name  (or (bbdb-record-name (car recs)) "<span class="quote"></span>")))
               (if (string= pattern (substring (downcase b-r-name) 0
                                               (min (length b-r-name) (length pattern))))
                   (setq match-recs  (cons (car recs) match-recs)
                         matched     t)))
             <span class="linecomment">;; Did we match on aka?</span>
             (unless matched
               (setq lst  (bbdb-record-aka (car recs)))
               (while lst
                 (if (string= pattern (substring (downcase (car lst)) 0
                                                 (min (length (downcase (car lst)))
                                                      (length pattern))))
                     (setq match-recs  (append match-recs (list (car recs)))
                           matched     t
                           lst         ())
                   (setq lst  (cdr lst)))))
             <span class="linecomment">;; Name didn't match name so check net matching</span>
             (unless matched
               (setq lst      (bbdb-record-net (car recs))
                     primary  t)        <span class="linecomment">; primary wins over secondary...</span>
               (while lst
                 (if (string= pattern (substring (downcase (car lst)) 0
                                                 (min (length (downcase (car lst)))
                                                      (length pattern))))
                     (setq the-net     (car lst)
                           lst         nil
                           match-recs  (if primary
                                           (cons (car recs) match-recs)
                                         (append match-recs (list (car recs))))))
                 (setq lst      (cdr lst)
                       primary  nil))))
           <span class="linecomment">;; loop to next rec</span>
           (setq recs     (cdr recs)
                 matched  nil))
         (unless match-recs (error "<span class="quote">Only exact matching record has net field</span>"))
         <span class="linecomment">;; now replace the text with the expansion</span>
         (delete-region beg end)
         (insert (bbdb-dwim-net-address (car match-recs) the-net))
         <span class="linecomment">;; if we're past fill-column, wrap at the previous comma.</span>
         (when (and (bbdb-auto-fill-function) (&gt;= (current-column) fill-column))
           (let ((p  (point))
                 bol)
             (save-excursion
               (beginning-of-line)
               (setq bol  (point))
               (goto-char p)
               (when (search-backward "<span class="quote">,</span>" bol t) (forward-char 1) (insert "<span class="quote">\n   </span>")))))
         <span class="linecomment">;; Update the *BBDB* buffer if desired.</span>
         (when bbdb-completion-display-record
           (let ((bbdb-gag-messages  t))
             (bbdb-pop-up-bbdb-buffer)
             (bbdb-display-records-1 match-recs t)))
         (bbdb-complete-name-cleanup)
         <span class="linecomment">;; Call the exact-completion hook</span>
         (run-hooks 'bbdb-complete-name-hooks)))
      <span class="linecomment">;; Partial match</span>
      <span class="linecomment">;; note, we can't use the trimmed version of the pattern here or</span>
      <span class="linecomment">;; we'll recurse infinitely on e.g. common first names</span>
      ((and (stringp completion) (not (string= typed completion)))
       (delete-region beg end)
       (insert completion)
       (setq end  (point))
       (let ((last                              "<span class="quote"></span>")
             (bbdb-complete-name-allow-cycling  nil))
         (while (and (stringp completion) (not (string= completion last))
                     (setq last        completion
                           pattern     (downcase orig)
                           completion  (progn (all-completions pattern ht pred)
                                              (try-completion pattern ht))))
           (when (stringp completion) (delete-region beg end) (insert completion)))
         (bbdb-complete-name beg)))     <span class="linecomment">; RECURSE &lt;================</span>
      <span class="linecomment">;; Exact match, but more than one record</span>
      (t
       (unless (eq (selected-window) (minibuffer-window)) (message "<span class="quote">Making completion list...</span>"))
       (let (dwim-completions uniq nets net name akas)
         <span class="linecomment">;; Collect all the dwim-addresses for each completion, but only once for each record.</span>
         <span class="linecomment">;; Add if the net is part of the completions.</span>
         (bbdb-mapc (lambda (sym)
                      (bbdb-mapc (lambda (rec)
                                   (unless (member rec uniq)
                                     (setq uniq  (cons rec uniq)
                                           nets  (bbdb-record-net rec)
                                           name  (downcase (or (bbdb-record-name rec) "<span class="quote"></span>"))
                                           akas  (mapcar 'downcase (bbdb-record-aka rec)))
                                     (while nets
                                       (setq net  (car nets))
                                       (when (cond
                                               ((and (member bbdb-completion-type <span class="linecomment">; Primary</span>
                                                             '(primary primary-or-name))
                                                     (member (intern-soft (downcase net) ht)
                                                             all-the-completions))
                                                (setq nets  ())
                                                t)
                                               ((and name (member bbdb-completion-type <span class="linecomment">; Name</span>
                                                                  '(nil name primary-or-name))
                                                     (let ((cname  (symbol-name sym)))
                                                       (or (string= cname name)
                                                           (member cname akas))))
                                                (setq name  nil)
                                                t)
                                               ((and (member bbdb-completion-type '(nil net)) <span class="linecomment">; Net</span>
                                                     (member (intern-soft (downcase net) ht)
                                                             all-the-completions)))
                                               <span class="linecomment">;; (name-or-)primary</span>
                                               ((and (member bbdb-completion-type
                                                             '(name-or-primary))
                                                     (let ((cname  (symbol-name sym)))
                                                       (or (string= cname name)
                                                           (member cname akas))))
                                                (setq nets  ())
                                                t))
                                         (setq dwim-completions
                                               (cons (bbdb-dwim-net-address rec net)
                                                     dwim-completions))
                                         (when exact-match (setq nets  ())))
                                       (setq nets  (cdr nets)))))
                                 (symbol-value sym)))
                    all-the-completions)
         (cond ((and dwim-completions (null (cdr dwim-completions))) <span class="linecomment">; Insert the unique match.</span>
                (delete-region beg end) (insert (car dwim-completions)) (message "<span class="quote"></span>"))
               (t                       <span class="linecomment">; More than one match.  Use Icicles minibuffer completion.</span>
                (condition-case nil
                    (let* ((icicle-show-Completions-initially-flag      t)
                           (icicle-incremental-completion-p             'display)
                           (icicle-top-level-when-sole-completion-flag  t)
                           (choice (save-excursion
                                     (completing-read "<span class="quote">Complete: </span>" (mapcar #'list dwim-completions)
                                                      nil t pattern nil pattern))))
                      (when choice
                        (delete-region beg end)
                        (insert choice)))
                  (error nil))
                (unless (eq (selected-window) (minibuffer-window))
                  (message "<span class="quote">Making completion list...done</span>")))))))))


<span class="linecomment">;; REPLACE ORIGINAL `lisp-complete-symbol' defined in `lisp.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Selects *Completions* window even if on another frame.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-lisp-complete-symbol)
(fset 'old-lisp-complete-symbol (symbol-function 'lisp-complete-symbol)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-lisp-complete-symbol (&optional predicate) <span class="linecomment">; Bound to `ESC TAB' globally.</span>
  "<span class="quote">Complete the Lisp symbol preceding point against known Lisp symbols.
If no characters can be completed, display a list of possible completions.
Repeating the command at that point scrolls the list.

When called from a program, optional arg PREDICATE is a predicate
determining which symbols are considered, e.g. `commandp'.

If PREDICATE is nil, the context determines which symbols are
considered.  If the symbol starts just after an open-parenthesis, only
symbols with function definitions are considered.  Otherwise, all
symbols with function definitions, values or properties are
considered.</span>"
  (interactive)
  (let* ((end            (point))
         (buffer-syntax  (syntax-table))
         (beg
          (unwind-protect
               (save-excursion
                 (set-syntax-table emacs-lisp-mode-syntax-table)
                 (backward-sexp 1)
                 (while (= (char-syntax (following-char)) ?\') (forward-char 1))
                 (point))
            (set-syntax-table buffer-syntax)))
         (pattern        (buffer-substring beg end))
         (predicate
          (or predicate
              (save-excursion
                (goto-char beg)
                (if (not (eq (char-before) ?\())
                    (lambda (sym)	<span class="linecomment">;why not just nil ?   -sm</span>
                      (or (boundp sym) (fboundp sym)
                          (symbol-plist sym)))
                  <span class="linecomment">;; If first element of parent list is not an open paren, assume that this is a</span>
                  <span class="linecomment">;; funcall position: use `fboundp'.  If not, then maybe this is a variable in</span>
                  <span class="linecomment">;; a `let' binding, so no predicate: use nil.</span>
                  (and (not (condition-case nil
                                (progn (up-list -2) (forward-char 1) (eq (char-after) ?\())
                              (error nil)))
                       'fboundp)))))
         (enable-recursive-minibuffers  (active-minibuffer-window))
         (icicle-top-level-when-sole-completion-flag  t)
         (completion
          (save-excursion (completing-read "<span class="quote">Complete Lisp symbol: </span>" obarray predicate t pattern))))
    (delete-region beg end)
    (insert completion)))



<span class="linecomment">;; REPLACE ORIGINAL `customize-face' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Multi-command version.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-customize-face)
(fset 'old-customize-face (symbol-function 'customize-face)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-face (face)
  "<span class="quote">Customize face FACE.
Input-candidate completion and cycling are available.  While cycling,
these keys with prefix `C-' are active:

`C-mouse-2', `C-RET' - Act on current completion candidate only
`C-down'  - Move to next prefix-completion candidate and act
`C-up'    - Move to previous prefix-completion candidate and act
`C-next'  - Move to next apropos-completion candidate and act
`C-prior' - Move to previous apropos-completion candidate and act
`M-!'     - Act on *all* candidates (or all that are saved):
            Customize all in the same buffer.
`C-!'     - Act on *all* candidates (or all that are saved):
            Customize each in a separate buffer.

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate,
or `C-g' to quit.

With a prefix argument, you can enter multiple faces at the same time
with `RET' (in Emacs 22 or later).  This gives you the completion
behavior of `customize-face' in vanilla Emacs.  The advantage is that
the default value is the list of all faces under the cursor.  The
disadvantage is that face candidates are not WYSIWYG in buffer
*Completions*.

This is an Icicles command - see command `icicle-mode'.</span>"
  (interactive
   (list (let* ((icicle-list-use-nth-parts  '(1))
                (icicle-candidate-action-fn
                 (lambda (x)
                   (old-customize-face (intern (icicle-transform-multi-completion x)))
                   (select-window (minibuffer-window))
                   (select-frame-set-input-focus (selected-frame))))
                (icicle-all-candidates-list-action-fn 'icicle-customize-faces))
           (if (and (&gt; emacs-major-version 21) current-prefix-arg)
               (read-face-name "<span class="quote">Customize face: </span>" "<span class="quote">all faces</span>" t)
             (read-face-name "<span class="quote">Customize face: </span>")))))
  (old-customize-face face))


<span class="linecomment">;; REPLACE ORIGINAL `customize-face-other-window' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Multi-command version.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-customize-face-other-window)
(fset 'old-customize-face-other-window (symbol-function 'customize-face-other-window)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-face-other-window (face)
  "<span class="quote">Customize face FACE in another window.
Same as `icicle-customize-face' except it uses a different window.</span>"
  (interactive
   (list (let* ((icicle-list-use-nth-parts  '(1))
                (icicle-candidate-action-fn
                 (lambda (x)
                   (old-customize-face-other-window (intern (icicle-transform-multi-completion x)))
                   (select-window (minibuffer-window))
                   (select-frame-set-input-focus (selected-frame))))
                (icicle-all-candidates-list-action-fn 'icicle-customize-faces))
           (if (and (&gt; emacs-major-version 21) current-prefix-arg)
               (read-face-name "<span class="quote">Customize face: </span>" "<span class="quote">all faces</span>" t)
             (read-face-name "<span class="quote">Customize face: </span>")))))
  (old-customize-face-other-window face))

(defun icicle-customize-faces (faces)
  "<span class="quote">Open Customize buffer on all faces in list FACES.</span>"
  (let ((icicle-list-nth-parts-join-string  "<span class="quote">: </span>")
        (icicle-list-join-string            "<span class="quote">: </span>")
        (icicle-list-end-string             "<span class="quote"></span>")
        (icicle-list-use-nth-parts          '(1)))
    (custom-buffer-create
     (custom-sort-items
      (mapcar (lambda (f) (list (intern (icicle-transform-multi-completion f)) 'custom-face))
              faces)
      t custom-buffer-order-groups)
     "<span class="quote">*Customize Apropos*</span>")))


<span class="linecomment">;; REPLACE ORIGINAL `customize-apropos' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-customize-apropos)
(fset 'old-customize-apropos (symbol-function 'customize-apropos)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos (regexp &optional all)
  "<span class="quote">Customize all user options matching REGEXP.
If ALL is `options', include only options.
If ALL is `faces', include only faces.
If ALL is `groups', include only groups.
If ALL is t (interactively, with prefix arg), include options which
  are not user-settable, as well as faces and groups.

Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (let ((pref-arg  current-prefix-arg))
     (list (completing-read "<span class="quote">Customize (regexp): </span>" obarray
                            (lambda (symbol)
                              (or (get symbol 'custom-group)
                                  (custom-facep symbol)
                                  (and (boundp symbol)
                                       (or (get symbol 'saved-value)
                                           (custom-variable-p symbol)
                                           (if (null pref-arg)
                                               (user-variable-p symbol)
                                             (get symbol 'variable-documentation))))))
                            nil nil 'regexp-history)
           pref-arg)))
  (let ((found  nil))
    (mapatoms (lambda (symbol)
                (when (string-match regexp (symbol-name symbol))
                  (when (and (not (memq all '(faces options))) <span class="linecomment">; groups or t</span>
                             (get symbol 'custom-group))
                    (push (list symbol 'custom-group) found))
                  (when (and (not (memq all '(options groups))) <span class="linecomment">; faces or t</span>
                             (custom-facep symbol))
                    (push (list symbol 'custom-face) found))
                  (when (and (not (memq all '(groups faces))) <span class="linecomment">; options or t</span>
                             (boundp symbol)
                             (or (get symbol 'saved-value)
                                 (custom-variable-p symbol)
                                 (if (memq all '(nil options))
                                     (user-variable-p symbol)
                                   (get symbol 'variable-documentation))))
                    (push (list symbol 'custom-variable) found)))))
    (if (not found)
        (error "<span class="quote">No matches</span>")
      (custom-buffer-create (custom-sort-items found t custom-buffer-order-groups)
                            "<span class="quote">*Customize Apropos*</span>"))))

<span class="linecomment">;; Define this for Emacs 20 and 21</span>
(unless (fboundp 'custom-variable-p)
  (defun custom-variable-p (variable)
    "<span class="quote">Return non-nil if VARIABLE is a custom variable.</span>"
    (or (get variable 'standard-value) (get variable 'custom-autoload))))


<span class="linecomment">;; REPLACE ORIGINAL `customize-apropos-faces' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-customize-apropos-faces)
(fset 'old-customize-apropos-faces (symbol-function 'customize-apropos-faces)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos-faces (regexp)
  "<span class="quote">Customize all user faces matching REGEXP.
Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (list (completing-read "<span class="quote">Customize faces (regexp): </span>" obarray 'custom-facep nil nil
                          'regexp-history)))
  (customize-apropos regexp 'faces))


<span class="linecomment">;; REPLACE ORIGINAL `customize-apropos-groups' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-customize-apropos-groups)
(fset 'old-customize-apropos-groups (symbol-function 'customize-apropos-groups)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos-groups (regexp)
  "<span class="quote">Customize all user groups matching REGEXP.
Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (list (completing-read "<span class="quote">Customize groups (regexp): </span>" obarray
                          (lambda (symbol) (get symbol 'custom-group)) nil nil 'regexp-history)))
  (customize-apropos regexp 'groups))


<span class="linecomment">;; REPLACE ORIGINAL `customize-apropos-options' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-customize-apropos-options)
(fset 'old-customize-apropos-options (symbol-function 'customize-apropos-options)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos-options (regexp &optional arg)
  "<span class="quote">Customize all user options matching REGEXP.
With prefix argument, include options which are not user-settable.

Use `S-TAB', [next], and [prior], to match regexp input - this lets
you see what items will be available in the customize buffer.</span>"
  (interactive
   (let ((pref-arg  current-prefix-arg))
     (list (completing-read "<span class="quote">Customize options (regexp): </span>" obarray
                            (lambda (symbol)
                              (and (boundp symbol)
                                   (or (get symbol 'saved-value)
                                       (custom-variable-p symbol)
                                       (if (null pref-arg)
                                           (user-variable-p symbol)
                                         (get symbol 'variable-documentation)))))
                            nil nil 'regexp-history)
           pref-arg)))
  (customize-apropos regexp (or arg 'options)))


<span class="linecomment">;; REPLACE ORIGINAL `customize-apropos-options-of-type' defined in `cus-edit+.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-customize-apropos-options-of-type)
    (not (fboundp 'customize-apropos-options-of-type)) <span class="linecomment">; Doesn't exist.</span>
    (fset 'old-customize-apropos-options (symbol-function 'customize-apropos-options)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-apropos-options-of-type (type regexp)
  "<span class="quote">Customize all loaded customizable options of type TYPE that match REGEXP.
With no prefix arg, each option is defined with `defcustom' type TYPE.
With a prefix arg, either each option is defined with `defcustom' type
 TYPE or its current value is compatible with TYPE.

If TYPE is nil (the default value) then all `defcustom' variables are
potential candidates.

Use `S-TAB', `next', and `prior', to match regexp input - this lets
you see which options will be available in the customize buffer.</span>"
  (interactive
   (let ((typ       (car (condition-case err
                             (read-from-string
                              (let ((types ()))
                                (mapatoms
                                 (lambda (cand)
                                   (when (custom-variable-p cand)
                                     (push (list (format "<span class="quote">%s</span>"
                                                         (format "<span class="quote">%S</span>" (get cand 'custom-type))))
                                           types))))
                                (completing-read "<span class="quote">Customize all options of type: </span>"
                                                 (icicle-remove-duplicates types)
                                                 nil nil nil nil "<span class="quote">nil</span>")))
                           (end-of-file (error "<span class="quote">No such custom type</span>")))))
         (pref-arg  current-prefix-arg))
     (list typ
           (completing-read
            "<span class="quote">Customize options matching (regexp): </span>" obarray
            (lambda (symb)
              (and (boundp symb)
                   (or (not (fboundp 'indirect-variable)) (eq (indirect-variable symb) symb))
                   (or (get symb 'saved-value) (custom-variable-p symb))
                   (or (not typ)        <span class="linecomment">; `typ' = nil means use all types.</span>
                       (if pref-arg
                           (icicle-var-is-of-type-p symb (list typ))
                         (equal (get symb 'custom-type) typ)))))
            nil nil 'regexp-history))))
  (custom-buffer-create (custom-sort-items
                         (mapcar (lambda (s) (list (intern s) 'custom-variable))
                                 icicle-completion-candidates)
                         t "<span class="quote">*Customize Apropos*</span>")))


<span class="linecomment">;; REPLACE ORIGINAL `repeat-complex-command' defined in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the command to repeat, letting you use `S-TAB' and</span>
<span class="linecomment">;; `TAB' to see the history list and `C-,' to toggle sorting that display.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-repeat-complex-command)
(fset 'old-repeat-complex-command (symbol-function 'repeat-complex-command)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-repeat-complex-command (arg) <span class="linecomment">; Bound to `C-x ESC ESC', `C-x M-:' in Icicle mode.</span>
  "<span class="quote">Edit and re-evaluate the last complex command, or ARGth from last.
A complex command is one that used the minibuffer.
ARG is the prefix argument numeric value.

You can edit the past command you choose before executing it.  The
Lisp form of the command is used.  If the command you enter differs
from the previous complex command, then it is added to the front of
the command history.

Icicles completion is available for choosing a past command.  You can
still use the vanilla Emacs bindings `\\&lt;minibuffer-local-map&gt;\\[next-history-element]' and \
`\\[previous-history-element]' to cycle inputs,
and `\\[repeat-matching-complex-command]' to match regexp input, but Icicles input cycling (`up',
`down',`next', `prior') and apropos completion (`S-TAB') are superior
and more convenient.</span>"
  (interactive "<span class="quote">p</span>")
  (let ((elt  (nth (1- arg) command-history))
        newcmd)
    (if elt
        (progn
          (setq newcmd
                (let ((print-level                   nil)
                      (minibuffer-history-position   arg)
                      (minibuffer-history-sexp-flag  (1+ (minibuffer-depth))))
                  (unwind-protect
                       (let ((icicle-transform-function  'icicle-remove-duplicates))
                         (read (completing-read
                                "<span class="quote">Redo: </span>" (mapcar (lambda (entry) (list (prin1-to-string entry)))
                                                 command-history)
                                nil nil (prin1-to-string elt) (cons 'command-history arg)
                                (prin1-to-string elt))))
                    <span class="linecomment">;; If command was added to command-history as a string, get rid of that.</span>
                    <span class="linecomment">;; We want only evaluable expressions there.</span>
                    (if (stringp (car command-history))
                        (setq command-history  (cdr command-history))))))
          <span class="linecomment">;; If command to be redone does not match front of history, add it to the history.</span>
          (or (equal newcmd (car command-history))
              (setq command-history  (cons newcmd command-history)))
          (eval newcmd))
      (if command-history
          (error "<span class="quote">Argument %d is beyond length of command history</span>" arg)
        (error "<span class="quote">There are no previous complex commands to repeat</span>")))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-add-entry-to-saved-completion-set (set-name entry type)
  "<span class="quote">Add ENTRY to saved completion-candidates set SET-NAME.
ENTRY is normally a single candidate (a string).
 With a prefix arg, however, and if option
 `icicle-filesets-as-saved-completion-sets-flag' is non-nil, then
 ENTRY is the name of an  Emacs fileset (Emacs 22 or later).
TYPE is the type of entry to add: `Fileset' or `Candidate'.</span>"
  (interactive
   (let ((typ (if (and current-prefix-arg icicle-filesets-as-saved-completion-sets-flag
                       (prog1 (or (require 'filesets nil t)
                                  (error "<span class="quote">Feature `filesets' not provided</span>"))
                         (filesets-init))
                       filesets-data)
                  'Fileset
                'Candidate)))
     (list
      (save-selected-window
        (completing-read "<span class="quote">Saved completion set: </span>" icicle-saved-completion-sets nil t nil
                         'icicle-completion-set-history))
      (if (eq typ 'Fileset)
          (list ':fileset               <span class="linecomment">; Just save the fileset name, not the data.</span>
                (car (assoc (completing-read "<span class="quote">Fileset to add: </span>" filesets-data nil t)
                            filesets-data)))
        (completing-read "<span class="quote">Candidate to add: </span>" (mapcar #'list icicle-saved-completion-candidates)))
      typ)))
  (let ((file-name  (cdr (assoc set-name icicle-saved-completion-sets))))
    (unless (icicle-file-readable-p file-name) (error "<span class="quote">Cannot read cache file `%s'</span>" file-name))
    (let ((list-buf  (find-file-noselect file-name 'nowarn 'raw))
          candidates newcands entry-type)
      (unwind-protect
           (condition-case icicle-add-entry-to-saved-completion-set
               (when (listp (setq newcands  (setq candidates  (read list-buf))))
                 (message "<span class="quote">Set `%s' read from file `%s'</span>" set-name file-name))
             (error (error "<span class="quote">Bad cache file.  %s</span>"
                           (error-message-string icicle-add-entry-to-saved-completion-set))))
        (kill-buffer list-buf))
      (unless (consp newcands) (error "<span class="quote">Bad data in cache file `%s'</span>" file-name))
      (pushnew entry newcands :test #'equal)
      (setq entry  (if (eq type 'Fileset) (caar entry) entry))
      (if (= (length candidates) (length newcands))
          (message "<span class="quote">%s `%s' is already in saved set `%s', file `%s'</span>" type entry set-name file-name)
        (with-temp-message (format "<span class="quote">Writing entry to cache file `%s'...</span>" file-name)
          (with-temp-file file-name (prin1 newcands (current-buffer))))
        (message "<span class="quote">%s `%s' added to saved set `%s', file `%s'</span>" type entry set-name file-name)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-remove-entry-from-saved-completion-set (set-name)
  "<span class="quote">Remove an entry from saved completion-candidates set SET-NAME.
SET-NAME can be an Icicles saved completions set (cache file) or the
name of an Emacs fileset.

The entry to remove can be a single completion candidate (a string) or
an Emacs fileset.  You can thus remove a file name from a fileset or
remove a fileset from an Icicles saved completion set.  (You can also
remove a file name from a saved completion set.)  If a saved set has
both a file and a fileset of the same name, then both are removed.

To use filesets here, use Emacs 22 or later, load library `filesets',
use `(filesets-init)', and ensure that option
`icicle-filesets-as-saved-completion-sets-flag' is non-nil.</span>"
  (interactive
   (list (completing-read "<span class="quote">Saved completion set: </span>"
                          (if (and icicle-filesets-as-saved-completion-sets-flag
                                   (featurep 'filesets) filesets-data)
                              (append filesets-data icicle-saved-completion-sets)
                            icicle-saved-completion-sets)
                          nil t nil 'icicle-completion-set-history)))
  (let* ((file-name   (cdr (assoc set-name icicle-saved-completion-sets)))
         (candidates  (icicle-get-candidates-from-saved-set set-name 'dont-expand))
         (icicle-whole-candidate-as-text-prop-p  t)
         (entry
          (icicle-get-alist-candidate
           (completing-read
            "<span class="quote">Candidate to remove: </span>"
            (mapcar (lambda (e)
                      (cond ((icicle-saved-fileset-p e) <span class="linecomment">; Swap `:fileset' with fileset name.</span>
                             `(,(cadr e) ,(car e) ,@(cddr e)))
                            ((consp e) e)
                            (t (list e)))) <span class="linecomment">; Listify naked string.</span>
                    candidates)
            nil t))))
    (when (and (consp entry) (eq (cadr entry) ':fileset)) <span class="linecomment">; Swap back again: `:fileset' and name.</span>
      (setq entry  `(,(cadr entry) ,(car entry) ,@(cddr entry))))
    (when (and (consp entry) (null (cdr entry))) (setq entry  (car entry))) <span class="linecomment">; Use just the string.</span>
    <span class="linecomment">;; Delete any such candidate, then remove text properties used for completion.</span>
    (setq candidates  (mapcar #'icicle-unpropertize (delete entry candidates)))
    (cond (file-name
           (with-temp-message           <span class="linecomment">; Remove from cache file.</span>
               (format "<span class="quote">Writing remaining candidates to cache file `%s'...</span>" file-name)
             (with-temp-file file-name (prin1 candidates (current-buffer)))))
          ((icicle-saved-fileset-p (list ':fileset set-name)) <span class="linecomment">; Remove from fileset.</span>
           (unless (require 'filesets nil t) (error "<span class="quote">Feature `filesets' not provided</span>"))
           (filesets-init)
           (let ((fst  (and filesets-data (assoc set-name filesets-data)))) <span class="linecomment">; The fileset itself.</span>
             (unless fst (error "<span class="quote">No such fileset: `%s'</span>" set-name))
             (let ((fst-files  (filesets-entry-get-files fst)))
               (if (car (filesets-member entry fst-files :test 'filesets-files-equalp))
                   (if fst-files        <span class="linecomment">; Similar to code in `filesets-remove-buffer'.</span>
                       (let ((new-fst  (list (cons ':files (delete entry fst-files)))))
                         (setcdr fst new-fst)
                         (filesets-set-config set-name 'filesets-data filesets-data))
                     (message "<span class="quote">Cannot remove `%s' from fileset `%s'</span>" entry set-name))
                 (message "<span class="quote">`%s' not in fileset `%s'</span>" entry set-name))))))
    (icicle-msg-maybe-in-minibuffer
     (concat (format "<span class="quote">`%s' removed from %s `%s'</span>"
                     (if (icicle-saved-fileset-p entry) (cadr entry) entry)
                     (if (icicle-saved-fileset-p entry) "<span class="quote">fileset</span>" "<span class="quote">saved set</span>")
                     set-name)
             (and file-name (format "<span class="quote">, file `%s'</span>" file-name))))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-remove-saved-completion-set <span class="linecomment">; Command name</span>
  "<span class="quote">Remove an entry from `icicle-saved-completion-sets'.
Save the updated option.
You are prompted to also delete the associated cache file.
You can add entries to `icicle-saved-completion-sets' using command
`icicle-add/update-saved-completion-set'.</span>" <span class="linecomment">; Doc string</span>
  icicle-remove-saved-set-action
  "<span class="quote">Remove set of completion candidates named: </span>" <span class="linecomment">; `completing-read' args</span>
  icicle-saved-completion-sets nil t nil 'icicle-completion-set-history nil nil
  ((icicle-whole-candidate-as-text-prop-p  t) <span class="linecomment">; Additional bindings</span>
   (icicle-use-candidates-only-once-flag   t))
  nil nil (icicle-remove-Completions-window)) <span class="linecomment">; First code, undo code, last code</span>

(defun icicle-remove-saved-set-action (set-name)
  "<span class="quote">Remove saved set SET-NAME from `icicle-saved-completion-sets'.</span>"
  (let ((enable-recursive-minibuffers  t)
        (sets                          icicle-saved-completion-sets)
        set cache)
    (save-selected-window
      (select-window (minibuffer-window))
      (while (setq set    (assoc set-name sets)
                   cache  (cdr set))
        (when (file-exists-p cache)
          (if (y-or-n-p (format "<span class="quote">Delete cache file `%s'? </span>" cache))
              (when (condition-case err
                        (progn (delete-file cache) t)
                      (error (progn (message (error-message-string err)) nil)))
                (message "<span class="quote">DELETED `%s'</span>" cache) (sit-for 1))
            (message "<span class="quote">OK, file NOT deleted</span>") (sit-for 1)))
        (setq sets  (delete set sets)))))
  (setq icicle-saved-completion-sets
        (icicle-assoc-delete-all set-name icicle-saved-completion-sets))
  (funcall icicle-customize-save-variable-function
           'icicle-saved-completion-sets
           icicle-saved-completion-sets)
  (message "<span class="quote">Candidate set `%s' removed</span>" set-name))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-save-marked (&optional arg) <span class="linecomment">; Bound to `C-M-&gt;' in Dired.</span>
  "<span class="quote">Save the marked file names in Dired as a set of completion candidates.
Saves file names in variable `icicle-saved-completion-candidates', by
default.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.
 To subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.</span>"
  (interactive "<span class="quote">P</span>")
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">Command `icicle-dired-save-marked' must be called from a Dired buffer</span>"))
  (icicle-candidate-set-save-1 (dired-get-marked-files) arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-save-marked-more (&optional arg) <span class="linecomment">; Bound to `C-&gt;' in Dired.</span>
  "<span class="quote">Add the marked file names in Dired to the saved candidates set.
Add candidates to `icicle-saved-completion-candidates', by default.
A prefix argument acts the same as for `icicle-candidate-set-save'.

The existing saved candidates are still saved.  The current candidates
are added to those already saved.

You can retrieve the saved set of candidates with `C-M-&lt;'.
You can use the saved set of candidates for operations such as</span>"
  (interactive "<span class="quote">P</span>")
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">`icicle-dired-save-marked-more' must be called from a Dired buffer</span>"))
  (icicle-candidate-set-save-1 (dired-get-marked-files) arg t))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-save-marked-to-variable () <span class="linecomment">; Bound to `C-M-}' in Dired.</span>
  "<span class="quote">Save the marked file names in Dired as a candidate set to a variable.
You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.</span>"
  (interactive)
  (icicle-candidate-set-save-1 (dired-get-marked-files) 99))

(defalias 'icicle-dired-save-marked-as-project <span class="linecomment">; Bound to `C-}' in Dired.</span>
    'icicle-dired-save-marked-persistently)
<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-save-marked-persistently (filesetp)
  "<span class="quote">Save the marked file names in Dired as a persistent set.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-candidate-set-save-1 (dired-get-marked-files) (if filesetp 0 '(1))))


(put 'icicle-dired-saved-file-candidates 'icicle-Completions-window-max-height 200)
(defalias 'icicle-dired-chosen-files 'icicle-dired-saved-file-candidates)
<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-saved-file-candidates (prompt-for-dir-p)
  "<span class="quote">Open Dired on a set of files and directories of your choice.
If you have saved a set of file names using \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-candidate-set-save]', then it is used.
If not, you are prompted to choose the files.
With a prefix argument, you are prompted for the default directory to use.
Otherwise, the current value of `default-directory' is used.
Names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the Dired
directory (default directory).</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets? </span>
  (unless icicle-saved-completion-candidates
    (error (substitute-command-keys "<span class="quote">No saved completion candidates.  \
Use \\&lt;minibuffer-local-completion-map&gt;`\\[icicle-candidate-set-save]' to save candidates</span>")))
  (let* ((default-directory  (if prompt-for-dir-p
                                 (read-file-name "<span class="quote">Directory: </span>" nil default-directory nil)
                               default-directory))
         (file-names         (icicle-remove-if
                              (lambda (fil) (or (null fil) (not (file-exists-p fil))))
                              (or icicle-saved-completion-candidates
                                  (icicle-file-list)))))
    (dired (cons (generate-new-buffer-name "<span class="quote">Icy File Set</span>") (nreverse file-names)))))

(defalias 'icicle-dired-chosen-files-other-window 'icicle-dired-saved-file-candidates-other-window)
<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-saved-file-candidates-other-window (prompt-for-dir-p) <span class="linecomment">; Bound `C-M-&lt;' in Dired.</span>
  "<span class="quote">Open Dired in other window on set of files & directories of your choice.
If you have saved a set of file names using \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-candidate-set-save]', then it is used.
If not, you are prompted to choose the files.
With a prefix arg, you are prompted for the default directory to use.
Otherwise, the current value of `default-directory' is used.
Names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the Dired
directory (default directory).</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets? </span>
  (let* ((default-directory  (if prompt-for-dir-p
                                 (read-file-name "<span class="quote">Directory: </span>" nil default-directory nil)
                               default-directory))
         (file-names         (icicle-remove-if
                              (lambda (fil) (or (null fil) (not (file-exists-p fil))))
                              (or icicle-saved-completion-candidates
                                  (icicle-file-list)))))
    (dired-other-window (cons (generate-new-buffer-name "<span class="quote">Icy File Set</span>") (nreverse file-names)))))

(put 'icicle-dired-project 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-project (prompt-for-dir-p)
  "<span class="quote">Open Dired on a saved project.
A project is either a persistent completion set or an Emacs fileset.
With a prefix argument, you are prompted for the directory.
Otherwise, the default directory is assumed.

Project file names that do not correspond to existing files are
ignored.  Existence of files with relative names is checked in the
directory.</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets? </span>
  (let ((set-name  (completing-read "<span class="quote">Project (saved file names): </span>"
                                    (if (and icicle-filesets-as-saved-completion-sets-flag
                                             (featurep 'filesets) filesets-data)
                                        (append filesets-data icicle-saved-completion-sets)
                                      icicle-saved-completion-sets)
                                    nil nil nil 'icicle-completion-set-history)))
    (icicle-retrieve-candidates-from-set set-name)
    (let* ((default-directory  (if prompt-for-dir-p
                                   (read-file-name "<span class="quote">Dired directory: </span>" nil default-directory nil)
                                 default-directory))
           (file-names         ()))
      (dolist (f icicle-saved-completion-candidates) (when (file-exists-p f) (push f file-names)))
      (unless file-names (error "<span class="quote">No files in project `%s' actually exist</span>" set-name))
      (dired (cons (generate-new-buffer-name set-name)
                   (nreverse (mapcar (lambda (file)
                                       (if (file-name-absolute-p file)
                                           (expand-file-name file)
                                         file))
                                     file-names)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dired-project-other-window (prompt-for-dir-p) <span class="linecomment">; Bound to `C-{' in Dired.</span>
  "<span class="quote">Open Dired on a saved project in another window.
A project is either a persistent completion set or an Emacs fileset.
With a prefix argument, you are prompted for the directory.
Otherwise, the default directory is assumed.

Project file names that do not correspond to existing files are
ignored.  Existence of files with relative names is checked in the
directory.</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets? </span>
  (let ((set-name  (completing-read "<span class="quote">Project (saved file names): </span>"
                                    (if (and icicle-filesets-as-saved-completion-sets-flag
                                             (featurep 'filesets) filesets-data)
                                        (append filesets-data icicle-saved-completion-sets)
                                      icicle-saved-completion-sets)
                                    nil nil nil 'icicle-completion-set-history)))
    (icicle-retrieve-candidates-from-set set-name)
    (let* ((default-directory  (if prompt-for-dir-p
                                   (read-file-name "<span class="quote">Dired directory: </span>" nil default-directory nil)
                                 default-directory))
           (file-names         ()))
      (dolist (f icicle-saved-completion-candidates) (when (file-exists-p f) (push f file-names)))
      (unless file-names (error "<span class="quote">No files in project `%s' actually exist</span>" set-name))
      (dired-other-window (cons (generate-new-buffer-name set-name)
                                (nreverse (mapcar (lambda (file)
                                                    (if (file-name-absolute-p file)
                                                        (expand-file-name file)
                                                      file))
                                                  file-names)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-grep-saved-file-candidates (command-args)
  "<span class="quote">Run `grep' on the set of completion candidates saved with \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-candidate-set-save]'.
Saved names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the default
directory.</span>"
  (interactive
   (list
    (let ((file-names  ()))
      (unless icicle-saved-completion-candidates
        (error (substitute-command-keys "<span class="quote">No saved completion candidates.  \
Use \\&lt;minibuffer-local-completion-map&gt;`\\[icicle-candidate-set-save]' to save candidates</span>")))
      (unless grep-command (grep-compute-defaults))
      (dolist (f  icicle-saved-completion-candidates) (when (file-exists-p f) (push f file-names)))
      (let ((default  (and (fboundp 'grep-default-command) (grep-default-command))))
        (read-from-minibuffer
         "<span class="quote">grep &lt;pattern&gt; &lt;files&gt; :  </span>"
         (let ((up-to-files  (concat grep-command "<span class="quote">   </span>")))
           (cons (concat up-to-files (mapconcat #'identity icicle-saved-completion-candidates "<span class="quote"> </span>"))
                 (- (length up-to-files) 2)))
         nil nil 'grep-history default)))))
  (grep command-args))
 
<span class="linecomment">;;(@* "Icicles multi-commands")</span>
<span class="linecomment">;;; Icicles multi-commands .   .   .   .   .   .   .   .   .</span>

<span class="linecomment">;; Utility function.  Use it to define multi-commands that navigate.</span>
(defun icicle-explore (define-candidates-fn final-action-fn quit-fn error-fn cleanup-fn prompt
                                            &rest compl-read-args)
  "<span class="quote">Icicle explorer: explore complex completion candidates.
Navigate among locations or other entities represented by a set of
completion candidates.  See `icicle-search' for a typical example.

Arguments:
 DEFINE-CANDIDATES-FN:
   Function of no args called to fill `icicle-candidates-alist' with
   the candidates.
 FINAL-ACTION-FN:
   Function of no args called after the final choice of candidate
   (after both `icicle-explore-final-choice' and
   `icicle-explore-final-choice-full' have been set).  Typically uses
   `icicle-explore-final-choice-full', the full candidate.
 QUIT-FN: Function of no args called if user uses `C-g'.
 ERROR-FN: Function of no args called if an error is raised.
 CLEANUP-FN: Function of no args called after exploring.
 PROMPT: Prompt string for `completing-read'.
 COMPL-READ-ARGS: `completing-read' args other than PROMPT and
   COLLECTION.

Returns:
 The result of executing FINAL-ACTION-FN, if that arg is non-nil.
 Otherwise, `icicle-explore-final-choice-full'.

To use `icicle-explore' to define a multi-command, you must also bind
`icicle-candidate-action-fn'.

Though `icicle-explore' is typically used to define navigation
commands, it need not be.  It can be useful anytime you need to use
`completing-read' and also provide specific behavior for quitting
\(`C-g'), completion errors, and final actions.</span>"
  (let ((icicle-incremental-completion-flag     'always)
        (icicle-whole-candidate-as-text-prop-p  t)
        (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
        (icicle-act-before-cycle-flag           icicle-act-before-cycle-flag)
        (orig-pt-explore                        (point-marker))
        (orig-win-explore                       (selected-window))
        result)
    (setq icicle-act-before-cycle-flag      nil
          icicle-candidates-alist           nil
          icicle-explore-final-choice       nil
          icicle-explore-final-choice-full  nil)
    (icicle-highlight-lighter)
    (message "<span class="quote">Finding candidates...</span>")
    (when define-candidates-fn (funcall define-candidates-fn))
    (unless icicle-candidates-alist (error "<span class="quote">No candidates defined</span>"))
    (when (= (length icicle-candidates-alist) 1)
      (setq icicle-explore-final-choice  (icicle-display-cand-from-full-cand
                                          (car icicle-candidates-alist))))
    (unwind-protect
         (condition-case failure
             (progn
               (unless icicle-explore-final-choice
                 (setq icicle-explore-final-choice
                       (apply #'completing-read prompt icicle-candidates-alist compl-read-args)))
               (setq icicle-explore-final-choice-full
                     (icicle-get-alist-candidate icicle-explore-final-choice 'no-error-p))
               (unless icicle-explore-final-choice-full (error "<span class="quote">No such occurrence</span>"))
               (setq result  (if final-action-fn
                                 (funcall final-action-fn)
                               icicle-explore-final-choice-full)))
           (quit (if quit-fn (funcall quit-fn) (keyboard-quit)))
           (error (when error-fn (funcall error-fn))
                  (error "<span class="quote">%s</span>" (error-message-string failure))))
      (when cleanup-fn (funcall cleanup-fn)))
    result))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-execute-extended-command <span class="linecomment">; Bound to `M-x' in Icicle mode.</span>
  "<span class="quote">Read command name, then read its arguments and call it.
This is `execute-extended-command', turned into a multi-command.

By default, Icicle mode remaps all key sequences that are normally
bound to `execute-extended-command' to
`icicle-execute-extended-command'.  If you do not want this remapping,
then customize option `icicle-top-level-key-bindings'.</span>" <span class="linecomment">; Doc string</span>
  icicle-execute-extended-command-1     <span class="linecomment">; Function to perform the action</span>
  (format "<span class="quote">Execute command%s: </span>"         <span class="linecomment">; `completing-read' args</span>
          (if current-prefix-arg
              (format "<span class="quote"> (prefix %d)</span>" (prefix-numeric-value current-prefix-arg))
            "<span class="quote"></span>"))
  obarray 'commandp t nil 'extended-command-history nil nil
  (<span class="linecomment">;; Bindings</span>
   (use-file-dialog  nil)               <span class="linecomment">; `mouse-2' in *Completions* shouldn't use file dialog box.</span>
   (last-command     last-command)      <span class="linecomment">; Save and restore the last command.</span>
   new-last-cmd)                        <span class="linecomment">; Set in `icicle-execute-extended-command-1'.</span>
  nil  nil
  (setq this-command  new-last-cmd))    <span class="linecomment">; Final code: this will update `last-command'.</span>

<span class="linecomment">;; Free vars here: `orig-buff' and `orig-window' are bound by `icicle-define-command'.</span>
<span class="linecomment">;;                 `new-last-cmd' is bound in `icicle-execute-extended-command'.</span>
(defun icicle-execute-extended-command-1 (cmd-name)
  "<span class="quote">Action function to execute command or named keyboard macro CMD-NAME.</span>"
  (when (get-buffer orig-buff) (set-buffer orig-buff))
  (when (window-live-p orig-window) (select-window orig-window))
  (when (string= "<span class="quote"></span>" cmd-name) (error "<span class="quote">No command name</span>"))

  <span class="linecomment">;; Rebind `icicle-candidate-action-fn' to a function that calls the</span>
  <span class="linecomment">;; candidate CMD-NAME on a single argument that it reads.  This is</span>
  <span class="linecomment">;; used only if CMD-NAME is a command that, itself, reads an input</span>
  <span class="linecomment">;; argument with completion.  When that is the case, you can use</span>
  <span class="linecomment">;; completion on that input, and if you do that, you can use `C-RET'</span>
  <span class="linecomment">;; to use command CMD-NAME as a multi-command.  In other words, this</span>
  <span class="linecomment">;; binding allows for two levels of multi-commands.</span>
  (let* ((cmd    (intern cmd-name))
         (icicle-candidate-action-fn
          (and icicle-candidate-action-fn <span class="linecomment">; This is nil after the command name is read.</span>
               (lambda (arg)
                 (condition-case nil
                     (funcall cmd arg)  <span class="linecomment">; Try to use string candidate `arg'.</span>
                   <span class="linecomment">;; If that didn't work, use a symbol or number candidate.</span>
                   (wrong-type-argument (funcall cmd (car (read-from-string arg))))
                   (wrong-number-of-arguments <span class="linecomment">; Punt - show help.</span>
                    (funcall #'icicle-help-on-candidate)))
                 (select-window (minibuffer-window))
                 (select-frame-set-input-focus (selected-frame)))))
         (fn     (symbol-function cmd))
         (count  (prefix-numeric-value current-prefix-arg)))
    <span class="linecomment">;; Message showing what `cmd' is bound to.  This is pretty much a transcription of C code in</span>
    <span class="linecomment">;; `keyboard.c'.  Not sure it DTRT when there is already a msg in the echo area.</span>
    (when (and suggest-key-bindings (not executing-kbd-macro))
      (let* ((bindings   (where-is-internal cmd overriding-local-map t))
             (curr-msg   (current-message))
             (wait-time  (if curr-msg
                             (or (and (numberp suggest-key-bindings) suggest-key-bindings) 2)
                           0)))
        (when (and bindings (not (and (vectorp bindings) (eq (aref bindings 0) 'mouse-movement))))
          (when (and (sit-for wait-time) (atom unread-command-events))
            (let ((message-log-max  nil))      <span class="linecomment">; Don't log this message.</span>
              (message "<span class="quote">You can run the command `%s' with `%s'</span>"
                       (symbol-name cmd)
                       (key-description bindings)))
            (when (and (sit-for wait-time) curr-msg) (message curr-msg))))))
    (cond ((arrayp fn)
           (let ((this-command  cmd)) (execute-kbd-macro fn count))
           (when (&gt; count 1) (message "<span class="quote">(%d times)</span>" count)))
          (t
           (run-hooks 'post-command-hook)
           (run-hooks 'pre-command-hook)
           (let ((enable-recursive-minibuffers  t)
                 <span class="linecomment">;; Bind, don't set `this-command'.  When you use `C-next', `this-command' needs</span>
                 <span class="linecomment">;; to be `cmd' during the `C-RET' part, but `last-command' must not be `cmd'</span>
                 <span class="linecomment">;; during the `next' part.</span>
                 (this-command cmd))
             (call-interactively cmd 'record-it))))
    <span class="linecomment">;; After `M-x' `last-command' must be the command finally entered with `RET' or, if you end</span>
    <span class="linecomment">;; with `C-g', the last command entered with `C-RET'.</span>
    (setq new-last-cmd  cmd)))

<span class="linecomment">;; Inspired by Emacs partial completion and by library `exec-abbrev-cmd.el' (Tassilo Horn</span>
<span class="linecomment">;; &lt;tassilo@member.fsf.org&gt;).  The idea of command abbreviation is combined here with normal</span>
<span class="linecomment">;; command invocation, in an Icicles multi-command.</span>
<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-command-abbrev <span class="linecomment">; Bound to `C-x SPC' in Icicle mode.</span>
  "<span class="quote">Read command name or its abbreviation, read command args, call command.
Read input, then call `icicle-command-abbrev-action' to act on it.

If `icicle-add-proxy-candidates-flag' is non-nil, then command
abbreviations, as well as commands, are available as completion
candidates.  Otherwise, only commands are available.  You can toggle
this user option using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-proxy-candidates]'\
in the minibuffer.

When an abbreviation is available, you can treat it just like a
command.  The rest of this description covers the behavior of choosing
an abbreviation.

If an abbreviation matches a single command name, then that command is
invoked.  If it matches more than one, then you can use completion to
choose one.

Hyphens (`-') in command names divide them into parts.  For example,
`find-file' has two parts: `find' and `file'.  Each character of a
command abbreviation corresponds to one part of each of the commands
that match the abbreviation.  For example, abbreviation `ff' matches
commands `find-file' and `focus-frame', and abbreviation `fg' matches
`find-grep'.

User option `icicle-command-abbrev-match-all-parts-flag' = nil means
that an abbreviation need not match all parts of a command name; it
need match only a prefix.  For example, nil means that abbreviation
`ff' also matches `find-file-other-window' and `fg' also matches
`find-grep-dired'.</span>"                     <span class="linecomment">; Doc string</span>
  icicle-command-abbrev-action          <span class="linecomment">; Function to perform the action</span>
  prompt obarray  'commandp             <span class="linecomment">; `completing-read' args</span>
  nil nil 'icicle-command-abbrev-history nil nil
  ((icicle-sort-function     'icicle-command-abbrev-used-more-p) <span class="linecomment">; Bindings.</span>
   (prompt                   "<span class="quote">Command or abbrev: </span>")
   (icicle-proxy-candidates  (let ((ipc  ())
                                   abv)
                               (dolist (entry icicle-command-abbrev-alist ipc)
                                 (setq abv  (symbol-name (cadr entry)))
                                 (unless (member abv ipc) (push abv ipc)))))
   (use-file-dialog          nil)       <span class="linecomment">; `mouse-2' in *Completions* shouldn't use file dialog box.</span>
   (last-command             last-command)) <span class="linecomment">; Save and restore the last command.</span>
  (when icicle-proxy-candidates         <span class="linecomment">; First code</span>
    (put-text-property 0 1 'icicle-fancy-candidates t prompt))
  nil (setq icicle-proxy-candidates  nil)) <span class="linecomment">; Undo code, last code</span>

(defun icicle-command-abbrev-action (abbrev-or-cmd)
  "<span class="quote">Action function for `icicle-command-abbrev'.
If ABBREV-OR-CMD is a command, call it.
If ABBREV-OR-CMD is an abbreviation for a single command, invoke it.
If ABBREV-OR-CMD is an abbreviation for multiple commands, call
`icicle-command-abbrev-command', to let user choose commands.
If ABBREV-OR-CMD is not an abbreviation or a command, raise an error.</span>"
  (setq abbrev-or-cmd  (intern abbrev-or-cmd))
  (let* ((not-cmdp                          (not (commandp abbrev-or-cmd)))
         (regexp                            (and (or not-cmdp icicle-command-abbrev-priority-flag)
                                                 (icicle-command-abbrev-regexp abbrev-or-cmd)))
         (icicle-commands-for-abbrev        (and (or not-cmdp icicle-command-abbrev-priority-flag)
                                                 (icicle-command-abbrev-matching-commands regexp)))
         (icicle-add-proxy-candidates-flag  icicle-add-proxy-candidates-flag)
         (icicle-proxy-candidates           icicle-proxy-candidates))
    (cond ((and not-cmdp (null icicle-commands-for-abbrev))
           (error "<span class="quote">No such command or abbreviation `%s'</span>" abbrev-or-cmd))
          (icicle-commands-for-abbrev
           (let* ((icicle-sort-function  'icicle-command-abbrev-used-more-p)
                  (cmd  (if (null (cdr icicle-commands-for-abbrev))
                            (prog1 (intern (caar icicle-commands-for-abbrev))
                              (push (caar icicle-commands-for-abbrev) extended-command-history)
                              (call-interactively (intern (caar icicle-commands-for-abbrev)) t))
                          (let ((enable-recursive-minibuffers  t))
                            (icicle-remove-Completions-window)
                            (icicle-command-abbrev-command)))))
             (icicle-command-abbrev-record abbrev-or-cmd cmd)))
          ((not not-cmdp) (call-interactively abbrev-or-cmd)))))

(defun icicle-command-abbrev-regexp (abbrev)
  "<span class="quote">Return the command-matching regexp for ABBREV.</span>"
  (let ((char-list  (append (symbol-name abbrev) nil))
        (str        "<span class="quote">^</span>"))
    (dolist (c char-list) (setq str  (concat str (list c) "<span class="quote">[^-]*-</span>")))
    (concat (substring str 0 (1- (length str)))
            (if icicle-command-abbrev-match-all-parts-flag "<span class="quote">$</span>" "<span class="quote">.*$</span>"))))

(defun icicle-command-abbrev-matching-commands (regexp)
  "<span class="quote">Return a completion alist of commands that match REGEXP.</span>"
  (mapcar #'list (icicle-remove-if-not
                  (lambda (strg) (string-match regexp strg))
                  (let ((cmds  nil))
                    (mapatoms (lambda (symb) (when (commandp symb) (push (symbol-name symb) cmds))))
                    cmds))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-command-abbrev-command
  "<span class="quote">Read command name, then read its arguments and call command.</span>" <span class="linecomment">; Doc string</span>
  icicle-execute-extended-command-1     <span class="linecomment">; Function to perform the action</span>
  (format "<span class="quote">Command abbreviated%s%s: </span>"   <span class="linecomment">; `completing-read' arguments</span>
          (cond ((and icicle-current-input (not (string= "<span class="quote"></span>" icicle-current-input)))
                 (format "<span class="quote"> `%s'</span>" icicle-current-input))
                (icicle-candidate-nb
                 (format "<span class="quote"> `%s'</span>" (elt icicle-completion-candidates icicle-candidate-nb)))
                (t "<span class="quote"></span>"))
          (if current-prefix-arg
              (format "<span class="quote"> (prefix %d)</span>" (prefix-numeric-value current-prefix-arg))
            "<span class="quote"></span>"))
  icicle-commands-for-abbrev nil t nil 'extended-command-history nil nil
  (<span class="linecomment">;; Bindings</span>
   (use-file-dialog                   nil) <span class="linecomment">; `mouse-2' in *Completions* shouldn't use file dialog.</span>
   (last-command                      last-command) <span class="linecomment">; Save and restore the last command.</span>
   (icicle-add-proxy-candidates-flag  nil) <span class="linecomment">; No abbrevs - just commands here.</span>
   new-last-cmd)                        <span class="linecomment">; Set in `icicle-execute-extended-command-1'.</span>
  nil nil
  (setq this-command  new-last-cmd)     <span class="linecomment">; Final code: this will update `last-command'.</span>
  t)                                    <span class="linecomment">; Do not make this function interactive.</span>

(defun icicle-command-abbrev-record (abbrev command)
  "<span class="quote">Record ABBREV and COMMAND in `icicle-command-abbrev-alist'.</span>"
  (let ((entry  (assq command icicle-command-abbrev-alist)))
    (when (and abbrev command)
      (if entry
          (setq icicle-command-abbrev-alist  (cons (list command abbrev (1+ (car (cddr entry))))
                                                   (delete entry icicle-command-abbrev-alist)))
        (push (list command abbrev 1) icicle-command-abbrev-alist)))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-execute-named-keyboard-macro <span class="linecomment">; Bound to `C-x M-e' in Icicle mode.</span>
  "<span class="quote">Read the name of a keyboard macro, then execute it.</span>"
  icicle-execute-extended-command-1     <span class="linecomment">; Function to perform the action</span>
  (format "<span class="quote">Execute keyboard macro%s: </span>"  <span class="linecomment">; `completing-read' args</span>
          (if current-prefix-arg
              (format "<span class="quote"> (prefix %d)</span>" (prefix-numeric-value current-prefix-arg))
            "<span class="quote"></span>"))
  obarray (lambda (fn) (and (commandp fn) (arrayp (symbol-function fn))))
  t nil 'icicle-kmacro-history nil nil
  ((last-command  last-command)))       <span class="linecomment">; Bindings: save and restore the last command.</span>

<span class="linecomment">;;;###autoload</span>
(when (require 'kmacro nil t)
  (icicle-define-command icicle-kmacro  <span class="linecomment">; Bound to `S-f4' in Icicle mode (Emacs 22+).</span>
    "<span class="quote">Execute a keyboard macro according to its position in `kmacro-ring'.
Macros in the keyboard macro ring are given names `1', `2', and so on,
for use as completion candidates.

With prefix argument, repeat macro that many times (but see below).
If a macro is still being defined, end it first, then execute it.

Since this is a multi-command, you can execute any number of macros
any number of times in a single invocation.  In particular, you can
execute a given macro repeatedly using `C-RET' (be sure you use `TAB'
first, to make it the current candidate).

If you use a prefix arg for `icicle-kmacro', then each multi-command
action (e.g. `C-RET') repeats the macro that number of times.  However
if you use a prefix arg for an individual action, then the action
repeats the macro that number of times.  Without its own prefix arg,
an action uses the base prefix arg you used for `icicle-kmacro'.</span>"
    icicle-kmacro-action                <span class="linecomment">; Function to perform the action</span>
    (format "<span class="quote">Execute keyboard macro%s: </span>" <span class="linecomment">; `completing-read' args</span>
            (if current-prefix-arg
                (format "<span class="quote"> (prefix %s)</span>" (prefix-numeric-value current-prefix-arg))
              "<span class="quote"></span>"))
    (let ((count  0))
      (setq icicle-kmacro-alist
            (mapcar (lambda (x) (cons (format "<span class="quote">%d</span>" (setq count  (1+ count))) x))
                    (reverse (if nil kmacro-ring (cons (kmacro-ring-head) kmacro-ring))))))
    nil 'no-exit-wo-match nil 'icicle-kmacro-history
    (and (kmacro-ring-head) (null kmacro-ring) "<span class="quote">1</span>") nil
    ((pref-arg  current-prefix-arg))    <span class="linecomment">; Additional bindings</span>
    (progn                              <span class="linecomment">; First code</span>
      (when defining-kbd-macro (kmacro-end-or-call-macro current-prefix-arg) (error "<span class="quote">Done</span>"))
      (unless (or (kmacro-ring-head) kmacro-ring) (error "<span class="quote">No keyboard macro defined</span>"))))

  <span class="linecomment">;; Free vars here: `orig-buff' and `orig-window' are bound by `icicle-define-command'.</span>
  (defun icicle-kmacro-action (cand)
    "<span class="quote">Action function for `icicle-kmacro'.</span>"
    (when (get-buffer orig-buff) (set-buffer orig-buff))
    (when (window-live-p orig-window) (select-window orig-window))
    (let* ((count  (if current-prefix-arg (prefix-numeric-value current-prefix-arg) pref-arg))
           (macro  (cadr (assoc cand icicle-kmacro-alist))))
      (unless macro (error "<span class="quote">No such macro: `%s'</span>" cand))
      (execute-kbd-macro macro count #'kmacro-loop-setup-function)
      (when (&gt; count 1) (message "<span class="quote">(%d times)</span>" count)))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-set-option-to-t <span class="linecomment">; Command name</span>
  "<span class="quote">Set option to t.  This makes sense for binary (toggle) options.
By default, completion candidates are limited to user options that
have `boolean' custom types.  However, there are many \"binary\" options
that allow other non-nil values than t.

You can use a prefix argument to change the set of completion
candidates, as follows:

 - With a non-negative prefix arg, all user options are candidates.
 - With a negative prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
  (lambda (opt) (set (intern opt) t) (message "<span class="quote">`%s' is now t</span>" opt)) <span class="linecomment">; Action function</span>
  "<span class="quote">Set option to t: </span>" obarray           <span class="linecomment">; `completing-read' args</span>
  (cond ((and current-prefix-arg (wholenump (prefix-numeric-value current-prefix-arg)))
         (lambda (x) (and (boundp x) (user-variable-p x) (eq nil (symbol-value x)))))
        (current-prefix-arg (lambda (x) (and (boundp x) (eq nil (symbol-value x)))))
        (t (lambda (x) (and (boundp x) (icicle-binary-option-p x) (eq nil (symbol-value x))))))
  'must-confirm nil
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil
  ((enable-recursive-minibuffers          t) <span class="linecomment">; Additional bindings</span>
   (icicle-use-candidates-only-once-flag  t)))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-clear-history
  "<span class="quote">Clear a minibuffer history of selected entries.
You are prompted for the history to clear, then you are prompted for
the entries to delete from it.  You can use multi-command completion
for both inputs.  That is, you can act on multiple histories and
delete multiple entries from each.

For convenience, you can use `S-delete' the same way as `C-RET': Each
of them deletes the current entry candidate from the history.

With a prefix argument, empty the chosen history completely
\(you are not prompted to choose history entries to delete).

`icicle-act-before-cycle-flag' is bound to t here during completion of
history entries, so `C-next' and so on act on the current candidate.</span>"
  icicle-clear-history-1                <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">History to clear: </span>" icicle-clear-history-hist-vars <span class="linecomment">; `completing-read' args</span>
  nil t nil nil (symbol-name minibuffer-history-variable) nil
  ((pref-arg                        current-prefix-arg) <span class="linecomment">; Additional bindings</span>
   (enable-recursive-minibuffers    t)
   (icicle-transform-function       'icicle-remove-duplicates)
   (icicle-clear-history-hist-vars  `((,(symbol-name minibuffer-history-variable))
                                      (,(symbol-name 'icicle-previous-raw-file-name-inputs))
                                      (,(symbol-name 'icicle-previous-raw-non-file-name-inputs))))
   (icicle-delete-candidate-object  'icicle-clear-history-entry))
  (mapatoms (lambda (x) (when (and (boundp x) (consp (symbol-value x)) <span class="linecomment">; First code</span>
                                   (stringp (car (symbol-value x)))
                                   (string-match "<span class="quote">-\\(history\\|ring\\)\\'</span>" (symbol-name x)))
                          (push (list (symbol-name x)) icicle-clear-history-hist-vars)))))

<span class="linecomment">;; Free vars here: `pref-arg' is bound in `icicle-clear-history'.</span>
(defun icicle-clear-history-1 (hist)
  "<span class="quote">Action function for `icicle-clear-history' history-variable candidates.</span>"
  (setq hist  (intern hist))
  (if (not pref-arg)
      (let* ((icicle-candidate-action-fn              'icicle-clear-history-entry)
             (icicle-transform-function               'icicle-remove-duplicates)
             (icicle-clear-history-hist               hist)
             (icicle-use-candidates-only-once-flag    t)
             (icicle-show-Completions-initially-flag  t)
             (icicle-act-before-cycle-flag            t))
        (when hist                      <span class="linecomment">; Maybe there are no more, due to deletion actions.</span>
          (funcall icicle-candidate-action-fn
                   (completing-read "<span class="quote">Clear input: </span>" (mapcar #'list (symbol-value hist)) nil t))))
    (set hist nil))
  (unless hist (message "<span class="quote">History `%s' is now empty</span>" hist))
  nil)

<span class="linecomment">;; Free vars here: `icicle-clear-history-hist' is bound in `icicle-clear-history-1'</span>
<span class="linecomment">;; and in `icicle-clear-current-history'.</span>
(defun icicle-clear-history-entry (cand)
  "<span class="quote">Action function for history entry candidates in `icicle-clear-history'.</span>"
  (unless (string= "<span class="quote"></span>" cand)
    (set icicle-clear-history-hist
         (icicle-remove-if
          (lambda (x)
            (string= (icicle-substring-no-properties cand) (icicle-substring-no-properties x)))
          (symbol-value icicle-clear-history-hist)))
    <span class="linecomment">;; We assume here that CAND was in fact present in the history originally.</span>
    (message "<span class="quote">`%s' deleted from history `%s'</span>" cand icicle-clear-history-hist))
  nil)

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-clear-current-history <span class="linecomment">; Bound to `M-i' in minibuffer.</span>
  "<span class="quote">Clear current minibuffer history of selected entries.
You are prompted for the history entries to delete.

With a prefix argument, however, empty the history completely
\(you are not prompted to choose history entries to delete).

`icicle-act-before-cycle-flag' is bound to t here during completion of
history entries, so `C-next' and so on act on the current candidate.</span>"
  icicle-clear-history-entry            <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Clear input: </span>" (mapcar #'list (symbol-value icicle-clear-history-hist)) <span class="linecomment">; `completing-read' args</span>
  nil t nil nil nil nil
  ((pref-arg                                current-prefix-arg) <span class="linecomment">; Additional bindings</span>
   (enable-recursive-minibuffers            t)
   (icicle-transform-function               'icicle-remove-duplicates)
   (icicle-use-candidates-only-once-flag    t)
   (icicle-show-Completions-initially-flag  t)
   (icicle-clear-history-hist               minibuffer-history-variable))
  (when pref-arg                        <span class="linecomment">; Use `error' just to exit and make sure message is seen.</span>
    (icicle-ding)
    (if (not (yes-or-no-p (format "<span class="quote">Are you sure you want to empty `%s' completely? </span>"
                                  minibuffer-history-variable)))
        (error "<span class="quote"></span>")
      (set minibuffer-history-variable nil)
      (error "<span class="quote">History `%s' is now empty</span>" minibuffer-history-variable))))

(when (and icicle-define-alias-commands-flag (not (fboundp 'clear-option)))
  (defalias 'clear-option 'icicle-reset-option-to-nil))
<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-reset-option-to-nil <span class="linecomment">; Command name</span>
  "<span class="quote">Set option to nil.  This makes sense for binary and list options.
By default, the set of completion candidates is limited to user
options.  Note: it is *not* limited to binary and list options.
With a prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
  (lambda (opt) (set (intern opt) nil) (message "<span class="quote">`%s' is now nil</span>" opt)) <span class="linecomment">; Action function</span>
  "<span class="quote">Clear option (set it to nil): </span>" obarray <span class="linecomment">; `completing-read' args</span>
  (if current-prefix-arg
      (lambda (x) (and (boundp x) (symbol-value x)))
    (lambda (x) (and (boundp x) (user-variable-p x) (symbol-value x))))
  t nil (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history)
  nil nil
  ((enable-recursive-minibuffers          t) <span class="linecomment">; Additional bindings</span>
   (icicle-use-candidates-only-once-flag  t)))

(when (and icicle-define-alias-commands-flag (not (fboundp 'toggle)))
  (defalias 'toggle 'icicle-toggle-option))
<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-toggle-option <span class="linecomment">; Command name</span>
  "<span class="quote">Toggle option's value.  This makes sense for binary (toggle) options.
By default, completion candidates are limited to user options that
have `boolean' custom types.  However, there are many \"binary\" options
that allow other non-nil values than t.

You can use a prefix argument to change the set of completion
candidates, as follows:

 - With a non-negative prefix arg, all user options are candidates.
 - With a negative prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
  (lambda (opt)                         <span class="linecomment">; Function to perform the action</span>
    (let ((sym  (intern opt)))
      (set sym (not (eval sym))) (message "<span class="quote">`%s' is now %s</span>" opt (eval sym))))
  "<span class="quote">Toggle value of option: </span>" obarray    <span class="linecomment">; `completing-read' args</span>
  (cond ((and current-prefix-arg (wholenump (prefix-numeric-value current-prefix-arg)))
         'user-variable-p)
        (current-prefix-arg 'boundp)
        (t 'icicle-binary-option-p))
  'must-confirm nil
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil
  ((enable-recursive-minibuffers  t)))   <span class="linecomment">; Additional bindings</span>

(defun icicle-binary-option-p (symbol)
  "<span class="quote">Non-nil if SYMBOl is a user option that has custom-type `boolean'.</span>"
  (eq (get symbol 'custom-type) 'boolean))

<span class="linecomment">;;;###autoload</span>
(defun icicle-bookmark-cmd (&optional parg) <span class="linecomment">; Bound to what `bookmark-set' is bound to (`C-x r m').</span>
  "<span class="quote">Set bookmark or visit bookmark(s).
With no prefix argument or a plain prefix arg (`C-u'), call
`bookmark-set' to set a bookmark, passing the prefix arg.

With a non-negative numeric prefix argument, set a bookmark at point,
giving it a name that is the buffer name followed by the text starting
at point (after a space).  At most `icicle-bookmark-name-length-max'
characters of buffer text are used for the name.  If the prefix
argument is 0, then do not overwrite any bookmarks that have the same
name.

With a negative prefix argument, call `icicle-bookmark' to visit a
bookmark.

By default, Icicle mode remaps all key sequences that are normally
bound to `bookmark-set' to `icicle-bookmark-cmd'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if (and parg (&lt; (prefix-numeric-value parg) 0))
      (icicle-bookmark)
    (let ((bm-name (and parg (atom parg)
                        (concat (buffer-name) "<span class="quote"> </span>"
                                (buffer-substring
                                 (point)
                                 (min (save-excursion (end-of-line) (point))
                                      (+ (point) icicle-bookmark-name-length-max)))))))
      (when bm-name (message "<span class="quote">Setting bookmark `%s'</span>" bm-name) (sit-for 2))
      (bookmark-set bm-name (and parg (or (consp parg) (zerop (prefix-numeric-value parg))))))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-bookmark  <span class="linecomment">; Command name</span>
  "<span class="quote">Jump to a bookmark.
You can use `S-delete' on any bookmark during completion to delete it.
If `crosshairs.el' is loaded, then the target position is highlighted.</span>" <span class="linecomment">; Doc string</span>
  icicle-bookmark-jump                  <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Bookmark: </span>" (mapcar #'list (bookmark-all-names)) <span class="linecomment">; `completing-read' args</span>
  nil t nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history)
  (and (boundp 'bookmark-current-bookmark) bookmark-current-bookmark)
  nil
  ((completion-ignore-case          bookmark-completion-ignore-case) <span class="linecomment">; Additional bindings</span>
   (icicle-delete-candidate-object  'bookmark-delete))
  nil (icicle-bookmark-cleanup) (icicle-bookmark-cleanup)) <span class="linecomment">; First code, undo code, last code</span>

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-bookmark-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Jump to a bookmark in another window..
You can use `S-delete' on any bookmark during completion to delete it.
If `crosshairs.el' is loaded, then the target position is highlighted.</span>" <span class="linecomment">; Doc string</span>
  icicle-bookmark-jump-other-window     <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Bookmark: </span>" (mapcar #'list (bookmark-all-names)) <span class="linecomment">; `completing-read' args</span>
  nil t nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history)
  (and (boundp 'bookmark-current-bookmark) bookmark-current-bookmark)
  nil
  ((completion-ignore-case          bookmark-completion-ignore-case) <span class="linecomment">; Additional bindings</span>
   (icicle-delete-candidate-object  'bookmark-delete))
  nil (icicle-bookmark-cleanup) (icicle-bookmark-cleanup)) <span class="linecomment">; First code, undo code, last code</span>

(defun icicle-bookmark-jump (bookmark)
  "<span class="quote">Jump to BOOKMARK.
You probably don't want to use this.  Use `icicle-bookmark' instead.
If `crosshairs.el' is loaded, then the target position is highlighted.</span>"
  (interactive (list (bookmark-completing-read "<span class="quote">Jump to bookmark</span>" bookmark-current-bookmark)))
  (icicle-bookmark-jump-1 bookmark))

(defun icicle-bookmark-jump-other-window (bookmark)
  "<span class="quote">Jump to BOOKMARK in another window.
You probably don't want to use this.  Use
`icicle-bookmark-other-window' instead.
If `crosshairs.el' is loaded, then the target position is highlighted.</span>"
  (interactive (list (bookmark-completing-read "<span class="quote">Jump to bookmark (in another window)</span>"
                                               bookmark-current-bookmark)))
  (icicle-bookmark-jump-1 bookmark 'other-window))

(defun icicle-bookmark-jump-1 (bookmark &optional other-window-p)
  "<span class="quote">Helper function for `icicle-bookmark-jump(-other-window)'.</span>"
  (unless bookmark (error "<span class="quote">No bookmark specified</span>"))
  (bookmark-maybe-historicize-string bookmark)
  (let ((cell  (bookmark-jump-noselect bookmark)))
    (when (&gt; emacs-major-version 22) (setq cell  (cons (current-buffer) (point))))
    (when cell
      (if other-window-p
          (pop-to-buffer (car cell) 'other-window)
        (switch-to-buffer (car cell)))
      (goto-char (cdr cell))
      (progn (run-hooks 'bookmark-after-jump-hook) t)
      <span class="linecomment">;; If there is an annotation for this bookmark, show it in a buffer.</span>
      (when bookmark-automatically-show-annotations (bookmark-show-annotation bookmark))
      (when (fboundp 'crosshairs-highlight) (crosshairs-highlight))))
  (select-window (minibuffer-window))
  (select-frame-set-input-focus (selected-frame)))

(defun icicle-bookmark-cleanup ()
  "<span class="quote">Cleanup code for `icicle-bookmark'.</span>"
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))
  (when (window-live-p orig-window)
    (select-window orig-window)
    (select-frame-set-input-focus (selected-frame))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-find-first-tag <span class="linecomment">; Command name</span>
  "<span class="quote">Find first tag in current tags table whose name matches your input.
This is similar to standard command `find-tag', with these
differences:

* This is a multi-command, so you can visit any number of tags.

* Only the first tag of several identical tags is a candidate, so you
  cannot visit the others.  That is, there is no equivalent to using
  `M-,' (`tags-loop-continue') after `find-tag' to find additional,
  identical tags.

* If `crosshairs.el' is loaded, the target position is highlighted.

To browse all tags (including duplicates) in all tags tables, use the
more powerful Icicles multi-command `icicle-find-tag'.

By default, Icicle mode remaps all key sequences that are normally
bound to `find-tag-other-window' to `icicle-find-first-tag'.  If you
do not want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"       <span class="linecomment">; Doc string</span>
  icicle-find-first-tag-action          <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Find tag: </span>"                          <span class="linecomment">; `completing-read' args</span>
  (if (fboundp 'tags-lazy-completion-table) (tags-lazy-completion-table) 'tags-complete-tag)
  nil nil nil nil (funcall (or find-tag-default-function (get major-mode 'find-tag-default-function)
                               'find-tag-default))
  nil
  ((completion-ignore-case  (progn (require 'etags)
                                   (if (and (boundp 'tags-case-fold-search) <span class="linecomment">; Additional bindings</span>
                                            (memq tags-case-fold-search '(t nil)))
                                       tags-case-fold-search
                                     case-fold-search)))
   (case-fold-search        completion-ignore-case))
  nil                                   <span class="linecomment">; First, undo, last code.</span>
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch)))

(defun icicle-find-first-tag-action (cand)
  "<span class="quote">Action function for `icicle-find-first-tag'.</span>"
  (find-tag cand)
  (when (fboundp 'crosshairs-highlight) (crosshairs-highlight)))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-find-first-tag-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Find first tag in current tags table whose name matches your input.
Same as `icicle-find-first-tag' except it uses a different window.</span>" <span class="linecomment">; Doc string</span>
  icicle-find-first-tag-other-window-action <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Find tag other window: </span>"             <span class="linecomment">; `completing-read' args</span>
  (if (fboundp 'tags-lazy-completion-table) (tags-lazy-completion-table) 'tags-complete-tag)
  nil nil nil nil (funcall (or find-tag-default-function (get major-mode 'find-tag-default-function)
                               'find-tag-default))
  nil
  ((completion-ignore-case  (progn (require 'etags)
                                   (if (and (boundp 'tags-case-fold-search) <span class="linecomment">; Additional bindings</span>
                                            (memq tags-case-fold-search '(t nil)))
                                       tags-case-fold-search
                                     case-fold-search)))
   (case-fold-search        completion-ignore-case))
  nil                                   <span class="linecomment">; First, undo, last code.</span>
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch)))

(defun icicle-find-first-tag-other-window-action (cand)
  "<span class="quote">Action function for `icicle-find-first-tag-other-window'.</span>"
  (find-tag-other-window cand)
  (when (fboundp 'crosshairs-highlight) (crosshairs-highlight)))

<span class="linecomment">;; Free vars here: `orig-pt-explore' is bound in `icicle-explore'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-find-tag (regexp &optional arg)
  "<span class="quote">Navigate among all tags that match REGEXP.
You are prompted for the REGEXP to match.  Enter REGEXP with `RET'.
You can use completion to choose a tag in the current tags table as
REGEXP.  You can use `\\[icicle-pop-tag-mark]' to return to your
starting point.

All matching tags are shown, including duplicate tags from the same or
different source files.  This means that you do not need `M-,' - you
see all tags as candidates to visit.

By default:

* Tags from all tags files are candidates.
* The source file name is shown after a tag, in buffer *Completions*.

A prefix argument changes this default behavior, as follows:

* ARG = 0 or ARG &gt; 0: only the current tag table is used
* ARG = 0 or ARG &lt; 0: source file names are not shown

By default, Icicle mode remaps all key sequences that are normally
bound to `find-tag' to `icicle-find-tag'.  If you do not want this
remapping, then customize option `icicle-top-level-key-bindings'.

If `crosshairs.el' is loaded, then the target position is highlighted.</span>"
  (interactive
   (let* ((completion-ignore-case  (if (and (boundp 'tags-case-fold-search)
                                            (memq tags-case-fold-search '(t nil)))
                                       tags-case-fold-search
                                     case-fold-search))
          (case-fold-search        completion-ignore-case))
     (require 'etags)
     (list (completing-read "<span class="quote">Find tag matching regexp: </span>"
                            <span class="linecomment">;; $$$$ Or should we just read a regexp against `regexp-history'?</span>
                            (if (fboundp 'tags-lazy-completion-table)
                                (tags-lazy-completion-table) <span class="linecomment">; Emacs 23+</span>
                              'tags-complete-tag) <span class="linecomment">; Emacs &lt; 23</span>
                            nil nil nil 'find-tag-history
                            (funcall (or find-tag-default-function
                                         (get major-mode 'find-tag-default-function)
                                         'find-tag-default)))
           current-prefix-arg)))

  (unwind-protect
       (let* ((icicle-whole-candidate-as-text-prop-p  t)
              (icicle-sort-function                   nil)
              (icicle-inhibit-sort-p                  t)
              (icicle-candidate-action-fn             'icicle-find-tag-action)
              (icicle-candidate-help-fn               'icicle-find-tag-help)
              (completion-ignore-case                 (if (and (boundp 'tags-case-fold-search)
                                                               (memq tags-case-fold-search
                                                                     '(t nil)))
                                                          tags-case-fold-search
                                                        case-fold-search))
              (case-fold-search                       completion-ignore-case)
              (orig-pt-find-tag                       (point-marker)))
         
         (ring-insert find-tag-marker-ring orig-pt-find-tag) <span class="linecomment">; Record starting point.</span>
         (icicle-explore (lambda () (icicle-find-tag-define-candidates regexp arg))
                         #'icicle-find-tag-final-act #'icicle-find-tag-quit-or-error
                         #'icicle-find-tag-quit-or-error nil
                         "<span class="quote">Choose a tag: </span>" nil nil nil 'find-tag-history))
    (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-pop-tag-mark ()
  "<span class="quote">Like `pop-tag-mark', but uses `pop-to-buffer', not `switch-to-buffer'.
By default, Icicle mode remaps all key sequences that are normally
bound to `pop-tag-mark' to `icicle-pop-tag-mark'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive)
  (require 'etags)
  (when (ring-empty-p find-tag-marker-ring) (error "<span class="quote">No previous locations for find-tag invocation</span>"))
  (let ((marker  (ring-remove find-tag-marker-ring 0)))
    (pop-to-buffer (or (marker-buffer marker) (error "<span class="quote">The marked buffer has been deleted</span>")))
    (goto-char (marker-position marker))
    (set-marker marker nil nil)))

(defun icicle-find-tag-define-candidates (regexp arg)
  "<span class="quote">Define candidates for `icicle-find-tag'.
See `icicle-explore', argument DEFINE-CANDIDATES-FN.</span>"
  (save-excursion
    (let ((first-time  t)
          (morep       t))
      (setq icicle-candidates-alist  ())
      (while (and morep (visit-tags-table-buffer (not first-time)))
        (when (and arg (wholenump (prefix-numeric-value arg))) (setq morep  nil))
        (setq first-time               nil
              icicle-candidates-alist  (append icicle-candidates-alist
                                               (nreverse
                                                (icicle-find-tag-define-candidates-1
                                                 regexp (&gt; (prefix-numeric-value arg)
                                                           0)))))))))

(defun icicle-find-tag-define-candidates-1 (regexp show-file-p)
  "<span class="quote">Helper function for `icicle-find-tag-define-candidates'.
Returns completion alist of tag information for tags matching REGEXP.
Include file name (label) if SHOW-FILE-P is non-nil.

If SHOW-FILE-P is nil, then alist items look like this:

 (TAG TAG-INFO FILE-PATH GOTO-FUNC)

If SHOW-FILE-P is non-nil, then alist items look like this:

 ((TAG FILE-LABEL) TAG-INFO FILE-PATH GOTO-FUNC) or

 (FILE-LABEL TAG-INFO FILE-PATH GOTO-FUNC) if no matching TAG.

TAG-INFO is what `snarf-tag-function' (e.g. `etags-snarf-tag')
returns.  It is a cons (TEXT LINE . POSITION).

TEXT is the initial part of a line containing the tag.
LINE is the line number.
POSITION is the (one-based) char position of TEXT within the file.

If TEXT is t, it means the tag refers to exactly LINE or POSITION,
whichever is present, LINE having preference, no searching.
Either LINE or POSITION can be nil.  POSITION is used if present.</span>"
  (icicle-highlight-lighter)
  (message "<span class="quote">Gathering tags...</span>")
  (goto-char (point-min))
  (let ((temp-list  ()))
    (while (re-search-forward (concat regexp "<span class="quote">.*\177*</span>") nil t) <span class="linecomment">; Look before the DEL character.</span>
      (beginning-of-line)
      (let* ((goto-func  goto-tag-location-function) <span class="linecomment">; e.g. `etags-goto-tag-location'.</span>
             <span class="linecomment">;; TAG-INFO: If no specific tag, (t nil (point-min)). Else, (TEXT LINE . STARTPOS).</span>
             <span class="linecomment">;; e.g. TEXT = "(defun foo ()" or just "foo" (if explicit),</span>
             <span class="linecomment">;;      LINE = "148", STARTPOS = "1723"</span>
             (tag-info (save-excursion (funcall snarf-tag-function))) <span class="linecomment">; e.g. `etags-snarf-tag'.</span>
             (tag (if (eq t (car tag-info)) nil (car tag-info)))
             <span class="linecomment">;; FILE-PATH is absolute. FILE-LABEL is relative to `default-directory'.</span>
             (file-path (save-excursion
                          (if tag (file-of-tag) (save-excursion (next-line 1) (file-of-tag)))))
             (file-label (expand-file-name file-path (file-truename default-directory))))
        (when (and tag (not (string= "<span class="quote"></span>" tag)) (= (aref tag 0) ?\( ))
          (setq tag  (concat tag "<span class="quote"> ...)</span>")))
        (when (file-readable-p file-path)
          <span class="linecomment">;; Add item to alist.</span>
          <span class="linecomment">;;   Item looks like this:         ((TAG FILE-LABEL) TAG-INFO FILE-PATH GOTO-FUNC)</span>
          <span class="linecomment">;;   or like this, if no matching tag: ((FILE-LABEL) TAG-INFO FILE-PATH GOTO-FUNC)</span>
          (cond (tag
                 (push `(,(if show-file-p
                              (list tag <span class="linecomment">; Make multi-completion cons: add file name to candidate.</span>
                                    (progn (put-text-property 0 (length file-label) 'face
                                                              'icicle-candidate-part file-label)
                                           file-label))
                              tag)
                         ,tag-info ,file-path ,goto-func)
                       temp-list))
                (show-file-p            <span class="linecomment">; No tag.  Use only the FILE-LABEL.</span>
                 (push `((,(progn (put-text-property 0 (length file-label) 'face
                                                     'icicle-candidate-part file-label)
                                  file-label))
                         ,tag-info ,file-path ,goto-func)
                       temp-list)))))
      (forward-line))
    temp-list))                         <span class="linecomment">; Return the alist for this TAGS file.</span>

(defun icicle-find-tag-action (ignored-string)
  "<span class="quote">Action function for `icicle-find-tag'.</span>"
  <span class="linecomment">;; Ignore (TAG FILE-LABEL) part.  Use only (TAG-INFO FILE-PATH GOTO-FUNC) part.</span>
  (let* ((cand       (cdr (elt (icicle-filter-alist icicle-candidates-alist
                                                    icicle-completion-candidates)
                               icicle-candidate-nb)))
         (tag-info   (nth 0 cand))
         (goto-func  (nth 2 cand)))
    (switch-to-buffer-other-window      <span class="linecomment">; Go to source file at FILE-PATH.</span>
     (if (fboundp 'tag-find-file-of-tag-noselect)
         (tag-find-file-of-tag-noselect (nth 1 cand))
       (find-file-noselect (nth 1 cand))))
    (widen)
    (condition-case err
        (funcall goto-func tag-info)    <span class="linecomment">; Go to text at TAG-INFO.</span>
      (error (message (error-message-string err)) (sit-for 2) nil)))
  (when (fboundp 'crosshairs-highlight) (crosshairs-highlight))
  (select-window (minibuffer-window))
  (select-frame-set-input-focus (selected-frame)))

(defun icicle-find-tag-help (cand)
  "<span class="quote">Use as `icicle-candidate-help-fn' for `icicle-find-first-tag'.</span>"
  (let* ((cand      (cdr (elt (icicle-filter-alist icicle-candidates-alist
                                                   icicle-completion-candidates)
                              icicle-candidate-nb)))
         (tag-info  (nth 0 cand)))
    (message (if (eq t (car tag-info))
                 "<span class="quote">No tag - file name itself matches</span>"
               (format "<span class="quote">Line: %d, Position: %d, File: %s</span>"
                       (cadr tag-info) (cddr tag-info) (nth 1 cand))))
    (sit-for 4)))

(defun icicle-find-tag-final-act ()
  "<span class="quote">Go to the final tag choice.</span>"
  (let ((cand  (cdr icicle-explore-final-choice-full)))
    (unless cand (error "<span class="quote">No such occurrence: %s</span>" cand))
    (switch-to-buffer-other-window <span class="linecomment">; Go to source file at FILE-PATH.</span>
     (if (fboundp 'tag-find-file-of-tag-noselect)
         (tag-find-file-of-tag-noselect (nth 1 cand))
       (find-file-noselect (nth 1 cand))))
    (widen)
    (funcall (nth 2 cand) (nth 0 cand)))) <span class="linecomment">; Go to text at TAG-INFO.</span>
  
(defun icicle-find-tag-quit-or-error ()
  "<span class="quote">Pop back to the last tag visited.</span>"
  (icicle-pop-tag-mark)
  (raise-frame))

<span class="linecomment">;;;###autoload</span>
(defun icicle-other-window-or-frame (arg) <span class="linecomment">; Bound to `C-x o' in Icicle mode.</span>
  "<span class="quote">Select a window or frame, by name or by order.
This command combines Emacs commands `other-window' and `other-frame',
together with Icicles multi-commands `icicle-select-window', and
`icicle-select-frame'.  Use the prefix argument to choose, as follows:

 With no prefix arg or a non-zero numeric prefix arg:
  If the selected frame has multiple windows, then this is
  `other-window'.  Otherwise, it is `other-frame'.

 With a zero prefix arg (e.g. `C-0'):
  If the selected frame has multiple windows, then this is
  `icicle-select-window' with windows in the frame as candidates.
  Otherwise (single-window frame), this is `icicle-select-frame'.

 With plain `C-u':
  If the selected frame has multiple windows, then this is
  `icicle-select-window' with windows from all visible frames as
  candidates.  Otherwise, this is `icicle-select-frame'.

By default, Icicle mode remaps all key sequences that are normally
bound to `other-window' to `icicle-other-window-or-frame'.  If you do
not want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((numarg  (prefix-numeric-value arg)))
    (cond ((consp arg)
           (if (one-window-p) (icicle-select-frame) (icicle-select-window)))
          ((zerop numarg)
           (if (one-window-p)
               (icicle-select-frame)
             (let ((current-prefix-arg  nil)) (icicle-select-window))))
          (t
           (if (one-window-p) (other-frame numarg) (other-window numarg))))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-select-frame <span class="linecomment">; Bound to `C-x 5 o' in Icicle mode.</span>
  "<span class="quote">Select frame by its name and raise it.
A frame name in this context is suffixed as needed by [NUMBER], to
make it unique.  For example, in a context where frames are named for
their buffers and you have two frames showing buffer *Help*, one of
the frames will be called `*Help*[2]' for use with this command.</span>" <span class="linecomment">; Doc string</span>
  icicle-select-frame-by-name           <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Select frame: </span>"                      <span class="linecomment">; `completing-read' args</span>
  icicle-frame-alist nil t nil
  (if (boundp 'frame-name-history) 'frame-name-history 'icicle-frame-name-history)
  (cdr (assq 'name (frame-parameters (next-frame (selected-frame))))) nil
  ((icicle-frame-alist  (icicle-make-frame-alist)))) <span class="linecomment">; Additional bindings</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-select-frame-by-name (name &optional frame-alist)
  "<span class="quote">Select the frame named NAME, and raise it.
Optional argument FRAME-ALIST is an alist of frames to choose from.
Each element has the form (FNAME . FRAME), where FNAME names FRAME.
See `icicle-make-frame-alist' for more about FNAME.</span>"
  (interactive (let* ((alist    (icicle-make-frame-alist))
                      (default  (car (rassoc (selected-frame) alist)))
                      (input    (completing-read "<span class="quote">Select Frame: </span>" alist nil t nil
                                                 'frame-name-history default)))
                 (list (if (= (length input) 0) default input)
                       alist)))
  (unless frame-alist (setq frame-alist  (or (and (boundp 'icicle-frame-alist) icicle-frame-alist)
                                             (icicle-make-frame-alist))))
  (let ((frame  (cdr (assoc name frame-alist))))
    (unless frame (error "<span class="quote">No such frame: `%s'</span>" name))
    (make-frame-visible frame)
    (select-frame-set-input-focus frame)))

(defun icicle-make-frame-alist ()
  "<span class="quote">Return an alist of entries (FNAME . FRAME), where FNAME names FRAME.
Frame parameter `name' is used as FNAME, unless there is more than one
frame with the same name.  In that case, FNAME includes a suffix
\[NUMBER], to make it a unique name.  The NUMBER order among frame
names that differ only by their [NUMBER] is arbitrary.</span>"
  (let ((fr-alist  ())
        (count     2)
        fname new-name)
    (dolist (fr (frame-list))
      (setq fname  (frame-parameter fr 'name))
      (if (not (assoc fname fr-alist))
          (push (cons fname fr) fr-alist)
        (setq new-name  fname)
        (while (assoc new-name fr-alist)
          (setq new-name  (format "<span class="quote">%s[%d]</span>" fname count)
                count     (1+ count)))
        (push (cons new-name fr) fr-alist))
      (setq count  2))
    fr-alist))

<span class="linecomment">;; Free vars here: `icicle-window-alist' is bound in Bindings form.</span>
<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-select-window <span class="linecomment">; Command name</span>
  "<span class="quote">Select window by its name.
With no prefix arg, candidate windows are those of the selected frame.
With a prefix arg, windows of all visible frames are candidates.

A window name is the name of its displayed buffer, but suffixed as
needed by [NUMBER], to make the name unique.  For example, if you have
two windows showing buffer *Help*, one of the windows will be called
`*Help*[2]' for use with this command.</span>" <span class="linecomment">; Doc string</span>
  icicle-select-window-by-name          <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Select window: </span>"                     <span class="linecomment">; `completing-read' args</span>
  icicle-window-alist nil t nil nil
  (buffer-name (window-buffer (other-window 1))) nil
  ((icicle-window-alist  (icicle-make-window-alist current-prefix-arg)))) <span class="linecomment">; Additional bindings</span>

<span class="linecomment">;; Free vars here: `icicle-window-alist' is bound in `icicle-select-window'.</span>
(defun icicle-select-window-by-name (name &optional window-alist)
  "<span class="quote">Select the window named NAME.
Optional argument WINDOW-ALIST is an alist of windows to choose from.

Interactively:
 A prefix arg means windows from all visible frames are candidates.
 No prefix arg means windows from the selected frame are candidates.

Each alist element has the form (WNAME . WINDOW), where WNAME names
WINDOW.  See `icicle-make-window-alist' for more about WNAME.

If `crosshairs.el' is loaded, then the target position is highlighted.</span>"
  (interactive (let* ((alist    (icicle-make-window-alist current-prefix-arg))
                      (default  (car (rassoc (selected-window) alist)))
                      (input    (completing-read "<span class="quote">Select Window: </span>" alist nil t nil nil default)))
                 (list (if (= (length input) 0) default input) alist)))
  (unless window-alist
    (setq window-alist  (or (and (boundp 'icicle-window-alist) icicle-window-alist)
                            (icicle-make-window-alist))))
  (let ((window  (cdr (assoc name window-alist))))
    (unless window (error "<span class="quote">No such window: `%s'</span>" name))
    (select-window window)
    (when (fboundp 'crosshairs-highlight) (crosshairs-highlight))
    (select-frame-set-input-focus (selected-frame))))

(defun icicle-make-window-alist (&optional all-p)
  "<span class="quote">Return an alist of entries (WNAME . WINDOW), where WNAME names WINDOW.
The name of the buffer in a window is used as its name, unless there
is more than one window displaying the same buffer.  In that case,
WNAME includes a suffix [NUMBER], to make it a unique name.  The
NUMBER order among window names that differ only by their [NUMBER] is
arbitrary.

Non-nil argument ALL-P means use windows from all visible frames.
Otherwise, use only windows from the selected frame.</span>"
  (let ((win-alist  ())
        (count      2)
        wname new-name)
    (walk-windows (lambda (w)
                    (setq wname  (buffer-name (window-buffer w)))
                    (if (not (assoc wname win-alist))
                        (push (cons wname w) win-alist)
                      (setq new-name  wname)
                      (while (assoc new-name win-alist)
                        (setq new-name  (format "<span class="quote">%s[%d]</span>" wname count)
                              count     (1+ count)))
                      (push (cons new-name w) win-alist))
                    (setq count  2))
                  'no-mini
                  (if all-p 'visible 'this-frame))
    win-alist))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-delete-windows <span class="linecomment">; Command name</span>
  "<span class="quote">Delete windows showing a buffer, anywhere.</span>" <span class="linecomment">; Doc string</span>
  delete-windows-on                     <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Delete windows on buffer: </span>"          <span class="linecomment">; `completing-read' args</span>
  (let ((cand-bufs  nil))
    (dolist (buf  (buffer-list))
      (when (get-buffer-window buf 0) (push (list (buffer-name buf)) cand-bufs)))
    cand-bufs)
  nil t nil 'buffer-name-history (buffer-name (current-buffer)) nil
  ((icicle-use-candidates-only-once-flag  t) <span class="linecomment">; Additional bindings</span>
   (icicle-inhibit-try-switch-buffer      t)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-window (bufferp)   <span class="linecomment">; Bound to `C-x 0' in Icicle mode.</span>
  "<span class="quote">`delete-window' or prompt for buffer and delete all its windows.
When called from the minibuffer, remove the *Completions* window.

Otherwise:
 With no prefix argument, delete the selected window.
 With a prefix argument, prompt for a buffer and delete all windows,
   on any frame, that show that buffer.

 With a prefix argument, this is an Icicles multi-command - see
 command `icicle-mode'.  Input-candidate completion and cycling are
 available.  While cycling, these keys with prefix `C-' are active:

 `C-RET'   - Act on current completion candidate only
 `C-down'  - Move to next prefix-completion candidate and act
 `C-up'    - Move to previous prefix-completion candidate and act
 `C-next'  - Move to next apropos-completion candidate and act
 `C-prior' - Move to previous apropos-completion candidate and act
 `C-!'     - Act on *all* candidates (or all that are saved),
             successively (careful!)

 With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
 `C-M-RET', `C-M-down', and so on) provide help about candidates.

 Use `mouse-2', `RET', or `S-RET' to finally choose a candidate,
 or `C-g' to quit.

By default, Icicle mode remaps all key sequences that are normally
bound to `delete-window' to `icicle-delete-window'.  If you do not
want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if (window-minibuffer-p (selected-window))
      (icicle-remove-Completions-window)
    (if bufferp (icicle-delete-windows) (delete-window))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-kill-buffer <span class="linecomment">; Bound to `C-x k' in Icicle mode.</span>
  "<span class="quote">Kill a buffer.
These options, when non-nil, control candidate matching and filtering:

 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer must satisfy
 `icicle-buffer-sort'               - Sort function for candidates

By default, Icicle mode remaps all key sequences that are normally
bound to `kill-buffer' to `icicle-kill-buffer'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"       <span class="linecomment">; Doc string</span>
  icicle-kill-a-buffer-and-update-completions <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Kill buffer: </span>"                       <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (buf) (list (buffer-name buf))) (buffer-list)) nil t nil 'buffer-name-history
  (buffer-name (current-buffer)) nil
  ((icicle-must-match-regexp         icicle-buffer-match-regexp) <span class="linecomment">; Additional bindings</span>
   (icicle-must-not-match-regexp     icicle-buffer-no-match-regexp)
   (icicle-must-pass-predicate       icicle-buffer-predicate)
   (icicle-extra-candidates          icicle-buffer-extras)
   (icicle-transform-function        'icicle-remove-dups-if-extras)
   (icicle-sort-function             icicle-buffer-sort)
   (icicle-require-match-flag        icicle-buffer-require-match-flag)
   (icicle-ignore-space-prefix-flag  icicle-buffer-ignore-space-prefix-flag)))

(defun icicle-kill-a-buffer-and-update-completions (buf)
  "<span class="quote">Kill buffer BUF and update the set of completions.</span>"
  (setq buf  (get-buffer buf))
  (if buf
      (condition-case err
          (if (not (buffer-live-p buf))
              (message "<span class="quote">Buffer already deleted: `%s'</span>" buf)
            (if (fboundp 'kill-buffer-and-its-windows)
                (kill-buffer-and-its-windows buf) <span class="linecomment">; Defined in `misc-cmds.el'.</span>
              (kill-buffer buf))
            <span class="linecomment">;; Update the set of completions, then update *Completions*.</span>
            (setq minibuffer-completion-table  (mapcar (lambda (buf) (list (buffer-name buf)))
                                                       (buffer-list)))
            (icicle-complete-again-update))
        (error nil))
    (message "<span class="quote">No such live buffer: `%s'</span>" buf)))

(put 'icicle-buffer 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-buffer    <span class="linecomment">; Bound to `C-x b' in Icicle mode.</span>
  "<span class="quote">Switch to a different buffer.
You can use `S-delete' during completion to kill a candidate buffer.

These options, when non-nil, control candidate matching and filtering:

 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer must satisfy
 `icicle-buffer-sort'               - Sort function for candidates

For example, to show only buffers that are associated with files, set
`icicle-buffer-predicate' to (lambda (buf) (buffer-file-name buf)).

Option `icicle-buffer-require-match-flag' can be used to override
option `icicle-require-match-flag'.

See also command `icicle-buffer-config'.

By default, Icicle mode remaps all key sequences that are normally
bound to `switch-to-buffer' to `icicle-buffer'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"       <span class="linecomment">; Doc string</span>
  switch-to-buffer                      <span class="linecomment">;  Function to perform the action</span>
  "<span class="quote">Switch to buffer: </span>"                  <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (buf) (list (buffer-name buf)))  (buffer-list))
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil
  'buffer-name-history (buffer-name (if (fboundp 'another-buffer) <span class="linecomment">; In `misc-fns.el'.</span>
                                        (another-buffer nil t)
                                      (other-buffer (current-buffer))))
  nil
  ((icicle-must-match-regexp         icicle-buffer-match-regexp) <span class="linecomment">; Additional bindings</span>
   (icicle-must-not-match-regexp     icicle-buffer-no-match-regexp)
   (icicle-must-pass-predicate       icicle-buffer-predicate)
   (icicle-extra-candidates          icicle-buffer-extras)
   (icicle-transform-function        'icicle-remove-dups-if-extras)
   (icicle-sort-function             (or icicle-buffer-sort icicle-sort-function))
   (icicle-delete-candidate-object   'icicle-kill-a-buffer) <span class="linecomment">; `S-delete' kills current buffer.</span>
   (icicle-require-match-flag        icicle-buffer-require-match-flag)
   (icicle-ignore-space-prefix-flag  icicle-buffer-ignore-space-prefix-flag)))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-buffer-other-window <span class="linecomment">; Bound to `C-x 4 b' in Icicle mode.</span>
  "<span class="quote">Switch to a different buffer in another window.
Same as `icicle-buffer' except it uses a different window.</span>" <span class="linecomment">; Doc string</span>
  switch-to-buffer-other-window         <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Switch to buffer: </span>"                  <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (buf) (list (buffer-name buf)))  (buffer-list))
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil
  'buffer-name-history (buffer-name (if (fboundp 'another-buffer)
                                        (another-buffer nil t)
                                      (other-buffer (current-buffer))))
  nil
  ((icicle-must-match-regexp         icicle-buffer-match-regexp) <span class="linecomment">; Additional bindings</span>
   (icicle-must-not-match-regexp     icicle-buffer-no-match-regexp)
   (icicle-must-pass-predicate       icicle-buffer-predicate)
   (icicle-extra-candidates          icicle-buffer-extras)
   (icicle-transform-function        'icicle-remove-dups-if-extras)
   (icicle-sort-function             (or icicle-buffer-sort icicle-sort-function))
   (icicle-delete-candidate-object   'icicle-kill-a-buffer) <span class="linecomment">; `S-delete' kills current buffer.</span>
   (icicle-require-match-flag        icicle-buffer-require-match-flag)
   (icicle-ignore-space-prefix-flag  icicle-buffer-ignore-space-prefix-flag)))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-add-buffer-candidate <span class="linecomment">; Command name</span>
  "<span class="quote">Add buffer as an always-show completion candidate.
Add the buffer to `icicle-buffer-extras'.  Save the updated option.
You can use `S-delete' on any completion candidate to remove it from
`icicle-buffer-extras'.</span>"                <span class="linecomment">; Doc string</span>
  (lambda (buf)
    (add-to-list 'icicle-buffer-extras buf) <span class="linecomment">; Action function</span>
    (funcall icicle-customize-save-variable-function 'icicle-buffer-extras icicle-buffer-extras)
    (message "<span class="quote">Buffer `%s' added to always-show buffers</span>" buf))
  "<span class="quote">Buffer candidate to show always: </span>"   <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (buf) (list (buffer-name buf))) (buffer-list))
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil
  'buffer-name-history (buffer-name (if (fboundp 'another-buffer)
                                        (another-buffer nil t)
                                      (other-buffer (current-buffer))))
  nil
  ((icicle-delete-candidate-object        'icicle-remove-buffer-candidate-action) <span class="linecomment">; Bindings</span>
   (icicle-use-candidates-only-once-flag  t)))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-remove-buffer-candidate <span class="linecomment">; Command name</span>
  "<span class="quote">Remove buffer as an always-show completion candidate.
Remove the buffer from `icicle-buffer-extras'.
Save the updated option.</span>" <span class="linecomment">; Doc string</span>
  icicle-remove-buffer-candidate-action <span class="linecomment">; Action function</span>
  "<span class="quote">Remove buffer from always-show list: </span>" <span class="linecomment">; `completing-read' args</span>
  (mapcar #'list icicle-buffer-extras) nil t nil 'buffer-name-history (car icicle-buffer-extras) nil
  ((icicle-use-candidates-only-once-flag  t))) <span class="linecomment">;  ; Additional bindings</span>

(defun icicle-remove-buffer-candidate-action (buf)
  "<span class="quote">Action function for command `icicle-remove-buffer-candidate'.</span>"
  (setq icicle-buffer-extras  (delete buf icicle-buffer-extras))
  (funcall icicle-customize-save-variable-function 'icicle-buffer-extras icicle-buffer-extras)
  (message "<span class="quote">Buffer `%s' removed from always-show buffers</span>" buf))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-buffer-config <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a configuration of user options for `icicle-buffer'.
You can use `S-delete' on any configuration during completion to
remove it.  See user option `icicle-buffer-configs'.
See also commands `icicle-add-buffer-config' and
`icicle-remove-buffer-config'.</span>"         <span class="linecomment">; Doc string</span>
  (lambda (config-name)                 <span class="linecomment">; Function to perform the action</span>
    (let ((config  (assoc config-name icicle-buffer-configs)))
      (setq icicle-buffer-match-regexp     (elt config 1)
            icicle-buffer-no-match-regexp  (elt config 2)
            icicle-buffer-predicate        (elt config 3)
            icicle-buffer-extras           (elt config 4)
            icicle-buffer-sort             (elt config 5))))
  "<span class="quote">Configuration: </span>" icicle-buffer-configs nil t nil <span class="linecomment">; `completing-read' args</span>
  'icicle-buffer-config-history nil nil
  ((icicle-delete-candidate-object  'icicle-remove-buffer-config-action))) <span class="linecomment">; Additional bindings</span>

<span class="linecomment">;;;###autoload</span>
(icicle-define-add-to-alist-command icicle-add-buffer-config <span class="linecomment">; Command name</span>
  "<span class="quote">Add buffer configuration to `icicle-buffer-configs'.
You are prompted for the buffer configuration components.
For the list of extra buffers to always display, you can choose them
using `C-mouse-2', `C-RET', and so on, just as you would make any
Icicles multiple choice.</span>"
  (lambda ()
    (let ((name            (read-from-minibuffer "<span class="quote">Add buffer configuration.  Name: </span>"))
          (match-regexp    (icicle-read-from-minibuf-nil-default
                            "<span class="quote">Regexp to match: </span>" nil nil nil 'regexp-history
                            icicle-buffer-match-regexp))
          (nomatch-regexp  (icicle-read-from-minibuf-nil-default
                            "<span class="quote">Regexp not to match: </span>" nil nil nil 'regexp-history
                            icicle-buffer-no-match-regexp))
          (pred            (icicle-read-from-minibuf-nil-default
                            "<span class="quote">Predicate to satify: </span>" nil nil nil
                            (if (boundp 'function-name-history)
                                'function-name-history
                              'icicle-function-name-history)
                            icicle-buffer-predicate))
          (sort-fn         (icicle-read-from-minibuf-nil-default
                            "<span class="quote">Sort function: </span>" nil nil t
                            (if (boundp 'function-name-history)
                                'function-name-history
                              'icicle-function-name-history)
                            (and icicle-buffer-sort (symbol-name icicle-buffer-sort))))
          (extras          (progn (message "<span class="quote">Choose extra buffers to show...</span>") (sit-for 1)
                                  (icicle-buffer-list)))) <span class="linecomment">; Do last, for convenience.</span>
      (list name match-regexp nomatch-regexp pred extras sort-fn)))
  icicle-buffer-configs)

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-buffer-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of buffer names.
You can use `S-delete' during completion to kill a candidate buffer.
The list of names (strings) is returned.

These options, when non-nil, control candidate matching and filtering:

 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer must satisfy
 `icicle-buffer-sort'               - Sort function for candidates

With a prefix argument, only buffers visiting files are candidates.
Note: The prefix arg is tested, even when this is called
noninteractively.  Lisp code can bind `current-prefix-arg' to control
the behavior.</span>"                          <span class="linecomment">; Doc string</span>
  (lambda (name) (push name buf-names)) <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Choose buffer (`RET' when done): </span>"   <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (buf) (list (buffer-name buf)))
          (if current-prefix-arg
              (icicle-remove-if-not (lambda (bf) (buffer-file-name bf)) (buffer-list))
            (buffer-list)))
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'buffer-name-history nil nil
  ((buf-names ())                       <span class="linecomment">; Additional bindings</span>
   (icicle-must-match-regexp              icicle-buffer-match-regexp)
   (icicle-must-not-match-regexp          icicle-buffer-no-match-regexp)
   (icicle-must-pass-predicate            icicle-buffer-predicate)
   (icicle-extra-candidates               icicle-buffer-extras)
   (icicle-transform-function             'icicle-remove-dups-if-extras)
   (icicle-sort-function                  (or icicle-buffer-sort icicle-sort-function))
   (icicle-delete-candidate-object        'icicle-kill-a-buffer) <span class="linecomment">; `S-delete' kills current buffer.</span>
   (icicle-require-match-flag             icicle-buffer-require-match-flag)
   (icicle-ignore-space-prefix-flag       icicle-buffer-ignore-space-prefix-flag)
   (icicle-use-candidates-only-once-flag  t))
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (prog1 (setq buf-names  (nreverse (delete "<span class="quote"></span>" buf-names))) <span class="linecomment">; Last code - return the list of buffers</span>
    (when (interactive-p) (message "<span class="quote">Buffers: %S</span>" buf-names))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-remove-buffer-config <span class="linecomment">; Command name</span>
  "<span class="quote">Remove buffer configuration from `icicle-buffer-configs'.
Save the updated option.</span>" <span class="linecomment">; Doc string</span>
  icicle-remove-buffer-config-action    <span class="linecomment">; Action function</span>
  "<span class="quote">Remove buffer configuration: </span>"       <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (config) (list (car config))) icicle-buffer-configs)
  nil t nil 'icicle-buffer-config-history (caar icicle-buffer-configs) nil
  ((icicle-use-candidates-only-once-flag  t))) <span class="linecomment">; Additional bindings</span>

(defun icicle-remove-buffer-config-action (config-name)
  "<span class="quote">Action function for command `icicle-remove-buffer-config'.</span>"
  (setq icicle-buffer-configs  (icicle-assoc-delete-all config-name icicle-buffer-configs))
  (funcall icicle-customize-save-variable-function 'icicle-buffer-configs icicle-buffer-configs)
  (message "<span class="quote">Buffer configuration `%s' removed</span>" config-name))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-face-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of face names.  The list of names (strings) is returned.</span>" <span class="linecomment">; Doc string</span>
  (lambda (name) (push (icicle-transform-multi-completion name) face-names)) <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar #'icicle-make-face-candidate (face-list))
  nil (not (stringp icicle-WYSIWYG-Completions-flag)) nil
  (if (boundp 'face-name-history) 'face-name-history 'icicle-face-name-history)
  nil nil
  ((prompt                                "<span class="quote">Choose face (`RET' when done): </span>") <span class="linecomment">; Additional bindings</span>
   (icicle-list-nth-parts-join-string     "<span class="quote">: </span>")
   (icicle-list-join-string               "<span class="quote">: </span>")
   (icicle-list-end-string                "<span class="quote"></span>")
   (icicle-list-use-nth-parts             '(1))
   (icicle-use-candidates-only-once-flag  t)
   (face-names                            ()))
  (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (prog1 (setq face-names  (nreverse (delete "<span class="quote"></span>" face-names))) <span class="linecomment">; Last code - return list of faces</span>
    (when (interactive-p) (message "<span class="quote">Faces: %S</span>" face-names))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-color-theme <span class="linecomment">; Command name</span>
  "<span class="quote">Change color theme.
You can use `S-delete' during completion to remove the current
candidate from the list of color themes.

To use this command, you must have loaded library `color-theme.el',
available from http://www.emacswiki.org/cgi-bin/wiki.pl?ColorTheme.</span>" <span class="linecomment">; Doc string</span>
  (lambda (theme) (funcall (intern theme))) <span class="linecomment">; Action - just call the theme.</span>
  "<span class="quote">Theme: </span>" icicle-color-themes nil t nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'color-theme-history) 'color-theme-history 'icicle-color-theme-history)
  nil nil
  ((icicle-delete-candidate-object  'icicle-color-themes))) <span class="linecomment">; Additional bindings</span>

<span class="linecomment">;; Bound to `C-- C-y' via `icicle-yank-maybe-completing'.</span>
<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-completing-yank
  "<span class="quote">Yank an entry from the `kill-ring', choosing it using completion.
This is like `yank', but it does not rotate the `kill-ring'.
The mark is pushed first, so the yanked text becomes the region.
You can sort the candidates to yank - use `C-,'.
You can use `S-delete' during completion to remove a candidate entry
from the `kill-ring'.</span>"                  <span class="linecomment">; Doc string</span>
  icicle-insert-for-yank                <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Insert: </span>" (mapcar #'list kill-ring) nil t nil 'icicle-kill-history <span class="linecomment">; `completing-read' args</span>
  (car kill-ring) nil
  ((icicle-transform-function       'icicle-remove-duplicates) <span class="linecomment">; Additional bindings</span>
   (icicle-sort-function            nil)
   (icicle-delete-candidate-object  'kill-ring)))

(defun icicle-insert-for-yank (string)
  "<span class="quote">`insert-for-yank', if defined; else, `insert' with `read-only' removed.
Pushes the mark first, so the inserted text becomes the region.</span>"
  (push-mark)
  (if (fboundp 'insert-for-yank)        <span class="linecomment">; Defined in `subr.el' (not required).</span>
      (insert-for-yank string)
    (let ((opoint  (point)))
      (insert string)
      (let ((inhibit-read-only  t)) (remove-text-properties opoint (point) '(read-only nil))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-yank-maybe-completing (&optional arg) <span class="linecomment">;  Bound to `C-y' (or what `yank' was bound to).</span>
  "<span class="quote">`icicle-completing-yank', `icicle-yank', or `icicle-yank-function'.
If called from the minibuffer, call `icicle-yank'.
Otherwise:
 With a negative prefix argument, call `icicle-completing-yank'.
 Otherwise, call the value of user option `icicle-yank-function' (by
 default, `yank').</span>"
  (interactive "<span class="quote">*P</span>")
  (if (window-minibuffer-p (selected-window))
      (icicle-yank arg)
    (if (wholenump (prefix-numeric-value arg))
        (funcall icicle-yank-function arg)
      (icicle-completing-yank))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-file-command icicle-delete-file <span class="linecomment">; Command name</span>
  "<span class="quote">Delete a file or directory.</span>"         <span class="linecomment">; Doc string</span>
  icicle-delete-file-or-directory       <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Delete file or directory: </span>" default-directory nil t nil nil <span class="linecomment">; `read-file-name' args</span>
  ((icicle-use-candidates-only-once-flag  t))) <span class="linecomment">; Additional bindings</span>

(defun icicle-delete-file-or-directory (file)
  "<span class="quote">Delete file or (empty) directory FILE.</span>"
  (condition-case i-delete-file
      (if (eq t (car (file-attributes file)))
          (delete-directory file)
        (delete-file file))
    (error (message (error-message-string i-delete-file))
           (error (error-message-string i-delete-file)))))

<span class="linecomment">;; $$$$$ (icicle-define-command icicle-file-list ; Command name</span>
<span class="linecomment">;;   "Choose a list of file names.</span>
<span class="linecomment">;; You can use `S-delete' during completion to delete a candidate file.</span>
<span class="linecomment">;; The list of names (strings) is returned." ; Doc string</span>
<span class="linecomment">;;   (lambda (name) (push name file-names)) ; Function to perform the action</span>
<span class="linecomment">;;   "Choose file (`RET' when done): "     ; `completing-read' args</span>
<span class="linecomment">;;   (mapcar #'list (directory-files default-directory nil icicle-re-no-dot))</span>
<span class="linecomment">;;   nil nil nil 'file-name-history nil nil</span>
<span class="linecomment">;;   ((file-names nil)                     ; Additional bindings</span>
<span class="linecomment">;;    (icicle-delete-candidate-object  'icicle-delete-file-or-directory) ; `S-delete' deletes file.</span>
<span class="linecomment">;;    (icicle-use-candidates-only-once-flag  t))</span>
<span class="linecomment">;;   nil nil                               ; First code, undo code</span>
<span class="linecomment">;;   (prog1 (setq file-names  (nreverse (delete "" file-names))) ; Last code - return files list</span>
<span class="linecomment">;;     (when (interactive-p) (message "Files: %S" file-names))))</span>

<span class="linecomment">;;;###autoload</span>
(icicle-define-file-command icicle-file-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of file and directory names.
Use multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.
You can navigate the directory tree, picking files and directories
anywhere in the tree.

You can use `S-delete' during completion to delete a candidate file.
  Careful: This deletes the file, it does not just remove it as a
  candidate.
The list of file names (strings) is returned.

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (&gt; (nth 5 (file-attributes file)) 5000))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.</span>" <span class="linecomment">; Doc string</span>
  (lambda (name) (push name file-names)) <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Choose file (`RET' when done): </span>"     <span class="linecomment">; `read-file-name' args</span>
  nil nil t nil nil
  ((file-names                         nil) <span class="linecomment">; Additional bindings</span>
   (icicle-must-match-regexp           icicle-file-match-regexp)
   (icicle-must-not-match-regexp       icicle-file-no-match-regexp)
   (icicle-must-pass-predicate         icicle-file-predicate)
   (icicle-extra-candidates            icicle-file-extras)
   (icicle-transform-function          'icicle-remove-dups-if-extras)
   (icicle-sort-function               (or icicle-file-sort icicle-sort-function))
   (icicle-require-match-flag          icicle-file-require-match-flag)
   (icicle-delete-candidate-object     'icicle-delete-file-or-directory) <span class="linecomment">; `S-delete' deletes file.</span>
   (icicle-comp-base-is-default-dir-p  t)
   <span class="linecomment">;; $$$$$ (icicle-dir-candidate-can-exit-p (not current-prefix-arg))</span>
   )
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (prog1 (setq file-names  (nreverse (delete "<span class="quote"></span>" file-names))) <span class="linecomment">; Last code - return list of files</span>
    (when (interactive-p) (message "<span class="quote">Files: %S</span>" file-names))))

<span class="linecomment">;;;###autoload</span>
(when (&gt; emacs-major-version 21)
  (icicle-define-file-command icicle-directory-list <span class="linecomment">; Command name</span>
    "<span class="quote">Choose a list of directory names.
Use multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.
You can navigate the directory tree, picking directories anywhere in
the tree.

You can use `S-delete' during completion to delete a candidate (empty)
directory.
  Careful: This deletes the directory, it does not just remove it as a
  candidate.
The list of directory names (strings) is returned.

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra directory names to display
 `icicle-file-match-regexp'     - Regexp directory names must match
 `icicle-file-no-match-regexp'  - Regexp dir names must not match
 `icicle-file-predicate'        - Predicate dir names must satisfy
 `icicle-file-sort'             - Sort function for candidates

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.</span>" <span class="linecomment">; Doc string</span>
    (lambda (name) (push name dir-names)) <span class="linecomment">; Function to perform the action</span>
    "<span class="quote">Choose file (`RET' when done): </span>"   <span class="linecomment">; `read-file-name' args</span>
    <span class="linecomment">;; $$$$$$ nil nil t nil (lambda (file) (eq t (car (file-attributes file)))) ; PREDICATE</span>
    nil nil t nil #'file-directory-p    <span class="linecomment">; PREDICATE</span>
    ((dir-names                          nil) <span class="linecomment">; Additional bindings</span>
     (icicle-must-match-regexp           icicle-file-match-regexp)
     (icicle-must-not-match-regexp       icicle-file-no-match-regexp)
     (icicle-must-pass-predicate         icicle-file-predicate)
     (icicle-extra-candidates            icicle-file-extras)
     (icicle-transform-function          'icicle-remove-dups-if-extras)
     (icicle-sort-function               (or icicle-file-sort icicle-sort-function))
     (icicle-require-match-flag          icicle-file-require-match-flag)
     (icicle-delete-candidate-object     'icicle-delete-file-or-directory) <span class="linecomment">; `S-delete' deletes file</span>
     (icicle-comp-base-is-default-dir-p  t)
     <span class="linecomment">;; $$$$$ (icicle-dir-candidate-can-exit-p (not current-prefix-arg))</span>
     )
    nil nil                             <span class="linecomment">; First code, undo code</span>
    (prog1 (setq dir-names  (nreverse (delete "<span class="quote"></span>" dir-names))) <span class="linecomment">; Last code - return the list of dirs</span>
      (when (interactive-p) (message "<span class="quote">Directories: %S</span>" dir-names)))))


(put 'icicle-file 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(defun icicle-file (arg)                <span class="linecomment">; Bound to `C-x C-f' in Icicle mode.</span>
  "<span class="quote">Visit a file or directory.
With no prefix argument, use relative file names
 (`icicle-find-file').
With a prefix argument, use absolute file names
 (`icicle-find-file-absolute').
With a negative prefix argument, you can choose also by date:
 Completion candidates include the the last modification date.

Note that when you use a prefix argument completion matches candidates
as ordinary strings.  It knows nothing of file names per se.  In
particular, you cannot use remote file-name syntax if you use a prefix
argument.

You can use `S-delete' during completion to delete a candidate file.

By default, Icicle mode remaps all key sequences that are normally bound
to `find-file' to `icicle-file'.  If you do not want this remapping,
then customize option `icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if arg
      (if (wholenump (prefix-numeric-value arg))
          (let ((current-prefix-arg  nil)) (icicle-find-file-absolute))
        (icicle-find-file-absolute))
    (icicle-find-file)))


(put 'icicle-file-other-window 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(defun icicle-file-other-window (arg)   <span class="linecomment">; Bound to `C-x 4 f' in Icicle mode.</span>
  "<span class="quote">Visit a file or directory in another window.
With no prefix argument, use relative file names
 (`icicle-find-file-other-window').
With a prefix argument, use absolute file names
 (`icicle-find-file-absolute-other-window').
With a negative prefix argument, you can choose also by date:
 Completion candidates include the the last modification date.

Note that when you use a prefix argument completion matches candidates
as ordinary strings.  It knows nothing of file names per se.  In
particular, you cannot use remote file-name syntax if you use a prefix
argument.

You can use `S-delete' during completion to delete a candidate file.

By default, Icicle mode remaps all key sequences that are normally
bound to `find-file-other-window' to `icicle-file-other-window'.  If
you do not want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if arg
      (if (wholenump (prefix-numeric-value arg))
          (let ((current-prefix-arg  nil)) (icicle-find-file-absolute-other-window))
        (icicle-find-file-absolute-other-window))
    (icicle-find-file-other-window)))


(put 'icicle-find-file-absolute 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-find-file-absolute <span class="linecomment">; Command name</span>
  "<span class="quote">Visit a file or directory, given its absolute name.
Unlike `icicle-find-file', the completion candidates are absolute, not
relative, file names.  By default, the completion candidates are files
in the current directory, but you can substitute other candidates by
retrieving a saved candidate set.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-hiding-common-match]' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

With a prefix argument, you can choose also by date: Completion
candidates include the the last modification date.

You can use `S-delete' during completion to delete a candidate file.

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (&gt; (nth 5 (file-attributes file)) 5000))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.</span>"    <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file (icicle-transform-multi-completion f) 'wildcards)) <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          icicle-abs-file-candidates)
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  default-directory 'file-name-history default-directory nil
  <span class="linecomment">;; Additional bindings</span>
  ((prompt                             "<span class="quote">File or directory: </span>")
   (icicle-abs-file-candidates
    (mapcar (lambda (fil) (if (file-directory-p fil) (concat fil "<span class="quote">/</span>") fil))
            (directory-files default-directory 'full nil 'nosort)))
   (icicle-special-candidate-regexp    (or icicle-special-candidate-regexp "<span class="quote">.+/$</span>"))
   (icicle-must-match-regexp           icicle-file-match-regexp)
   (icicle-must-not-match-regexp       icicle-file-no-match-regexp)
   (icicle-must-pass-predicate         icicle-file-predicate)
   (icicle-extra-candidates            icicle-file-extras)
   (icicle-transform-function          'icicle-remove-dups-if-extras)
   (icicle-sort-function               (or icicle-file-sort icicle-sort-function))
   (icicle-require-match-flag          icicle-file-require-match-flag)
   (icicle-delete-candidate-object     'icicle-delete-file-or-directory) <span class="linecomment">; `S-delete' deletes file.</span>
   (icicle-candidate-properties-alist  (and current-prefix-arg
                                            '((1 (face 'icicle-candidate-part)))))
   (icicle-list-use-nth-parts          (and current-prefix-arg '(1))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil)))


(put 'icicle-find-file-absolute-other-window 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-find-file-absolute-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Visit a file or directory in another window, given its absolute name.
Same as `icicle-find-file-absolute' except uses a different window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file-other-window (icicle-transform-multi-completion f) 'wildcards)) <span class="linecomment">; Action</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          icicle-abs-file-candidates)
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  default-directory 'file-name-history default-directory nil
  <span class="linecomment">;; Additional bindings</span>
  ((prompt                             "<span class="quote">File or directory: </span>")
   (icicle-abs-file-candidates
    (mapcar (lambda (fil) (if (file-directory-p fil) (concat fil "<span class="quote">/</span>") fil))
            (directory-files default-directory 'full nil 'nosort)))
   (icicle-special-candidate-regexp    (or icicle-special-candidate-regexp "<span class="quote">.+/$</span>"))
   (icicle-must-match-regexp           icicle-file-match-regexp)
   (icicle-must-not-match-regexp       icicle-file-no-match-regexp)
   (icicle-must-pass-predicate         icicle-file-predicate)
   (icicle-extra-candidates            icicle-file-extras)
   (icicle-transform-function          'icicle-remove-dups-if-extras)
   (icicle-sort-function               (or icicle-file-sort icicle-sort-function))
   (icicle-require-match-flag          icicle-file-require-match-flag)
   (icicle-delete-candidate-object     'icicle-delete-file-or-directory) <span class="linecomment">; `S-delete' deletes file.</span>
   (icicle-candidate-properties-alist  (and current-prefix-arg
                                            '((1 (face 'icicle-candidate-part)))))
   (icicle-list-use-nth-parts          (and current-prefix-arg '(1))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil)))


(put 'icicle-find-file 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(icicle-define-file-command icicle-find-file
  "<span class="quote">Visit a file or directory.
You can use `S-delete' during completion to delete a candidate file.

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra absolute file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (&gt; (nth 5 (file-attributes file)) 5000))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.</span>"    <span class="linecomment">; Doc string</span>
  (lambda (file) (find-file file 'wildcards)) <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">File or directory: </span>" nil             <span class="linecomment">; `read-file-name' args</span>
  (and (eq major-mode 'dired-mode) (fboundp 'dired-get-file-for-visit) <span class="linecomment">; Emacs 22+.</span>
       (condition-case nil              <span class="linecomment">; E.g. error because not on file line (ignore)</span>
           (abbreviate-file-name (dired-get-file-for-visit))
         (error nil)))
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil nil
  <span class="linecomment">;; Additional bindings</span>
  ((icicle-must-match-regexp           icicle-file-match-regexp)
   (icicle-must-not-match-regexp       icicle-file-no-match-regexp)
   (icicle-must-pass-predicate         icicle-file-predicate)
   (icicle-extra-candidates            icicle-file-extras)
   (icicle-transform-function          'icicle-remove-dups-if-extras)
   (icicle-sort-function               (or icicle-file-sort icicle-sort-function))
   (icicle-require-match-flag          icicle-file-require-match-flag)
   (icicle-delete-candidate-object     'icicle-delete-file-or-directory) <span class="linecomment">; `S-delete' deletes file</span>
   (icicle-default-value                <span class="linecomment">; Let user get default via `M-n', but don't insert it.</span>
    (and (memq icicle-default-value '(t nil)) icicle-default-value))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-file-command icicle-find-file-other-window
  "<span class="quote">Visit a file or directory in another window.
Same as `icicle-find-file' except it uses a different window.

Note: Unlike standard `C-x 4 f' (`find-file-other-window'), in Dired
the file or directory on the current line is the default value.  Like
`C-x 4 f', if you just hit `RET' without entering any text, that is
the same as if you first use `M-n' to retrieve the default value and
then hit `RET'.  Thus, if you just want to visit, in a different
window, the current directory instead of the file or directory of the
current line, you should use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-erase-minibuffer-or-history-element]' to first empty the minibuffer.
Or you can just use a different command, such as `\\[dired]', to visit the
current directory.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (file) (find-file-other-window file 'wildcards)) <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">File or directory: </span>" nil             <span class="linecomment">; `read-file-name' args</span>
  (and (eq major-mode 'dired-mode) (fboundp 'dired-get-file-for-visit) <span class="linecomment">; Emacs 22+.</span>
       (condition-case nil              <span class="linecomment">; E.g. error because not on file line (ignore)</span>
           (abbreviate-file-name (dired-get-file-for-visit))
         (error nil)))
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil nil
  <span class="linecomment">;; Additional bindings</span>
  ((icicle-must-match-regexp           icicle-file-match-regexp)
   (icicle-must-not-match-regexp       icicle-file-no-match-regexp)
   (icicle-must-pass-predicate         icicle-file-predicate)
   (icicle-extra-candidates            icicle-file-extras)
   (icicle-transform-function          'icicle-remove-dups-if-extras)
   (icicle-sort-function               (or icicle-file-sort icicle-sort-function))
   (icicle-require-match-flag          icicle-file-require-match-flag)
   (icicle-delete-candidate-object     'icicle-delete-file-or-directory) <span class="linecomment">; `S-delete' deletes file</span>
   (icicle-default-value                <span class="linecomment">; Let user get default via `M-n', but don't insert it.</span>
    (and (memq icicle-default-value '(t nil)) icicle-default-value))))

(put 'icicle-recent-file 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-recent-file <span class="linecomment">; Command name</span>
  "<span class="quote">Open a recently used file.
With a prefix argument, you can choose also by date: Completion
candidates include the the last modification date.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-hiding-common-match]' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

You can use `S-delete' during completion to delete a candidate file.

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra absolute file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (&gt; (nth 5 (file-attributes file)) 5000))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.</span>"    <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file (icicle-transform-multi-completion f) 'wildcards)) <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          icicle-abs-file-candidates)
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'file-name-history (car recentf-list) nil
  ((prompt                             "<span class="quote">Recent file: </span>") <span class="linecomment">; Additional bindings</span>
   (icicle-abs-file-candidates         (progn (unless (boundp 'recentf-list) (require 'recentf))
                                              (when (fboundp 'recentf-mode) (recentf-mode 99))
                                              (unless (consp recentf-list)
                                                (error "<span class="quote">No recently accessed files</span>"))
                                              recentf-list))
   (icicle-must-match-regexp           icicle-file-match-regexp)
   (icicle-must-not-match-regexp       icicle-file-no-match-regexp)
   (icicle-must-pass-predicate         icicle-file-predicate)
   (icicle-extra-candidates            icicle-file-extras)
   (icicle-transform-function          'icicle-remove-dups-if-extras)
   (icicle-sort-function               (or icicle-file-sort icicle-sort-function))
   (icicle-require-match-flag          icicle-file-require-match-flag)
   (icicle-delete-candidate-object     'icicle-delete-file-or-directory) <span class="linecomment">; `S-delete' deletes file.</span>
   (icicle-candidate-properties-alist  (and current-prefix-arg
                                            '((1 (face 'icicle-candidate-part)))))
   (icicle-list-use-nth-parts          (and current-prefix-arg '(1))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil)))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-recent-file-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Open a recently used file in another window.
Same as `icicle-recent-file' except it uses a different window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file-other-window (icicle-transform-multi-completion f) 'wildcards)) <span class="linecomment">; Action</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          icicle-abs-file-candidates)
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'file-name-history (car recentf-list) nil
  ((prompt                             "<span class="quote">Recent file: </span>") <span class="linecomment">; Additional bindings</span>
   (icicle-abs-file-candidates         (progn (unless (boundp 'recentf-list) (require 'recentf))
                                              (when (fboundp 'recentf-mode) (recentf-mode 99))
                                              (unless (consp recentf-list)
                                                (error "<span class="quote">No recently accessed files</span>"))
                                              recentf-list))
   (icicle-must-match-regexp           icicle-file-match-regexp)
   (icicle-must-not-match-regexp       icicle-file-no-match-regexp)
   (icicle-must-pass-predicate         icicle-file-predicate)
   (icicle-extra-candidates            icicle-file-extras)
   (icicle-transform-function          'icicle-remove-dups-if-extras)
   (icicle-sort-function               (or icicle-file-sort icicle-sort-function))
   (icicle-require-match-flag          icicle-file-require-match-flag)
   (icicle-delete-candidate-object     'icicle-delete-file-or-directory) <span class="linecomment">; `S-delete' deletes file.</span>
   (icicle-candidate-properties-alist  (and current-prefix-arg
                                            '((1 (face 'icicle-candidate-part)))))
   (icicle-list-use-nth-parts          (and current-prefix-arg '(1))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil)))


(put 'icicle-locate-file 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-locate-file <span class="linecomment">; Command name</span>
  "<span class="quote">Visit a file within a directory or its subdirectories.
With a non-negative (&gt;= 0) prefix argument, you are prompted for the
directory.  Otherwise, the current directory is used.

With a non-positive (&lt;= 0) prefix argument, you can choose also by
date: Completion candidates include the last modification date.

The absolute names of all files within the directory and all of its
subdirectories are targets for completion.  Regexp input is matched
against all parts of the absolute name, not just the file-name part.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-hiding-common-match]' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

You can use this command to find all files within your file system
that match a regexp, but be aware that gathering and matching the file
names will take some time.

Remember that you can save the set of files matching your input using
`\\[icicle-candidate-set-save]' or \
`\\[icicle-candidate-set-save-persistently]'.  You can then retrieve quickly them later using
`\\[icicle-candidate-set-retrieve]' or \
`\\[icicle-candidate-set-retrieve-persistent]'.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

You can use `S-delete' during completion to delete a candidate file.

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (&gt; (nth 5 (file-attributes file)) 5000))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.</span>"    <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file (icicle-transform-multi-completion f) 'wildcards)) <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if (&lt;= (prefix-numeric-value current-prefix-arg) 0)
              #'icicle-make-file+date-candidate
            #'list)
          icicle-abs-file-candidates)
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'file-name-history nil nil
  ((prompt                             "<span class="quote">File: </span>") <span class="linecomment">; Bindings</span>
   (dir                                (if (and current-prefix-arg
                                                (wholenump (prefix-numeric-value
                                                            current-prefix-arg)))
                                           (read-file-name "<span class="quote">Locate under which directory: </span>" nil
                                                           default-directory nil)
                                         default-directory))
   (IGNORE--FOR-SIDE-EFFECT            (progn
                                         (icicle-highlight-lighter)
                                         (message "<span class="quote">Gathering files within `%s' (this could take \
a while)...</span>" dir)))
   (icicle-abs-file-candidates         (icicle-files-within (directory-files dir 'full
                                                                             icicle-re-no-dot) nil))
   (icicle-must-match-regexp           icicle-file-match-regexp)
   (icicle-must-not-match-regexp       icicle-file-no-match-regexp)
   (icicle-must-pass-predicate         icicle-file-predicate)
   (icicle-extra-candidates            icicle-file-extras)
   (icicle-transform-function          'icicle-remove-dups-if-extras)
   (icicle-sort-function               (or icicle-file-sort icicle-sort-function))
   (icicle-require-match-flag          icicle-file-require-match-flag)
   (icicle-delete-candidate-object     'icicle-delete-file-or-directory) <span class="linecomment">; `S-delete' deletes file.</span>
   (use-dialog-box                     nil)
   (icicle-candidate-properties-alist  (and (&lt;= (prefix-numeric-value current-prefix-arg) 0)
                                            '((1 (face 'icicle-candidate-part)))))
   (icicle-list-use-nth-parts          '(1)))
  (progn                                <span class="linecomment">; First code</span>
    (when (&lt;= (prefix-numeric-value current-prefix-arg) 0)
      (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil)))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-locate-file-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Same as `icicle-locate-file' except visit file in a different window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file-other-window (icicle-transform-multi-completion f) 'wildcards)) <span class="linecomment">; Action</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if (&lt;= (prefix-numeric-value current-prefix-arg) 0)
              #'icicle-make-file+date-candidate
            #'list)
          icicle-abs-file-candidates)
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer) (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'file-name-history nil nil
  ((prompt                             "<span class="quote">File: </span>") <span class="linecomment">; Bindings</span>
   (dir                                (if (and current-prefix-arg
                                                (wholenump (prefix-numeric-value
                                                            current-prefix-arg)))
                                           (read-file-name "<span class="quote">Locate under which directory: </span>" nil
                                                           default-directory nil)
                                         default-directory))
   (IGNORED--FOR-SIDE-EFFECT           (progn
                                         (icicle-highlight-lighter)
                                         (message "<span class="quote">Gathering files within `%s' (this could take \
a while)...</span>" dir)))
   (icicle-abs-file-candidates         (icicle-files-within (directory-files dir 'full <span class="linecomment">; Bindings</span>
                                                                             icicle-re-no-dot) nil))
   (icicle-must-match-regexp           icicle-file-match-regexp)
   (icicle-must-not-match-regexp       icicle-file-no-match-regexp)
   (icicle-must-pass-predicate         icicle-file-predicate)
   (icicle-extra-candidates            icicle-file-extras)
   (icicle-transform-function          'icicle-remove-dups-if-extras)
   (icicle-sort-function               (or icicle-file-sort icicle-sort-function))
   (icicle-require-match-flag          icicle-file-require-match-flag)
   (icicle-delete-candidate-object     'icicle-delete-file-or-directory) <span class="linecomment">; `S-delete' deletes file.</span>
   (use-dialog-box                     nil)
   (icicle-candidate-properties-alist  (and (&lt;= (prefix-numeric-value current-prefix-arg) 0)
                                            '((1 (face 'icicle-candidate-part)))))
   (icicle-list-use-nth-parts          '(1)))
  (progn                                <span class="linecomment">; First code</span>
    (when (&lt;= (prefix-numeric-value current-prefix-arg) 0)
      (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (define-key minibuffer-local-completion-map [(control backspace)] 'icicle-up-directory)
    (define-key minibuffer-local-must-match-map [(control backspace)] 'icicle-up-directory))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil))
  (progn                                <span class="linecomment">; Undo code</span>
    (define-key minibuffer-local-completion-map [(control backspace)] nil)
    (define-key minibuffer-local-must-match-map [(control backspace)] nil)))

(defun icicle-make-file+date-candidate (file)
  "<span class="quote">Return a multi-completion candidate: FILE + last modification date.</span>"
  (list (list file (format-time-string "<span class="quote">%Y %m %d %T </span>" (nth 5 (file-attributes file))))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-font      <span class="linecomment">; Command name</span>
  "<span class="quote">Change font of current frame.</span>"       <span class="linecomment">; Doc string</span>
  (lambda (font) (modify-frame-parameters orig-frame (list (cons 'font font)))) <span class="linecomment">; Action function</span>
  "<span class="quote">Font: </span>" (mapcar #'list (x-list-fonts "<span class="quote">*</span>")) <span class="linecomment">; `completing-read' args</span>
  nil t nil (if (boundp 'font-name-history) 'font-name-history 'icicle-font-name-history) nil nil
  ((orig-frame  (selected-frame))       <span class="linecomment">; Additional bindings</span>
   (orig-font   (frame-parameter nil 'font)))
  nil                                   <span class="linecomment">; First code</span>
  (modify-frame-parameters orig-frame (list (cons 'font orig-font))) <span class="linecomment">; Undo code</span>
  nil)                                  <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-frame-bg  <span class="linecomment">; Command name</span>
  "<span class="quote">Change background of current frame.</span>" <span class="linecomment">; Doc string</span>
  (lambda (color)                       <span class="linecomment">; Function to perform the action</span>
    (modify-frame-parameters orig-frame (list (cons 'background-color color))))
  "<span class="quote">Background color: </span>" (mapcar #'list (x-defined-colors)) <span class="linecomment">; `completing-read' args</span>
  nil t nil (if (boundp 'color-history) 'color-history 'icicle-color-history) nil nil
  ((orig-frame  (selected-frame))       <span class="linecomment">; Additional bindings</span>
   (orig-bg     (frame-parameter nil 'background-color)))
  nil                                   <span class="linecomment">; First code</span>
  (modify-frame-parameters orig-frame (list (cons 'background-color orig-bg))) <span class="linecomment">; Undo code</span>
  nil)                                  <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-frame-fg  <span class="linecomment">; Command name</span>
  "<span class="quote">Change foreground of current frame.</span>" <span class="linecomment">; Doc string</span>
  (lambda (color)                       <span class="linecomment">; Function to perform the action</span>
    (modify-frame-parameters orig-frame (list (cons 'foreground-color color))))
  "<span class="quote">Foreground color: </span>" (mapcar #'list (x-defined-colors)) <span class="linecomment">; `completing-read' args</span>
  nil t nil (if (boundp 'color-history) 'color-history 'icicle-color-history) nil nil
  ((orig-frame  (selected-frame))       <span class="linecomment">; Additional bindings</span>
   (orig-bg     (frame-parameter nil 'foreground-color)))
  nil                                   <span class="linecomment">; First code</span>
  (modify-frame-parameters orig-frame (list (cons 'foreground-color orig-bg))) <span class="linecomment">; Undo code</span>
  nil)                                  <span class="linecomment">; Last code</span>

<span class="linecomment">;; Bind this, not `icicle-Info-index', to `i' in Info mode,</span>
<span class="linecomment">;; so plain `Info-index' will be used when not also in Icicle mode.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-Info-index-cmd ()         <span class="linecomment">; Bound to `i' in Info mode.</span>
  "<span class="quote">If in Icicle mode, run `icicle-Info-index'; else, run `Info-index'.
Note: In Emacs versions prior to version 22, this runs `Info-index'.</span>"
  (interactive)
  (call-interactively (if icicle-mode 'icicle-Info-index 'Info-index)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-Info-index ()
  "<span class="quote">Like `Info-index', but you can use Icicles keys `C-RET', `C-up' etc.</span>"
  (interactive)
  (when (and (boundp 'Info-current-file) (equal Info-current-file "<span class="quote">dir</span>"))
    (error "<span class="quote">The Info directory node has no index; use `m' to select a manual</span>"))
  (let ((info-buf                    (current-buffer))
        (info-window                 (selected-window))
        (icicle-candidate-action-fn  'icicle-Info-index-action))
    (call-interactively (if (&gt; emacs-major-version 21) 'Info-index 'icicle-Info-index-20))))

<span class="linecomment">;; Thx to Tamas Patrovics for this Emacs 20 version.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-Info-index-20 ()
  "<span class="quote">Like `Info-index', but you can use completion for the index topic.</span>"
  (interactive)
  (let* ((symb (or (and (fboundp 'symbol-nearest-point) <span class="linecomment">; Defined in `thingatpt+.el'.</span>
                        (symbol-nearest-point))
                   (symbol-at-point)))
         (topic (and symb (symbol-name symb))))
    (Info-index "<span class="quote"></span>")
    (let ((pattern     "<span class="quote">\\* +\\([^:]*\\):.</span>")
          (candidates  ()))
      (goto-char (point-min))
      (while (re-search-forward pattern nil t) (push (list (match-string 1)) candidates))
      (Info-index (completing-read "<span class="quote">Index topic: </span>" candidates nil t nil nil topic)))))

<span class="linecomment">;; Free vars here: `info-buf' and `info-window' are bound in `icicle-Info-index'.</span>
(defun icicle-Info-index-action (topic)
  "<span class="quote">Completion action function for `icicle-Info-index'.</span>"
  (let ((minibuf-win  (selected-window)))
    (set-buffer info-buf)
    (select-window info-window)
    (Info-index topic)
    (select-window minibuf-win)))

<span class="linecomment">;; Bind this, not `icicle-Info-menu', to `m' in Info mode,</span>
<span class="linecomment">;; so plain `Info-menu' will be used when not also in Icicle mode.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-Info-menu-cmd ()    <span class="linecomment">; Bound to `m' in Info mode.</span>
  "<span class="quote">In Icicle mode, run `icicle-Info-menu'; else, `Info-menu'.</span>"
  (interactive)
  (call-interactively (if icicle-mode 'icicle-Info-menu 'Info-menu)))

<span class="linecomment">;; Free vars here: `Info-menu-entry-name-re' is bound in `info.el'.</span>
(icicle-define-command icicle-Info-menu
  "<span class="quote">Go to a menu node.</span>"                  <span class="linecomment">; Doc string</span>
  (lambda (m) (icicle-Info-goto-node (cdr (icicle-get-alist-candidate m)))) <span class="linecomment">; Action function</span>
  "<span class="quote">Menu item: </span>" icicle-candidates-alist <span class="linecomment">; `completing-read' args</span>
  nil t nil nil (save-excursion
                  (goto-char (point-min))
                  (unless (search-forward "<span class="quote">\n* menu:</span>" nil t) (error "<span class="quote">No menu in this node</span>"))
                  (setq menu-eol  (point))
                  (and (&lt; menu-eol opoint)
                       (save-excursion
                         (goto-char opoint) (end-of-line)
                         (and (re-search-backward (concat "<span class="quote">\n\\* +\\(</span>"
                                                          (if (boundp 'Info-menu-entry-name-re)
                                                              Info-menu-entry-name-re
                                                            "<span class="quote">[^:\t\n]*</span>")
                                                          "<span class="quote">\\):</span>")
                                                  menu-eol t)
                              (match-string-no-properties 1)))))
  nil
  ((opoint                                 (point)) <span class="linecomment">; Additional bindings</span>
   (completion-ignore-case                 t)
   (case-fold-search                       t)
   (icicle-sort-function                   nil)
   (icicle-whole-candidate-as-text-prop-p  t)
   (Info-complete-menu-buffer              (current-buffer))
   (icicle-candidates-alist                (mapcar (lambda (m) (cons m (Info-extract-menu-item m)))
                                                   (reverse
                                                    (all-completions "<span class="quote"></span>" 'Info-complete-menu-item))))
   menu-eol))

<span class="linecomment">;; Bind this, not `icicle-Info-goto-node', to `g' in Info mode,</span>
<span class="linecomment">;; so plain `Info-goto-node' will be used when not also in Icicle mode.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-Info-goto-node-cmd ()     <span class="linecomment">; Bound to `g' in Info mode.</span>
  "<span class="quote">In Icicle mode, run `icicle-Info-goto-node'; else, `Info-goto-node'.</span>"
  (interactive)
  (call-interactively (if icicle-mode 'icicle-Info-goto-node 'Info-goto-node)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-Info-goto-node (nodename &optional arg)
  "<span class="quote">Go to Info node named NODENAME.
NODENAME has the form NODE or (FILE)NODE-IN-FILE, where:
 NODE names a node in the current Info file or one of its subfiles.
 FILE names an Info file containing node NODE-IN-FILE.
Completion is available for node names in the current Info file.

With a prefix argument ARG, treated as a numeric value:

 * If ARG &lt; 0, then completion candidates are presented in book order,
   and are limited to the current node and the rest of the book.
   In this case, the first candidate is `..', which goes up.
   
 * If ARG &gt;= 0, then show node in a new Info buffer (Emacs 21+).

In Lisp code, if ARG is a string, then show the node in a new Info
buffer named ARG.

With no prefix argument, or with a non-negative prefix arg, you can
use `C-,' to choose how to sort completion candidates.  By default,
they are sorted alphabetically.

Input-candidate completion and cycling are available.  While cycling,
these keys with prefix `C-' are active:

`C-mouse-2', `C-RET' - Go to current completion candidate (node)
`C-down'  - Go to next prefix-completion candidate
`C-up'    - Go to previous prefix-completion candidate
`C-next'  - Go to next apropos-completion candidate
`C-prior' - Go to previous apropos-completion candidate

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate, or
`C-g' to quit.

This is an Icicles command - see command `icicle-mode'.</span>"
  (interactive
   (let* ((info-buf                         (current-buffer))
          (info-window                      (selected-window))
          (icicle-candidate-action-fn       'icicle-Info-goto-node-action)
          (icicle-Info-only-rest-of-book-p  (&lt; (prefix-numeric-value current-prefix-arg) 0))
          (icicle-sort-functions-alist      (cons '("<span class="quote">in book order</span>" .  icicle-Info-book-order-p)
                                                  icicle-sort-functions-alist))
          (icicle-sort-function             (if icicle-Info-only-rest-of-book-p
                                                #'icicle-Info-book-order-p
                                              icicle-sort-function)))
     (list (icicle-Info-read-node-name "<span class="quote">Go to node: </span>") current-prefix-arg)))
  (icicle-Info-goto-node-1 nodename arg))

(defun icicle-Info-goto-node-1 (nodename &optional arg)
  "<span class="quote">Same as `Info-goto-node', but go up for `..' pseudo-node.</span>"
  (if (and (string= nodename "<span class="quote">..</span>") (Info-check-pointer "<span class="quote">up</span>"))
      (Info-up)
    (if (&gt; emacs-major-version 20)
        (Info-goto-node nodename (and arg (not icicle-Info-only-rest-of-book-p)))
      (Info-goto-node nodename))))

(defun icicle-Info-read-node-name (prompt)
  "<span class="quote">Read a node name, prompting with PROMPT.</span>"
  (let* ((completion-ignore-case           t)
         (Info-read-node-completion-table  (icicle-Info-build-node-completions))
         (nodename                         (completing-read prompt 'Info-read-node-name-1 nil nil)))
    (if (equal nodename "<span class="quote"></span>") (icicle-Info-read-node-name prompt) nodename)))

(defun icicle-Info-build-node-completions ()
  "<span class="quote">Build completions list for Info nodes.
This takes `icicle-Info-only-rest-of-book-p' into account.</span>"
  (icicle-highlight-lighter)
  (if (or (not icicle-Info-only-rest-of-book-p) (string= Info-current-node "<span class="quote">Top</span>"))
      (icicle-Info-build-node-completions-fix-*)
    (reverse (cons '("<span class="quote">..</span>") (member (list Info-current-node)
                                   (reverse (icicle-Info-build-node-completions-fix-*)))))))

(defun icicle-Info-build-node-completions-fix-* ()
  "<span class="quote">`Info-build-node-completions', but get rid of `*' pseudo-node.
This just fixes a bug in Emacs 21 and 22.1.</span>"
  (let ((comps  (Info-build-node-completions)))
    (when (equal (car comps) '("<span class="quote">*</span>")) (setq comps  (cdr comps)))
    comps))

<span class="linecomment">;; Free vars here:</span>
<span class="linecomment">;; `info-buf' and `info-window' are bound in `icicle-Info-goto-node'.</span>
<span class="linecomment">;; `Info-read-node-completion-table' is bound in `info.el'.</span>
(defun icicle-Info-goto-node-action (node)
  "<span class="quote">Completion action function for `icicle-Info-goto-node'.</span>"
  (set-buffer info-buf)
  (select-window info-window)
  (icicle-Info-goto-node-1 node)
  (when icicle-Info-only-rest-of-book-p
    (setq Info-read-node-completion-table  (icicle-Info-build-node-completions)
          icicle-current-input             "<span class="quote"></span>")
    (icicle-complete-again-update)
    (if (and (string= Info-current-node "<span class="quote">Top</span>") Info-history)
        (let* ((hist  Info-history)
               (last  (car (cdr (car hist)))))
          (while (string= "<span class="quote">Top</span>" (car (cdr (car hist)))) (pop hist))
          (setq icicle-candidate-nb
                (1- (length (reverse (member (list (car (cdr (car hist))))
                                             (icicle-Info-build-node-completions-fix-*)))))))
      (setq icicle-candidate-nb  1))     <span class="linecomment">; Skip `..'.</span>

    <span class="linecomment">;; $$$$$$ Maybe factor this out. Same thing in several places.  However, here we don't do</span>
    <span class="linecomment">;; `icicle-maybe-sort-and-strip-candidates' at beginning of first clause.</span>
    (cond ((and icicle-completion-candidates (cdr icicle-completion-candidates)) <span class="linecomment">; &gt; 1 left.</span>
           (message "<span class="quote">Displaying completion candidates...</span>")
           (save-selected-window (icicle-display-candidates-in-Completions))
           (with-current-buffer "<span class="quote">*Completions*</span>"
             (goto-char (icicle-start-of-candidates-in-Completions))
             (icicle-move-to-next-completion
              (mod icicle-candidate-nb (length icicle-completion-candidates)))
             (set-window-point (get-buffer-window "<span class="quote">*Completions*</span>" 0) (point))
             (setq icicle-last-completion-candidate  (icicle-current-completion-in-Completions))
             (set-buffer-modified-p nil)))
          (icicle-completion-candidates <span class="linecomment">; Single candidate left</span>
           (save-selected-window (icicle-remove-Completions-window))
           (let ((completion  (icicle-transform-multi-completion
                               (car icicle-completion-candidates))))
             (select-window (active-minibuffer-window))
             (with-current-buffer (window-buffer) <span class="linecomment">; Need if *Completions* redirected to minibuffer.</span>
               (goto-char (icicle-minibuffer-prompt-end))
               (icicle-clear-minibuffer)
               (insert (if (and (icicle-file-name-input-p) insert-default-directory
                                (or (not (member completion icicle-extra-candidates))
                                    icicle-extra-candidates-dir-insert-p))
                           (icicle-file-name-directory-w-default icicle-current-input)
                         "<span class="quote"></span>")
                       completion))))
          (t                            <span class="linecomment">; No candidates left</span>
           (select-window (active-minibuffer-window))
           (with-current-buffer (window-buffer) <span class="linecomment">; Needed if *Completions* redirected to minibuffer.</span>
             (goto-char (icicle-minibuffer-prompt-end))
             (icicle-clear-minibuffer)))))
  (select-window (active-minibuffer-window)))

(defun icicle-Info-book-order-p (s1 s2)
  "<span class="quote">Non-nil if Info node S1 comes before node S2 in the book.</span>"
  t)        <span class="linecomment">; This just reverses the default order, which is reversed.</span>

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-insert-thesaurus-entry <span class="linecomment">; Command name</span>
  "<span class="quote">Insert an entry from a thesaurus.
Library `synonyms.el' is needed for this.  If you have never used
command `synonyms' before, then the first use of
`icicle-insert-thesaurus-entry' will take a while, because it will
build a cache file of synonyms that are used for completion.  See
`synonyms.el'.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-incremental-completion] to toggle incremental completion.</span>" <span class="linecomment">; Doc string</span>
  icicle-insert-thesaurus-entry-cand-fn <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Thesaurus entry to match: </span>" synonyms-obarray <span class="linecomment">; `completing-read' args</span>
  nil nil nil 'icicle-dictionary-history nil nil
  ((icicle-track-pt  (point)))          <span class="linecomment">; Additional bindings</span>
  (progn                                <span class="linecomment">; First code</span>
    (unless (or (boundp 'synonyms-obarray) (require 'synonyms nil t))
      (error "<span class="quote">You must first load library `synonyms.el'</span>"))
    (synonyms-ensure-synonyms-read-from-cache))
  (when (window-live-p orig-window)     <span class="linecomment">; Undo code</span>
    (select-window orig-window)
    (select-frame-set-input-focus (selected-frame))
    (goto-char icicle-track-pt))
  (when (window-live-p orig-window)     <span class="linecomment">; Last code</span>
    (select-window orig-window)
    (select-frame-set-input-focus (selected-frame))
    (goto-char icicle-track-pt)))

<span class="linecomment">;; Free vars here: `orig-buff' is bound in `icicle-insert-thesaurus-entry'.</span>
(defun icicle-insert-thesaurus-entry-cand-fn (string)
  "<span class="quote">Action function for `icicle-insert-thesaurus-entry'.
Insert STRING, followed by a space, at position TRACK-PT of buffer
ORIG-BUFF.</span>"
  (set-buffer orig-buff)
  (goto-char icicle-track-pt)
  (insert string "<span class="quote"> </span>")
  (setq icicle-track-pt  (point))
  (save-excursion (set-buffer (window-buffer (minibuffer-window))) (icicle-clear-minibuffer))
  (save-selected-window (icicle-remove-Completions-window)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-complete-thesaurus-entry (word) <span class="linecomment">; Bound to `C-c /' in Icicle mode.</span>
  "<span class="quote">Complete WORD to an entry from a thesaurus.
The default value of WORD is the word at the cursor.
Library `synonyms.el' is needed for this.  If you have never used
command `synonyms' before, then the first use of
`icicle-insert-thesaurus-entry' will take a while, because it will
build a cache file of synonyms that are used for completion.  See
`synonyms.el'.</span>"
  (interactive (list (word-at-point)))
  (unless word (error "<span class="quote">No word at point to complete</span>"))
  (unless (or (boundp 'synonyms-obarray) (require 'synonyms nil t))
    (error "<span class="quote">You must first load library `synonyms.el'</span>"))
  (synonyms-ensure-synonyms-read-from-cache)
  (when (and (looking-at "<span class="quote">\\b</span>") (not (looking-at "<span class="quote">\\s-</span>"))) (forward-word 1))
  (delete-region (progn (forward-word -1) (point)) (progn (forward-word 1) (point)))
  (insert (completing-read "<span class="quote">Thesaurus entry to match: </span>" synonyms-obarray
                           nil nil word 'icicle-dictionary-history word))
  (unless (looking-at "<span class="quote">\\s-</span>") (insert "<span class="quote"> </span>")))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-where-is  <span class="linecomment">; Command name</span>
  "<span class="quote">Show keyboard/menu/mouse sequences that invoke specified command.
This is a multi-command version of `where-is'.

With no prefix argument, only commands actually bound to keys are
completion candidates.  With a prefix argument, all commands are
candidates.

With a plain (non-numeric) prefix argument, `C-u', insert the message
in the current buffer.

By default, Icicle mode remaps all key sequences that are normally
bound to `where-is' to `icicle-where-is'.  If you do not want this
remapping, then customize option `icicle-top-level-key-bindings'.</span>" <span class="linecomment">; Doc string</span>
  (lambda (x) (let ((symb  (intern-soft x))) <span class="linecomment">; Action function</span>
                (where-is symb (and pref-arg (consp pref-arg)))))
  "<span class="quote">Where is command: </span>" obarray          <span class="linecomment">; `completing-read' args</span>
  (if pref-arg
      'commandp
    (lambda (c)
      (with-current-buffer orig-buff
        (and (commandp c) (where-is-internal c overriding-local-map 'non-ascii)))))
  t nil nil (let ((fn  (or (and (fboundp 'symbol-nearest-point) (symbol-nearest-point))
                           (function-called-at-point))))
              (and fn (symbol-name fn)))
  t
  ((pref-arg  current-prefix-arg)       <span class="linecomment">; Additional bindings</span>
   (icicle-candidate-help-fn
    (lambda (c) (let* ((keys   (where-is-internal (intern-soft c) overriding-local-map))
                       (keys1  (mapconcat 'key-description keys "<span class="quote">, </span>")))
                  (message (format "<span class="quote">`%s' is on `%s'</span>" c keys1))
                  (sit-for 3))))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-describe-option-of-type <span class="linecomment">; Bound to `C-h C-o'.  Command name</span>
  "<span class="quote">Describe a user option that was defined with a given `defcustom' type.
Enter patterns for the OPTION name and TYPE definition in the
minibuffer, separated by `icicle-list-join-string', which is \"^G^J\",
by default.  (`^G' here means the Control-g character, input using
`C-h C-g'.  Likewise, for `^J'.)

OPTION is a regexp that is matched against option names.

Depending on the prefix arg, TYPE is interpreted as either of these:

 - a regexp to match against the option type

 - a definition acceptable for `defcustom' :type, or its first symbol,
   for example, (choice (integer) (regexp)) or `choice'

In the second case, depending on the prefix arg, TYPE can be matched
against the option type, or it can be matched against either the
option type or one of its subtypes.

In the second case also, depending on the prefix arg, if TYPE does not
match some option's type, that option might still be a candidate, if
its current value satisfies TYPE.

In sum, the prefix arg determines the type-matching behavior, as
follows:

 - None:      OPTION is defined with TYPE or a subtype of TYPE.
              TYPE is a regexp.

 - `C-u':     OPTION is defined with TYPE or a subtype of TYPE,
                or its current value is compatible with TYPE.
              TYPE is a type definition or its first symbol.

 - Negative:  OPTION is defined with TYPE (exact match).
              TYPE is a regexp.

 - Positive:  OPTION is defined with TYPE,
                or its current value is compatible with TYPE.
              TYPE is a type definition or its first symbol.

 - Zero:      OPTION is defined with TYPE or a subtype of TYPE.
              TYPE is a type definition or its first symbol.

 - `C-u C-u': OPTION is defined with TYPE (exact match).
              TYPE is a type definition or its first symbol.

You can change these prefix-arg key sequences by customizing option
`icicle-option-type-prefix-arg-list'.  For example, if you tend to use
the matching defined here for `C-u', you might want to make that the
default behavior (no prefix arg).  You can assign any of the six
behaviors to any of the prefix-arg keys.

If TYPE is nil, then *all* options that match OPTION are candidates.

Note that options defined in libraries that have not been loaded can
be candidates, but their type will appear as nil, since it is not
known before loading the option definition.

You can match your input against the option name or the type
definition or both.  Use `C-M-j' (equivalent here to `C-q C-g C-j') to
input the default separator.

For example, to match all Icicles options whose type matches `string'
\(according to the prefix arg), use `S-TAB' with this input:

icicle.*^G
string$

If you instead want all Icicles options whose type definition contains
`string', as in (repeat string), then use this:

icicle.*^G
\[^^G]*string

Here, `[^^G]' matches any character except ^G, which includes newline.
If you use `.'  here instead of `[^^G]', then only the first lines of
type definitions are searched for `string', because `.' matches any
character except a newline.  (The first `^' in `[^^G]' is a circumflex
character.  The second `^' is part of `^G', the printed representation
of a Control-g character.)

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-incremental-completion] to toggle incremental completion.</span>" <span class="linecomment">; Doc string</span>
  icicle-describe-opt-action            <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  'icicle-describe-opt-of-type-complete nil nil nil nil nil nil
  ((prompt                             "<span class="quote">OPTION `C-M-j' TYPE (`RET' when done): </span>") <span class="linecomment">; Bindings</span>
   (icicle-candidate-properties-alist  '((1 (face 'icicle-candidate-part))))
   <span class="linecomment">;; Bind `icicle-apropos-complete-match-fn' to nil to prevent automatic input matching</span>
   <span class="linecomment">;; in `icicle-unsorted-apropos-candidates' etc., because `icicle-describe-opt-of-type-complete'</span>
   <span class="linecomment">;; does everything.</span>
   (icicle-apropos-complete-match-fn   nil)
   (icicle-candidate-help-fn           'icicle-describe-opt-action)
   <span class="linecomment">;; $$$ (icicle-highlight-input-completion-failure nil)</span>
   (pref-arg                           current-prefix-arg))
  (progn (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
         (icicle-highlight-lighter)
         (message "<span class="quote">Gathering user options and their types...</span>")))

(defun icicle-describe-opt-action (opt+type)
  "<span class="quote">Action function for `icicle-describe-option-of-type'.</span>"
  (let ((icicle-list-use-nth-parts  '(1)))
    (describe-variable (intern (icicle-transform-multi-completion opt+type)))))

<span class="linecomment">;; Free var here: `pref-arg' - it is bound in `icicle-describe-option-of-type'.</span>
(defun icicle-describe-opt-of-type-complete (strg pred completion-mode)
  "<span class="quote">Completion function for `icicle-describe-option-of-type'.
This is used as the value of `minibuffer-completion-table'.</span>"
  (setq strg  icicle-current-input)
  <span class="linecomment">;; Parse strg into its option part and its type part: OPS  and TPS.</span>
  <span class="linecomment">;; Make raw alist of all options and their types: ((a . ta) (b . tb)...).</span>
  (let* ((num-prefix  (prefix-numeric-value pref-arg))
         (mode        (cond ((not pref-arg) <span class="linecomment">; No prefix arg</span>
                             (nth 4 icicle-option-type-prefix-arg-list))
                            ((and (consp pref-arg) (= 16 num-prefix)) <span class="linecomment">; C-u C-u</span>
                             (nth 0 icicle-option-type-prefix-arg-list))
                            ((consp pref-arg) (nth 2 icicle-option-type-prefix-arg-list)) <span class="linecomment">; C-u</span>
                            ((zerop num-prefix) (nth 1 icicle-option-type-prefix-arg-list)) <span class="linecomment">; C-0</span>
                            ((wholenump num-prefix) <span class="linecomment">; C-9</span>
                             (nth 3 icicle-option-type-prefix-arg-list))
                            (t (nth 5 icicle-option-type-prefix-arg-list)))) <span class="linecomment">; C--</span>
         (ops         (let ((icicle-list-use-nth-parts  '(1)))
                        (icicle-transform-multi-completion strg)))
         (tps         (let ((icicle-list-use-nth-parts  '(2)))
                        (icicle-transform-multi-completion strg)))
         (tp          (and (not (string= "<span class="quote"></span>" tps))
                           <span class="linecomment">;; Use regexp if no prefix arg or negative; else use sexp.</span>
                           (if (memq mode '(inherit-or-regexp direct-or-regexp)) tps (read tps))))
         (result      nil))
    (mapatoms
     (lambda (symb)
       (when (if (fboundp 'custom-variable-p) (custom-variable-p symb) (user-variable-p symb))
         (condition-case nil
             (push (list symb (get symb 'custom-type)) result)
           (error nil)))))
    <span class="linecomment">;; Keep only candidates that correspond to input.</span>
    (setq result
          (let ((ops-re  (if (memq icicle-current-completion-mode '(nil apropos))
                             ops
                           (concat "<span class="quote">^</span>" ops))))
            (icicle-remove-if-not
             (lambda (opt+typ)
               (and (string-match ops-re (symbol-name (car opt+typ)))
                    (or (null tp)
                        (icicle-var-is-of-type-p (car opt+typ) (list tp)
                                                 (case mode
                                                   ((inherit inherit-or-regexp) 'inherit)
                                                   ((direct  direct-or-regexp)  'direct)
                                                   (inherit-or-value     'inherit-or-value)
                                                   (direct-or-value      'direct-or-value))))))
             result)))
    <span class="linecomment">;; Change alist entries to multi-completions: "op^G^Jtp".</span>
    (setq result  (mapcar (lambda (entry)
                            (concat (mapconcat (lambda (e) (pp-to-string e))
                                               entry icicle-list-join-string)
                                    icicle-list-end-string))
                          result))
    (if completion-mode
        result                          <span class="linecomment">; `all-completions', `test-completion'</span>
      (try-completion strg (mapcar #'list result) pred)))) <span class="linecomment">; `try-completion'</span>

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-vardoc    <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a variable description.
Each candidate for completion is a variable name plus its
documentation.  They are separated by `icicle-list-join-string'
\(\"^G^J\", by default).  You can match an input regexp against the
variable name or the documentation or both.  Use `C-M-j' (equivalent
here to `C-q C-g C-j') to input the default separator.

For example, use input

\"dired.*^G
\[^^G]*list\"

with `S-TAB' to match all variables whose names contain \"dired\" and
whose documentation contains \"list\".  Here, `[^^G]' matches any
character except ^G, which includes newline.  If you use `.*' here,
instead, then only the first lines of doc strings are searched.

With a non-negative prefix argument, use the same documentation that
was gathered the last time `icicle-vardoc' was called.  Use a
non-negative prefix arg to save the time that would be needed to
gather the documentation.

With a non-positive prefix arg, use only user variables (options) as
candidates.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-incremental-completion] to toggle incremental completion.</span>" <span class="linecomment">; Doc string</span>
  icicle-funvardoc-action               <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (let* ((num-arg         (prefix-numeric-value pref-arg))
         (options-only-p  (&lt;= num-arg 0))
         (result          (and pref-arg (&gt;= num-arg 0)
                               (if options-only-p
                                   icicle-vardoc-last-initial-option-cand-set
                                 icicle-vardoc-last-initial-cand-set))))
    (unless result                      <span class="linecomment">; COLLECTION arg is an alist whose items are ((symb doc)).</span>
      (mapatoms (lambda (symb)          <span class="linecomment">; Each completion candidate is a list of strings.</span>
                  (when (and (boundp symb)
                             (or (wholenump (prefix-numeric-value pref-arg))
                                 (user-variable-p symb)))
                    (let ((doc  (documentation-property symb 'variable-documentation)))
                      (when (icicle-non-whitespace-string-p doc)
                        (push (list (list (symbol-name symb) doc)) result))))))
      (if options-only-p
          (setq icicle-vardoc-last-initial-option-cand-set  result)
        (setq icicle-vardoc-last-initial-cand-set  result)))
    result)
  nil nil nil 'icicle-doc-history nil nil
  ((prompt                             "<span class="quote">VAR `C-M-j' DOC (`RET' when done): </span>") <span class="linecomment">; Additional bindings</span>
   (icicle-candidate-properties-alist  '((1 (face 'icicle-candidate-part))))
   (icicle-candidate-help-fn           'icicle-funvardoc-action)
   (pref-arg                           current-prefix-arg))
  (progn
    (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
    (icicle-highlight-lighter)
    (message "<span class="quote">Gathering variable descriptions...</span>")))

(defun icicle-funvardoc-action (entry)
  "<span class="quote">Action function for `icicle-vardoc', `icicle-fundoc', `icicle-plist'.</span>"
  (with-output-to-temp-buffer "<span class="quote">*Help*</span>" (princ entry)))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-fundoc    <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a function description.
Each candidate for completion is a function name plus its
documentation.  They are separated by `icicle-list-join-string'
\(\"^G^J\", by default).  You can match an input regexp against the
function name or the documentation or both.  Use `C-M-j' (equivalent
here to `C-q C-g C-j') to input the default separator.

For example, use input

\"dired.*^G
\[^^G]*file\"

with `S-TAB' to match all functions whose names contain \"dired\" and
whose documentation contains \"file\".  Here, `[^^G]' matches any
character except ^G, which includes newline.  If you use `.*' here,
instead, then only the first lines of doc strings are searched.

With a prefix argument, use the same documentation that was gathered
the last time `icicle-fundoc' was called.  Use a prefix arg to save
the time that would be needed to gather the documentation.

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-incremental-completion] to toggle incremental completion.</span>" <span class="linecomment">; Doc string</span>
  icicle-funvardoc-action               <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (let ((result  (and pref-arg icicle-fundoc-last-initial-cand-set)))
    (unless result                      <span class="linecomment">; COLLECTION arg is an alist whose items are ((symb doc)).</span>
      (mapatoms
       (lambda (symb)                   <span class="linecomment">; Each completion candidate is a list of strings.</span>
         (when (fboundp symb)
           <span class="linecomment">;; Ignore symbols that produce errors.  Example: In Emacs 20, `any', which is defalias'd</span>
           <span class="linecomment">;; to `icicle-anything', raises this error: "Symbol's function definition is void: any".</span>
           <span class="linecomment">;; This is caused by the `after' advice `ad-advised-docstring' that is defined by Emacs</span>
           <span class="linecomment">;; itself for function `documentation'.  It is not a problem for Emacs 22+. </span>
           (let ((doc (condition-case nil (documentation symb) (error nil))))
             (when (and doc (icicle-non-whitespace-string-p (icicle-fn-doc-minus-sig doc)))
               (push (list (list (symbol-name symb) doc)) result))))))
      (setq icicle-fundoc-last-initial-cand-set  result))
    result)
  nil nil nil 'icicle-doc-history nil nil
  ((prompt                             "<span class="quote">FUNC `C-M-j' DOC (`RET' when done): </span>") <span class="linecomment">; Additional bindings</span>
   (icicle-candidate-properties-alist  '((1 (face 'icicle-candidate-part))))
   (icicle-candidate-help-fn           'icicle-funvardoc-action)
   (pref-arg                           current-prefix-arg))
  (progn
    (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
    (icicle-highlight-lighter)
    (message "<span class="quote">Gathering function descriptions...</span>")))

(defun icicle-fn-doc-minus-sig (docstring)
  "<span class="quote">Return DOCSTRING minus the function signature (usage info).</span>"
  (let ((sig-p  (string-match "<span class="quote">\n\n(fn\\(\\( .*\\)?)\\)\\'</span>" docstring)))
    (if sig-p (substring docstring 0 (match-beginning 0)) docstring)))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-plist     <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a symbol and its property list.
Each candidate for completion is a symbol name plus its property list
\(as a string).  They are separated by `icicle-list-join-string'
\(^G^J, by default).  You can match an input regexp against the symbol
name or the property list or both.  Use `C-M-j' (equivalent here to
`C-q C-g C-j') to input the default separator.

With a prefix argument, use the same initial set of candidates that
were gathered the last time `icicle-plist' was called.  Use a prefix
arg to save the time that would be needed to gather the plists.

Remember that you can use `[^^G]' to match any character except ^G,
which includes newline. Remember also that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-incremental-completion] to toggle incremental completion.</span>" <span class="linecomment">; Doc string</span>
  icicle-funvardoc-action               <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (let ((result  (and pref-arg icicle-plist-last-initial-cand-set)))
    (unless result                      <span class="linecomment">; COLLECTION arg: an alist with items ((symb plist-string))</span>
      (mapatoms
       (lambda (symb)                   <span class="linecomment">; Each completion candidate is a list of strings.</span>
         (condition-case nil            <span class="linecomment">; Ignore symbols that produce errors.</span>
             (let ((plist  (symbol-plist symb)))
               (when plist
                 (push (list (list (symbol-name symb) (format "<span class="quote">%s</span>" plist))) result)))
           (error nil))))
      (setq icicle-plist-last-initial-cand-set  result))
    result)
  nil nil nil nil nil nil
  ((prompt                             "<span class="quote">SYMB `C-M-j' PLIST (`RET' when done): </span>") <span class="linecomment">; Bindings</span>
   (icicle-candidate-properties-alist  '((1 (face 'icicle-candidate-part))))
   (pref-arg                           current-prefix-arg))
  (progn
    (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
    (icicle-highlight-lighter)
    (message "<span class="quote">Gathering property lists...</span>")))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-doc       <span class="linecomment">; Command name</span>
  "<span class="quote">Choose documentation for a symbol.
Each candidate for completion is the description of a function,
variable, or face.  Displays the documentation and returns the symbol.

Each candidate for completion is a symbol name plus its type
\(FUNCTION, VARIABLE, or FACE) and its documentation.  These candidate
components are separated by `icicle-list-join-string' (\"^G^J\", by
default).  You can match an input regexp against the symbol name,
type, or the documentation or any combination of the three.  Use
`C-M-j' (equivalent here to `C-q C-g C-j') to input the default
separator.

With a prefix argument, use the same documentation that was gathered
the last time `icicle-doc' was called.  Use a prefix arg to save the
time that would be needed to gather the documentation.

Remember that you can use \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-toggle-incremental-completion]' to toggle incremental completion.</span>" <span class="linecomment">; Doc string</span>
  icicle-doc-action                     <span class="linecomment">; Action function: display the doc.</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (let ((result  (and pref-arg icicle-doc-last-initial-cand-set))
        doc)                            <span class="linecomment">; Each completion candidate is a list of strings.</span>
    (unless result                      <span class="linecomment">; COLLECTION arg is an alist with items (doc . symb).</span>
      (mapatoms
       (lambda (symb)
         (progn
           (when (and (functionp symb)  <span class="linecomment">; Function's doc.</span>
                      <span class="linecomment">;; Ignore symbols that produce errors.  See comment for `icicle-fundoc'.</span>
                      (setq doc  (condition-case nil (documentation symb) (error nil)))
                      (setq doc  (icicle-fn-doc-minus-sig doc))
                      (icicle-non-whitespace-string-p doc)
                      (setq doc  (concat doc "<span class="quote">\n\n</span>")))
             (push (cons (list (concat (symbol-name symb) icicle-list-join-string "<span class="quote">FUNCTION</span>") doc)
                         symb)
                   result))
           (when (and (boundp symb)     <span class="linecomment">; Variable's doc (and keymap var's bindings if remove nil)</span>
                      (setq doc  (documentation-property symb 'variable-documentation))
                      (icicle-non-whitespace-string-p doc))
             (when (and nil             <span class="linecomment">; $$$ Remove nil to get keymaps, but it slows things down.</span>
                        (fboundp 'describe-keymap)
                        (keymapp (symbol-value symb)))
               (setq doc  (concat (symbol-name symb) "<span class="quote">:\n</span>" doc "<span class="quote">\n\n</span>" <span class="linecomment">; Keymap variable's doc.</span>
                                  (substitute-command-keys
                                   (concat "<span class="quote">\\{</span>" (symbol-name symb) "<span class="quote">}</span>"))
                                  "<span class="quote">\n\n</span>")))
             (setq doc  (concat doc "<span class="quote">\n\n</span>"))
             (push (cons (list (concat (symbol-name symb) icicle-list-join-string "<span class="quote">VARIABLE</span>") doc)
                         symb)
                   result))
           (when (and (facep symb)
                      (setq doc  (documentation-property symb 'face-documentation)))
             (push (cons (list (concat (symbol-name symb) icicle-list-join-string "<span class="quote">FACE</span>") doc)
                         symb)
                   result)))))
      (setq icicle-doc-last-initial-cand-set  result))
    result)
  nil nil nil 'icicle-doc-history nil nil
  ((prompt                             "<span class="quote">Find doc with regexp: </span>") <span class="linecomment">; Additional bindings</span>
   (icicle-candidate-properties-alist  '((1 (face 'icicle-candidate-part))))
   (icicle-list-use-nth-parts          '(1))
   (icicle-transform-function          'icicle-remove-duplicates) <span class="linecomment">; Duplicates are due to `fset's.</span>
   (icicle-candidate-help-fn           'icicle-doc-action)
   (pref-arg                           current-prefix-arg))
  (progn
    (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
    (icicle-highlight-lighter)
    (message "<span class="quote">Gathering documentation...</span>")))

(defun icicle-doc-action (entry)
  "<span class="quote">Completion action function for `icicle-doc': Display the doc.</span>"
  (let ((symb  (intern (icicle-transform-multi-completion entry))))
    (cond ((fboundp symb) (describe-function symb))
          <span class="linecomment">;; $$$ This works fine, but it slows things down:</span>
          <span class="linecomment">;; ((and (fboundp 'describe-keymap) (boundp symb) (keymapp (symbol-value symb)))</span>
          <span class="linecomment">;;  (describe-keymap symb))</span>
          ((and symb (boundp symb)) (describe-variable symb))
          ((facep symb) (describe-face symb)))
    symb))

<span class="linecomment">;;;###autoload</span>
(defun icicle-non-whitespace-string-p (string)
  "<span class="quote">Return non-nil if STRING contains a non-whitespace character.
The `standard-syntax-table' definition of whitespace is used.</span>"
  (interactive "<span class="quote">s</span>")
  (let ((orig-syntable  (syntax-table)))
    (unwind-protect
       (progn
         (set-syntax-table (standard-syntax-table))
         (and (stringp string) (&gt; (length string) 0) (string-match "<span class="quote">\\S-</span>" string)))
      (set-syntax-table orig-syntable))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos (apropos-regexp &optional do-all)
  "<span class="quote">Like `apropos', but lets you see the list of matches (with `S-TAB').
Function names are highlighted using face `icicle-special-candidate'.</span>"
  (interactive
   (list
    (unwind-protect
         (progn
           (mapatoms (lambda (symb) (when (fboundp symb) (put symb 'icicle-special-candidate t))))
           (let ((icicle-fancy-candidates-p  t))
             (completing-read "<span class="quote">Apropos symbol (regexp or words): </span>" obarray
                              nil nil nil 'regexp-history)))
      (mapatoms (lambda (symb) (put symb 'icicle-special-candidate nil))))
    current-prefix-arg))
  (apropos apropos-regexp do-all))

<span class="linecomment">;;;###autoload</span>
(cond
  <span class="linecomment">;; Use my versions of the `apropos*' commands, defined in `apropos-fn+var.el'.</span>
  <span class="linecomment">;; Note that unlike my versions of `apropos-option' and `apropos-command', the `icicle-'</span>
  <span class="linecomment">;; versions here do not respect `apropos-do-all': they always work with options and commands.</span>
  ((fboundp 'apropos-option)
   (defun icicle-apropos-variable (pattern)
     "<span class="quote">Show variables that match PATTERN.
This includes variables that are not user options.
User options are highlighted using face `icicle-special-candidate'.
You can see the list of matches with `S-TAB'.
See `apropos-variable' for a description of PATTERN.</span>"
     (interactive
      (list
       (unwind-protect
            (progn
              (mapatoms (lambda (symb)
                          (when (user-variable-p symb) (put symb 'icicle-special-candidate t))))
              (let ((icicle-fancy-candidates-p  t))
                (completing-read
                 (concat "<span class="quote">Apropos variable (regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>")
                         "<span class="quote">): </span>") obarray
                         #'(lambda (symbol) (and (boundp symbol) (get symbol 'variable-documentation)))
                         nil nil 'regexp-history)))
         (mapatoms (lambda (symb) (put symb 'icicle-special-candidate nil))))))
     (apropos-variable pattern))

   (defun icicle-apropos-option (pattern)
     "<span class="quote">Show user options (variables) that match PATTERN.
You can see the list of matches with `S-TAB'.
See `apropos-option' for a description of PATTERN.</span>"
     (interactive
      (list (completing-read
             (concat "<span class="quote">Apropos user option (regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>")
                     "<span class="quote">): </span>") obarray 'user-variable-p nil nil 'regexp-history)))
     (let ((apropos-do-all  nil)) (apropos-option pattern)))

   (defun icicle-apropos-function (pattern)
     "<span class="quote">Show functions that match PATTERN.
This includes functions that are not commands.
Command names are highlighted using face `icicle-special-candidate'.
You can see the list of matches with `S-TAB'.
See `apropos-function' for a description of PATTERN.</span>"
     (interactive
      (list 
       (unwind-protect
            (progn
              (mapatoms (lambda (symb)
                          (when (commandp symb) (put symb 'icicle-special-candidate t))))
              (let ((icicle-fancy-candidates-p  t))
                (completing-read
                 (concat "<span class="quote">Apropos function (regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>")
                         "<span class="quote">): </span>") obarray 'fboundp nil nil 'regexp-history)))
         (mapatoms (lambda (symb) (put symb 'icicle-special-candidate nil))))))
     (apropos-function pattern))

   (defun icicle-apropos-command (pattern)
     "<span class="quote">Show commands (interactively callable functions) that match PATTERN.
You can see the list of matches with `S-TAB'.
See `apropos-command' for a description of PATTERN.</span>"
     (interactive
      (list (completing-read
             (concat "<span class="quote">Apropos command (regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>")
                     "<span class="quote">): </span>") obarray 'commandp nil nil 'regexp-history)))
     (let ((apropos-do-all  nil)) (apropos-command pattern))))

  <span class="linecomment">;; My versions are not available.  Use the vanilla Emacs versions of the `apropos...' commands.</span>
  (t
   (defun icicle-apropos-variable (pattern &optional do-all)
     "<span class="quote">Show variables that match PATTERN.
You can see the list of matches with `S-TAB'.
See `apropos-variable' for a description of PATTERN.

By default, only user options are candidates.  With optional prefix
DO-ALL, or if `apropos-do-all' is non-nil, all variables are
candidates.  In that case, the user-option candidates are highlighted
using face `icicle-special-candidate'.</span>"
     (interactive
      (list
       (unwind-protect
            (progn
              (unless (or (boundp 'apropos-do-all) (require 'apropos nil t))
                (error "<span class="quote">Library `apropos' not found</span>"))
              (when (or current-prefix-arg apropos-do-all)
                (mapatoms (lambda (symb)
                            (when (user-variable-p symb) (put symb 'icicle-special-candidate t)))))
              (let ((icicle-fancy-candidates-p  (or current-prefix-arg apropos-do-all)))
                (completing-read
                 (concat "<span class="quote">Apropos </span>" (if (or current-prefix-arg apropos-do-all)
                                        "<span class="quote">variable</span>" "<span class="quote">user option</span>")
                         "<span class="quote"> (regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>") "<span class="quote">): </span>")
                 obarray (if (or current-prefix-arg apropos-do-all)
                             #'(lambda (symbol) (and (boundp symbol)
                                                     (get symbol 'variable-documentation)))
                           'user-variable-p)
                 nil nil 'regexp-history)))
         (when (or current-prefix-arg apropos-do-all)
           (mapatoms (lambda (symb) (put symb 'icicle-special-candidate nil)))))
       current-prefix-arg))
     (apropos-variable pattern do-all))

   (defun icicle-apropos-command (pattern &optional do-all var-predicate)
     "<span class="quote">Show commands (interactively callable functions) that match PATTERN.
You can see the list of matches with `S-TAB'.

See `apropos-command' for a description of PATTERN.

With \\[universal-argument] prefix, or if `apropos-do-all' is non-nil,
also show noninteractive functions.  In that case, the command
candidates are highlighted using face `icicle-special-candidate'.

If VAR-PREDICATE is non-nil, show only variables, and only those that
satisfy the predicate VAR-PREDICATE.</span>"
     (interactive
      (list 
       (unwind-protect
            (progn
              (unless (boundp 'apropos-do-all)
                (unless (require 'apropos nil t) (error "<span class="quote">Library `apropos' not found</span>")))
              (when (or current-prefix-arg apropos-do-all)
                (mapatoms (lambda (symb)
                            (when (commandp symb) (put symb 'icicle-special-candidate t)))))
              (let ((icicle-fancy-candidates-p  (or current-prefix-arg apropos-do-all)))
                (completing-read
                 (concat "<span class="quote">Apropos </span>" (if (or current-prefix-arg apropos-do-all)
                                        "<span class="quote">command or function</span>" "<span class="quote">command</span>")
                         "<span class="quote">(regexp</span>" (and (&gt;= emacs-major-version 22) "<span class="quote"> or words</span>") "<span class="quote">): </span>")
                 obarray (if current-prefix-arg 'fboundp 'commandp) nil nil 'regexp-history)))
         (when (or current-prefix-arg apropos-do-all)
           (mapatoms (lambda (symb) (put symb 'icicle-special-candidate nil)))))
       current-prefix-arg))
     (apropos-command pattern do-all var-predicate))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-zippy (regexp)
  "<span class="quote">Show all Zippy quotes matching the regular-expression input REGEXP.
Return the list of matches.</span>"
  (interactive (progn (unless (boundp 'yow-file)
                        (unless (require 'yow nil t) (error "<span class="quote">Library `yow' not found</span>")))
                      (cookie yow-file yow-load-message yow-after-load-message)
                      (let* ((case-fold-search     t)
                             (cookie-table-symbol  (intern yow-file cookie-cache))
                             (string-table         (symbol-value cookie-table-symbol))
                             (table                (nreverse (mapcar #'list string-table))))
                        (list (completing-read "<span class="quote">Apropos Zippy (regexp): </span>" table
                                               nil nil nil 'regexp-history)))))
  (let ((matches  (apropos-zippy icicle-current-input)))
    (when (interactive-p)
      (with-output-to-temp-buffer "<span class="quote">*Zippy Apropos*</span>"
        (while matches
          (princ (car matches))
          (setq matches  (cdr matches))
          (and matches (princ "<span class="quote">\n\n</span>")))))
    matches))                           <span class="linecomment">; Return matching Zippyisms.</span>

(defalias 'icicle-map 'icicle-apply)
<span class="linecomment">;;;###autoload</span>
(defun icicle-apply (alist fn &optional nomsg)
  "<span class="quote">Selectively apply a function to elements in an alist.
Argument ALIST is an alist such as can be used as the COLLECTION
argument for Icicles `completing-read'.  Its elements can represent
multi-completions, for example.  Interactively, COLLECTION is a
variable (a symbol) whose value is an alist.

Argument FN is a function.

Optional argument NOMSG non-nil means do not display an informative
message each time FN is applied.  If nil, then a message shows the key
of the alist element that FN is applied to and the result of the
application.

Interactively, you are prompted for both arguments.  Completion is
available for each.  The completion list for ALIST candidates is the
set of variables whose value is a cons.  With no prefix argument, the
names of these variables must end with \"alist\".  With a prefix
argument, the first car of each variable value must itself be a cons.

After choosing the ALIST and FN, you are prompted to choose one or
more keys of the alist elements, and FN is applied to each element
that has a key that you choose.  Multi-command completion is available
for choosing these candidates: you can apply FN to any number of
elements, any number of times.

Examples: If ALIST is `auto-mode-alist' and FN is `cdr', then the
completion candidates are the keys of the alist, and the result of
applying FN to an alist element is simply the value of that key.  If
you choose, for example, candidate \"\\.el\\'\", then the result is
`cdr' applied to the alist element (\"\\.el\\'\" . emacs-lisp-mode),
which is the symbol `emacs-lisp-mode'.  In this case, the function
performs simple lookup.

If FN were instead (lambda (x) (describe-function (cdr x))), then the
result of choosing candidate \"\\.el\\'\" would be to display the help
for function `emacs-lisp-mode'.

NOTE: `icicle-apply' does not, by itself, impose any particular sort
order.  Neither does it inhibit sorting.  If you call this function
from Lisp code and you want it to use a certain sort order or you want
no sorting, then bind `icicle-sort-function' accordingly.

During completion you can use multi-command keys.  Each displays the
value of applying FN to an alist element whose key is a completion
candidate.

`C-RET'   - Act on current completion candidate only
`C-down'  - Move to next prefix-completion candidate and act
`C-up'    - Move to previous prefix-completion candidate and act
`C-next'  - Move to next apropos-completion candidate and act
`C-prior' - Move to previous apropos-completion candidate and act
`C-!'     - Act on *each* candidate (or each that is saved), in turn.
`M-!'     - Act on the list of *all* candidates (or all saved).

Note that `M-!' applies FN to the *list* of chosen alist elements,
whereas `C-!' applies FN to each chosen element, in turn.  For
example, if FN is `length' and your input is `\.el', then `M-!' displays
the result of applying `length' to the list of chosen elements:

 ((\"\\.el\\'\" . emacs-lisp-mode) (\"\\.elc'\" . emacs-lisp-mode))

which is 2.

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate, or
`C-g' to quit.  This is an Icicles command - see command
`icicle-mode'.

`icicle-apply' overrides `icicle-ignore-space-prefix-flag', binding it
to nil so that candidates with initial spaces can be matched.</span>"
  (interactive
   (list (symbol-value
          (intern (completing-read "<span class="quote">Alist (variable): </span>" obarray
                                   `(lambda (symb)
                                     (and
                                      (boundp symb) (consp (symbol-value symb))
                                      ,(if current-prefix-arg
                                           '(consp (car (symbol-value symb)))
                                           '(string-match "<span class="quote">alist$</span>" (symbol-name symb)))))
                                   t nil (if (boundp 'variable-name-history)
                                             'variable-name-history
                                           'icicle-variable-name-history))))
         (read (completing-read "<span class="quote">Function: </span>" obarray 'functionp nil nil
                                (if (boundp 'function-name-history)
                                    'function-name-history
                                  'icicle-function-name-history)))))

  (setq icicle-candidate-entry-fn  fn)  <span class="linecomment">; Save in global variable - used by `icicle-apply-action'.</span>
  (let ((icicle-candidate-action-fn            'icicle-apply-action)
        (icicle-all-candidates-list-action-fn  'icicle-apply-list-action)
        (icicle-ignore-space-prefix-flag       nil)
        (icicle-apply-nomsg                    nomsg)
        (enable-recursive-minibuffers          t))
    (icicle-explore
     (lambda ()
       (setq icicle-candidates-alist    <span class="linecomment">; Ensure that keys of ALIST are strings or conses.</span>
             (mapcar (lambda (key+val)
                       (if (consp (car key+val))
                           key+val      <span class="linecomment">; Multi-completion candidate: (("aaa" "bbb") . ccc)</span>
                         (cons (format "<span class="quote">%s</span>" (car key+val)) (cdr key+val))))
                     alist)))
     (lambda ()
       (let ((result  (funcall icicle-candidate-entry-fn icicle-explore-final-choice-full)))
         (unless nomsg
           (message "<span class="quote">Key: %s,  Result: %s</span>" (car icicle-explore-final-choice-full) result))
         result))                       <span class="linecomment">; Return result.</span>
     nil nil nil "<span class="quote">Choose an occurrence: </span>" nil t)))

(defun icicle-apply-action (string)
  "<span class="quote">Completion action function for `icicle-apply'.</span>"
  (unwind-protect
      (condition-case icicle-apply-action
	  (progn
	    (icicle-highlight-candidate-in-Completions)
	    <span class="linecomment">;; Apply function to candidate element and display it.</span>
	    (let* ((key+value  (icicle-get-alist-candidate string))
		   (result     (funcall icicle-candidate-entry-fn key+value)))
	      (unless icicle-apply-nomsg
		(message "<span class="quote">Key: %s,  Result: %s</span>" (car key+value) result)))
	    nil)			<span class="linecomment">; Return nil for success.</span>
	(error "<span class="quote">%s</span>" (error-message-string icicle-apply-action))) <span class="linecomment">; Return error msg.</span>
    (select-window (minibuffer-window))
    (select-frame-set-input-focus (selected-frame))))

(defun icicle-apply-list-action (strings)
  "<span class="quote">Completion action list function for `icicle-apply'.</span>"
  (unwind-protect
       (condition-case icicle-apply-list-action
           (progn                       <span class="linecomment">; Apply function to candidate element and display it.</span>
             (message "<span class="quote">Result: %s</span>" (funcall icicle-candidate-entry-fn
                                            (mapcar #'icicle-get-alist-candidate strings)))
             nil)                       <span class="linecomment">; Return nil for success.</span>
         (error "<span class="quote">%s</span>" (error-message-string icicle-apply-list-action))) <span class="linecomment">; Return error msg.</span>
    (select-window (minibuffer-window))
    (select-frame-set-input-focus (selected-frame))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-goto-marker-or-set-mark-command (arg) <span class="linecomment">; Bound to `C-@', `C-SPC'.</span>
  "<span class="quote">With prefix arg &lt; 0, `icicle-goto-marker'; else `set-mark-command'.
By default, Icicle mode remaps all key sequences that are normally
bound to `set-mark-command' to
`icicle-goto-marker-or-set-mark-command'.  If you do not want this
remapping, then customize option `icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if (wholenump (prefix-numeric-value arg))
      (set-mark-command arg)
    (icicle-goto-marker)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-goto-global-marker-or-pop-global-mark (arg) <span class="linecomment">; Bound to `C-x C-@', `C-x C-SPC'.</span>
  "<span class="quote">With prefix arg &lt; 0, `icicle-goto-global-marker'; else `pop-global-mark'.
By default, Icicle mode remaps all key sequences that are normally
bound to `pop-global-mark' to
`icicle-goto-global-marker-or-pop-global-mark'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if (wholenump (prefix-numeric-value arg))
      (pop-global-mark)
    (icicle-goto-global-marker)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-goto-marker ()            <span class="linecomment">; Bound to `C-- C-@', `C-- C-SPC'.</span>
  "<span class="quote">Go to a marker in this buffer, choosing it by the line that includes it.
If `crosshairs.el' is loaded, then the target position is highlighted.

By default, candidates are sorted in marker order, that is, with
respect to their buffer positions.  Use `C-M-,' or `C-,' to change the
sort order.

During completion you can use these keys:

`C-RET'   - Goto marker named by current completion candidate
`C-down'  - Goto marker named by next prefix-completion candidate
`C-up'    - Goto marker named by previous prefix-completion candidate
`C-next'  - Goto marker named by next apropos-completion candidate
`C-prior' - Goto marker named by previous apropos-completion candidate
`S-delete' - Delete marker named by current completion candidate

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to choose a candidate as the final
destination, or `C-g' to quit.  This is an Icicles command - see
command `icicle-mode'.</span>"
  (interactive)
  (let ((icicle-sort-functions-alist  (cons '("<span class="quote">by position</span>" .  icicle-cdr-lessp)
                                            icicle-sort-functions-alist))
        (icicle-sort-function         'icicle-cdr-lessp))
    (icicle-goto-marker-1 mark-ring)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-goto-global-marker ()     <span class="linecomment">; Bound to `C-- C-x C-@', `C-- C-x C-SPC'.</span>
  "<span class="quote">Like `icicle-goto-marker', but visits global, not local, markers.
If user option `icicle-add-buffer-name-flag' is non-nil, then each
completion candidate is annotated (prefixed) with the name of the
marker's buffer, to facilitate orientation.</span>"
  (interactive)
  (let ((icicle-list-nth-parts-join-string  "<span class="quote">\t</span>")
        (icicle-list-join-string            "<span class="quote">\t</span>")
        (icicle-list-end-string             "<span class="quote"></span>")
        (icicle-sort-functions-alist
         (cons '("<span class="quote">by buffer, then by position</span>" . icicle-part-1-cdr-lessp)
               icicle-sort-functions-alist))
        (icicle-sort-function               'icicle-part-1-cdr-lessp)
        (icicle-candidate-properties-alist  (and icicle-add-buffer-name-flag
                                                 '((1 (face 'icicle-candidate-part))))))
    (icicle-goto-marker-1 global-mark-ring)))

(defun icicle-goto-marker-1 (ring)
  "<span class="quote">Helper function for `icicle-goto-marker', `icicle-goto-global-marker'.
RING is the marker ring to use.</span>"
  (unwind-protect
       (let* ((global-ring-p  (memq this-command '(icicle-goto-global-marker
                                                   icicle-goto-global-marker-or-pop-global-mark)))
              (markers        (if (and (not global-ring-p) (marker-buffer (mark-marker)))
                                  (cons (mark-marker) (icicle-markers ring))
                                (icicle-markers ring)))
              (icicle-delete-candidate-object
               (lambda (cand)
                 (let ((mrkr+txt  (icicle-get-alist-candidate cand)))
                   (move-marker (cdr mrkr+txt) nil))))
              (icicle-alternative-sort-function  nil)
              (icicle-last-sort-function         nil)
              (orig-buff                         (current-buffer)))
         (unless (consp markers)
           (error (if global-ring-p "<span class="quote">No global markers</span>" "<span class="quote">No markers in this buffer</span>")))
         (cond ((cdr markers)
                (icicle-apply (mapcar (lambda (mrkr) (icicle-marker+text mrkr global-ring-p))
                                      markers)
                              #'icicle-goto-marker-1-action
                              'nomsg))
               ((= (point) (car markers)) (message "<span class="quote">Already at marker: %d</span>" (point)))
               (t
                (icicle-goto-marker-1-action (icicle-marker+text (car markers) global-ring-p)))))
    (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))))

(defun icicle-goto-marker-1-action (cand)
  "<span class="quote">Action function for `icicle-goto-marker-1'.</span>"
  (pop-to-buffer (marker-buffer (cdr cand)))
  (select-frame-set-input-focus (selected-frame))
  (goto-char (cdr cand))
  (when (fboundp 'crosshairs-highlight) (crosshairs-highlight)))

(defun icicle-marker+text (marker &optional globalp)
  "<span class="quote">Cons of text line that includes MARKER with MARKER itself.
If the marker is on an empty line, then text \"&lt;EMPTY LINE&gt;\" is used.
If both optional argument GLOBALP and option
`icicle-add-buffer-name-flag' are non-nil, then the text is prefixed
by MARKER's buffer name.</span>"
  (save-excursion
    (set-buffer (marker-buffer marker))
    (goto-char marker)
    (let ((line  (buffer-substring-no-properties (save-excursion (beginning-of-line) (point))
                                                 (save-excursion (end-of-line) (point)))))
      (when (string= "<span class="quote"></span>" line) (setq line  "<span class="quote">&lt;EMPTY LINE&gt;</span>"))
      (if (and globalp icicle-add-buffer-name-flag)
          (cons (list (buffer-name) line) marker)
        (cons line marker)))))

(defun icicle-markers (ring)
  "<span class="quote">Marks in mark RING that are in live buffers other than a minibuffer.</span>"
  (let ((markers  nil))
    (dolist (mkr ring)
      (when (and (buffer-live-p (marker-buffer mkr))
                 (not (string-match "<span class="quote">\\` \\*Minibuf-[0-9]+\\*\\'</span>"
                                    (buffer-name (marker-buffer mkr)))))
        (push mkr markers)))
    markers))

<span class="linecomment">;;;###autoload</span>
(defun icicle-region-open-all-files ()
  "<span class="quote">Visit all files that contain regions in `icicle-region-alist'.
The files are visited, but not displayed.
If a file listed in `icicle-region-alist' does not exist or is not
readable, then it is ignored.</span>"
  (interactive)
  (let ((alist  (icicle-remove-if-not (lambda (entry) (car (cddr entry))) icicle-region-alist)))
    (unless alist (error "<span class="quote">There are no file buffers in `icicle-region-alist'</span>"))
    (dolist (entry alist)
      (let ((file  (car (cddr entry)))) (when (file-readable-p file) (find-file-noselect file))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-exchange-point-and-mark (&optional arg) <span class="linecomment">; Bound to `C-x C-x'.</span>
  "<span class="quote">`exchange-point-and-mark', `icicle-add-region', or `icicle-select-region'.
With no prefix arg: `exchange-point-and-mark'.
With a numeric prefix arg:`icicle-add-region'.
With a plain `C-u' prefix arg: `icicle-select-region'.

By default, Icicle mode remaps all key sequences that are normally
bound to `exchange-point-and-mark' to
`icicle-exchange-point-and-mark'.  If you do not want this remapping,
then customize option `icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if arg
      (if (atom arg)
          (call-interactively #'icicle-add-region)
        (unless (consp icicle-region-alist)
          (error "<span class="quote">`icicle-region-alist' is empty; try again, with a numeric prefix arg</span>"))
        (call-interactively #'icicle-select-region))
    (call-interactively #'exchange-point-and-mark)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-add-region (start end &optional tag) <span class="linecomment">; Bound to `C-N C-x C-x', N = whole number.</span>
  "<span class="quote">Add current region to list of regions, `icicle-region-alist'.
Save the updated option.

With a prefix argument, you are prompted for a tag to name the region.
Otherwise, the first `icicle-regions-name-length-max' characters of
the region itself serve as the name.

To remove a region from `icicle-region-alist', use command
`icicle-remove-region' or customize `icicle-region-alist'.</span>"
  (interactive "<span class="quote">r\nP</span>")
  (when (= start end) (error "<span class="quote">Cannot add region; it is empty</span>"))
  (when (&gt; start end) (setq end  (prog1 start (setq start  end))))
  (let ((region-prefix
         (buffer-substring-no-properties start (+ start (min icicle-regions-name-length-max
                                                             (- end start))))))
    (add-to-list 'icicle-region-alist
                 (list (setq tag  (if tag
                                      (icicle-completing-read-history
                                       "<span class="quote">Add region (tag): </span>" nil nil nil region-prefix)
                                    region-prefix))
                       (buffer-name)
                       (buffer-file-name)
                       start
                       end))
    (funcall icicle-customize-save-variable-function 'icicle-region-alist icicle-region-alist)
    (message "<span class="quote">Region added to `icicle-region-alist' with tag `%s'</span>"
             (if (&gt; (length tag) 20) (concat (substring tag 0 17) "<span class="quote">...</span>") tag))))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-select-region <span class="linecomment">; Bound to `C-u C-x C-x'</span>
  "<span class="quote">Choose a region from the list of Icicles regions, and activate it.
Completion is available.  The regions are sorted alphabetically by
buffer, and then by tag; you cannot change the sort order.

Regions in `icicle-region-alist' that are in buffers that do not
currently exist are ignored.

Note that each region is defined by its limits, so that if the
region's buffer has changed, then the text used to identify the region
might no longer correspond to the text at the beginning of the
region.

If user option `icicle-add-buffer-name-flag' is non-nil, then each
completion candidate is annotated with the name of the region's
buffer, to facilitate orientation.  Note that even when the value is
nil, you can use `C-M-mouse-2' and so on to see the buffer name, as
well as the start and end points of the region and its length.

Completion is lax if `icicle-add-buffer-name-flag' is non-nil;
otherwise, it is strict.

You can use `S-delete' during completion to delete a region from
`icicle-region-alist'.

You can use `icicle-add-region' to define the list of regions,
`icicle-region-alist'.</span>"                 <span class="linecomment">; Doc string</span>
  icicle-select-region-action           <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Select region: </span>" icicle-candidates-alist <span class="linecomment">; `completing-read' args</span>
  nil (not icicle-add-buffer-name-flag) nil nil (if icicle-add-buffer-name-flag
                                                    (car (caar icicle-candidates-alist))
                                                  (caar icicle-candidates-alist))
  nil
  ((IGNORED--FOR-SIDE-EFFECT               (when icicle-region-auto-open-files-flag <span class="linecomment">; Bindings</span>
                                             (icicle-region-open-all-files)))
   (icicle-candidate-help-fn               'icicle-region-help)
   (icicle-delete-candidate-object         'icicle-delete-region-from-alist)
   (icicle-list-nth-parts-join-string      "<span class="quote">\t</span>")
   (icicle-list-join-string                "<span class="quote">\t</span>")
   (icicle-list-end-string                 "<span class="quote"></span>")
   (icicle-list-use-nth-parts              '(1))
   (icicle-sort-function                   nil)
   (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
   (icicle-inhibit-sort-p                  t)
   (icicle-whole-candidate-as-text-prop-p  t)
   (icicle-candidates-alist                (icicle-region-add-buffers (icicle-region-sorted)))))

(defun icicle-select-region-action (reg-name)
  "<span class="quote">Action function for `icicle-select-region'.</span>"
  (let* ((reg   (icicle-get-alist-candidate reg-name))
         (buf   (cadr reg))
         (file  (car (cddr reg))))
    (when (and (not (get-buffer buf)) file) <span class="linecomment">; If no buffer, try to open the file.  If no file, msg.</span>
      (if (file-readable-p file) (find-file-noselect file) (message "<span class="quote">No such file: `%s'</span>" file)))
    (when (get-buffer buf)
      (pop-to-buffer buf) (raise-frame) (goto-char (cadr (cddr reg)))
      (push-mark (car (cddr (cddr reg))) 'nomsg 'activate)))
  (setq deactivate-mark  nil))

(defun icicle-region-sorted ()
  "<span class="quote">`icicle-region-alist', sorted first by buffer name and then by tag.</span>"
  (sort (icicle-regions) (lambda (x1 x2)
                           (let ((buf1  (cadr x1))
                                 (buf2  (cadr x2)))
                             (or (string-lessp buf1 buf2)
                                 (and (string= buf1 buf2) (string-lessp (car x1) (car x2))))))))

(defun icicle-region-add-buffers (region-list)
  "<span class="quote">Add buffer names to REGION-LIST, if `icicle-add-buffer-name-flag'.</span>"
  (if icicle-add-buffer-name-flag
      (mapcar (lambda (entry)
                (let ((buf  (copy-sequence (cadr entry))))
                  (put-text-property 0 (length buf) 'face 'icicle-candidate-part buf)
                  (cons (list (car entry) buf) (cdr entry))))
              region-list)
    region-list))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-remove-region <span class="linecomment">; Command name</span>
  "<span class="quote">Remove a region from the list of regions, `icicle-region-alist'.
Save the updated option.

Completion is available.  The regions are sorted alphabetically by
buffer, and then by tag; you cannot change the sort order.

To add a region to `icicle-region-alist', do one of the following:

* Use `\\[icicle-exchange-point-and-mark]' with a numeric prefix arg.
* Use command `icicle-add-region'.
* Customize `icicle-region-alist'.</span>"     <span class="linecomment">; Doc string</span>
  icicle-delete-region-from-alist       <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Remove region from saved regions: </span>" icicle-candidates-alist <span class="linecomment">; `completing-read' args</span>
  nil (not icicle-add-buffer-name-flag) nil nil (if icicle-add-buffer-name-flag
                                                    (car (caar icicle-candidates-alist))
                                                  (caar icicle-candidates-alist))
  nil
  ((icicle-candidate-help-fn               'icicle-region-help) <span class="linecomment">; Additional bindings</span>
   (icicle-list-nth-parts-join-string      "<span class="quote">\t</span>")
   (icicle-list-join-string                "<span class="quote">\t</span>")
   (icicle-list-end-string                 "<span class="quote"></span>")
   (icicle-list-use-nth-parts              '(1))
   (icicle-sort-function                   nil)
   (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
   (icicle-inhibit-sort-p                  t)
   (icicle-whole-candidate-as-text-prop-p  t)
   (icicle-candidates-alist                (icicle-region-add-buffers (icicle-region-sorted)))))

(defun icicle-delete-region-from-alist (reg-name)
  "<span class="quote">Delete the region named REG-NAME from `icicle-region-alist'.</span>"
  (let ((alist-cand  (icicle-get-alist-candidate reg-name)))
    (setq icicle-region-alist
          (delete (cons (caar alist-cand) (cdr alist-cand)) icicle-region-alist)))
  (funcall icicle-customize-save-variable-function 'icicle-region-alist icicle-region-alist))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-remove-all-regions-in-buffer <span class="linecomment">; Command name</span>
  "<span class="quote">Remove all regions in a buffer from `icicle-region-alist'.
Save the updated option.
To remove individual regions, use command `icicle-remove-region'.
To add a region to `icicle-region-alist', use `icicle-add-region'.
Alternatively, you can customize `icicle-region-alist'.</span>" <span class="linecomment">; Doc string</span>
  icicle-remove-all-regions-action      <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Buffer: </span>"                            <span class="linecomment">; `completing-read' args</span>
  (icicle-remove-duplicates (mapcar (lambda (reg) (list (cadr reg))) icicle-region-alist))
  nil t nil nil (buffer-name) nil
  ((icicle-use-candidates-only-once-flag  t))) <span class="linecomment">; Additional bindings</span>

(defun icicle-remove-all-regions-action (buffer)
  "<span class="quote">Action function for `icicle-remove-all-regions-in-buffer'.
Remove all regions in BUFFER from `icicle-region-alist'.
BUFFER is the name of a buffer.</span>"
  (dolist (reg icicle-region-alist)
    (when (string= buffer (cadr reg)) (setq icicle-region-alist  (delete reg icicle-region-alist))))
  (funcall icicle-customize-save-variable-function 'icicle-region-alist icicle-region-alist)
  (message "<span class="quote">Removed all regions in buffer `%s'</span>" buffer))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-search-region <span class="linecomment">; Command name</span>
  "<span class="quote">Search a region from the list of regions, `icicle-region-alist'.
Completion is available.  The regions are sorted alphabetically by
buffer, and then by tag; you cannot change the sort order.

You can use `S-delete' during completion to delete a region from
`icicle-region-alist'.

You can use `icicle-add-region' to define the list of regions.
Regions in `icicles-regions' that are in buffers that do not currently
exist are ignored.

Note that each region is defined by its limits, so that if the
region's buffer has changed, then the text used to identify the region
might no longer correspond to the text at the beginning of the
region.

If user option `icicle-add-buffer-name-flag' is non-nil, then each
completion candidate is annotated with the name of the region's
buffer, to facilitate orientation.  Note that even when the value is
nil, you can use `C-M-mouse-2' and so on to see the buffer name, as
well as the start and end points of the region and its length.

Completion is lax if `icicle-add-buffer-name-flag' is non-nil;
otherwise, it is strict.</span>"               <span class="linecomment">; Doc string</span>
  icicle-search-region-action           <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">Search region: </span>" icicle-candidates-alist <span class="linecomment">; `completing-read' args</span>
  nil (not icicle-add-buffer-name-flag) nil nil (if icicle-add-buffer-name-flag
                                                    (car (caar icicle-candidates-alist))
                                                  (caar icicle-candidates-alist))
  nil
  ((IGNORED--FOR-SIDE-EFFECT               (when icicle-region-auto-open-files-flag <span class="linecomment">; Bindings</span>
                                             (icicle-region-open-all-files)))
   (icicle-candidate-help-fn               'icicle-region-help)
   (icicle-delete-candidate-object         'icicle-delete-region-from-alist)
   (regexp                                 (icicle-search-read-context-regexp))
   (icicle-list-nth-parts-join-string      "<span class="quote">\t</span>")
   (icicle-list-join-string                "<span class="quote">\t</span>")
   (icicle-list-end-string                 "<span class="quote"></span>")
   (icicle-list-use-nth-parts              '(1))
   (icicle-sort-function                   nil)
   (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
   (icicle-inhibit-sort-p                  t)
   (icicle-whole-candidate-as-text-prop-p  t)
   (icicle-candidates-alist                (icicle-region-add-buffers (icicle-region-sorted)))))

<span class="linecomment">;; Free var here: `regexp' is bound in `icicle-search-region'.</span>
(defun icicle-search-region-action (reg-name)
  "<span class="quote">Action function for `icicle-search-region'.</span>"
  (let* ((reg   (icicle-get-alist-candidate reg-name))
         (buf   (cadr reg))
         (file  (car (cddr reg))))
    (when (and (not (get-buffer buf)) file) <span class="linecomment">; If no buffer, try to open the file.  If no file, msg.</span>
      (if (file-readable-p file) (find-file-noselect file) (message "<span class="quote">No such file: `%s'</span>" file)))
    (pop-to-buffer buf) (raise-frame)
    (let ((icicle-show-Completions-initially-flag  t)
          (icicle-candidate-action-fn              'icicle-search-action)
          (icicle-candidates-alist                 icicle-candidates-alist)
          (enable-recursive-minibuffers            t))
      (icicle-search (cadr (cddr reg)) (car (cddr (cddr reg))) regexp t))
    (save-excursion (set-buffer (window-buffer (minibuffer-window))) (icicle-erase-minibuffer))))

(defun icicle-region-help (reg-name)
  "<span class="quote">Use as `icicle-candidate-help-fn' for `icicle-region-alist' commands.</span>"
  (icicle-msg-maybe-in-minibuffer
   (let* ((reg    (icicle-get-alist-candidate reg-name))
          (file   (car (cddr reg)))
          (start  (cadr (cddr reg)))
          (end    (car (cddr (cddr reg)))))
     (or (concat (format "<span class="quote">%d to %d</span>" end start) "<span class="quote"> in buffer `</span>" (cadr reg)
                 (and file (format "<span class="quote">', file `%s</span>" file)) (format "<span class="quote">', %d chars</span>" (- end start)))
         "<span class="quote">No help</span>"))))

(defun icicle-regions ()
  "<span class="quote">Variable `icicle-region-alist', but without non-existent non-file buffers.</span>"
  (let ((unsorted-regions  (icicle-remove-if (lambda (reg) (and (not (car (cddr reg))) <span class="linecomment">; No file.</span>
                                                                (not (get-buffer (cadr reg)))))
                                             icicle-region-alist)))
    (if icicle-sort-function
        (sort unsorted-regions (lambda (a b) (funcall icicle-sort-function (car a) (car b))))
      unsorted-regions)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-generic ()         <span class="linecomment">; Bound to `C-x `'.</span>
  "<span class="quote">Run `icicle-search-command'.  By default, this is `icicle-search'.
In Compilation and Grep modes, this is `icicle-compilation-search'.
In Comint, Shell, GUD, and Inferior Lisp modes, this is
   `icicle-comint-search'.</span>"
  (interactive)
  (call-interactively icicle-search-command))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search (beg end scan-fn-or-regexp require-match <span class="linecomment">; Bound to `C-c `'.</span>
                      &optional where &rest args)
  "<span class="quote">Search for matches, with completion, cycling, and hit replacement.
Interactively, search for regexp matches.  You are prompted for a
regexp, which you enter using `RET'.  The search hits (matches) are
available as completion candidates.  You can then use apropos
completion to filter the candidates using a different regexp, which
you can change dynamically (as always).  You can replace individual
matches with another string, as in `query-replace' or
`query-replace-regexp'.  Candidates appear in order of buffer
occurrence; you cannot sort them.

Non-interactively, search can be for regexp matches or any other kind
of matches.  Argument SCAN-FN-OR-REGEXP is the regexp to match, or it
is a function that defines an alist of buffer zones to search.  You
can navigate among the matching buffer zones (defined either as regexp
matches or via function), called search \"contexts\", and you can
match another regexp against the text in a search context.  See the
end of this description for information about the other arguments.

If the search-context regexp contains regexp subgroups, that is,
subexpressions of the form `\(...\)', then you are prompted for the
subgroup to use to define the search contexts.  Subgroup 0 means the
context is whatever matches the whole regexp.  Subgroup 1 means the
context is whatever matches the first subgroup, and so on.  The
subgroup number is the number of occurrences of `\(', starting at the
beginning of the regexp.

You can further limit the set of search contexts by setting user
option `icicle-search-context-match-predicate' to a predicate that
takes a search-context (string) argument.  Only contexts that satisfy
the predicate are used.  For example, if the predicate is (lambda (x)
\(commandp (intern-soft x))), then only contexts that name commands
are kept.

Search respects `icicle-regexp-quote-flag' and
`icicle-search-whole-word-flag'.  You can toggle these during search,
by using `C-`' and `M-q', respectively.  If `icicle-regexp-quote-flag'
is non-nil, then regexp special characters are quoted, so that they
become non-special.  If `icicle-search-whole-word-flag' is non-nil,
then whole-word searching is done.  During word search, all characters
in the search string you type are treated as if they were word
constituents: the search string is matched literally, but only at word
boundaries.  (You can also use `\\[icicle-search-word]' to perform
word search.)

Optional Behaviors: Prefix Argument
-----------------------------------

By default, search only the current buffer.  Search the active region,
or, if there is none, then search the entire buffer.

With a prefix argument, you can search multiple buffers, files, or
regions, as follows:

- With a simple prefix arg (`C-u'), search all of the regions in
`icicle-region-alist'.  Those regions can be in any buffers.  If a
region is in a buffer that does not exist, it is skipped.  You can
always re-create the buffer (e.g. visit the file), and try again.

Note: To search selected regions in `icicle-region-alist'
individually, use multi-command `icicle-search-region'.

- With a non-negative numeric prefix arg, search multiple buffers
completely.  You are prompted for the buffers to search - all of each
buffer is searched.  Any existing buffers can be chosen.  If the
prefix arg is 99, then only buffers visiting files are candidates.

- With a negative numeric prefix arg, search multiple files
completely.  You are prompted for the files to search - all of each
file is searched.  Any existing files in the current directory can be
chosen.

Navigation and Help
-------------------

The use of completion for this command is special.  It is not unusual
in this context to have multiple completion candidates that are
identical - only the positions of their occurrences in the search
buffer(s) differ.  In that case, you cannot choose one simply by
completing it in the minibuffer, because the destination would be
ambiguous.  That is, simply completing your input and entering the
completion with `RET' will not take you to its occurrence in the
search buffer, unless it is unique.

Instead, choose search hits to visit using any of the candidate-action
keys: `C-RET', `C-mouse-2', `C-next', `C-prior', `C-down', and `C-up'.
The last four of these cycle among the search hits.  The current
candidate in *Completions* corresponds to the current location
visited (it is not off by one, as is usually the case in Icicles).

As always, the `C-M-' keys provide help on individual candidates:
`C-M-RET', `C-M-mouse-2', `C-M-next', `C-M-prior', `C-M-down', and
`C-M-up'.  For `icicle-search', they indicate the buffer and position
of the search hit.

You can cycle among candidates without moving to their occurrences in
the search buffer, using `next', `prior', `down', and `up' (no `C-').

Highlighting
------------

In the search buffer (that is, where the hits are), `icicle-search'
does the following:

- Highlights the current match (buffer zone) for the initial (context)
  regexp, using face `icicle-search-main-regexp-current'.

- Highlights the first `icicle-search-highlight-threshold' context
  matches, using face `icicle-search-main-regexp-others'.

- Highlights 1-8 context levels, within each search context.  This
  happens only if your initial (context) regexp has \\(...\\) groups
  and option `icicle-search-highlight-context-levels-flag' is non-nil.

- Highlights the match for your current input, using face
  `icicle-search-current-input'.  Highlights all such matches if
  option `icicle-search-highlight-all-current-flag' is non-nil;
  otherwise, highlights just the currently visited match.
  You can toggle this option using `C-^'.

If user option `icicle-search-cleanup-flag' is non-nil (the default),
then all search highlighting is removed from the search buffer when
you are finished searching.  If it is nil, then you can remove this
highlighting later using command `icicle-search-highlight-cleanup'.
You can toggle `icicle-search-cleanup-flag' during Icicles search
using `C-.'  in the minibuffer.

Search and Replace
------------------

You can replace the current search match by using any of the
alternative action keys: `C-S-RET', `C-S-mouse-2' (in *Completions*),
`C-S-next', `C-S-prior', `C-S-down', and `C-S-up'.  You can use `C-|'
to replace all matches at once.

At the first use of any of these, you are prompted for the replacement
string; it is used thereafter, or until you use `M-,'
\(`icicle-search-define-replacement').  The replacement string can be
anything that is allowed as a replacement by `query-replace-regexp'.
In Emacs 22 or later, this includes Lisp sexp evaluation via `\,'.

Unlike `query-replace', you need not visit each search match - you can
visit and replace selected matches in any order.

What is meant here by a \"search match\"?  It can be either an entire
search context or just whatever your current minibuffer input matches.

Key `C-,' toggles option `icicle-search-replace-whole-candidate-flag'.
By default, the entire current search context is replaced, that is,
whatever matches the context regexp that you entered initially, using
`RET'.  However, you can use `C-,' at any time during searching to
toggle between this default behavior and replacement of whatever your
current minibuffer input matches.

Remember this:

 - If `icicle-search-replace-whole-candidate-flag' is non-nil, then
   the granularity of replacement is a complete search context.  In
   this case, replacement behaves similarly to `query-replace-regexp'.
   You can still use minibuffer input to filter the set of search
   contexts, but replacement is on a whole-context basis.

 - If `icicle-search-replace-whole-candidate-flag' is nil, then you
   can replace multiple input matches separately within a search
   context.  This behavior is unique to Icicles.

If `icicle-search-replace-whole-candidate-flag' is non-nil, then you
can use the navigational alternative action keys, `C-S-next',
`C-S-prior', `C-S-down', and `C-S-up', to replace successive search
contexts.

Search traversal using these keys is always by search context, not by
input match.  This means that you cannot use these keys to replace
individual input matches within a search context, except for the first
such match.  That is, if `icicle-search-replace-whole-candidate-flag'
is nil and you use these keys, then only the first match of your input
in each search context is replaced.

If your input matches multiple parts of the search context, and you
want to replace them in order, then use `C-S-RET' repeatedly.  This
replaces successive input matches within a search context, then moves
on to the next context, and so on.  You can traverse all matches of
your input in the order they appear in the buffer by repeating
`C-S-RET'.

Repeated use of `C-S-RET' is generally for the case where you are
replacing input matches, not whole search contexts.  If you repeat
`C-S-RET' when `icicle-search-replace-whole-candidate-flag' is
non-nil, then you will, in effect, just replace the same context over
and over - unless, that is, your current input does not match the
replacement text.  In that case, the replacement is no longer a
matching search context (candidate), and `C-S-RET' moves on to the
next context.

What your input matches depends on a few Icicles options:

 - `icicle-regexp-quote-flag' determines whether to use regexp
   matching or literal matching.

 - `icicle-search-highlight-all-current-flag',
   `icicle-expand-input-to-common-match-flag' and
   `icicle-search-replace-common-match-flag' together determine
   whether to replace exactly what your input matches in the current
   search hit or the expanded common match (ECM) of your input among
   all search hits.  If any of these options is nil, then your exact
   input match is replaced; otherwise, the ECM is replaced.

Using Regexps
-------------

At any time, you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-from-variable]' (command
`icicle-insert-string-from-variable') to insert text (e.g. a regexp)
from a variable into the minibuffer.  For example, you can search for
ends of sentences by using `C-u \\[icicle-insert-string-from-variable]' and choosing variable
`sentence-end' as the variable.  And you can use
`\\[icicle-save-string-to-variable]' to save a string to a variable
for later use by `\\[icicle-insert-string-from-variable]'.

When employed with useful regexps, `C-=' can turn `icicle-search' into
a general navigator or browser of code, mail messages, and many other
types of buffer.  Imenu regexps work fine, for example - command
`icicle-imenu' simply uses `icicle-search' this way.  See
`icicle-insert-string-from-variable' for more tips on inserting
regexps from variables.

Additional Information
----------------------

If user option `icicle-add-buffer-name-flag' is non-nil, then each
candidate is annotated with the name of the buffer where the hit
occurs, to facilitate orientation.  Note that even when the value is
nil, you can use `C-M-mouse-2' and so on to see the buffer name, as
well as the position of the hit in the buffer.

Completion is lax if `icicle-add-buffer-name-flag' is non-nil;
otherwise, it is strict.

After you visit a completion candidate, the hooks in variable
`icicle-search-hook' are run.

`icicle-search' overrides `icicle-ignore-space-prefix-flag', binding
it to nil, so that candidates with initial spaces can be matched.

`icicle-search' sets `icicle-search-final-choice' to the final user
choice, which might not be one of the search candidates if
REQUIRE-MATCH is nil.

Non-Interactive Use
-------------------

When called non-interactively, these are the `icicle-search'
arguments:

BEG is the beginning of the region to search; END is the end.
SCAN-FN-OR-REGEXP: Regexp or function that determines the set of
  initial candidates (match zones).  If a function, it is passed, as
  arguments, the buffer to search, the beginning and end of the search
  region in that buffer, and ARGS.
REQUIRE-MATCH is passed to `completing-read'.
Optional arg WHERE is either a list of buffers or a list of region
  entries that have the same form as `icicle-region-alist'.  If nil,
  then only the current buffer is used.
ARGS are arguments that are passed to function SCAN-FN-OR-REGEXP.

Note that if SCAN-FN-OR-REGEXP is a regexp string, then function
`icicle-search-regexp-scan' is used to determine the set of match
zones.  You can limit hits to regexp matches that also satisfy a
predicate, by using `(PREDICATE)' as ARGS: PREDICATE is then passed to
`icicle-search-regexp-scan' as its PREDICATE argument.

This command is intended for use only in Icicle mode.</span>"
  (interactive `(,@(icicle-region-or-buffer-limits)
                 ,(if icicle-search-whole-word-flag
                      (icicle-search-read-word)
                      (icicle-search-read-context-regexp))
                 ,(not icicle-add-buffer-name-flag)
                 ,(icicle-search-where-arg)))
  (setq icicle-search-context-regexp  (and (stringp scan-fn-or-regexp) scan-fn-or-regexp))
  (let ((icicle-candidate-action-fn         (or icicle-candidate-action-fn 'icicle-search-action))
        (icicle-candidate-help-fn           'icicle-search-help)
        (icicle-candidate-alt-action-fn     (or icicle-candidate-alt-action-fn
                                                'icicle-search-replace-search-hit))
        (icicle-update-input-hook           (list 'icicle-search-highlight-all-input-matches))
        (icicle-search-ecm                  nil)
        (icicle-searching-p                 t)
        (icicle-list-nth-parts-join-string  "<span class="quote">\t</span>")
        (icicle-list-join-string            "<span class="quote">\t</span>")
        (icicle-list-end-string             "<span class="quote"></span>")
        (icicle-list-use-nth-parts          '(1))
        (icicle-sort-function               nil)
        (icicle-inhibit-sort-p              t)
        (completion-ignore-case             case-fold-search))
    (icicle-explore (lambda () (icicle-search-define-candidates beg end scan-fn-or-regexp
                                                                require-match where args))
                    #'icicle-search-final-act #'icicle-search-quit-or-error
                    #'icicle-search-quit-or-error #'icicle-search-cleanup
                    "<span class="quote">Choose an occurrence: </span>" nil require-match nil 'icicle-search-history)))

<span class="linecomment">;; This is the same as `region-or-buffer-limits' in `misc-fns.el'.</span>
(defun icicle-region-or-buffer-limits ()
    "<span class="quote">Return the start and end of the region as a list, smallest first.
If the region is not active or is empty, then use bob and eob.</span>"
  (if (or (not mark-active) (null (mark)) (= (point) (mark)))
      (list (point-min) (point-max))
    (if (&lt; (point) (mark)) (list (point) (mark)) (list (mark) (point)))))

(defun icicle-search-read-context-regexp (&optional prompt pred init hist def i-i-m)
  "<span class="quote">Read context regexp and determine `icicle-search-context-level'.
Read the regexp using completion against previous regexp input.
The arguments are for use by `completing-read' to read the regexp.
 HIST (or `regexp-history' if HIST is nil) is used for the
 `completing-read' COLLECTION argument.
 The REQUIRE-MATCH arg is nil.
 A default prompt is used if PROMPT is nil.</span>"
  (setq hist    (or hist 'regexp-history)
        prompt  (or prompt "<span class="quote">Find (regexp): </span>"))
  (let* ((icicle-candidate-action-fn  nil)
         (icicle-candidate-help-fn    nil)
         (regexp                      (icicle-completing-read-history
                                       prompt 'regexp-history pred init def i-i-m)))
    (while (string= "<span class="quote"></span>" regexp)
      (message "<span class="quote">Regexp cannot be empty.  Try again...</span>") (sit-for 2)
      (setq regexp  (icicle-completing-read-history prompt 'regexp-history pred init def i-i-m)))
    (setq prompt                       "<span class="quote">Subgroup to use as search context [0, 1, 2,...]: </span>"
          icicle-search-context-level  (if (string-match "<span class="quote">\\\\(</span>" regexp)
                                           (truncate (if (fboundp 'read-number)
                                                         (read-number prompt 0)
                                                       (read-from-minibuffer <span class="linecomment">; Hope for a number.</span>
                                                        prompt nil nil nil nil 0)))
                                         0))
    regexp))

(defun icicle-search-where-arg ()
  "<span class="quote">Return WHERE arg for `icicle-search*' commands, based on prefix arg.</span>"
  (cond ((consp current-prefix-arg)
         (message "<span class="quote">Searching saved regions</span>") (sit-for 1) icicle-region-alist)
        ((wholenump current-prefix-arg)
         (icicle-search-choose-buffers (= 99 (prefix-numeric-value current-prefix-arg))))
        (current-prefix-arg
         (message "<span class="quote">Searching multiple files</span>") (sit-for 1)
         (let ((icicle-show-Completions-initially-flag  t))
           (save-selected-window (icicle-file-list))))
        (t nil)))

(defun icicle-search-choose-buffers (files-only-p)
  "<span class="quote">Choose multiple buffers to search.
FILES-ONLY-P non-nil means that only buffers visiting files are
candidates.</span>"
  (message "<span class="quote">Searching multiple buffers</span>") (sit-for 1)
  (let ((icicle-show-Completions-initially-flag  t))
    (mapcar #'get-buffer (let ((icicle-buffer-require-match-flag  'partial-match-ok)
                               (current-prefix-arg                files-only-p))
                           (save-selected-window (icicle-buffer-list))))))

(defun icicle-search-read-word ()
  "<span class="quote">Read a word to search for (whole-word search).
Regexp special characters within the word are escaped (quoted).</span>"
  (setq icicle-search-context-level  0)
  (concat "<span class="quote">\\b</span>"
          (regexp-quote (icicle-completing-read-history "<span class="quote">Search for whole word: </span>"
                                                        'icicle-search-history))
          "<span class="quote">\\b</span>"))

(defun icicle-search-final-act ()
  "<span class="quote">Go to the final search hit choice, then run `icicle-search-hook'.
The hit's frame is raised and selected.</span>"
  (let* ((marker  (cdr icicle-explore-final-choice-full))
         (buf     (marker-buffer marker)))
    (unless (bufferp buf) (error "<span class="quote">No such buffer: %s</span>" buf))
    (pop-to-buffer buf)
    (raise-frame)
    (goto-char (marker-position marker))
    (select-frame-set-input-focus (selected-frame))
    (run-hooks 'icicle-search-hook)))

<span class="linecomment">;; Free vars here: `orig-pt-explore', `orig-win-explore' are bound in `icicle-explore'.</span>
(defun icicle-search-quit-or-error ()
  "<span class="quote">Return to the starting point.</span>"
  (when (window-live-p orig-win-explore)
    (select-window orig-win-explore)
    (goto-char orig-pt-explore)))

<span class="linecomment">;; Free vars here: `orig-win-explore' is bound in `icicle-explore'.</span>
(defun icicle-search-cleanup ()
  "<span class="quote">Clean up search highlighting, if `icicle-search-highlight-cleanup'.
Select original window.</span>"
  (when icicle-search-cleanup-flag (icicle-search-highlight-cleanup))
  (when (window-live-p orig-win-explore)
    (select-window orig-win-explore)
    (select-frame-set-input-focus (selected-frame))))

(defun icicle-search-define-candidates (beg end scan-fn-or-regexp require-match where args)
  "<span class="quote">Define completion candidates for `icicle-search'.
The arguments are the same as for `icicle-search'.</span>"
  (when (and icicle-regexp-quote-flag
             (not icicle-search-whole-word-flag)
             (stringp scan-fn-or-regexp))
    (setq scan-fn-or-regexp  (regexp-quote scan-fn-or-regexp)))
  (cond ((and (consp where) (bufferp (car where))) <span class="linecomment">; List of buffers - search buffers.</span>
         (dolist (buf where)
           (icicle-search-define-candidates-1 buf nil nil scan-fn-or-regexp args)))
        ((and (consp where)           <span class="linecomment">; List of files - search files.</span>
              (stringp (car where))
              (file-exists-p (car where)))
         (dolist (file where)
           (icicle-search-define-candidates-1 (find-file-noselect file 'nowarn) nil nil
                                              scan-fn-or-regexp args)))
        ((consp where)                <span class="linecomment">; Search all regions in `icicle-region-alist'.</span>
         (when icicle-region-auto-open-files-flag (icicle-region-open-all-files))
         (let ((non-existent-buffers  ()))
           (dolist (reg where)
             (if (bufferp (get-buffer (cadr reg)))
                 (icicle-search-define-candidates-1
                  (get-buffer (cadr reg)) (cadr (cddr reg))
                  (car (cddr (cddr reg))) scan-fn-or-regexp args)
               (push (cadr reg) non-existent-buffers)))
           (when non-existent-buffers
             (message "<span class="quote">Skipping regions in non-existent buffers: `%s'</span>"
                      (mapconcat #'identity (icicle-remove-duplicates non-existent-buffers)
                                 "<span class="quote">', `</span>"))
             (sit-for 3))))
        (t                            <span class="linecomment">; Search this buffer only.</span>
         (icicle-search-define-candidates-1 nil beg end scan-fn-or-regexp args))))

(defun icicle-search-define-candidates-1 (buffer beg end scan-fn-or-regexp args)
  "<span class="quote">Helper function for `icicle-search-define-candidates'.
BUFFER is a buffer to scan for candidates.
The other arguments are the same as for `icicle-search'.</span>"
  (if (functionp scan-fn-or-regexp)
      (apply scan-fn-or-regexp buffer beg end args)
    (apply 'icicle-search-regexp-scan buffer beg end scan-fn-or-regexp args))
  (unless icicle-candidates-alist
    (if (functionp scan-fn-or-regexp)
        (error "<span class="quote">No search hits</span>")
      (error "<span class="quote">No search hits for `%s'</span>" scan-fn-or-regexp))))

(defun icicle-search-regexp-scan (buffer beg end regexp &optional predicate)
  "<span class="quote">Scan BUFFER for REGEXP, pushing hits onto `icicle-candidates-alist'.
If BUFFER is nil, scan the current buffer.
If BEG and END are non-nil, scan only between positions BEG and END.
If REGEXP has subgroups, then use what the Nth subgroup matches as the
 search context (hit), where N = `icicle-search-context-level'.
 If N=0, then use the overall match of REGEXP as the search context.
PREDICATE is nil or a boolean function that takes these arguments:
  - the search-context string
  - a marker at the end of the search-context
If PREDICATE is non-nil, then push only the hits for which it holds.

Highlight the matches in face `icicle-search-main-regexp-others'.</span>"
  (setq regexp  (or regexp (icicle-search-read-context-regexp)))
  (let ((add-bufname-p  (and buffer icicle-add-buffer-name-flag))
        (temp-list      ())
        (last-beg       nil))
    (unless buffer (setq buffer  (current-buffer)))
    (when (bufferp buffer)
      (set-buffer buffer)
      (unless (and beg end)
        (setq beg  (point-min)
              end  (point-max)))
      (condition-case icicle-search-regexp-scan
          (save-excursion
            (goto-char (setq last-beg  beg))
            (while (and beg (&lt; beg end) (not (eobp)))
              (while (and (setq beg  (re-search-forward regexp end t))
                          (eq last-beg beg)
                          (not (eobp)))
                (forward-char) (setq beg  (1+ beg))) <span class="linecomment">; Matched again, same place.  Advance 1 char.</span>
              (when (and beg (not (eobp)))
                (unless (match-beginning icicle-search-context-level)
                  (error "<span class="quote">Search context has no subgroup of level %d - try a lower number</span>"
                         icicle-search-context-level))
                (let* ((hit-string  (buffer-substring-no-properties
                                     (match-beginning icicle-search-context-level)
                                     (match-end icicle-search-context-level)))
                       (end-marker  (copy-marker (match-end icicle-search-context-level))))
                  (when (and (not (string= "<span class="quote"></span>" hit-string))
                             (or (not predicate)
                                 (save-match-data (funcall predicate hit-string end-marker))))
                    <span class="linecomment">;; Add whole candidate to `temp-list'.  Whole candidate is</span>
                    <span class="linecomment">;; (`hit-string' . `end-marker') or ((`hit-string' BUFNAME) . `end-marker').</span>
                    (push (cons (if add-bufname-p
                                    (list hit-string
                                          (let ((string  (copy-sequence (buffer-name))))
                                            (put-text-property 0 (length string) 'face
                                                               'icicle-candidate-part string)
                                            string))
                                  hit-string)
                                end-marker)
                          temp-list)
                    <span class="linecomment">;; Highlight search context in buffer.</span>
                    (when (&lt;= (+ (length temp-list) (length icicle-candidates-alist))
                              icicle-search-highlight-threshold)
                      (let ((ov  (make-overlay (match-beginning icicle-search-context-level)
                                               (match-end icicle-search-context-level))))
                        (push ov icicle-search-overlays)
                        (overlay-put ov 'priority 200) <span class="linecomment">; &gt; ediff's 100+, &lt; isearch-overlay's 1001.</span>
                        (overlay-put ov 'face 'icicle-search-main-regexp-others))))))
              (setq last-beg  beg))
            (setq icicle-candidates-alist  (append icicle-candidates-alist (nreverse temp-list))))
        (quit (when icicle-search-cleanup-flag (icicle-search-highlight-cleanup)))
        (error (when icicle-search-cleanup-flag (icicle-search-highlight-cleanup))
               (error (error-message-string icicle-search-regexp-scan)))))))

<span class="linecomment">;; Free var here: `icicle-search-ecm' is bound in `icicle-search'.</span>
(defun icicle-search-highlight-all-input-matches (&optional input)
  "<span class="quote">Highlight, inside each search context, what INPUT matches.</span>"
  (save-excursion
    <span class="linecomment">;; Update by deleting (if it exists) and then creating.</span>
    <span class="linecomment">;; If a single overlay exists, it means that the user just changed</span>
    <span class="linecomment">;; `icicle-search-highlight-threshold' to non-zero.</span>
    <span class="linecomment">;; Otherwise, it's nil or a list of overlays.</span>
    (when (overlayp icicle-search-refined-overlays)
      (delete-overlay icicle-search-refined-overlays)
      (setq icicle-search-refined-overlays  nil))
    (while icicle-search-refined-overlays
      (delete-overlay (car icicle-search-refined-overlays))
      (setq icicle-search-refined-overlays  (cdr icicle-search-refined-overlays))))
  (when icicle-search-highlight-all-current-flag
    (setq input  (or input icicle-current-input))
    (unless (or (string= "<span class="quote"></span>" input) (null icicle-search-overlays))
      (let ((hits  ()))
        (save-excursion
          (dolist (ov icicle-search-overlays)
            (set-buffer (overlay-buffer ov))
            (save-restriction             <span class="linecomment">; Search within the current search context.</span>
              (narrow-to-region (overlay-start ov) (overlay-end ov))
              (goto-char (point-min))
              (when (condition-case nil (re-search-forward input nil 'move-to-end) (error nil))
                (push (buffer-substring-no-properties (point-min) (point-max)) hits))))
          (when (and icicle-expand-input-to-common-match-flag  hits)
            (setq icicle-search-ecm  (icicle-expanded-common-match input hits)))
          (dolist (ov icicle-search-overlays)
            (set-buffer (overlay-buffer ov))
            (save-restriction             <span class="linecomment">; Search within the current search context.</span>
              (narrow-to-region (overlay-start ov) (overlay-end ov))
              (when (member (buffer-substring-no-properties (point-min) (point-max)) hits)
                (goto-char (point-min))
                (save-match-data
                  (while (condition-case nil
                             (re-search-forward (or icicle-search-ecm input) nil 'move-to-end)
                           (error nil))
                    (setq ov  (make-overlay (match-beginning 0) (match-end 0)))
                    (push ov icicle-search-refined-overlays)
                    (overlay-put ov 'priority 220)
                    (overlay-put ov 'face 'icicle-search-current-input)))))))))))

(defun icicle-search-replace-search-hit (candidate)
  "<span class="quote">Replace search hit CANDIDATE with `icicle-search-replacement'.</span>"
  (let ((icicle-candidate-nb             icicle-candidate-nb)
        (icicle-completion-candidates    icicle-completion-candidates)
        (icicle-last-completion-command  icicle-last-completion-command)
        (icicle-last-input               icicle-last-input)
        (compl-win                       (get-buffer-window "<span class="quote">*Completions*</span>" 0)))
    (unless icicle-search-replacement
      (icicle-search-define-replacement)
      (when (and compl-win icicle-completion-candidates)
        (with-output-to-temp-buffer "<span class="quote">*Completions*</span>"
          (display-completion-list icicle-completion-candidates)))))
  (setq icicle-candidate-nb  (or icicle-candidate-nb 0)) <span class="linecomment">; Replace-all has nil, so use 0.</span>
  (funcall icicle-candidate-action-fn candidate icicle-search-replacement))

<span class="linecomment">;; Free vars here: `orig-win-explore' is bound in `icicle-explore'.</span>
(defun icicle-search-action (string &optional replace-string)
  "<span class="quote">Completion action function for command `icicle-search'.
1. Move to the regexp match in the original buffer and highlight it.
2. If `icicle-search-highlight-threshold' is zero, highlight what the
   current input matches, inside the match of the initial regexp.
3. If REPLACE-STRING is non-nil, replace current candidate with it.
   If `icicle-search-replace-whole-candidate-flag' is nil, replace
   only the candidate part that matches the current input.
4. Highlight the current candidate in *Completions*.

   Note: The replacement can be anything allowed as a replacement by
   `query-replace-regexp', including Lisp-evaluation
   constructs (`\,...').</span>"
  (prog1
      (condition-case icicle-search-action
          (progn
            <span class="linecomment">;; Move cursor to the match in the original buffer and highlight it.</span>
            (let* ((cand+mrker  (icicle-get-alist-candidate string))
                   <span class="linecomment">;; $$$$$$$$</span>
                   <span class="linecomment">;; (cand+mrker (elt (icicle-filter-alist icicle-candidates-alist</span>
                   <span class="linecomment">;;                                       icicle-completion-candidates)</span>
                   <span class="linecomment">;;                  icicle-candidate-nb))</span>
                   (candidate   (if (consp (car-safe cand+mrker))
                                    (car-safe (car-safe cand+mrker))
                                  (car-safe cand+mrker)))
                   (marker      (cdr-safe cand+mrker))
                   (icicle-search-in-context-fn
                    (or icicle-search-in-context-fn 'icicle-search-in-context-default-fn)))
              (unless marker (error "<span class="quote">No such occurrence</span>"))
              (save-selected-window
                (when (window-live-p orig-win-explore) (select-window orig-win-explore))
                (let ((completion-ignore-case  case-fold-search)
                      (buf                     (marker-buffer marker))
                      (icicle-candidate-nb     icicle-candidate-nb)) <span class="linecomment">; Save and restore this.</span>
                  (unless (bufferp buf) (error "<span class="quote">No such buffer: %s</span>" buf))
                  (pop-to-buffer buf)
                  (raise-frame)
                  (goto-char marker)
                  <span class="linecomment">;; Highlight current search context using `icicle-search-main-regexp-current'.</span>
                  (icicle-place-overlay (- marker (length candidate)) marker
                                        'icicle-search-current-overlay
                                        'icicle-search-main-regexp-current
                                        202 buf)
                  (funcall icicle-search-in-context-fn cand+mrker replace-string)
                  (icicle-highlight-candidate-in-Completions)
                  (run-hooks 'icicle-search-hook)))
              nil))                     <span class="linecomment">; Return nil for success.</span>
        (error (message (error-message-string icicle-search-action))
               (error-message-string icicle-search-action))) <span class="linecomment">; Return error message.</span>
    (select-window (minibuffer-window))
    (select-frame-set-input-focus (selected-frame))))

(defun icicle-search-in-context-default-fn (cand+mrker replace-string)
  "<span class="quote">Default value of `icicle-search-in-context-fn'.</span>"
  (let ((candidate  (if (consp (car-safe cand+mrker))
                        (car-safe (car-safe cand+mrker))
                      (car-safe cand+mrker)))
        (marker     (cdr-safe cand+mrker)))
    (save-excursion (save-restriction   <span class="linecomment">; Search within the current search context.</span>
                      (narrow-to-region (- marker (length candidate)) marker)
                      (icicle-search-highlight-and-maybe-replace cand+mrker replace-string))))
  (let ((icicle-candidate-nb  icicle-candidate-nb)) (icicle-complete-again-update)))

<span class="linecomment">;; Free var here: `icicle-search-ecm' is bound in `icicle-search'.</span>
(defun icicle-search-highlight-and-maybe-replace (cand+mrker replace-string)
  "<span class="quote">Highlight within search context and replace using REPLACE-STRING.
If REPLACE-STRING is nil, no replacement occurs.
Arguments are the same as for `icicle-search-in-context-fn'.</span>"
  (icicle-search-highlight-context-levels)
  (icicle-search-highlight-input-matches-here)
  (when replace-string
    (goto-char (point-min))
    (cond (icicle-search-replace-whole-candidate-flag
           (let ((candidate  (if (consp (car-safe cand+mrker))
                                 (car-safe (car-safe cand+mrker))
                               (car-safe cand+mrker))))
             (cond ((string= candidate replace-string) <span class="linecomment">; Sanity check only.</span>
                    (save-restriction (widen) (message
                                               "<span class="quote">Replacement = candidate, and \
current input matches candidate</span>") (sit-for 2)))
                   (t
                    (set-match-data (list (point-min) (point-max)))
                    (icicle-search-replace-match replace-string
                                                 (icicle-search-replace-fixed-case-p
                                                  icicle-search-context-regexp))))))
          (t
           (save-match-data
             (let ((first-p  t)
                   (ecm      (and icicle-search-replace-common-match-flag icicle-search-ecm)))
               (while (and (re-search-forward (or ecm icicle-current-input) nil 'move-to-end)
                           (or first-p icicle-all-candidates-action-p))
                 (setq first-p  nil)
                 (icicle-search-replace-match replace-string
                                              (icicle-search-replace-fixed-case-p
                                               icicle-current-input)))))))
    (icicle-search-replace-candidate cand+mrker (buffer-substring (point-min) (point-max)))
    (save-selected-window (select-window (minibuffer-window)) (icicle-retrieve-last-input))
    (when (or (not icicle-candidate-nb) <span class="linecomment">; Just in case - should never be nil.</span>
              (&gt;= icicle-candidate-nb (length icicle-completion-candidates)))
      (setq icicle-candidate-nb  0))
    (setq icicle-last-completion-candidate  (buffer-substring (point-min) (point-max)))
    (icicle-highlight-candidate-in-Completions)
    (icicle-search-highlight-context-levels)
    (icicle-search-highlight-input-matches-here)))

(defun icicle-search-replace-match (replace-string fixedcase)
  "<span class="quote">Replace current match with REPLACE-STRING, interpreting escapes.
Treat REPLACE-STRING as it would be by `query-replace-regexp'.
FIXEDCASE is as for `replace-match'.  Non-nil means do not alter case.</span>"
  (if (fboundp 'query-replace-compile-replacement) <span class="linecomment">; Emacs 22.</span>
      (let ((compiled
             (save-match-data
               (query-replace-compile-replacement replace-string
                                                  (not icicle-search-replace-literally-flag)))))
        (condition-case icicle-search-replace-match1
            (let ((enable-recursive-minibuffers    t) <span class="linecomment">; So we can read input from \?.</span>
                  <span class="linecomment">;; Save and restore these, because we might read input from \?.</span>
                  (icicle-last-completion-command  icicle-last-completion-command)
                  (icicle-last-input               icicle-last-input))
              (replace-match-maybe-edit
               (if (consp compiled)
                   (funcall (car compiled) (cdr compiled) (setq replace-count  (1+ replace-count)))
                 compiled)
               fixedcase icicle-search-replace-literally-flag nil (match-data)))
          (error (icicle-remove-Completions-window) (error "<span class="quote">No match for %s</span>" replace-string))))
    (condition-case icicle-search-replace-match2 <span class="linecomment">; Emacs &lt; 22.  Try to interpret `\'.</span>
        (replace-match replace-string fixedcase icicle-search-replace-literally-flag)
      (error (replace-match replace-string fixedcase t))))) <span class="linecomment">;   If error, replace literally.</span>

(defun icicle-search-highlight-context-levels ()
  "<span class="quote">Highlight context levels differently (up to 8 levels).
No such highlighting is done if any of these conditions holds:
 * `icicle-search-context-level' is not 0 (search context &lt; regexp).
 * `icicle-search-highlight-context-levels-flag' is nil.
 * `icicle-search-context-regexp' is nil (non-regexp searching).</span>"
  (unless (or (/= icicle-search-context-level 0)
              (not icicle-search-highlight-context-levels-flag)
              (not icicle-search-context-regexp)) <span class="linecomment">; E.g. text-property searching</span>
    (while icicle-search-level-overlays
      (delete-overlay (car icicle-search-level-overlays))
      (setq icicle-search-level-overlays  (cdr icicle-search-level-overlays)))
    (save-match-data
      (let ((level       1)
            (max-levels  (min (regexp-opt-depth icicle-search-context-regexp) 8)))
        (goto-char (point-min))
        (re-search-forward icicle-search-context-regexp nil t)
        (condition-case nil
            (while (&lt;= level max-levels)
              (let ((ov  (make-overlay (match-beginning level) (match-end level))))
                (push ov icicle-search-level-overlays)
                (overlay-put ov 'priority (+ 205 level)) <span class="linecomment">; &gt; ediff's 100+, &lt; isearch-overlay's 1001.</span>
                (overlay-put ov 'face (intern (concat "<span class="quote">icicle-search-context-level-</span>"
                                                      (number-to-string level)))))
              (setq level  (1+ level)))
          (error nil))))))

<span class="linecomment">;; Free var here: `icicle-search-ecm' is bound in `icicle-search'.</span>
(defun icicle-search-highlight-input-matches-here ()
  "<span class="quote">Highlight all input matches in the current search context.</span>"
  (unless (or (&gt; 0 icicle-search-highlight-threshold) (string= "<span class="quote"></span>" icicle-current-input))
    (goto-char (point-min))
    (when (and (not icicle-search-highlight-all-current-flag)
               (overlayp icicle-search-refined-overlays))
      (delete-overlay icicle-search-refined-overlays)
      (setq icicle-search-refined-overlays  nil))
    (unless icicle-search-highlight-all-current-flag
      (while icicle-search-refined-overlays
        (delete-overlay (car icicle-search-refined-overlays))
        (setq icicle-search-refined-overlays  (cdr icicle-search-refined-overlays))))
    (let ((ov  nil))
      (save-match-data
        (while (and (not (eobp)) (re-search-forward (or icicle-search-ecm icicle-current-input)
                                                    nil 'move-to-end))
          (setq ov  (make-overlay (match-beginning 0) (match-end 0)))
          (push ov icicle-search-refined-overlays)
          (overlay-put ov 'priority 220) <span class="linecomment">; Greater than any possible context-level priority (213).</span>
          (overlay-put ov 'face 'icicle-search-current-input))))))

(defun icicle-search-replace-fixed-case-p (from)
  "<span class="quote">Return non-nil if FROM should be replaced without transferring case.
FROM is a string or nil.  If FROM is nil, then return nil.</span>"
  (and from (not (and case-fold-search case-replace (string= from (downcase from))))))

(defun icicle-search-replace-candidate (cand+mrker new-cand)
  "<span class="quote">In `icicle-candidates-alist', replace car of CAND+MRKER with NEW-CAND.</span>"
  (let ((newlist  icicle-candidates-alist))
    (while newlist
      (when (equal (car newlist) cand+mrker) (setcar newlist (cons new-cand (cdr-safe cand+mrker))))
      (setq newlist  (cdr newlist)))
  icicle-candidates-alist))

(defun icicle-search-help (cand)
  "<span class="quote">Use as `icicle-candidate-help-fn' for `icicle-search' commands.</span>"
  (icicle-msg-maybe-in-minibuffer
   (let ((marker  (cdr (icicle-get-alist-candidate cand))))
     (or (concat "<span class="quote">Buffer: `</span>" (buffer-name (marker-buffer marker))
                 (format "<span class="quote">', Position: %d</span>" (marker-position marker)))
         "<span class="quote">No help</span>"))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-keywords (beg end keywords require-match <span class="linecomment">; Bound to `C-c ^'.</span>
                               &optional where &rest args)
  "<span class="quote">Search with one or more keywords, which can each be a regexp.
Text that matches *any* of the keywords is found.

You can use completion to choose one or more previously entered
regexps (using `C-RET', `C-mouse-2', `C-next', and so on), or you can
enter new keywords (using `C-RET').  Use `RET' or `mouse-2' to choose
the last keyword.

Keywords are interpreted as regexps.  You can change to substring
completion instead, matching regexp special characters literally, by
using `C-`' during completion to toggle `icicle-regexp-quote-flag'.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the `icicle-search'
documentation.</span>"
  (interactive
   `(,@(icicle-region-or-buffer-limits)
     ,(icicle-group-regexp (mapconcat #'icicle-group-regexp (icicle-keyword-list) "<span class="quote">\\|</span>"))
     ,(not icicle-add-buffer-name-flag)
     ,(icicle-search-where-arg)))
  (icicle-search beg end keywords (not icicle-add-buffer-name-flag) where))

(defalias 'icicle-regexp-list 'icicle-keyword-list)
<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-keyword-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of keywords. The list of keywords (strings) is returned.
You can choose from keywords entered previously or enter new keywords
using `C-RET'.  Each keyword is a regexp.  The regexps are OR'd, and
the resulting regexp is used for `icicle-search'.</span>" <span class="linecomment">; Doc string</span>
  (lambda (name)                        <span class="linecomment">; Function to perform the action</span>
    (push name keywords)
    (message "<span class="quote">Added keyword `%s'</span>" name))
  "<span class="quote">Choose keyword (regexp) (`RET' when done): </span>" <span class="linecomment">; `completing-read' args</span>
  (mapcar #'list (icicle-remove-duplicates regexp-history)) nil nil nil 'regexp-history nil nil
  ((keywords                              nil) <span class="linecomment">; Additional bindings</span>
   (icicle-use-candidates-only-once-flag  t))
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (prog1 (setq keywords  (nreverse (delete "<span class="quote"></span>" keywords))) <span class="linecomment">; Last code - return the list of keywords.</span>
    (when (interactive-p) (message "<span class="quote">Keywords (regexps): %S</span>" keywords))))

(defun icicle-group-regexp (regexp)
  "<span class="quote">Wrap REGEXP between regexp parens, as a regexp group.</span>"
  (concat "<span class="quote">\\(</span>" regexp "<span class="quote">\\)</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-char-property (beg end require-match
                                    &optional where prop values predicate)
  "<span class="quote">Search for text that has a character property with a certain value.
If the property is `face' or `font-lock-face', then you can pick
multiple faces, using completion.  Text is then searched that has a
face property that includes any of the selected faces.  If you choose
no face (empty input), then text with any face is found.

By \"character property\" is meant either an overlay property or a
text property.  If you want to search for only an overlay property or
only a text property, then use `icicle-search-overlay-property' or
`icicle-search-text-property' instead.

Non-interactively, arguments BEG, END, REQUIRE-MATCH, and WHERE are as
for `icicle-search'.  Arguments PROP, VALUES, and PREDICATE are passed
to `icicle-search-char-property-scan' to define the search contexts.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the doc for command
`icicle-search'.</span>"
  (interactive (icicle-search-property-args))
  (icicle-search beg end 'icicle-search-char-property-scan require-match where prop values nil
                 predicate))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-overlay-property (beg end require-match &optional where prop values predicate)
  "<span class="quote">Same as `icicle-search-char-property', except only overlay property.
That is, do not also search a text property.</span>"
  (interactive (icicle-search-property-args))
  (icicle-search beg end 'icicle-search-char-property-scan require-match where prop values 'overlay
                 predicate))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-text-property (beg end require-match <span class="linecomment">; Bound to `C-c "'.</span>
                                    &optional where prop values predicate)
  "<span class="quote">Same as `icicle-search-char-property', except only text property.
That is, do not also search an overlay property.</span>"
  (interactive (icicle-search-property-args))
  (icicle-search beg end 'icicle-search-char-property-scan require-match where prop values 'text
                 predicate))

(defun icicle-search-property-args ()
  "<span class="quote">Read and return interactive arguments for `icicle-search-*-property'.</span>"
  (let* ((where    (icicle-search-where-arg))
         (beg+end  (icicle-region-or-buffer-limits))
         (beg1     (car beg+end))
         (end1     (cadr beg+end))
         (props    (mapcar (lambda (prop) (list (symbol-name prop)))
                           (icicle-char-properties-in-buffers where beg1 end1)))
         (prop     (intern (completing-read "<span class="quote">Property to search: </span>" props nil nil nil nil "<span class="quote">face</span>")))
         (values   (if (memq prop '(face font-lock-face))
                       (let ((faces  (icicle-face-list)))
                         (if faces (mapcar #'intern faces) (face-list))) <span class="linecomment">; Default: all faces.</span>
                     (list (intern (icicle-completing-read-history
                                    "<span class="quote">Property value: </span>" 'icicle-char-property-value-history))))))
    `(,beg1 ,end1 ,(not icicle-add-buffer-name-flag) ,where ,prop ,values)))

(defun icicle-char-properties-in-buffers (where beg end &optional type)
  "<span class="quote">List of all character properties in WHERE.
The other arguments are passed to `icicle-char-properties-in-buffer'.
Only the character properties are included, not their values.
WHERE is a list of buffers, a list of files, or a list of region
  entries that have the same form as `icicle-region-alist'.  If nil,
  then only the current buffer is used.
TYPE can be `overlay', `text', or nil, meaning overlay properties,
text properties, or both, respectively.</span>"
  (cond ((and (consp where) (bufferp (car where))) <span class="linecomment">; List of buffers - search buffers.</span>
         (dolist (buf where) (icicle-char-properties-in-buffer buf nil nil type)))
        ((and (consp where)             <span class="linecomment">; List of files - search files.</span>
              (stringp (car where))
              (file-exists-p (car where)))
         (dolist (file where)
           (icicle-char-properties-in-buffer (find-file-noselect file) nil nil type)))
        ((consp where)                  <span class="linecomment">; Search all regions in `icicle-region-alist'.</span>
         (when icicle-region-auto-open-files-flag (icicle-region-open-all-files))
         (dolist (reg where)
           (when (bufferp (get-buffer (cadr reg)))
             (icicle-char-properties-in-buffer
              (get-buffer (cadr reg)) (cadr (cddr reg)) (car (cddr (cddr reg))) type))))
        (t                              <span class="linecomment">; Search this buffer only.</span>
         (icicle-char-properties-in-buffer (current-buffer) beg end type))))

(defun icicle-char-properties-in-buffer (&optional buffer beg end type)
  "<span class="quote">List of all character properties in BUFFER between BEG and END.
Only the character properties are included, not their values.
TYPE can be `overlay', `text', or nil, meaning overlay properties,
text properties, or both, respectively.</span>"
  (let ((props  ())
        ovrlays curr-props)
    (save-excursion
      (unless buffer (setq buffer  (current-buffer)))
      (set-buffer buffer)
      (unless (and beg end)
        (setq beg  (point-min)
              end  (point-max)))
      (when (or (not type) (eq type 'overlay)) <span class="linecomment">; Get overlay properties.</span>
        (setq ovrlays  (overlays-in beg end))
        (dolist (ovrly ovrlays)
          (setq curr-props  (overlay-properties ovrly))
          (while curr-props
            (unless (memq (car curr-props) props) (push (car curr-props) props))
            (setq curr-props  (cddr curr-props)))))
      (when (or (not type) (eq type 'text)) <span class="linecomment">; Get text properties.</span>
        (while (&lt; beg end)
          (setq beg         (or (next-property-change beg nil end) end)
                curr-props  (text-properties-at beg))
          (while curr-props
            (unless (memq (car curr-props) props) (push (car curr-props) props))
            (setq curr-props  (cddr curr-props))))))
    props))

(defun icicle-search-char-property-scan (buffer beg end prop values type predicate)
  "<span class="quote">Scan BUFFER from BEG to END for character property PROP with VALUES.
Push hits onto `icicle-candidates-alist'.
If BUFFER is nil, scan the current buffer.
Highlight the matches in face `icicle-search-main-regexp-others'.
If BEG and END are nil, scan entire BUFFER.

Find text with a PROP value that overlaps with VALUES.  That is, if
the value of PROP is an atom, then it must be a member of VALUES; if
it is a list, then at least one list element must be a member of
VALUES.

TYPE is `overlay', `text', or nil, and specifies the type of character
property - nil means look for both overlay and text properties.

If PREDICATE is non-nil, then push only the hits for which it holds.
PREDICATE is nil or a Boolean function that takes these arguments:
  - the search-context string
  - a marker at the end of the search-context</span>"
  (let ((add-bufname-p  (and buffer icicle-add-buffer-name-flag))
        (temp-list      ())
        (zone-end       nil))
    (unless buffer (setq buffer  (current-buffer)))
    (set-buffer buffer)
    (unless (and beg end)
      (setq beg  (point-min)
            end  (point-max)))
    (condition-case icicle-search-char-property-scan
        (save-excursion
          (while (and (&lt; beg end)
                      (let* ((charval  (and (or (not type) (eq type 'overlay))
                                            (get-char-property beg prop)))
                             (textval  (and (or (not type) (eq type 'text))
                                            (get-text-property beg prop)))
                             (currval  (icicle-flat-list charval textval)))
                        (not (icicle-set-intersection values currval))))
            (setq beg  (icicle-next-single-char-property-change beg prop nil end)))
          (while (and beg (&lt; beg end))
            (setq zone-end  (or (icicle-next-single-char-property-change beg prop nil end) end))
            (let* ((hit-string  (buffer-substring-no-properties beg zone-end))
                   (end-marker  (copy-marker zone-end)))
              (when (or (not predicate) (save-match-data (funcall predicate hit-string end-marker)))
                (push (cons (if add-bufname-p
                                (list hit-string
                                      (let ((string  (copy-sequence (buffer-name))))
                                        (put-text-property 0 (length string)
                                                           'face 'icicle-candidate-part string)
                                        string))
                              hit-string)
                            end-marker)
                      temp-list)
                <span class="linecomment">;; Highlight search context in buffer.</span>
                (when (&lt;= (+ (length temp-list) (length icicle-candidates-alist))
                          icicle-search-highlight-threshold)
                  (let ((ov  (make-overlay beg zone-end)))
                    (push ov icicle-search-overlays)
                    (overlay-put ov 'priority 200) <span class="linecomment">; &gt; ediff's 100+, but &lt; isearch overlays</span>
                    (overlay-put ov 'face 'icicle-search-main-regexp-others)))))
            (setq beg  zone-end)
            (while (and (&lt; beg end)
                        (let* ((charval  (and (or (not type) (eq type 'overlay))
                                              (get-char-property beg prop)))
                               (textval  (and (or (not type) (eq type 'text))
                                              (get-text-property beg prop)))
                               (currval  (icicle-flat-list charval textval)))
                          (not (icicle-set-intersection values currval))))
              (setq beg  (icicle-next-single-char-property-change beg prop nil end))))
          (setq icicle-candidates-alist  (append icicle-candidates-alist (nreverse temp-list))))
      (quit (when icicle-search-cleanup-flag (icicle-search-highlight-cleanup)))
      (error (when icicle-search-cleanup-flag (icicle-search-highlight-cleanup))
             (error (error-message-string icicle-search-char-property-scan))))))

(defun icicle-flat-list (val1 val2)
  "<span class="quote">Return a flat list with all values in VAL1 and VAL2.</span>"
  (let ((result  nil))
    (unless (listp val1) (setq val1  (list val1)))
    (unless (listp val2) (setq val2  (list val2)))
    (while val1 (add-to-list 'result (pop val1)))
    (while val2 (add-to-list 'result (pop val2)))
    result))

(if (fboundp 'next-single-char-property-change)
    (defalias 'icicle-next-single-char-property-change 'next-single-char-property-change)
  (defun icicle-next-single-char-property-change (position prop &optional object limit)
    "<span class="quote">Position of next change of PROP for text property or overlay change.
Scans characters forward from buffer position POSITION until property
PROP changes.  Returns the position of that change.

POSITION is a buffer position (integer or marker).

Optional third arg OBJECT is ignored.  It is present for compatibility
 with Emacs 22.

If optional fourth arg LIMIT is non-nil, search stops at position
LIMIT.  LIMIT is returned if nothing is found before LIMIT.

The property values are compared with `eq'.  If the property is
constant all the way to the end of the buffer, then the last valid
buffer position is returned.</span>"
    (save-excursion
      (goto-char position)
      (let ((propval  (get-char-property (point) prop))
            (end      (min limit (point-max))))
        (while (and (&lt; (point) end) (eq (get-char-property (point) prop) propval))
          (goto-char (min (next-overlay-change (point))
                          (next-single-property-change (point) prop nil end)))))
      (point))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-highlight-cleanup ()
  "<span class="quote">Remove all highlighting from the last use of `icicle-search'.</span>"
  (interactive)
  (let ((inhibit-quit  t))
    (message "<span class="quote">Removing search highlighting...</span>")
    (while icicle-search-overlays
      (delete-overlay (car icicle-search-overlays))
      (setq icicle-search-overlays  (cdr icicle-search-overlays)))
    (while icicle-search-level-overlays
      (delete-overlay (car icicle-search-level-overlays))
      (setq icicle-search-level-overlays  (cdr icicle-search-level-overlays)))
    (when (overlayp icicle-search-current-overlay)
      (delete-overlay icicle-search-current-overlay))
    (when (overlayp icicle-search-refined-overlays)
      (delete-overlay icicle-search-refined-overlays)
      (setq icicle-search-refined-overlays  ()))
    (while icicle-search-refined-overlays
      (delete-overlay (car icicle-search-refined-overlays))
      (setq icicle-search-refined-overlays  (cdr icicle-search-refined-overlays)))
    (message "<span class="quote">Removing search highlighting...done</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-word (beg end word-regexp require-match <span class="linecomment">; Bound to `C-c $'.</span>
                           &optional where &rest args)
  "<span class="quote">Search for a whole word.
Word search is literal: regexp special characters are treated as
non-special.  In fact, they are also treated as if they were
word-constituent characters.  That is, your typed input is searched
for literally, but matches must begin and end on a word boundary.
This also means that you can include whitespace within the \"word\"
being sought.

At the prompt for a word, you can use completion against previous
Icicles search inputs to choose the word, or you can enter a new word.

Non-interactively, WORD-REGEXP should be a regexp that matches a word.
The other arguments are the same as for `icicle-search'.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the doc for command
`icicle-search'.</span>"
  (interactive `(,@(icicle-region-or-buffer-limits)
                 ,(icicle-search-read-word)
                 ,(not icicle-add-buffer-name-flag)
                 ,(icicle-search-where-arg)))
  (icicle-search beg end word-regexp (not icicle-add-buffer-name-flag) where))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-all-regions (scan-fn-or-regexp require-match &rest args)
  "<span class="quote">Search all saved regions.
Same as using a simple prefix arg, `C-u', with `icicle-search'.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.</span>"
  (interactive `(,(if icicle-search-whole-word-flag
                      (icicle-search-read-word)
                      (icicle-search-read-context-regexp))
                 ,(not icicle-add-buffer-name-flag)))
  (apply #'icicle-search nil nil scan-fn-or-regexp require-match icicle-region-alist args))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-buffer (scan-fn-or-regexp require-match &rest args)
  "<span class="quote">Search multiple buffers completely.
Same as using a non-negative numeric prefix arg, such as `C-9', with
`icicle-search'.  You are prompted for the buffers to search.  All of
each buffer is searched.  Any existing buffers can be chosen.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.</span>"
  (interactive `(,(if icicle-search-whole-word-flag
                      (icicle-search-read-word)
                      (icicle-search-read-context-regexp))
                 ,(not icicle-add-buffer-name-flag)))
  (apply #'icicle-search nil nil scan-fn-or-regexp require-match
         (let ((icicle-show-Completions-initially-flag  t))
           (mapcar #'get-buffer (let ((icicle-buffer-require-match-flag  'partial-match-ok))
                                  (icicle-buffer-list))))
         args))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-file (scan-fn-or-regexp require-match &rest args)
  "<span class="quote">Search multiple files completely.
Same as using a negative numeric prefix arg, such as `C--', with
`icicle-search'.  You are prompted for the files to search.  All of
each file is searched.  Any existing files in the current directory
can be chosen.  Arguments are the same as for `icicle-search', but
without arguments BEG, END, and WHERE.</span>"
  (interactive `(,(if icicle-search-whole-word-flag
                      (icicle-search-read-word)
                      (icicle-search-read-context-regexp))
                 ,(not icicle-add-buffer-name-flag)))
  (apply #'icicle-search nil nil scan-fn-or-regexp require-match
         (let ((icicle-show-Completions-initially-flag  t)) (icicle-file-list))
         args))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-dired-marked (scan-fn-or-regexp require-match &rest args)
  "<span class="quote">Search the marked files in Dired.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.</span>"
  (interactive `(,(if icicle-search-whole-word-flag
                      (icicle-search-read-word)
                      (icicle-search-read-context-regexp))
                 ,(not icicle-add-buffer-name-flag)))
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">Command `icicle-search-dired-marked' must be called from a Dired buffer</span>"))
  (apply #'icicle-search nil nil scan-fn-or-regexp require-match (dired-get-marked-files) args))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-ibuffer-marked (scan-fn-or-regexp require-match &rest args)
  "<span class="quote">Search the marked buffers in Ibuffer, in order.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.</span>"
  (interactive `(,(if icicle-search-whole-word-flag
                      (icicle-search-read-word)
                      (icicle-search-read-context-regexp))
                 ,(not icicle-add-buffer-name-flag)))
  (unless (eq major-mode 'ibuffer-mode)
    (error "<span class="quote">Command `icicle-search-ibuffer-marked' must be called from an Ibuffer buffer</span>"))
  (let ((marked-bufs (nreverse (ibuffer-get-marked-buffers))))
    (unless marked-bufs (setq marked-bufs  (list (ibuffer-current-buffer t))))
    (apply #'icicle-search nil nil scan-fn-or-regexp require-match marked-bufs args)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-search-buff-menu-marked (scan-fn-or-regexp require-match &rest args)
  "<span class="quote">Search the marked buffers in Buffer Menu, in order.
Arguments are the same as for `icicle-search', but without arguments
BEG, END, and WHERE.</span>"
  (interactive `(,(if icicle-search-whole-word-flag
                      (icicle-search-read-word)
                      (icicle-search-read-context-regexp))
                 ,(not icicle-add-buffer-name-flag)))
  (unless (eq major-mode 'Buffer-menu-mode)
    (error "<span class="quote">Command `icicle-search-buff-menu-marked' must be called from a Buffer Menu buffer</span>"))
  (let ((marked-bufs  ()))
    (save-excursion
      (Buffer-menu-beginning)
      (while (re-search-forward "<span class="quote">^&gt;</span>" nil t) (push (Buffer-menu-buffer t) marked-bufs)))
    (setq marked-bufs  (nreverse marked-bufs))
    (unless marked-bufs (setq marked-bufs  (list (Buffer-menu-buffer t))))
    (apply #'icicle-search nil nil scan-fn-or-regexp require-match marked-bufs args)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-occur (beg end &optional buffers) <span class="linecomment">; Bound to `C-c ''.</span>
  "<span class="quote">`icicle-search' with a regexp of \".*\".  An `occur' with icompletion.
Type a regexp to match within each line of the buffer.  Use `S-TAB' to
show matching lines.  Use `C-RET' or `C-mouse-2' to go to the line of
the current candidate.  Use `C-next', `C-prior', `C-down', or`C-up' to
cycle among the matching lines.

By default, search only the current buffer.  Search the active region,
or, if none, the entire buffer.  With a prefix argument, you are
prompted for the buffers to search.  You can choose buffers using
completion (`C-RET' and so on).  If the prefix argument is 99, then
only buffers visiting files are candidates.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, see the doc for command
`icicle-search'.</span>"
  (interactive `(,@(icicle-region-or-buffer-limits)
                 ,(and current-prefix-arg
                       (icicle-search-choose-buffers (= 99 (prefix-numeric-value
                                                            current-prefix-arg))))))
  (let ((fg (face-foreground        'icicle-search-main-regexp-others))
        (bg (face-background        'icicle-search-main-regexp-others))
        (icicle-transform-function  (if (interactive-p) nil icicle-transform-function)))
    (unwind-protect
         (progn (set-face-foreground 'icicle-search-main-regexp-others nil)
                (set-face-background 'icicle-search-main-regexp-others nil)
                (icicle-search beg end "<span class="quote">.*</span>" (not icicle-add-buffer-name-flag) buffers))
      (when icicle-search-cleanup-flag (icicle-search-highlight-cleanup))
      (set-face-foreground 'icicle-search-main-regexp-others fg)
      (set-face-background 'icicle-search-main-regexp-others bg))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-comint-search (beg end)   <span class="linecomment">; Bound to `C-x `' in `comint-mode'.</span>
  "<span class="quote">Use `icicle-search' to pick up a previous input for reuse.
Use this in a `comint-mode' buffer, such as *shell* or
*inferior-lisp*.  This searches your interactive history in the buffer
for a match to your current input, which you can change dynamically.
When you choose a previous input, it is copied to the current prompt,
for reuse.  If the region is active, then only it is searched;
otherwise, the entire buffer is searched.

Use `C-RET' or `C-mouse-2' to choose a previous input for reuse.  Use
`C-next', `C-prior', `C-down', or `C-up' to cycle among your previous
inputs.

As for other Icicles search commands, your current input narrows the
set of possible candidates.  See `icicle-search' for more
information.

You can use `M-*' to further narrow the match candidates, typing
additional regexps to match.

Note that previous commands are identified by looking through the
shell buffer for a shell prompt.  This is not foolproof.  If, for
instance you use command `ls', the output includes an auto-save file
such as #foo.el#, and `#' in the first column represents a shell
prompt, then #foo.el# will be misinterpreted as a previous command.

Also, depending on your shell, you might want to customize variables
such as the following:

`shell-prompt-pattern',`telnet-prompt-pattern'.

Being a search command, `icicle-comint-search' cannot give you access
to previous shell commands that are not visible in the current buffer.
See also \\&lt;comint-mode-map&gt;\\[icicle-comint-command] for another way to reuse commands,
including those from previous sessions.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments, see the doc for command
`icicle-search'.</span>"
  (interactive (icicle-region-or-buffer-limits))
  <span class="linecomment">;; Is there a better test we can use, to make sure the current mode inherits from `comint-mode'?</span>
  (unless (where-is-internal 'comint-send-input (keymap-parent (current-local-map)))
    (error "<span class="quote">Current mode must be derived from comint mode</span>"))
  (let ((orig-search-hook           icicle-search-hook)
        (icicle-transform-function  'icicle-remove-duplicates))
    (add-hook 'icicle-search-hook 'icicle-comint-search-send-input)
    (icicle-search beg end (concat comint-prompt-regexp "<span class="quote">\\S-.*</span>") nil) <span class="linecomment">; Match not required (edit).</span>
    (remove-hook 'icicle-search-hook 'icicle-comint-search-send-input))
  (goto-char (point-max)))

(defun icicle-comint-search-send-input ()
  "<span class="quote">Grab current completion input and use that for comint input.</span>"
  (unless (comint-check-proc (current-buffer))
    (error "<span class="quote">No live process associated with this buffer</span>"))
  (let ((comint-get-old-input
         (if (minibuffer-window-active-p (minibuffer-window))
             'icicle-comint-search-get-minibuffer-input <span class="linecomment">; Use minibuffer input (e.g. for action fn).</span>
           'icicle-comint-search-get-final-choice))) <span class="linecomment">; Use final choice.</span>
    (comint-copy-old-input))
  (comint-send-input))

(defun icicle-comint-search-get-minibuffer-input ()
  "<span class="quote">Return the minibuffer input, beyond the prompt.</span>"
  (let* ((cand         (icicle-minibuf-input))
         (input-start  (and (string-match comint-prompt-regexp cand) (match-end 0))))
    (if input-start (substring cand input-start) cand)))

(defun icicle-comint-search-get-final-choice ()
  "<span class="quote">Return the final choice, beyond the prompt.</span>"
  (let ((input-start  (and (string-match comint-prompt-regexp icicle-explore-final-choice)
                           (match-end 0))))
    (if input-start
        (substring icicle-explore-final-choice input-start)
      icicle-explore-final-choice)))

<span class="linecomment">;;;###autoload</span>
(icicle-define-command icicle-comint-command <span class="linecomment">; Bound to `C-c TAB' in `comint-mode'.</span>
  "<span class="quote">Retrieve a previously used command.
Use this in a `comint-mode' buffer such as *shell* or *inferior-lisp*.

Note, depending on your shell, you might want to customize variables
such as the following:

`shell-prompt-pattern',`telnet-prompt-pattern'.

See also \\&lt;comint-mode-map&gt;\\[icicle-comint-search] for another way to reuse commands.</span>"
  insert
  "<span class="quote">Choose a previous command: </span>"         <span class="linecomment">; `completing-read' args</span>
  (mapcar #'list (cddr comint-input-ring)) nil nil nil 'shell-command-history
  (aref (cddr comint-input-ring) 0) nil
  ((icicle-transform-function  'icicle-remove-duplicates))) <span class="linecomment">; Additional bindings</span>

(defun icicle-comint-hook-fn ()
  "<span class="quote">Hook to set up Comint mode for Icicles.</span>"
  (set (make-local-variable 'icicle-search-command) 'icicle-comint-search))

<span class="linecomment">;;;###autoload</span>
(defun icicle-compilation-search (beg end) <span class="linecomment">; Bound to `C-c `' in `compilation(-minor)-mode'.</span>
  "<span class="quote">Like `icicle-search', but show the matching compilation-buffer hit.
Use this in a compilation buffer, such as `*grep*', searching for a
regexp as with `icicle-search'.  Use `C-RET' or `C-mouse-2' to show
the target-buffer hit corresponding to the current completion
candidate.  Use `C-next', `C-prior', `C-down', or `C-up' to cycle
among the target-buffer hits.

As for `icicle-search', you can further narrow the match candidates by
typing a second regexp to search for among the first matches.  See
`icicle-search' for more information.

Altogether, using this with `grep' gives you two or three levels of
regexp searching: 1) the `grep' regexp, 2) the major `icicle-search'
regexp, and optionally 3) the refining `icicle-search' regexp.

In Emacs 22 and later, you can replace search-hit text, as in
`icicle-search'.  In earlier Emacs versions, you cannot replace text.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments, see the doc for command
`icicle-search'.</span>"
  (interactive (icicle-region-or-buffer-limits))
  (unless (condition-case nil (eq (current-buffer) (compilation-find-buffer)) (error nil))
    (error "<span class="quote">Current buffer must be a compilation buffer</span>"))
  (save-excursion (goto-char (point-min))
                  (compilation-next-error 1)
                  (setq beg  (if beg (max beg (point)) (point))))
  (let ((icicle-transform-function    (if (interactive-p) nil icicle-transform-function))
        (icicle-candidate-alt-action-fn
         (if (boundp 'compilation-highlight-overlay) <span class="linecomment">; Emacs 22 test.</span>
             icicle-candidate-alt-action-fn
           (lambda (cand)
             (message "<span class="quote">Cannot replace matching text in Emacs before version 22</span>"))))
        <span class="linecomment">;; $$$ Bind `next-error-highlight' to t, for indefinite, after Emacs bug is fixed.</span>
        (next-error-highlight         1000000) 
        (icicle-search-in-context-fn  'icicle-compilation-search-in-context-fn)
        (fg (face-foreground          'icicle-search-main-regexp-others))
        (bg (face-background          'icicle-search-main-regexp-others)))
    (unwind-protect
         (progn
           (set-face-foreground 'icicle-search-main-regexp-others nil)
           (set-face-background 'icicle-search-main-regexp-others nil)
           (icicle-search beg end "<span class="quote">.*</span>" t))
      (set-face-foreground 'icicle-search-main-regexp-others fg)
      (set-face-background 'icicle-search-main-regexp-others bg))))

(defun icicle-compilation-search-in-context-fn (cand+mrker replace-string)
  "<span class="quote">`icicle-search-in-context-fn' used for `icicle-compilation-search'.
If `crosshairs.el' is loaded, then the target position is highlighted.</span>"
  (if (not (fboundp 'compilation-next-error-function))
      (compile-goto-error)                   <span class="linecomment">; Emacs 20, 21.</span>
    (setq compilation-current-error  (point)) <span class="linecomment">; Emacs 22+.</span>
    (compilation-next-error-function 0 nil))
  (save-excursion
    (save-restriction
      (narrow-to-region (progn (beginning-of-line) (point)) (progn (end-of-line) (point)))
      (icicle-search-highlight-and-maybe-replace cand+mrker replace-string)))
  (when (fboundp 'crosshairs-highlight) (crosshairs-highlight 'line-only 'nomsg))
  (let ((icicle-candidate-nb  icicle-candidate-nb)) (icicle-complete-again-update)))

(defun icicle-compilation-hook-fn ()
  "<span class="quote">Hook setting `icicle-search-command' for compilation modes.
Used on `compilation-mode-hook' and `compilation-minor-mode-hook'.</span>"
  (set (make-local-variable 'icicle-search-command) 'icicle-compilation-search))

<span class="linecomment">;;;###autoload</span>
(defun icicle-imenu (beg end require-match &optional where) <span class="linecomment">; Bound to `C-c ='.</span>
  "<span class="quote">Go to an Imenu entry using `icicle-search'.
Recommended: Use library `imenu+.el' also.
In Emacs-Lisp mode, `imenu+.el' classifies definitions using these
submenus:

 1. Keys         - keys in the global keymap
 2. Keys in Maps - keys in keymaps other than global keymap
 3. Functions    - functions, whether interactive or not
 4. Macros       - macros defined with `defmacro'
 5. User Options - user variables, from `defcustom'
 6. Variables    - other variables (non-options), from `defvar'
 7. Faces        - faces, from `defface'
 8. Other        - other definitions

Note: If you use this command with a prefix argument, then the Imenu
mode (and `imenu-generic-expression') of the current buffer determines
what kinds of definitions are found.  So, if you want to search for
definitions in a certain language, then invoke this command from a
buffer in that language.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the doc for command
`icicle-search'.</span>"
  (interactive `(,@(icicle-region-or-buffer-limits)
                 ,(not icicle-add-buffer-name-flag)
                 ,(icicle-search-where-arg)))
  (unless imenu-generic-expression (error "<span class="quote">No Imenu for this buffer</span>"))
  (let ((case-fold-search  (if (or (local-variable-p 'imenu-case-fold-search)
                                   (not (local-variable-p 'font-lock-defaults)))
                               imenu-case-fold-search
                             (nth 2 font-lock-defaults)))
        (old-table         (syntax-table))
        (table             (copy-syntax-table (syntax-table)))
        (slist             imenu-syntax-alist))
    (dolist (syn slist)                 <span class="linecomment">; Modify the syntax table used while matching regexps.</span>
      (if (numberp (car syn))
          (modify-syntax-entry (car syn) (cdr syn) table) <span class="linecomment">; Single character.</span>
        (mapc (lambda (c) (modify-syntax-entry c (cdr syn) table)) (car syn)))) <span class="linecomment">; String.</span>
    (unwind-protect
         (save-match-data
           (set-syntax-table table)
           (let* ((menus    (icicle-remove-if-not
                             #'icicle-imenu-in-buffer-p <span class="linecomment">; Only use menus that match the buffer.</span>
                             (mapcar (lambda (menu) <span class="linecomment">; Name an unlabeled menu `Others'.</span>
                                       (if (stringp (car menu)) menu (cons "<span class="quote">Others</span>" (cdr menu))))
                                     imenu-generic-expression)))
                  (submenu  (let ((icicle-show-Completions-initially-flag  t))
                              (completing-read "<span class="quote">Choose: </span>" menus nil t)))
                  (regexp   (cadr (assoc submenu menus)))
                  (icicle-transform-function
                   (if (interactive-p) nil icicle-transform-function)))
             (unless (stringp regexp) (error "<span class="quote">No match</span>"))
             (icicle-search beg end regexp require-match where)))
      (set-syntax-table old-table))))

(defun icicle-imenu-in-buffer-p (menu)
  "<span class="quote">Return non-nil if the regexp in MENU has a match in the buffer.</span>"
  (save-excursion (goto-char (point-min)) (re-search-forward (cadr menu) nil t)))

(defun icicle-imenu-command (beg end require-match &optional where)
  "<span class="quote">Go to an Emacs command definition using `icicle-search'.
This uses `commandp', so it finds only currently defined commands.
That is, if the buffer has not been evaluated, then its function
definitions are not considered commands by `icicle-imenu-command'.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the doc for command
`icicle-search'.</span>"
  (interactive `(,@(icicle-region-or-buffer-limits)
                 ,(not icicle-add-buffer-name-flag)
                 ,(icicle-search-where-arg)))
  (unless (or where (eq major-mode 'emacs-lisp-mode))
    (error "<span class="quote">This command is only for Emacs-Lisp mode</span>"))
  (let ((case-fold-search  (if (or (local-variable-p 'imenu-case-fold-search)
                                   (not (local-variable-p 'font-lock-defaults)))
                               imenu-case-fold-search
                             (nth 2 font-lock-defaults)))
        (old-table         (syntax-table))
        (table             (copy-syntax-table (syntax-table)))
        (slist             imenu-syntax-alist))
    (dolist (syn slist)                 <span class="linecomment">; Modify the syntax table used while matching regexps.</span>
      (if (numberp (car syn))
          (modify-syntax-entry (car syn) (cdr syn) table) <span class="linecomment">; Single character.</span>
        (mapc (lambda (c) (modify-syntax-entry c (cdr syn) table)) (car syn)))) <span class="linecomment">; String.</span>
    (unwind-protect
         (save-match-data
           (set-syntax-table table)
           (let* ((menus    (icicle-remove-if-not
                             #'icicle-imenu-in-buffer-p <span class="linecomment">; Only use menus that match the buffer.</span>
                             (mapcar (lambda (menu) <span class="linecomment">; Name an unlabeled menu `Others'.</span>
                                       (if (stringp (car menu)) menu (cons "<span class="quote">Others</span>" (cdr menu))))
                                     (if (boundp 'emacs-lisp-imenu-generic-expression)
                                         emacs-lisp-imenu-generic-expression
                                       lisp-imenu-generic-expression))))
                  (submenu  (or (assoc "<span class="quote">Functions</span>" menus) (assoc "<span class="quote">Others</span>" menus)
                                (error "<span class="quote">No command definitions in buffer</span>")))
                  (regexp   (cadr (assoc (car submenu) menus)))
                  (icicle-transform-function
                   (if (interactive-p) nil icicle-transform-function)))
             (unless (stringp regexp) (error "<span class="quote">No command definitions in buffer</span>"))
             (icicle-search beg end regexp require-match where 'icicle-imenu-command-p)))
      (set-syntax-table old-table))))

(defun icicle-imenu-non-interactive-function (beg end require-match &optional where)
  "<span class="quote">Go to an Emacs non-interactive function definition with `icicle-search'.
This uses `commandp' to distinguish currently defined commands from
other functions.  This means that if the buffer has not yet been
evaluated, then all of its function definitions are considered
non-interactive by `icicle-imenu-non-interactive-function'.

This command is intended only for use in Icicle mode.  It is defined
using `icicle-search'.  For more information, in particular for
information about the arguments and the use of a prefix argument to
search multiple regions, buffers, or files, see the doc for command
`icicle-search'.</span>"
  (interactive `(,@(icicle-region-or-buffer-limits)
                 ,(not icicle-add-buffer-name-flag)
                 ,(icicle-search-where-arg)))
  (unless (or where (eq major-mode 'emacs-lisp-mode))
    (error "<span class="quote">This command is only for Emacs-Lisp mode</span>"))
  (let ((case-fold-search  (if (or (local-variable-p 'imenu-case-fold-search)
                                   (not (local-variable-p 'font-lock-defaults)))
                               imenu-case-fold-search
                             (nth 2 font-lock-defaults)))
        (old-table         (syntax-table))
        (table             (copy-syntax-table (syntax-table)))
        (slist             imenu-syntax-alist))
    (dolist (syn slist)                 <span class="linecomment">; Modify the syntax table used while matching regexps.</span>
      (if (numberp (car syn))
          (modify-syntax-entry (car syn) (cdr syn) table) <span class="linecomment">; Single character.</span>
        (mapc (lambda (c) (modify-syntax-entry c (cdr syn) table)) (car syn)))) <span class="linecomment">; String.</span>
    (unwind-protect
         (save-match-data
           (set-syntax-table table)
           (let* ((menus    (icicle-remove-if-not
                             #'icicle-imenu-in-buffer-p <span class="linecomment">; Only use menus that match the buffer.</span>
                             (mapcar (lambda (menu) <span class="linecomment">; Name an unlabeled menu `Others'.</span>
                                       (if (stringp (car menu)) menu (cons "<span class="quote">Others</span>" (cdr menu))))
                                     (if (boundp 'emacs-lisp-imenu-generic-expression)
                                         emacs-lisp-imenu-generic-expression
                                       lisp-imenu-generic-expression))))
                  (submenu  (or (assoc "<span class="quote">Functions</span>" menus) (assoc "<span class="quote">Others</span>" menus)
                                (error "<span class="quote">No command definitions in buffer</span>")))
                  (regexp   (cadr (assoc (car submenu) menus)))
                  (icicle-transform-function
                   (if (interactive-p) nil icicle-transform-function)))
             (unless (stringp regexp) (error "<span class="quote">No command definitions in buffer</span>"))
             (icicle-search beg end regexp require-match where
                            'icicle-imenu-non-interactive-function-p)))
      (set-syntax-table old-table))))

(defun icicle-imenu-command-p (ignored-hit-string ignored-marker)
  "<span class="quote">Return non-nil for a command definition.
Predicate for `icicle-search'.
Both arguments are ignored here.</span>"
  (let ((indx  (if (&lt; emacs-major-version 21) 6 2)))
    (commandp (intern-soft
               (buffer-substring-no-properties (match-beginning indx) (match-end indx))))))

(defun icicle-imenu-non-interactive-function-p (ignored-hit-string ignored-marker)
  "<span class="quote">Return non-nil for a non-interactive function definition.
Predicate for `icicle-search'.
Both arguments are ignored here.</span>"
  (let* ((indx  (if (&lt; emacs-major-version 21) 6 2))
         (fn    (intern-soft
                 (buffer-substring-no-properties (match-beginning indx) (match-end indx)))))
    (and (fboundp fn) (not (commandp fn)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-tags-search (regexp &optional arg)
  "<span class="quote">Search all source files listed in tags tables for matches for REGEXP.
You are prompted for the REGEXP to match.  Enter REGEXP with `RET'.
You do not need `M-,' - you see all matches as search hits to visit.

All tags in a tags file are used, including duplicate tags from the
same or different source files.

By default, all tags files are used, but if you provide a prefix
argument then only the current tag table is used.

If your TAGS file references source files that no longer exist, those
files are listed.  In that case, you might want to update your TAGS
file.</span>"
  (interactive
   (let ((completion-ignore-case  (if (and (boundp 'tags-case-fold-search)
                                           (memq tags-case-fold-search '(t nil)))
                                      tags-case-fold-search
                                    case-fold-search)))
     (require 'etags)
     (list (icicle-search-read-context-regexp "<span class="quote">Search files with tags for regexp: </span>")
           current-prefix-arg)))
  (let ((files  ()))
    (save-excursion
      (let ((first-time  t)
            (morep       t))
        (while (and morep (visit-tags-table-buffer (not first-time)))
          (when arg (setq morep  nil))
          (setq first-time  nil)
          (let ((tail  (last files)))
            (if tail
                (setcdr tail (mapcar 'expand-file-name (tags-table-files)))
              (setq files  (mapcar 'expand-file-name (tags-table-files))))))))
    (let ((tail              files)     <span class="linecomment">; Remove names of non-existent or unreadable files.</span>
          (unreadable-files  ()))
      (while tail
        (if (file-readable-p (car tail))
            (setq tail  (cdr tail))
          (push (car tail) unreadable-files)
          (setcar tail (cadr tail))
          (setcdr tail (cddr tail))))
      (when unreadable-files
        (with-output-to-temp-buffer "<span class="quote">*Unreadable Files*</span>"
          (princ "<span class="quote">These missing or unreadable files were ignored:</span>") (terpri) (terpri)
          (dolist (file unreadable-files) (princ file) (terpri)))))
    (select-window (minibuffer-window))
    (select-frame-set-input-focus (selected-frame))
    (icicle-search nil nil regexp nil files)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-save-string-to-variable (askp)
  "<span class="quote">Save a string (text) to a variable.
You are prompted for the string to save.  Typically, you store a
regexp or part of a regexp in the variable.

By default, the variable is user option `icicle-input-string'.
To save to a different variable, use a prefix argument; you are then
prompted for the variable to use.

You can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-from-variable]' to insert a string from a
variable.</span>"
  (interactive "<span class="quote">P</span>")
  (let* ((enable-recursive-minibuffers  t)
         (var   (if askp
                    (intern (completing-read "<span class="quote">Variable: </span>" obarray 'boundp nil nil
                                             (if (boundp 'variable-name-history)
                                                 'variable-name-history
                                               'icicle-variable-name-history)
                                             (symbol-name 'icicle-input-string)))
                  'icicle-input-string))
         (text  (icicle-completing-read-history (format "<span class="quote">Text to save in `%s': </span>" var))))
    (set var text)))

(when (and icicle-define-alias-commands-flag (not (fboundp 'any)))
  (defalias 'any 'icicle-anything))
(when (&gt; emacs-major-version 21)
  (defun icicle-anything (type)
    "<span class="quote">Act on an object of type TYPE.
You are prompted for the type, then for an object of that type.  The
type is either the declared `type' of an Anything source, or its
`name' if it has no `type'.

This command is available only if you use library `anything.el'.

This is an Icicles multi-command: You can act on multiple objects in
multiple ways during a single command invocation.  When you choose an
object using `RET' or `mouse-2', the default action is applied to it.
The default action is also applied to the current completion candidate
when you use `C-RET', `C-mouse-2', and so on.

You can apply a different action by using an alternative action key:
`C-S-RET', `C-S-mouse-2', and so on.  This lets you choose the action
to apply using completion. You can use `C-RET', `C-mouse-2', and so
on, to perform multiple actions.

This command is intended for use only in Icicle mode.</span>"
    (interactive
     (let ((icicle-show-Completions-initially-flag  t)
           (icicle-whole-candidate-as-text-prop-p   icicle-anything-transform-candidates-flag))
       (unless (require 'anything nil t) (error "<span class="quote">You must load library `anything.el' first</span>"))
       (list (intern (completing-read "<span class="quote">What (type): </span>" (icicle-remove-duplicates
                                                       (mapcar #'list (icicle-get-anything-types)))
                                      nil t)))))
    (icicle-object-action type)))

(when (and icicle-define-alias-commands-flag (not (fboundp 'file)))
  (defun file ()
    "<span class="quote">Act on a file.  You are prompted for the file and the action.
During file-name completion, you can delete the file named by the
current candidate, using `S-delete'.

This is just `icicle-object-action' with type `file'.</span>"
    (interactive) (icicle-object-action 'file)))

(when (and icicle-define-alias-commands-flag (not (fboundp 'buffer)))
  (defun buffer ()
    "<span class="quote">Act on a buffer.  You are prompted for the buffer and the action.
During buffer-name completion, you can kill the buffer named by the
current candidate, using `S-delete'.

This is just `icicle-object-action' with type `buffer'.</span>"
    (interactive) (icicle-object-action 'buffer)))

(when (and icicle-define-alias-commands-flag (not (fboundp 'a)))
  (defalias 'a 'icicle-object-action))
(when (and icicle-define-alias-commands-flag (not (fboundp 'what-which-how)))
  (defalias 'what-which-how 'icicle-object-action))
<span class="linecomment">;;;###autoload</span>
(defun icicle-object-action (&optional type)
  "<span class="quote">Act on an object of type TYPE.
You are prompted for the type (\"What\"), then for an object of that
type (\"Which\"), then for the action function to apply to the
object (\"How\").  For Anything types (see below), you are not
prompted for the action function.

The \"type\" of an object is one of these:

a. A member of the list `icicle-object-predicate-types'.  These are
   type predicates, such as `bufferp', `keywordp', or `atom'.

b. The `type' of an Anything source, or its `name' if it has no
   `type'.  This is available only if you use library `anything.el'.

c. A member of the list `icicle-object-named-types'.

In the case of Anything types (only), this is a multi-command:
* `C-RET', `C-mouse-2', and so on perform the default action.
* `C-S-RET', `C-S-mouse-2', and so on let you choose the action using
  completion.

Though this is not a multi-command for non-Anything types `buffer' and
`file', you can use `S-delete' during completion to delete the object
\(buffer or file) named by the current completion candidate.

The objects of types (b) and (c) are easily associated with names.
Their names are the completion candidates.  So, for instance, if you
choose type `buffer', then you can act on a buffer by choosing its
name.

The objects of predicate type (type a) are not necessarily named.  The
completion candidates for these objects are symbols whose values are
the objects acted upon.  So, for instance, if you choose type
`bufferp', then you can choose a symbol whose value is a buffer, in
order to act on that buffer.  While a buffer is always named, an
object of type `stringp' is not.  The value of variable
`emacs-version' is one such string that you can act on.

Be aware that the action function you choose must accomodate the
object you choose as its only an argument.  Also, completion of the
function candidate itself is not strict, so you can enter a lambda
form.

With a prefix argument, the result of applying the function to the
object is pretty-printed using `pp-eval-expression'.  Otherwise, the
function is called for its effect only, and its value is not
displayed.

This command is intended for use only in Icicle mode.</span>"
  (interactive)
  (let* ((anything-loaded-p         (and (&gt; emacs-major-version 21) (require 'anything nil t)))
         (anything-types            (and (not type) anything-loaded-p (icicle-get-anything-types)))
         (typ
          (or type
              (let ((icicle-show-Completions-initially-flag  t))
                (intern
                 (completing-read
                  "<span class="quote">What (type): </span>"
                  (icicle-remove-duplicates (mapcar #'list (append anything-types
                                                                   icicle-object-named-types
                                                                   icicle-object-predicate-types)))
                  nil t)))))
         (predicate-type-p          (and (member (symbol-name typ) icicle-object-predicate-types)
                                         (not (memq typ anything-types))))
         (anything-candidates       (and anything-loaded-p (not predicate-type-p)
                                         (icicle-get-anything-candidates-of-type typ)))
         (anything-default-actions  (and anything-candidates
                                         (icicle-get-anything-default-actions-for-type typ)))
         (anything-actions          (and anything-candidates
                                         (icicle-get-anything-actions-for-type typ)))
         (icicle-saved-completion-candidate
          (cond (predicate-type-p (icicle-read-var-value-satisfying typ))
                (anything-candidates
                 (icicle-choose-anything-candidate typ anything-candidates
                                                   anything-default-actions anything-actions))
                ((member (symbol-name typ) (and anything-loaded-p (icicle-get-anything-types)))
                 (error "<span class="quote">No candidates for type `%s'</span>" (symbol-name typ)))
                (t
                 (icicle-choose-candidate-of-type typ))))
         (icicle-candidate-action-fn      (if anything-candidates
                                              (lambda (fn) (icicle-apply-to-saved-candidate fn t))
                                            'icicle-apply-to-saved-candidate))
         (icicle-candidate-alt-action-fn  (and anything-candidates
                                               (lambda (fn)
                                                 (icicle-apply-to-saved-candidate fn t)))))
    (if anything-candidates
        (if (null (cdr anything-default-actions))
            (funcall (cdar anything-default-actions) icicle-saved-completion-candidate)
          (funcall (let ((icicle-show-Completions-initially-flag  t))
                     (completing-read "<span class="quote">How (action): </span>" anything-default-actions nil t))
                   icicle-saved-completion-candidate))
      (icicle-apply-to-saved-candidate (completing-read "<span class="quote">How (action): </span>" obarray 'functionp)))))

(when (&gt; emacs-major-version 21)
  (defun icicle-get-anything-types ()
    "<span class="quote">Return list of types defined in `anything-sources'.  See `anything.el'.</span>"
    (and (boundp 'anything-sources) (consp anything-sources)
         (let ((types  ())
               type)
           (dolist (source (anything-get-sources))
             (if (setq type  (assoc-default 'type source))
                 (push (symbol-name type) types)
               (when (setq type  (assoc-default 'name source)) (push type types))))
           (setq types
                 (mapcar (lambda (typ)
                           (setq typ  (copy-sequence typ))
                           (put-text-property 0 (length typ) 'face 'icicle-special-candidate typ)
                           typ)
                         (icicle-remove-duplicates types)))))))

(when (&gt; emacs-major-version 21)
  (defun icicle-get-anything-candidates-of-type (type)
    "<span class="quote">Return list of Anything candidates for type TYPE.
Used only when `anything-sources' is non-nil - see `anything.el'.</span>"
    (and (boundp 'anything-sources) (consp anything-sources)
         (let ((anything-candidate-cache  ())
               (candidates                nil))
           (dolist (source (anything-get-sources))
             (let ((init-fn  (assoc-default 'init source))) (when init-fn (funcall init-fn)))
             (when (or (eq type (assoc-default 'type source))
                       (string= (symbol-name type) (assoc-default 'name source)))
               (setq candidates  (icicle-get-anything-cached-candidates source))))
           (when (and (not (functionp candidates)) (consp candidates))
             (mapcar (lambda (cand) (if (consp cand) cand (list cand))) candidates))
           candidates))))

<span class="linecomment">;; Similar to `anything-get-cached-candidates' in `anything.el', but ignores processes.</span>
<span class="linecomment">;; Free var here: `anything-candidate-cache'.</span>
(when (&gt; emacs-major-version 21)
  (defun icicle-get-anything-cached-candidates (source)
    "<span class="quote">Return cached value of candidates for Anything SOURCE.
Cache the candidates if there is not yet a cached value.</span>"
    (let* ((source-name      (assoc-default 'name source))
           (candidate-cache  (assoc source-name anything-candidate-cache))
           candidates)
      (if candidate-cache
          (setq candidates  (cdr candidate-cache))
        (setq candidates  (icicle-get-anything-candidates source))
        (when (processp candidates) (setq candidates  ()))
        (setq candidate-cache  (cons source-name candidates))
        (push candidate-cache anything-candidate-cache))
      candidates)))

(when (&gt; emacs-major-version 21)
  (defun icicle-get-anything-candidates (source)
    "<span class="quote">Return the list of candidates from Anything SOURCE.</span>"
    (let* ((candidate-source  (assoc-default 'candidates source))
           (candidates
            (cond ((functionp candidate-source)
                   `(lambda (string pred mode)
                     (let ((anything-pattern  icicle-current-input))
                       (setq string  anything-pattern)
                       (let ((all-cands  (funcall ,candidate-source)))
                         (setq all-cands
                               (icicle-remove-if-not
                                (lambda (cand)
                                  (string-match (if (eq 'prefix icicle-current-completion-mode)
                                                    (concat "<span class="quote">^</span>" (regexp-quote string))
                                                  string)
                                                cand))
                                all-cands))
                         (cond ((eq mode t) all-cands)
                               ((eq mode nil)
                                (icicle-expanded-common-match icicle-current-input all-cands))
                               ((eq mode 'lambda) t))))))
                  ((listp candidate-source) candidate-source)
                  ((and (symbolp candidate-source) (boundp candidate-source))
                   (symbol-value candidate-source))
                  (t
                   (error
                    (concat "<span class="quote">Source `candidates' value is not a function, variable or list: %s</span>")
                    candidate-source)))))
      (if (or (not icicle-anything-transform-candidates-flag) (processp candidates))
          candidates
        (anything-transform-candidates candidates source)))))

(when (&gt; emacs-major-version 21)
  (defun icicle-get-anything-actions-for-type (type)
    "<span class="quote">Set and return `icicle-candidates-alist' of actions for type TYPE.</span>"
    (setq icicle-candidates-alist  ())
    (let ((all-sources-actions  ())
          this-source-actions)
      (dolist (source (anything-get-sources))
        (when (or (eq type (assoc-default 'type source))
                  (string= (symbol-name type) (assoc-default 'name source)))
          (setq this-source-actions  (assoc-default 'action source))
          (dolist (action this-source-actions)
            (unless (memq action all-sources-actions)
              (push action all-sources-actions)))))
      (setq icicle-candidates-alist  (sort all-sources-actions
                                           (lambda (a1 a2)
                                             (funcall icicle-sort-function (car a1) (car a2))))))))
(when (&gt; emacs-major-version 21)
  (defun icicle-choose-anything-candidate (type candidates default-actions actions)
    "<span class="quote">Read an Anything object of type TYPE with completion, and return it.
During completion, you can act on selected completion candidates, in
turn, using the action keys.
CANDIDATES is the list of candidates of type TYPE.
DEFAULT-ACTIONS is the list of default actions for type TYPE.
ACTIONS is the list of all actions for type TYPE.</span>"
    (let* ((win                                         (selected-window))
           (icicle-sort-function                        nil)
           (icicle-transform-function                   nil)
           (icicle-Completions-display-min-input-chars  (icicle-get-anything-req-pat-chars type))
           (icicle-incremental-completion-delay         (icicle-get-anything-input-delay type))
           (icicle-whole-candidate-as-text-prop-p       icicle-anything-transform-candidates-flag)
           (icicle-candidates-alist
            (if (or (functionp candidates) icicle-whole-candidate-as-text-prop-p)
                candidates
              icicle-candidates-alist))
           (icicle-candidate-action-fn
            (lambda (obj)
              (when icicle-whole-candidate-as-text-prop-p
                (setq obj  (icicle-anything-candidate-value obj)))
              (let ((enable-recursive-minibuffers  t))
                (with-selected-window win
                  (if (null (cdr default-actions))
                      (funcall (cdar default-actions) obj)
                    (funcall (completing-read "<span class="quote">How (action): </span>" default-actions nil t) obj))))
              (select-window (minibuffer-window))
              (select-frame-set-input-focus (selected-frame))
              (icicle-raise-Completions-frame)))
           (icicle-candidate-alt-action-fn
            (lambda (obj)
              (when icicle-whole-candidate-as-text-prop-p
                (setq obj  (icicle-anything-candidate-value obj)))
              (let ((icicle-show-Completions-initially-flag  t)
                    (icicle-saved-completion-candidate       obj)
                    (icicle-candidates-alist                 actions)
                    (enable-recursive-minibuffers            t))
                (with-selected-window win
                  (icicle-apply-to-saved-candidate
                   (let ((enable-recursive-minibuffers      t)
                         (icicle-last-completion-candidate  icicle-last-completion-candidate)
                         (icicle-candidate-action-fn
                          (lambda (actn) (with-selected-window win
                                           (let ((enable-recursive-minibuffers t)
                                                 (icicle-candidates-alist actions))
                                             (icicle-apply-to-saved-candidate actn t)))))
                         (icicle-candidate-alt-action-fn    nil))
                     (completing-read "<span class="quote">How (action): </span>" actions nil t))
                   t)))))
           (orig-action-fn  icicle-candidate-action-fn)
           (icicle-candidate-help-fn
            (if icicle-whole-candidate-as-text-prop-p
                (lambda (obj)
                  (let ((icicle-candidate-help-fn  nil))
                    (icicle-help-on-candidate-symbol
                     (intern (icicle-anything-candidate-value obj)))))
              icicle-candidate-help-fn))
           (icicle-candidate-action-fn
            (if icicle-whole-candidate-as-text-prop-p
                (lambda (obj)
                  (let ((icicle-last-input  (icicle-anything-candidate-value obj)))
                    (funcall orig-action-fn obj)))
              icicle-candidate-action-fn)))
      (if icicle-whole-candidate-as-text-prop-p
          (icicle-anything-candidate-value
           (completing-read (concat "<span class="quote">Which (</span>" (symbol-name type) "<span class="quote">): </span>") candidates nil t))
        (completing-read (concat "<span class="quote">Which (</span>" (symbol-name type) "<span class="quote">): </span>") candidates nil t)))))

(when (&gt; emacs-major-version 21)
  (defun icicle-get-anything-req-pat-chars (type)
    "<span class="quote">Return max `required-pattern' value for sources of type TYPE.
The value returned is also always at least as big as
`icicle-Completions-display-min-input-chars'.</span>"
    (let ((req-pat              icicle-Completions-display-min-input-chars)
          (req-pat-this-source  nil))
      (dolist (source (anything-get-sources))
        (when (and (or (eq type (assoc-default 'type source))
                       (string= (symbol-name type) (assoc-default 'name source)))
                   (setq req-pat-this-source  (assoc-default 'requires-pattern source)))
          (setq req-pat  (max req-pat req-pat-this-source))))
      req-pat)))

(when (&gt; emacs-major-version 21)
  (defun icicle-get-anything-input-delay (type)
    "<span class="quote">Return max `delay' value for sources of type TYPE.
The value returned is also always at least as big as
`icicle-incremental-completion-delay'.</span>"
    (let ((delay              icicle-incremental-completion-delay)
          (delay-this-source  nil))
      (dolist (source (anything-get-sources))
        (when (and (or (eq type (assoc-default 'type source))
                       (string= (symbol-name type) (assoc-default 'name source)))
                   (setq delay-this-source  (and (assoc 'delayed source) anything-idle-delay)))
          (setq delay  (max delay delay-this-source))))
      delay)))

(when (&gt; emacs-major-version 21)
  (defun icicle-anything-candidate-value (candidate)
    "<span class="quote">Return the real value associated with string CANDIDATE.</span>"
    (or (cdr-safe (icicle-get-alist-candidate candidate)) candidate)))

(when (&gt; emacs-major-version 21)
  (defun icicle-get-anything-default-actions-for-type (type)
    "<span class="quote">Set and return `icicle-candidates-alist' of default actions for type TYPE.</span>"
    (setq icicle-candidates-alist  ())
    (let ((all-sources-actions  ())
          this-source-actions)
      (dolist (source (anything-get-sources))
        (when (or (eq type (assoc-default 'type source))
                  (string= (symbol-name type) (assoc-default 'name source)))
          (setq this-source-actions  (assoc-default 'action source))
          (unless (memq (car this-source-actions) all-sources-actions)
            (push (car this-source-actions) all-sources-actions))))
      (setq icicle-candidates-alist  (sort all-sources-actions
                                           (lambda (a1 a2)
                                             (funcall icicle-sort-function (car a1) (car a2))))))))

(defun icicle-choose-candidate-of-type (type)
  "<span class="quote">Read an object of type TYPE with completion, and return it.
These options, when non-nil, control buffer candidate matching and
filtering:
 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer must satisfy
 `icicle-buffer-sort'               - Sort function for candidates</span>"
  (case type
    (buffer
     (let ((icicle-must-match-regexp        icicle-buffer-match-regexp)
           (icicle-must-not-match-regexp    icicle-buffer-no-match-regexp)
           (icicle-must-pass-predicate      icicle-buffer-predicate)
           (icicle-extra-candidates         icicle-buffer-extras)
           (icicle-transform-function       'icicle-remove-dups-if-extras)
           (icicle-sort-function            (or icicle-buffer-sort icicle-sort-function))
           (icicle-delete-candidate-object  'icicle-kill-a-buffer) <span class="linecomment">; `S-delete' kills buffer.</span>
           (icicle-require-match-flag        icicle-buffer-require-match-flag)
           (icicle-ignore-space-prefix-flag  icicle-buffer-ignore-space-prefix-flag))
       (get-buffer-create
        (completing-read "<span class="quote">Which (buffer): </span>" (mapcar (lambda (buf) (list (buffer-name buf)))
                                                    (buffer-list))
                         nil
                         (and (fboundp 'confirm-nonexistent-file-or-buffer) <span class="linecomment">; Emacs 23.</span>
                              (confirm-nonexistent-file-or-buffer))
                         nil 'buffer-name-history nil nil))))
    (file (let ((icicle-delete-candidate-object  'icicle-delete-file-or-directory)) <span class="linecomment">; `S-delete'</span>
            (read-file-name "<span class="quote">Which (file): </span>" nil
                            (and (eq major-mode 'dired-mode)
                                 (fboundp 'dired-get-file-for-visit) <span class="linecomment">; Emacs 22+.</span>
                                 (condition-case nil <span class="linecomment">; E.g. error because not on file line (ignore)</span>
                                     (abbreviate-file-name (dired-get-file-for-visit))
                                   (error nil))))))
    (command (intern (completing-read "<span class="quote">Which (command): </span>" obarray 'commandp)))
    (face (intern (completing-read "<span class="quote">Which (face): </span>" (mapcar (lambda (x) (list (format "<span class="quote">%s</span>" x)))
                                                            (face-list)))))
    (frame (let ((frame-alist  (icicle-make-frame-alist)))
             (cdr (assoc (completing-read "<span class="quote">Which (frame): </span>" frame-alist) frame-alist))))
    (function (intern (completing-read "<span class="quote">Which (function): </span>" obarray 'fboundp)))
    (option (intern (completing-read "<span class="quote">Which (user option): </span>" obarray 'user-variable-p)))
    (process (get-process (completing-read
                           "<span class="quote">Which (process): </span>" (mapcar (lambda (proc) (list (process-name proc)))
                                                       (process-list)))))
    (symbol (intern (completing-read "<span class="quote">Which (symbol): </span>" obarray)))
    (variable (intern (completing-read "<span class="quote">Which (variable): </span>" obarray 'boundp)))
    (window (let ((buffers  ()))
              (walk-windows (lambda (win)
                              (push (list (format "<span class="quote">%s</span>" (window-buffer win))) buffers))
                            nil t)
              (get-buffer-window (completing-read "<span class="quote">Window showing buffer: </span>" buffers) 0)))
    (otherwise (error "<span class="quote">Bad object type: %S</span>" type))))

(defun icicle-read-var-value-satisfying (pred)
  "<span class="quote">Read a variable that satisfies predicate PRED and returns its value.</span>"
  (symbol-value (intern (completing-read (format "<span class="quote">Which (%s value of symbol): </span>" pred) obarray
                                         `(lambda (symb)
                                            (and (boundp symb)
                                                 (funcall #',pred (symbol-value symb))))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-customize-icicles-group ()
  "<span class="quote">Customize Icicles options and faces.  View their documentation.</span>"
  (interactive)
  (customize-group-other-window 'Icicles))

<span class="linecomment">;;;###autoload</span>
(defun icicle-send-bug-report ()
  "<span class="quote">Send a bug report about an Icicles problem.</span>"
  (interactive)
  (browse-url (format (concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=\
Icicles bug: \
&body=Describe bug below, using a precise recipe that starts with `emacs -Q' or `emacs -q'.  \
Each Icicles file has a header `Update #' that you can use to identify it.  %s.</span>")
                      (emacs-version))))
 
<span class="linecomment">;;(@* "Other top-level Icicles commands")</span>
<span class="linecomment">;;; Other top-level Icicles commands   .   .   .   .   .   .</span>

<span class="linecomment">;;;###autoload</span>
(when (fboundp 'map-keymap)             <span class="linecomment">; Emacs 22.</span>

  <span class="linecomment">;; This is a quick-and-dirty definition, not an efficient one.</span>
  <span class="linecomment">;; It gathers all key bindings and then throws most of them away!  Good enough.</span>
  (defun icicle-insert-char ()
    "<span class="quote">Insert a character, using key completion.
Keys bound to `self-insert-command' are completion candidates.</span>"
    (interactive)
    (barf-if-buffer-read-only)
    (let ((icicle-complete-keys-self-insert-flag  t)
          (icicle-must-match-regexp               "<span class="quote">^.+  =  self-insert-command</span>"))
      (icicle-complete-keys)))

  (defun icicle-complete-keys ()        <span class="linecomment">; Bound to prefix keys followed by `S-TAB' (unless defined).</span>
    "<span class="quote">Complete a key sequence for the currently invoked prefix key.
Input-candidate completion and cycling are available.

You can navigate the key-binding hierarchy (prefix-key hierarchy),
just as would navigate a file-system hierarchy (to complete directory
and file names) or a menu hierarchy (to complete submenu and menu-item
names).

Completion candidates generally have the form `KEY  =  COMMAND'.

If COMMAND is `...', then KEY is a prefix key; choosing it updates the
completion candidates list to the keys under that prefix.  For
example, choosing `C-x = ...' changes the candidates to those with
prefix `C-x'.

The special candidate `..' means to go up one level of the key-binding
hierarchy and complete candidates there.  For example, if you are
currently completing prefix key `C-x 5', and you choose candidate
`..', then you will be completing prefix `C-x', the parent of `C-x 5'.

Except at the top level, the default value for completion is `..'.

If option `icicle-complete-keys-self-insert-flag' is non-nil, then
keys bound to `self-insert-command' are included as possible
completion candidates; otherwise (the default), they are not.  Command
`icicle-insert-char' works like `icicle-complete-keys', but in
includes only keys bound to `self-insert-command' - use it to insert a
character that is difficult or impossible to type with your keyboard.

You can use `C-M-,' at any time to switch between sorting with local
bindings first and sorting with prefix keys first.  You can use `C-,'
at any time to change the sort order among these two and sorting by
command name.

While cycling, these keys describe candidates:

`C-RET'   - Describe command of current completion candidate only
`C-down'  - Move to next prefix-completion candidate and describe
`C-up'    - Move to previous prefix-completion candidate and describe
`C-next'  - Move to next apropos-completion candidate and describe
`C-prior' - Move to previous apropos-completion candidate and describe
`C-!'     - Describe *all* candidates (or all that are saved),
            successively - use the [back] button in buffer *Help* to
            visit the descriptions

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-RET', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate, or
`C-g' to quit.  This is an Icicles command - see command
`icicle-mode'.</span>"
    (interactive)
    (let* ((icicle-transform-function               'icicle-remove-duplicates)
           (icicle-show-Completions-initially-flag  t)
           (icicle-candidate-action-fn              'icicle-complete-keys-action)
           (enable-recursive-minibuffers            t)
           <span class="linecomment">;; `orig-(buff|win)-key-complete' are used free in `icicle-complete-keys-action'.</span>
           (orig-buff-key-complete                  (current-buffer))
           (orig-win-key-complete                   (selected-window))
           (icicle-completing-keys-p                t) <span class="linecomment">; Provide a condition to test key completion.</span>
           (icicle-sort-function                    'icicle-special-candidates-first-p)
           (icicle-alternative-sort-function        'icicle-prefix-keys-first-p)
           (icicle-sort-functions-alist
            <span class="linecomment">;; The first entry just gives `icicle-special-candidates-first-p' a different name.</span>
            '(("<span class="quote">by key name, local bindings first</span>" . icicle-special-candidates-first-p)
              ("<span class="quote">by key name, prefix keys first</span>" . icicle-prefix-keys-first-p)
              ("<span class="quote">by command name</span>" . icicle-command-names-alphabetic-p)
              ("<span class="quote">turned OFF</span>"))))
      (icicle-complete-keys-1 (icicle-this-command-keys-prefix))))

  (defun icicle-this-command-keys-prefix ()
    "<span class="quote">Return the prefix of the currently invoked key sequence.</span>"
    (let ((this-key  (this-command-keys))) (substring this-key 0 (1- (length this-key)))))

  <span class="linecomment">;; Free vars here: `icicle-complete-keys-alist' is bound in `icicles-var.el'.</span>
  (defun icicle-complete-keys-1 (prefix) <span class="linecomment">; PREFIX is a free var in `icicle-complete-keys-action'.</span>
    "<span class="quote">Complete a key sequence for prefix key PREFIX (a vector).</span>"
    (let ((orig-extra-cands  icicle-extra-candidates)) <span class="linecomment">; Free in `icicle-complete-keys-action'.</span>
      (unwind-protect
           (progn
             (icicle-keys+cmds-w-prefix prefix)
             (unless icicle-complete-keys-alist (error "<span class="quote">No keys for prefix `%s'</span>" prefix))
             (let* ((this-cmd-keys      <span class="linecomment">; For error report - e.g. mouse cmd.</span>
                     (this-command-keys-vector)) <span class="linecomment">; Free var in `icicle-complete-keys-action'.</span>
                    (prefix-description
                     (icicle-key-description prefix (not icicle-key-descriptions-use-&lt;&gt;-flag)))
                    (prompt  (concat "<span class="quote">Complete keys</span>" (and (not (string= "<span class="quote"></span>" prefix-description))
                                                          (concat "<span class="quote"> </span>" prefix-description))
                                     "<span class="quote">: </span>")))
               (put-text-property 0 1 'icicle-fancy-candidates t prompt)
               (icicle-complete-keys-action
                (completing-read prompt icicle-complete-keys-alist nil t nil nil
                                 <span class="linecomment">;;$$ (if (equal [] prefix) nil "\\.\\.")</span>
                                 ))))
        (mapc (lambda (cand) (put (car cand) 'icicle-special-candidate nil)) <span class="linecomment">; Reset the property.</span>
              icicle-complete-keys-alist))))

  <span class="linecomment">;; Free vars here:</span>
  <span class="linecomment">;; `orig-buff-key-complete' and `orig-win-key-complete' are bound in `icicle-complete-keys'.</span>
  <span class="linecomment">;; `prefix', `orig-extra-cands', and `this-cmd-keys' are bound in `icicle-complete-keys-1'.</span>
  (defun icicle-complete-keys-action (candidate)
    "<span class="quote">Completion action function for `icicle-complete-keys'.</span>"
    (let* ((key+binding    (cdr-safe (assq (intern candidate) icicle-complete-keys-alist)))
           (key            (car-safe key+binding))
           (binding        (cdr-safe key+binding))
           (cmd-name       nil)
           (action-window  (selected-window)))
      (unwind-protect
           (progn
             (set-buffer orig-buff-key-complete)
             (select-window orig-win-key-complete)
             (if (string= "<span class="quote">..</span>" candidate)
                 (setq cmd-name  "<span class="quote">..</span>")
               (unless (and (string-match "<span class="quote">\\(.+\\)  =  \\(.+\\)</span>" candidate) (match-beginning 2))
                 (error "<span class="quote">No match</span>"))
               (setq cmd-name  (substring candidate (match-beginning 2) (match-end 2))))
             (cond ((string= "<span class="quote">..</span>" cmd-name) <span class="linecomment">; Go back up to parent prefix.</span>
                    (setq last-command  'icicle-complete-keys)
                    (icicle-complete-keys-1 (vconcat (nbutlast (append prefix nil)))))
                   ((and key (string= "<span class="quote">...</span>" cmd-name)) <span class="linecomment">; Go down to prefix.</span>
                    (setq last-command  'icicle-complete-keys)
                    (icicle-complete-keys-1 (vconcat prefix key)))
                   (t
                    (setq this-command             binding
                          last-command             binding
                          icicle-extra-candidates  orig-extra-cands) <span class="linecomment">; Restore it.</span>
                    (when (eq 'self-insert-command binding)
                      (unless key (error "<span class="quote">Cannot insert `%s'</span>" key))
                      (setq last-command-char  (aref key 0)))
                    (when (eq 'digit-argument binding)
                      (setq last-command-char  (aref key 0))
                      (icicle-msg-maybe-in-minibuffer "<span class="quote">Numeric argument</span>"))
                    (when (eq 'negative-argument binding)
                      (icicle-msg-maybe-in-minibuffer "<span class="quote">Negative argument</span>"))
                    (setq last-nonmenu-event  1) <span class="linecomment">; So *Completions* mouse-click info is ignored.</span>
                    (condition-case try-command
                        (call-interactively binding nil this-cmd-keys)
                      (error (error (error-message-string try-command)))))))
        (select-window action-window))))

  (defun icicle-keys+cmds-w-prefix (prefix)
    "<span class="quote">Fill `icicle-complete-keys-alist' for prefix key PREFIX (a vector).</span>"
    (let ((prefix-map  nil))
      (setq icicle-complete-keys-alist  ())
      (dolist (map (current-active-maps t))
        (setq prefix-map  (lookup-key map prefix))
        <span class="linecomment">;; NOTE: `icicle-add-key+cmd' Uses `prefix' and `map' as free vars.</span>
        (when (keymapp prefix-map) (map-keymap #'icicle-add-key+cmd prefix-map)))
      (unless (equal [] prefix) (push (list '\.\.) icicle-complete-keys-alist))
      icicle-complete-keys-alist))

  <span class="linecomment">;; Free vars here: `prefix' and `map' are bound in `icicle-keys+cmds-w-prefix'.</span>
  (defun icicle-add-key+cmd (event binding)
    "<span class="quote">Add completion for EVENT and BINDING to `icicle-complete-keys-alist'.</span>"
    (cond
      <span class="linecomment">;; (menu-item ITEM-STRING): non-selectable item - skip it.</span>
      ((and (eq 'menu-item (car-safe binding))
            (null (cdr-safe (cdr-safe binding))))
       (setq binding  nil))             <span class="linecomment">; So `keymapp' test, below, fails.</span>

      <span class="linecomment">;; (ITEM-STRING): non-selectable item - skip it.</span>
      ((and (stringp (car-safe binding)) (null (cdr-safe binding)))
       (setq binding  nil))             <span class="linecomment">; So `keymapp' test, below, fails.</span>

      <span class="linecomment">;; (menu-item ITEM-STRING REAL-BINDING . PROPERTIES)</span>
      ((eq 'menu-item (car-safe binding))
       (let ((enable-condition  (memq ':enable (cdr-safe (cdr-safe (cdr-safe binding))))))
         (if (or (not enable-condition)
                 (condition-case nil    <span class="linecomment">; Don't enable if we can't check the condition.</span>
                     (eval (cadr enable-condition))
                   (error nil)))
             (setq binding  (car-safe (cdr-safe (cdr-safe binding))))
           (setq binding  nil))))

      <span class="linecomment">;; (ITEM-STRING . REAL-BINDING) or</span>
      <span class="linecomment">;; (ITEM-STRING [HELP-STRING] . REAL-BINDING) or</span>
      <span class="linecomment">;; (ITEM-STRING [HELP-STRING] (KEYBD-SHORTCUTS) . REAL-BINDING)</span>
      ((stringp (car-safe binding))
       (setq binding  (cdr binding))
       <span class="linecomment">;; Skip HELP-STRING</span>
       (when (stringp (car-safe binding)) (setq binding  (cdr binding)))
       <span class="linecomment">;; Skip (KEYBD-SHORTCUTS): cached key-equivalence data for menu items.</span>
       (when (and (consp binding) (consp (car binding))) (setq binding  (cdr binding)))))

    <span class="linecomment">;; Follow indirections to ultimate symbol naming a command.</span>
    (while (and (symbolp binding) (fboundp binding) (keymapp (symbol-function binding)))
      (setq binding  (symbol-function binding)))

    <span class="linecomment">;; `prefix' and `map' are free here, bound in `icicle-keys+cmds-w-prefix'.</span>
    (cond ((and (or (keymapp binding)
                    (and (commandp binding)
                         (equal binding (key-binding (vconcat prefix (vector event))))
                         (not (eq binding 'icicle-complete-keys))))
                (or (not (eq binding 'self-insert-command)) <span class="linecomment">; Command, keymap.</span>
                    (and icicle-complete-keys-self-insert-flag <span class="linecomment">; Insert normal char.</span>
                         (char-valid-p event))))
           (let* ((key-desc   (propertize (single-key-description
                                           event
                                           (not icicle-key-descriptions-use-&lt;&gt;-flag))
                                          'face 'icicle-candidate-part))
                  (candidate  (intern (concat key-desc "<span class="quote">  =  </span>" (if (keymapp binding)
                                                                   "<span class="quote">...</span>"
                                                                 (prin1-to-string binding))))))
             <span class="linecomment">;; Skip keys bound to `undefined'.</span>
             (unless (string= "<span class="quote">undefined</span>" (prin1-to-string binding))
               (push (cons candidate (cons (vector event) binding)) icicle-complete-keys-alist))
             (when (eq map (current-local-map)) (put candidate 'icicle-special-candidate t))))
          ((and (integerp event) (generic-char-p event) <span class="linecomment">; Insert generic char.</span>
                (eq 'self-insert-command  binding))
           (ignore))))                  <span class="linecomment">; Placeholder for future use.</span>

  <span class="linecomment">;; $$ No longer used.  Was used in `icicle-complete-keys-1'.</span>
  (defun icicle-read-single-key-description (string need-vector &optional no-angles)
    "<span class="quote">If STRING contains a space, then the vector containing the symbol named STRING.
Otherwise, call `icicle-read-kbd-macro'.
Other args are as for `icicle-read-kbd-macro'.</span>"
    (cond ((and no-angles (string-match "<span class="quote"> </span>" string)) (vector (intern string)))
          ((string-match "<span class="quote">^&lt;\\([^&gt;]* [^&gt;]*\\)&gt;</span>" string)
           (vector (intern (substring string (match-beginning 1) (match-end 1)))))
          (t (icicle-read-kbd-macro string need-vector no-angles))))

  <span class="linecomment">;; $$ No longer used.  Was used as `icicle-candidate-action-fn' in `icicle-complete-keys'.</span>
  (defun icicle-complete-keys-help (candidate)
    "<span class="quote">Describe the command associated with the current completion candidate.</span>"
    (interactive)                       <span class="linecomment">; Interactively, just describes itself.</span>
    (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
    (string-match "<span class="quote">\\(.+\\)  =  \\(.+\\)</span>" candidate)
    (let ((frame-with-focus  (selected-frame))
          (cmd               (intern-soft (substring candidate (match-beginning 2) (match-end 2)))))
      (if (not (fboundp cmd))
          (icicle-msg-maybe-in-minibuffer "<span class="quote">No help</span>")
        (describe-function cmd))
      (icicle-raise-Completions-frame)
      <span class="linecomment">;; This is a hack for MS Windows - otherwise, we can't continue to get more candidates,</span>
      <span class="linecomment">;; because the *Help* frame takes the focus away from the minibuffer frame.</span>
      <span class="linecomment">;; MS Windows always gives focus to a newly created frame - in this case, *Help*.</span>
      (let* ((help-window  (get-buffer-window "<span class="quote">*Help*</span>" 0))
             (help-frame   (and help-window (window-frame help-window))))
        (when help-frame (redirect-frame-focus help-frame frame-with-focus))))
    (message nil))                      <span class="linecomment">; Let minibuffer contents show immmediately.</span>

  (defun icicle-read-kbd-macro (start &optional end no-angles)
    "<span class="quote">Read the region as a keyboard macro definition.
The region is interpreted as spelled-out keystrokes, e.g., \"M-x abc RET\".
See documentation for `edmacro-mode' for details.
Leading/trailing \"C-x (\" and \"C-x )\" in the text are allowed and ignored.
The resulting macro is installed as the \"current\" keyboard macro.

In Lisp, may also be called with a single STRING argument in which case
the result is returned rather than being installed as the current macro.
The result will be a string if possible, otherwise an event vector.
Second argument NEED-VECTOR means to return an event vector always.

Optional argument NO-ANGLES non-nil means to expect key
descriptions not to use angle brackets (&lt;...&gt;).  For example:

 (icicle-read-kbd-macro \"&lt;mode-line&gt;\" t)   returns [mode-line]
 (icicle-read-kbd-macro  \"mode-line\"  t t) returns [mode-line]</span>"
    (interactive "<span class="quote">r</span>")
    (if (stringp start)
        (icicle-edmacro-parse-keys start end no-angles)
      (setq last-kbd-macro
            (icicle-edmacro-parse-keys (buffer-substring start end) nil no-angles))))

  (defun icicle-edmacro-parse-keys (string &optional need-vector no-angles)
    "<span class="quote">Same as `edmacro-parse-keys', but with added NO-ANGLES argument.
NO-ANGLES is the same as for `icicle-read-kbd-macro'.</span>"
    (let ((case-fold-search  nil)
          (pos               0)
          (res               []))
      (while (and (&lt; pos (length string))
                  (string-match "<span class="quote">[^ \t\n\f]+</span>" string pos))
        (let ((word   (substring string (match-beginning 0) (match-end 0)))
              (key    nil)
              (times  1))
          (setq pos  (match-end 0))
          (when (string-match "<span class="quote">\\([0-9]+\\)\\*.</span>" word)
            (setq times  (string-to-number (substring word 0 (match-end 1)))
                  word   (substring word (1+ (match-end 1)))))
          (cond ((string-match "<span class="quote">^&lt;&lt;.+&gt;&gt;$</span>" word)
                 (setq key  (vconcat (if (eq (key-binding [?\M-x])
                                             'execute-extended-command)
                                         [?\M-x]
                                       (or (car (where-is-internal
                                                 'execute-extended-command))
                                           [?\M-x]))
                                     (substring word 2 -2) "<span class="quote">\r</span>")))
                ((or (equal word "<span class="quote">REM</span>") (string-match "<span class="quote">^;;</span>" word))
                 (setq pos  (string-match "<span class="quote">$</span>" string pos)))
                ((and (string-match (if no-angles
                                        "<span class="quote">^\\(\\([ACHMsS]-\\)*\\)\\(..+\\)$</span>"
                                      "<span class="quote">^\\(\\([ACHMsS]-\\)*\\)&lt;\\(..+\\)&gt;$</span>")
                                    word)
                      (or (not no-angles)
                          (save-match-data (not (string-match "<span class="quote">^\\([ACHMsS]-.\\)+$</span>" word))))
                      (progn
                        (setq word  (concat (substring word (match-beginning 1)
                                                       (match-end 1))
                                            (substring word (match-beginning 3)
                                                       (match-end 3))))
                        (not (string-match
                              "<span class="quote">\\&lt;\\(NUL\\|RET\\|LFD\\|ESC\\|SPC\\|DEL\\)$</span>"
                              word))))
                 (setq key  (list (intern word))))
                (t
                 (let ((orig-word  word)
                       (prefix     0)
                       (bits       0))
                   (while (string-match "<span class="quote">^[ACHMsS]-.</span>" word)
                     (incf bits (cdr (assq (aref word 0)
                                           '((?A . ?\A-\^@) (?C . ?\C-\^@)
                                             (?H . ?\H-\^@) (?M . ?\M-\^@)
                                             (?s . ?\s-\^@) (?S . ?\S-\^@)))))
                     (incf prefix 2)
                     (callf substring word 2))
                   (when (string-match "<span class="quote">^\\^.$</span>" word)
                     (incf bits ?\C-\^@)
                     (incf prefix)
                     (callf substring word 1))
                   (let ((found  (assoc word '(("<span class="quote">NUL</span>" . "<span class="quote">\0</span>") ("<span class="quote">RET</span>" . "<span class="quote">\r</span>")
                                               ("<span class="quote">LFD</span>" . "<span class="quote">\n</span>") ("<span class="quote">TAB</span>" . "<span class="quote">\t</span>")
                                               ("<span class="quote">ESC</span>" . "<span class="quote">\e</span>") ("<span class="quote">SPC</span>" . "<span class="quote"> </span>")
                                               ("<span class="quote">DEL</span>" . "<span class="quote">\177</span>")))))
                     (when found (setq word  (cdr found))))
                   (when (string-match "<span class="quote">^\\\\[0-7]+$</span>" word)
                     (loop for ch across word
                           for n = 0 then (+ (* n 8) ch -48)
                           finally do (setq word  (vector n))))
                   (cond ((= bits 0)
                          (setq key  word))
                         ((and (= bits ?\M-\^@) (stringp word)
                               (string-match "<span class="quote">^-?[0-9]+$</span>" word))
                          (setq key  (loop for x across word collect (+ x bits))))
                         ((/= (length word) 1)
                          (error "<span class="quote">%s must prefix a single character, not %s</span>"
                                 (substring orig-word 0 prefix) word))
                         ((and (/= (logand bits ?\C-\^@) 0) (stringp word)
                               <span class="linecomment">;; We used to accept . and ? here,</span>
                               <span class="linecomment">;; but . is simply wrong,</span>
                               <span class="linecomment">;; and C-? is not used (we use DEL instead).</span>
                               (string-match "<span class="quote">[@-_a-z]</span>" word))
                          (setq key  (list (+ bits (- ?\C-\^@) (logand (aref word 0) 31)))))
                         (t
                          (setq key  (list (+ bits (aref word 0)))))))))
          (when key
            (loop repeat times do (callf vconcat res key)))))
      (when (and (&gt;= (length res) 4)
                 (eq (aref res 0) ?\C-x)
                 (eq (aref res 1) ?\()
                 (eq (aref res (- (length res) 2)) ?\C-x)
                 (eq (aref res (- (length res) 1)) ?\)))
        (setq res  (edmacro-subseq res 2 -2)))
      (if (and (not need-vector)
               (loop for ch across res
                     always (and (char-valid-p ch)
                                 (let ((ch2  (logand ch (lognot ?\M-\^@))))
                                   (and (&gt;= ch2 0) (&lt;= ch2 127))))))
          (concat (loop for ch across res
                        collect (if (= (logand ch ?\M-\^@) 0)
                                    ch (+ ch 128))))
        res))))

<span class="linecomment">;; See also `hexrgb-read-color' in `hexrgb.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-read-color (&optional arg prompt)
  "<span class="quote">Read a color name or hex RGB color value #RRRRGGGGBBBB.
A string value is returned.
Interactively, optional argument ARG is the prefix arg.
Optional argument PROMPT is the prompt to use (default \"Color: \").

In addition to standard color names and RGB (red, green, blue) hex
values, the following are also available as proxy color candidates,
provided `icicle-add-proxy-candidates-flag' is non-nil and library
`palette.el' or `eyedropper.el' is used.  In each case, the
corresponding color is used.

* `*copied foreground*'  - last copied foreground, if available
* `*copied background*'  - last copied background, if available
* `*mouse-2 foreground*' - foreground where you click `mouse-2'
* `*mouse-2 background*' - background where you click `mouse-2'
* `*point foreground*'   - foreground under the text cursor
* `*point background*'   - background under the text cursor

\(You can copy a color using eyedropper commands such as
`eyedrop-pick-foreground-at-mouse'.)

In addition, the names of user options (variables) whose custom type
is `color' are also proxy candidates, but with `'' as a prefix and
suffix.  So, for example, option `icicle-region-background' appears as
proxy color candidate `'icicle-region-background''.

As always, you can toggle the use of proxy candidates using `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-proxy-candidates]' in
the minibuffer.

With plain `C-u', use `hexrgb-read-color', which lets you complete a
color name or input any valid RGB hex value (without completion).

With no prefix arg, return a string with both the color name and the
RGB value, separated by `icicle-list-nth-parts-join-string'.

With a numeric prefix arg of 0 or 1, return the color name.  With any
other numeric prefix arg, return the RGB value.

In the plain `C-u' case, your input is checked to ensure that it
represents a valid color.

In all other cases:

- You can complete your input against the color name, the RGB value,
  or both.

- If you enter input without completing or cycling, the input is not
  checked: whatever is entered is returned as the string value.

From Emacs Lisp, ARG controls what is returned.  If ARG is nil,
`icicle-list-use-nth-parts' can also be used to control the behavior.

Note: Duplicate color names are removed by downcasing and removing
whitespace.  For example, \"AliceBlue\" and \"alice blue\" are both
treated as \"aliceblue\".  Otherwise, candidates with different names
but the same RGB values are not considered duplicates, so, for
example, input can match either \"darkred\" or \"red4\", which both
have RGB #8b8b00000000.  You can toggle duplicate removal at any time
using `C-$'.

During completion, candidate help (e.g. `C-M-RET') shows you the RGB
and HSV (hue, saturation, value) color components.

This command is intended only for use in Icicle mode (but it can be
used with `C-u', with Icicle mode turned off).</span>"
  (interactive "<span class="quote">P</span>")
  (unless (featurep 'hexrgb) (error "<span class="quote">`icicle-read-color' requires library `hexrgb.el'</span>"))
  (if (&lt; emacs-major-version 22)
      (require 'eyedropper nil t)
    (or (require 'palette nil t) (require 'eyedropper nil t)))
  (icicle-highlight-lighter)
  (let ((icicle-candidate-help-fn  'icicle-color-help)
        color)
    (if (consp arg)                     <span class="linecomment">; Plain `C-u': complete against color name only,</span>
        (let ((icicle-transform-function  'icicle-remove-color-duplicates))
          (setq color  (hexrgb-read-color t))) <span class="linecomment">; and be able to input any valid RGB string.</span>

      <span class="linecomment">;; Complete against name+RGB pairs, but user can enter invalid value without completing.</span>
      (let* ((completion-ignore-case     t)
             (icicle-transform-function  'icicle-remove-color-duplicates)
             (icicle-sort-functions-alist
              '(("<span class="quote">by color name</span>" . icicle-part-1-lessp)
                ("<span class="quote">by color hue</span>"  . (lambda (s1 s2) (not (icicle-color-hue-lessp s1 s2))))
                ("<span class="quote">by color purity (saturation)</span>" .
                 (lambda (s1 s2) (not (icicle-color-saturation-lessp s1 s2))))
                ("<span class="quote">by color brightness (value)</span>" .
                 (lambda (s1 s2) (not (icicle-color-value-lessp s1 s2))))
                ("<span class="quote">by amount of red</span>"   . (lambda (s1 s2) (not (icicle-color-red-lessp s1 s2))))
                ("<span class="quote">by amount of green</span>" . (lambda (s1 s2) (not (icicle-color-green-lessp s1 s2))))
                ("<span class="quote">by amount of blue</span>"  . (lambda (s1 s2) (not (icicle-color-blue-lessp s1 s2))))
                ("<span class="quote">by color rgb</span>"       . (lambda (s1 s2) (not (icicle-part-2-lessp s1 s2))))
                ("<span class="quote">turned OFF</span>")))
             <span class="linecomment">;; Make the two `*-join-string' variables the same, so past inputs are recognized.</span>
             <span class="linecomment">;; Do not use " " as the value, because color names such as "white smoke" would be</span>
             <span class="linecomment">;; split, and "smoke" would not be recognized as a color name when trying to list</span>
             <span class="linecomment">;; candidates in *Completions*.</span>
             (icicle-list-nth-parts-join-string  "<span class="quote">: </span>")
             (icicle-list-join-string            "<span class="quote">: </span>")
             (icicle-list-end-string             "<span class="quote"></span>")
             (icicle-proxy-candidate-regexp      "<span class="quote">^[*'].+[*']</span>")
             (named-colors
              (mapcar #'icicle-make-color-candidate (x-defined-colors)))
             (icicle-proxy-candidates
              (mapcar                   <span class="linecomment">; Convert multi-completions to strings.</span>
               (lambda (entry)
                 (concat (mapconcat #'identity (car entry) icicle-list-join-string)
                         icicle-list-end-string))
               (append
                (and (fboundp 'eyedrop-foreground-at-point)
                     (append
                      (and eyedrop-picked-foreground <span class="linecomment">; Multi-completions.</span>
                           `(,(icicle-make-color-candidate
                               "<span class="quote">*copied foreground*</span>" (downcase (hexrgb-color-name-to-hex
                                                                eyedrop-picked-foreground)))))
                      (and eyedrop-picked-background
                           `(,(icicle-make-color-candidate
                               "<span class="quote">*copied background*</span>" (downcase (hexrgb-color-name-to-hex
                                                                eyedrop-picked-background)))))
                      `(,(icicle-make-color-candidate
                          "<span class="quote">*point foreground*</span>" (downcase (hexrgb-color-name-to-hex
                                                          (eyedrop-foreground-at-point))))
                        ,(icicle-make-color-candidate
                          "<span class="quote">*point background*</span>" (downcase (hexrgb-color-name-to-hex
                                                          (eyedrop-background-at-point)))))
                      '((("<span class="quote">*mouse-2 foreground*</span>")) (("<span class="quote">*mouse-2 background*</span>")))))
                (let ((ipc  ()))
                  (mapatoms
                   (lambda (cand)
                     (when (and (user-variable-p cand)
                                (icicle-var-is-of-type-p cand '(color))
                                <span class="linecomment">;; This shouldn't be necessary, but type `color' isn't</span>
                                <span class="linecomment">;; enforced - it just means `string' (so far).</span>
                                (x-color-defined-p (symbol-value cand)))
                       (push `,(icicle-make-color-candidate
                                (concat "<span class="quote">'</span>" (symbol-name cand) "<span class="quote">'</span>")
                                (downcase (hexrgb-color-name-to-hex (symbol-value cand))))
                             ipc))))
                  ipc))))
             (icicle-list-use-nth-parts
              (or (and arg (list arg))  <span class="linecomment">; 1 or 2, by program or via `C-1' or `C-2'.</span>
                  icicle-list-use-nth-parts <span class="linecomment">; Bound externally by program.</span>
                  '(1 2)))              <span class="linecomment">; Both parts, by default.</span>
             (mouse-pseudo-color-p  nil))
        (setq prompt  (or prompt "<span class="quote">Color: </span>"))
        (put-text-property 0 1 'icicle-fancy-candidates t prompt)
        (setq color  (icicle-transform-multi-completion (completing-read prompt named-colors)))
        (when (fboundp 'eyedrop-foreground-at-point)
          (cond ((string-match "<span class="quote">^\*mouse-2 foreground\*</span>" color)
                 (setq color  (prog1 (eyedrop-foreground-at-mouse
                                      (read-event
                                       "<span class="quote">Click `mouse-2' anywhere to choose foreground color</span>"))
                                (read-event)) <span class="linecomment">; Discard mouse up event.</span>
                       mouse-pseudo-color-p  t))
                ((string-match "<span class="quote">^\*mouse-2 background\*</span>" color)
                 (setq color  (prog1 (eyedrop-background-at-mouse
                                      (read-event
                                       "<span class="quote">Click `mouse-2' anywhere to choose background color</span>"))
                                (read-event)) <span class="linecomment">; Discard mouse up event.</span>
                       mouse-pseudo-color-p  t))))
        (when mouse-pseudo-color-p
          (let ((icicle-list-nth-parts-join-string  "<span class="quote">: </span>")
                (icicle-list-join-string            "<span class="quote">: </span>")
                (icicle-list-end-string             "<span class="quote"></span>")
                (icicle-list-use-nth-parts
                 (or (and arg (list arg)) <span class="linecomment">; 1 or 2, by program or via `C-1' or `C-2'.</span>
                     icicle-list-use-nth-parts <span class="linecomment">; Bound externally by program.</span>
                     '(1 2))))          <span class="linecomment">; Both parts, by default.</span>
            (setq color  (icicle-transform-multi-completion
                          (concat color "<span class="quote">: </span>" (hexrgb-color-name-to-hex color))))))))
    (when (interactive-p) (message "<span class="quote">Color: `%s'</span>" color))
    color))

(defun icicle-make-color-candidate (color-name &optional hex-rgb)
  "<span class="quote">Return multi-completion candidate of COLOR-NAME and its hex RGB string.
If `icicle-WYSIWYG-Completions-flag' is non-nil, then the hex RGB
string has the color as its background text property.
Optional arg HEX-RGB is the hex RGB string.
If nil, then COLOR-NAME is used to determine the hex RGB string.</span>"
  (unless (featurep 'hexrgb) (error "<span class="quote">`icicle-make-color-candidate' requires library `hexrgb.el'</span>"))
  (let ((rgb-string  (or hex-rgb (hexrgb-color-name-to-hex color-name))))
    (when icicle-WYSIWYG-Completions-flag
      (put-text-property 0 (length rgb-string) 'face (cons 'background-color rgb-string)
                         rgb-string))
    (list (list color-name rgb-string))))

(defun icicle-remove-color-duplicates (list)
  "<span class="quote">Copy of LIST with duplicate color candidates removed.
Candidates are considered duplicates if they have the same color name,
abstracting from whitespace and letter case.</span>"
  (let ((tail  list)
        new)
    (save-match-data
      (while tail
        (let* ((this            (car tail))
               (pseudo-color-p  (string-match "<span class="quote">^\*</span>" this)))
          (string-match "<span class="quote">: </span>" this)
          (unless pseudo-color-p
            (setq this  (icicle-delete-whitespace-from-string
                         (downcase this) 0 (match-beginning 0))))
          (unless (member this new) (push this new)))
        (pop tail)))
    (nreverse new)))

(defun icicle-color-help (color)
  "<span class="quote">Display help on COLOR.</span>"
  (unless (featurep 'hexrgb) (error "<span class="quote">`icicle-color-help' requires library `hexrgb.el'</span>"))
  (let ((icicle-list-use-nth-parts  '(1 2)))
    (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
      (princ (format "<span class="quote">Color: %s</span>" (icicle-transform-multi-completion color))) (terpri) (terpri)
      (setq icicle-list-use-nth-parts  '(2)
            color                      (icicle-transform-multi-completion color))
      (let* ((rgb  (hexrgb-hex-to-rgb color))
             (hsv  (apply #'hexrgb-rgb-to-hsv rgb)))
        (princ "<span class="quote">RGB:</span>") (mapcar (lambda (component) (princ (format "<span class="quote">  %.18f</span>" component))) rgb)
        (terpri) (terpri)
        (princ "<span class="quote">HSV:</span>") (mapcar (lambda (component) (princ (format "<span class="quote">  %.18f</span>" component))) hsv)))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-cmd)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-cmd.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icicles-cmd.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-cmd.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icicles-cmd.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icicles-cmd.el">Administration</a></span><span class="time"><br /> Last edited 2009-02-28 20:23 UTC by <a class="author" title="from inet-bc01-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icicles-cmd.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
