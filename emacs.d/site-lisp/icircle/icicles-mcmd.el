<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icicles-mcmd.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-mcmd.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icicles-mcmd.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-mcmd.el" />
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
      title="Changes for icicles-mcmd.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-mcmd.el" /><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icicles-mcmd.el%22">icicles-mcmd.el</a></h1></div><div class="wrapper"><div class="content browse"><p><a href="http://www.emacswiki.org/emacs/download/icicles-mcmd.el">Download</a></p><pre class="code"><span class="linecomment">;;; icicles-mcmd.el --- Minibuffer commands for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-mcmd.el</span>
<span class="linecomment">;; Description: Minibuffer commands for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2009, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:25:04 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Mon Feb 23 16:33:07 2009 (-0800)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 13666</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-mcmd.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `apropos', `apropos-fn+var', `cl', `color-theme', `cus-face',</span>
<span class="linecomment">;;   `doremi', `easymenu', `ffap', `ffap-', `hexrgb', `icicles-fn',</span>
<span class="linecomment">;;   `icicles-mac', `icicles-opt', `icicles-var', `kmacro',</span>
<span class="linecomment">;;   `levenshtein', `mwheel', `pp', `pp+', `ring', `ring+',</span>
<span class="linecomment">;;   `subr-21', `thingatpt', `thingatpt+', `wid-edit', `wid-edit+',</span>
<span class="linecomment">;;   `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  commands to be used mainly in the minibuffer or buffer</span>
<span class="linecomment">;;  *Completions* (and a few non-interactive functions used in those</span>
<span class="linecomment">;;  commands).  For top-level commands, see `icicles-cmd.el'.  For</span>
<span class="linecomment">;;  Icicles documentation, see `icicles.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-abort-recursive-edit', `icicle-add-file-to-fileset',</span>
<span class="linecomment">;;    `icicle-add/update-saved-completion-set',</span>
<span class="linecomment">;;    `icicle-all-candidates-action',</span>
<span class="linecomment">;;    `icicle-all-candidates-alt-action',</span>
<span class="linecomment">;;    `icicle-all-candidates-list-action',</span>
<span class="linecomment">;;    `icicle-all-candidates-list-alt-action',</span>
<span class="linecomment">;;    `icicle-apropos-complete', `icicle-apropos-complete-and-exit',</span>
<span class="linecomment">;;    `icicle-apropos-complete-and-narrow',</span>
<span class="linecomment">;;    `icicle-apropos-complete-and-widen',</span>
<span class="linecomment">;;    `icicle-apropos-complete-no-display',</span>
<span class="linecomment">;;    `icicle-backward-delete-char-untabify',</span>
<span class="linecomment">;;    `icicle-backward-kill-paragraph',</span>
<span class="linecomment">;;    `icicle-backward-kill-sentence', `icicle-backward-kill-sexp',</span>
<span class="linecomment">;;    `icicle-backward-kill-word', `icicle-beginning-of-line+',</span>
<span class="linecomment">;;    `icicle-candidate-action', `icicle-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-candidate-read-fn-invoke',</span>
<span class="linecomment">;;    `icicle-candidate-set-complement',</span>
<span class="linecomment">;;    `icicle-candidate-set-define',</span>
<span class="linecomment">;;    `icicle-candidate-set-difference',</span>
<span class="linecomment">;;    `icicle-candidate-set-intersection',</span>
<span class="linecomment">;;    `icicle-candidate-set-retrieve',</span>
<span class="linecomment">;;    `icicle-candidate-set-retrieve-from-variable',</span>
<span class="linecomment">;;    `icicle-candidate-set-retrieve-more',</span>
<span class="linecomment">;;    `icicle-candidate-set-retrieve-persistent',</span>
<span class="linecomment">;;    `icicle-candidate-set-save', `icicle-candidate-set-save-more',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-more-selected',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-persistently',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-selected',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-to-variable',</span>
<span class="linecomment">;;    `icicle-candidate-set-swap', `icicle-candidate-set-truncate',</span>
<span class="linecomment">;;    `icicle-candidate-set-union',</span>
<span class="linecomment">;;    `icicle-change-alternative-sort-order',</span>
<span class="linecomment">;;    `icicle-change-sort-order', `icicle-choose-completion',</span>
<span class="linecomment">;;    `icicle-Completions-mouse-3-menu',</span>
<span class="linecomment">;;    `icicle-delete-backward-char', `icicle-delete-candidate-object',</span>
<span class="linecomment">;;    `icicle-delete-char', `icicle-delete-windows-on',</span>
<span class="linecomment">;;    `icicle-describe-file', `icicle-digit-argument',</span>
<span class="linecomment">;;    `icicle-dispatch-C-^', `icicle-dispatch-C-.',</span>
<span class="linecomment">;;    `icicle-dispatch-C-comma', `icicle-dispatch-M-comma',</span>
<span class="linecomment">;;    `icicle-dispatch-M-q', `icicle-doremi-candidate-width-factor',</span>
<span class="linecomment">;;    `icicle-doremi-inter-candidates-min-spaces',</span>
<span class="linecomment">;;    `icicle-end-of-line+', `icicle-erase-minibuffer',</span>
<span class="linecomment">;;    `icicle-erase-minibuffer-or-history-element',</span>
<span class="linecomment">;;    `icicle-exit-minibuffer', `icicle-goto/kill-failed-input',</span>
<span class="linecomment">;;    `icicle-help-on-candidate',</span>
<span class="linecomment">;;    `icicle-help-on-next-apropos-candidate',</span>
<span class="linecomment">;;    `icicle-help-on-next-prefix-candidate',</span>
<span class="linecomment">;;    `icicle-help-on-previous-apropos-candidate',</span>
<span class="linecomment">;;    `icicle-help-on-previous-prefix-candidate',</span>
<span class="linecomment">;;    `icicle-help-string-completion',</span>
<span class="linecomment">;;    `icicle-help-string-non-completion', `icicle-history',</span>
<span class="linecomment">;;    `icicle-insert-completion', `icicle-insert-history-element',</span>
<span class="linecomment">;;    `icicle-insert-key-description',</span>
<span class="linecomment">;;    `icicle-insert-list-join-string',</span>
<span class="linecomment">;;    `icicle-insert-newline-in-minibuffer',</span>
<span class="linecomment">;;    `icicle-insert-string-at-point',</span>
<span class="linecomment">;;    `icicle-insert-string-from-variable', `icicle-isearch-complete',</span>
<span class="linecomment">;;    `icicle-keep-only-past-inputs', `icicle-kill-line',</span>
<span class="linecomment">;;    `icicle-kill-paragraph', `icicle-kill-region',</span>
<span class="linecomment">;;    `icicle-kill-region-wimpy', `icicle-kill-sentence',</span>
<span class="linecomment">;;    `icicle-kill-sexp', `icicle-kill-word',</span>
<span class="linecomment">;;    `icicle-minibuffer-complete-and-exit', `icicle-minibuffer-help',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-action',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-read-fn-invoke',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-set-save',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-set-save-more',</span>
<span class="linecomment">;;    `icicle-mouse-choose-completion',</span>
<span class="linecomment">;;    `icicle-mouse-help-on-candidate',</span>
<span class="linecomment">;;    `icicle-mouse-remove-candidate',</span>
<span class="linecomment">;;    `icicle-mouse-save/unsave-candidate',</span>
<span class="linecomment">;;    `icicle-mouse-save-then-kill', `icicle-mouse-yank-secondary',</span>
<span class="linecomment">;;    `icicle-move-to-next-completion',</span>
<span class="linecomment">;;    `icicle-move-to-previous-completion',</span>
<span class="linecomment">;;    `icicle-narrow-candidates',</span>
<span class="linecomment">;;    `icicle-narrow-candidates-with-predicate',</span>
<span class="linecomment">;;    `icicle-negative-argument', `icicle-next-apropos-candidate',</span>
<span class="linecomment">;;    `icicle-next-apropos-candidate-action',</span>
<span class="linecomment">;;    `icicle-next-apropos-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-next-apropos-match-function',</span>
<span class="linecomment">;;    `icicle-next-candidate-per-mode',</span>
<span class="linecomment">;;    `icicle-next-candidate-per-mode-action',</span>
<span class="linecomment">;;    `icicle-next-history-element', `icicle-next-line',</span>
<span class="linecomment">;;    `icicle-next-prefix-candidate',</span>
<span class="linecomment">;;    `icicle-next-prefix-candidate-action',</span>
<span class="linecomment">;;    `icicle-next-prefix-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-pp-eval-expression-in-minibuffer',</span>
<span class="linecomment">;;    `icicle-prefix-complete', `icicle-prefix-complete-no-display',</span>
<span class="linecomment">;;    `icicle-prefix-word-complete',</span>
<span class="linecomment">;;    `icicle-previous-apropos-candidate',</span>
<span class="linecomment">;;    `icicle-previous-apropos-candidate-action',</span>
<span class="linecomment">;;    `icicle-previous-apropos-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-previous-candidate-per-mode',</span>
<span class="linecomment">;;    `icicle-previous-candidate-per-mode-action',</span>
<span class="linecomment">;;    `icicle-previous-line', `icicle-previous-prefix-candidate',</span>
<span class="linecomment">;;    `icicle-previous-prefix-candidate-action',</span>
<span class="linecomment">;;    `icicle-previous-prefix-candidate-alt-action',</span>
<span class="linecomment">;;    `icicle-regexp-quote-input', `icicle-remove-candidate',</span>
<span class="linecomment">;;    `icicle-remove-Completions-window',</span>
<span class="linecomment">;;    `icicle-retrieve-last-input', `icicle-retrieve-next-input',</span>
<span class="linecomment">;;    `icicle-retrieve-previous-input', `icicle-reverse-sort-order',</span>
<span class="linecomment">;;    `icicle-save-predicate-to-variable',</span>
<span class="linecomment">;;    `icicle-save/unsave-candidate', `icicle-scroll-Completions',</span>
<span class="linecomment">;;    `icicle-scroll-Completions-up',</span>
<span class="linecomment">;;    `icicle-search-define-replacement', `icicle-self-insert',</span>
<span class="linecomment">;;    `icicle-sort-alphabetical', `icicle-sort-by-abbrev-frequency',</span>
<span class="linecomment">;;    `icicle-sort-by-directories-last',</span>
<span class="linecomment">;;    `icicle-sort-by-last-file-modification-time',</span>
<span class="linecomment">;;    `icicle-sort-by-last-use',</span>
<span class="linecomment">;;    `icicle-sort-by-previous-use-alphabetically',</span>
<span class="linecomment">;;    `icicle-sort-by-2nd-parts-alphabetically',</span>
<span class="linecomment">;;    `icicle-sort-case-insensitive',</span>
<span class="linecomment">;;    `icicle-sort-extra-candidates-first',</span>
<span class="linecomment">;;    `icicle-sort-proxy-candidates-first',</span>
<span class="linecomment">;;    `icicle-sort-special-candidates-first',</span>
<span class="linecomment">;;    `icicle-sort-turned-OFF', `icicle-switch-to-Completions-buf',</span>
<span class="linecomment">;;    `icicle-switch-to-completions',</span>
<span class="linecomment">;;    `icicle-switch-to/from-minibuffer',</span>
<span class="linecomment">;;    `icicle-toggle-~-for-home-dir',</span>
<span class="linecomment">;;    `icicle-toggle-alternative-sorting',</span>
<span class="linecomment">;;    `icicle-toggle-angle-brackets',</span>
<span class="linecomment">;;    `icicle-toggle-apropos-match-function',</span>
<span class="linecomment">;;    `icicle-toggle-case-sensitivity', `icicle-toggle-C-for-actions',</span>
<span class="linecomment">;;    `icicle-toggle-expand-to-common-match',</span>
<span class="linecomment">;;    `icicle-toggle-fuzzy-completion',</span>
<span class="linecomment">;;    `icicle-toggle-hiding-common-match',</span>
<span class="linecomment">;;    `icicle-toggle-highlight-all-current',</span>
<span class="linecomment">;;    `icicle-toggle-highlight-historical-candidates',</span>
<span class="linecomment">;;    `icicle-toggle-ignored-extensions',</span>
<span class="linecomment">;;    `icicle-toggle-ignored-space-prefix',</span>
<span class="linecomment">;;    `icicle-toggle-incremental-completion',</span>
<span class="linecomment">;;    `icicle-toggle-literal-replacement',</span>
<span class="linecomment">;;    `icicle-toggle-proxy-candidates', `icicle-toggle-regexp-quote',</span>
<span class="linecomment">;;    `icicle-toggle-remote-file-testing',</span>
<span class="linecomment">;;    `icicle-toggle-search-cleanup',</span>
<span class="linecomment">;;    `icicle-toggle-search-replace-common-match',</span>
<span class="linecomment">;;    `icicle-toggle-search-replace-whole',</span>
<span class="linecomment">;;    `icicle-toggle-search-whole-word', `icicle-toggle-sorting',</span>
<span class="linecomment">;;    `icicle-toggle-transforming',</span>
<span class="linecomment">;;    `icicle-toggle-WYSIWYG-Completions', `icicle-transpose-chars',</span>
<span class="linecomment">;;    `icicle-transpose-sexps', `icicle-transpose-words',</span>
<span class="linecomment">;;    `icicle-universal-argument', `icicle-universal-argument-minus',</span>
<span class="linecomment">;;    `icicle-universal-argument-more',</span>
<span class="linecomment">;;    `icicle-universal-argument-other-key', `icicle-up-directory',</span>
<span class="linecomment">;;    `icicle-widen-candidates', `icicle-yank', `icicle-yank-pop',</span>
<span class="linecomment">;;    `icicle-yank-secondary', `old-choose-completion',</span>
<span class="linecomment">;;    `old-exit-minibuffer', `old-minibuffer-complete-and-exit',</span>
<span class="linecomment">;;    `old-switch-to-completions', `toggle-icicle-~-for-home-dir',</span>
<span class="linecomment">;;    `toggle-icicle-alternative-sorting',</span>
<span class="linecomment">;;    `toggle-icicle-apropos-match-function',</span>
<span class="linecomment">;;    `toggle-icicle-angle-brackets',</span>
<span class="linecomment">;;    `toggle-icicle-case-sensitivity', `toggle-icicle-C-for-actions',</span>
<span class="linecomment">;;    `toggle-icicle-expand-to-common-match',</span>
<span class="linecomment">;;    `toggle-icicle-fuzzy-completion',</span>
<span class="linecomment">;;    `toggle-icicle-highlight-all-current',</span>
<span class="linecomment">;;    `toggle-icicle-highlight-historical-candidates',</span>
<span class="linecomment">;;    `toggle-icicle-ignored-extensions',</span>
<span class="linecomment">;;    `toggle-icicle-ignored-space-prefix',</span>
<span class="linecomment">;;    `toggle-icicle-incremental-completion',</span>
<span class="linecomment">;;    `toggle-icicle-literal-replacement',</span>
<span class="linecomment">;;    `toggle-icicle-proxy-candidates', `toggle-icicle-regexp-quote',</span>
<span class="linecomment">;;    `toggle-icicle-remote-file-testing',</span>
<span class="linecomment">;;    `toggle-icicle-search-cleanup',</span>
<span class="linecomment">;;    `toggle-icicle-search-replace-common-match',</span>
<span class="linecomment">;;    `toggle-icicle-search-replace-whole',</span>
<span class="linecomment">;;    `toggle-icicle-search-whole-word', `toggle-icicle-sorting',</span>
<span class="linecomment">;;    `toggle-icicle-transforming',</span>
<span class="linecomment">;;    `toggle-icicle-WYSIWYG-Completions'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-all-candidates-action-1',</span>
<span class="linecomment">;;    `icicle-apply-to-saved-candidate', `icicle-apropos-complete-1',</span>
<span class="linecomment">;;    `icicle-delete-current-candidate-object',</span>
<span class="linecomment">;;    `icicle-candidate-action-1', `icicle-candidate-set-retrieve-1',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-1',</span>
<span class="linecomment">;;    `icicle-candidate-set-save-selected-1',</span>
<span class="linecomment">;;    `icicle-current-completion-in-Completions',</span>
<span class="linecomment">;;    `icicle-current-sort-functions', `icicle-current-sort-order',</span>
<span class="linecomment">;;    `icicle-delete-candidate-object-1',</span>
<span class="linecomment">;;    `icicle-ensure-overriding-map-is-bound',</span>
<span class="linecomment">;;    `icicle-help-on-candidate-symbol', `icicle-insert-input',</span>
<span class="linecomment">;;    `icicle-insert-thing', `icicle-markers-to-readable',</span>
<span class="linecomment">;;    `icicle-maybe-multi-completion-completing-p',</span>
<span class="linecomment">;;    `icicle-mouse-candidate-action-1',</span>
<span class="linecomment">;;    `icicle-nb-of-candidate-in-Completions',</span>
<span class="linecomment">;;    `icicle-prefix-complete-1', `icicle-raise-Completions-frame',</span>
<span class="linecomment">;;    `icicle-remove-cand-from-lists',</span>
<span class="linecomment">;;    `icicle-remove-candidate-display-others',</span>
<span class="linecomment">;;    `icicle-replace-input-w-parent-dir',</span>
<span class="linecomment">;;    `icicle-retrieve-candidates-from-set', `icicle-signum',</span>
<span class="linecomment">;;    `icicle-successive-action', `icicle-transform-sole-candidate',</span>
<span class="linecomment">;;    `icicle-upcase-if-ignore-case', `icicle-update-and-next'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Internal variables defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `overriding-map-is-bound', `saved-overriding-map'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: These EMACS PRIMITIVES have been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `exit-minibuffer'              - Remove *Completion* window and</span>
<span class="linecomment">;;                                   input mismatch highlighting</span>
<span class="linecomment">;;  `minibuffer-complete-and-exit' - Use Icicles prefix completion</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following function defined in `mouse.el' has</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `choose-completion'       - Don't iconify frame or bury buffer.</span>
<span class="linecomment">;;  `mouse-choose-completion' - Return the number of the completion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following function defined in `simple.el' has</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `switch-to-completions' - Always selects *Completions* window.</span>
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
<span class="linecomment">;;  (@&gt; "Redefined standard commands")</span>
<span class="linecomment">;;  (@&gt; "Icicles commands")</span>
<span class="linecomment">;;    (@&gt; "Minibuffer editing commands")</span>
<span class="linecomment">;;    (@&gt; "Commands to sort completion candidates")</span>
<span class="linecomment">;;    (@&gt; "Other commands to be used mainly in the minibuffer")</span>
 
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

(eval-when-compile (require 'cl)) <span class="linecomment">;; flet (plus for Emacs &lt; 20, when, unless)</span>

(unless (fboundp 'replace-regexp-in-string) (require 'subr-21 nil t))

(require 'icicles-mac) <span class="linecomment">;; icicle-define-sort-command</span>
(require 'icicles-var)
  <span class="linecomment">;; lacarte-menu-items-alist, icicle-candidate-action-fn, icicle-candidate-nb,</span>
  <span class="linecomment">;; icicle-complete-keys-alist, icicle-completion-candidates, </span>
  <span class="linecomment">;; icicle-current-completion-candidate-overlay, icicle-current-completion-mode,</span>
  <span class="linecomment">;; icicle-current-input, icicle-current-raw-input, icicle-default-directory,</span>
  <span class="linecomment">;; icicle-default-thing-insertion-flipped-p, icicle-edit-update-p, icicle-general-help-string,</span>
  <span class="linecomment">;; icicle-ignored-extensions, icicle-ignored-extensions-regexp, icicle-incremental-completion-p,</span>
  <span class="linecomment">;; icicle-insert-string-at-pt-end, `icicle-insert-string-at-pt-start,</span>
  <span class="linecomment">;; icicle-last-completion-candidate, icicle-last-completion-command, icicle-last-input,</span>
  <span class="linecomment">;; icicle-last-sort-function, icicle-last-transform-function, </span>
  <span class="linecomment">;; icicle-nb-of-other-cycle-candidates, icicle-pre-minibuffer-buffer,</span>
  <span class="linecomment">;; icicle-saved-candidates-variables-obarray, icicle-saved-completion-candidates,</span>
  <span class="linecomment">;; icicle-saved-ignored-extensions, icicle-successive-grab-count, icicle-thing-at-pt-fns-pointer,</span>
  <span class="linecomment">;; icicle-universal-argument-map, icicle-variable-name-history</span>
(require 'icicles-opt)
  <span class="linecomment">;; icicle-alternative-sort-function, icicle-Completions-frame-at-right-flag,</span>
  <span class="linecomment">;; icicle-cycling-respects-completion-mode, icicle-default-thing-insertion,</span>
  <span class="linecomment">;; icicle-expand-input-to-common-match-flag, icicle-ignore-space-prefix-flag,</span>
  <span class="linecomment">;; icicle-incremental-completion-flag, icicle-input-string, icicle-key-descriptions-use-&lt;&gt;-flag,</span>
  <span class="linecomment">;; icicle-regexp-quote-flag, icicle-saved-completion-sets,</span>
  <span class="linecomment">;; icicle-search-cleanup-flag, icicle-search-highlight-all-current-flag, icicle-sort-function,</span>
  <span class="linecomment">;; icicle-TAB-shows-candidates-flag, icicle-thing-at-point-functions, icicle-transform-function</span>
(require 'icicles-fn) <span class="linecomment">;; icicle-assoc-delete-all, icicle-get-alist-candidate,</span>
                      <span class="linecomment">;; icicle-isearch-complete-past-string, icicle-minibuf-input-sans-dir</span>

(require 'pp+ nil t) <span class="linecomment">;; (no error if not found): pp-eval-expression</span>
(require 'doremi nil t) <span class="linecomment">;; (no error if not found):</span>
                        <span class="linecomment">;; doremi, doremi(-boost)-(up|down)-key, doremi-limit, doremi-wrap</span>

(eval-when-compile (require 'fit-frame nil t)) <span class="linecomment">;; (no error if not found): fit-frame</span>
(eval-when-compile
 (when (&gt; emacs-major-version 21) (require 'linkd nil t))) <span class="linecomment">;; (no error if not found): linkd-mode</span>

<span class="linecomment">;; Byte-compiling this file, you will likely get some byte-compiler warning messages.</span>
<span class="linecomment">;; These are probably benign - ignore them.  Icicles is designed to work with multiple</span>
<span class="linecomment">;; versions of Emacs, and that fact provokes compiler warnings.  If you get byte-compiler</span>
<span class="linecomment">;; errors (not warnings), then please report a bug, using `M-x icicle-send-bug-report'.</span>

<span class="linecomment">;; Some defvars to quiet byte-compiler a bit:</span>

(when (&lt; emacs-major-version 22)
  (defvar overriding-map-is-bound)
  (defvar read-file-name-completion-ignore-case)
  (defvar read-file-name-predicate)
  (defvar saved-overriding-map))

(defvar filesets-data)                  <span class="linecomment">; Defined in `filesets.el'.</span>
(defvar minibuffer-confirm-exit-commands) <span class="linecomment">; Defined in `minibuffer.el' in Emacs 23+.</span>
(defvar icicle-complete-keys-alist)     <span class="linecomment">; Defined in `icicles-var.el' for Emacs 22+.</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
 
<span class="linecomment">;;(@* "Redefined standard commands")</span>

<span class="linecomment">;;; Redefined standard commands --------------------------------------</span>


<span class="linecomment">;; REPLACE ORIGINAL `next-history-element' in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Selects minibuffer contents and leaves point at its beginning.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-next-history-element)
(fset 'old-next-history-element (symbol-function 'next-history-element)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-history-element (arg) <span class="linecomment">; Bound to `M-n' in the minibuffer.</span>
  "<span class="quote">Insert the next element of the minibuffer history in the minibuffer.
With argument N, it uses the Nth following element.</span>"
  (interactive "<span class="quote">p</span>")
  (old-next-history-element (prefix-numeric-value arg))
  (when (and icicle-mode (memq icicle-default-value '(preselect-start preselect-end)))
    (icicle-select-minibuffer-contents)
    (setq deactivate-mark  nil)))


<span class="linecomment">;; REPLACE ORIGINAL `exit-minibuffer' (built-in function),</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Remove input mismatch highlighting.</span>
<span class="linecomment">;; Remove *Completion* window.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-exit-minibuffer)
(fset 'old-exit-minibuffer (symbol-function 'exit-minibuffer)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-exit-minibuffer ()        <span class="linecomment">; Bound to `C-m' (`RET') in the minibuffer.</span>
  "<span class="quote">Terminate this minibuffer argument.
Remove *Completions* window.  Remove Icicles minibuffer faces.</span>"
  <span class="linecomment">;; This removal lets users retrieve candidates that have other faces, and saves input-history space.</span>
  (interactive)
  (let ((pos                (icicle-minibuffer-prompt-end))
        (icy-minibuf-faces  '(icicle-input-completion-fail  icicle-input-completion-fail-lax
                              icicle-whitespace-highlight   icicle-match-highlight-minibuffer
                              icicle-complete-input))
        (keep-faces         ()))
    (while (&lt; pos (point-max))
      (let ((faces  (get-text-property pos 'face)))
        (when (or (and (consp faces) (cdr faces) (atom (cdr faces))) <span class="linecomment">; (background-color . "abc")</span>
                  (and faces (atom faces))) <span class="linecomment">; face name</span>
          (setq faces  (list faces)))   <span class="linecomment">; No-op: (foo (background-color . "abc") (:foreground "abc"))</span>
        (setq keep-faces  (icicle-set-union keep-faces
                                            (icicle-set-difference faces icy-minibuf-faces))))
      (setq pos  (1+ pos)))
    (when keep-faces                    <span class="linecomment">; Don't add a nil `face' property.</span>
      (put-text-property (icicle-minibuffer-prompt-end) (point-max) 'face keep-faces)))
  <span class="linecomment">;; $$$$$  (let ((pos  (icicle-minibuffer-prompt-end)))</span>
  <span class="linecomment">;;     (while (&lt; pos (point-max))</span>
  <span class="linecomment">;;       (when (memq (get-text-property pos 'face)</span>
  <span class="linecomment">;;                   '(icicle-input-completion-fail icicle-input-completion-fail-lax))</span>
  <span class="linecomment">;;         (remove-text-properties pos (point-max) '(face))</span>
  <span class="linecomment">;;         (setq pos  (point-max)))</span>
  <span class="linecomment">;;       (setq pos  (1+ pos))))</span>
  (icicle-remove-Completions-window)
  (old-exit-minibuffer))


<span class="linecomment">;; REPLACE ORIGINAL `minibuffer-complete-and-exit' (built-in function),</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Use Icicles completion.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-minibuffer-complete-and-exit)
(fset 'old-minibuffer-complete-and-exit (symbol-function 'minibuffer-complete-and-exit)))

<span class="linecomment">;; Bound to `C-m' (`RET') in `minibuffer-local-must-match-map'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-minibuffer-complete-and-exit ()
  "<span class="quote">If the minibuffer contents is a valid completion, then exit.
Otherwise try to complete it.</span>"
  (interactive)
  (let ((last-cmd  last-command))
    (cond ((string= "<span class="quote"></span>" (if (icicle-file-name-input-p) <span class="linecomment">;  Empty input - exit.</span>
                           (icicle-minibuf-input-sans-dir)
                         (icicle-input-from-minibuffer)))
           (icicle-exit-minibuffer))
          <span class="linecomment">;; This case serves when property `icicle-display-string' is used.</span>
          <span class="linecomment">;; What's returned is the replacement display string, not the original candidate.</span>
          <span class="linecomment">;; If you want to get the original candidate back, you'll need to search the obarray for a</span>
          <span class="linecomment">;; symbol that has this `icicle-display-string' value.  Or put the symbol on the display</span>
          <span class="linecomment">;; string as a text property.</span>
          ((member (icicle-upcase-if-ignore-case (icicle-minibuf-input-sans-dir))
                   (mapcar #'icicle-upcase-if-ignore-case icicle-completion-candidates))
           (icicle-exit-minibuffer))
          ((eq minibuffer-completion-confirm 'confirm) <span class="linecomment">; User wants it anyway? - Emacs 23+.</span>
           (if (eq last-cmd this-command)
               (icicle-exit-minibuffer)
             (minibuffer-message "<span class="quote">Confirm</span>")
             nil))
          ((eq minibuffer-completion-confirm 'confirm-after-completion) <span class="linecomment">; Emacs 23+.</span>
           <span class="linecomment">;; Similar to `confirm', but only if trying to exit immediately</span>
           <span class="linecomment">;; after completing (this catches most minibuffer typos).</span>
           (if (not (memq last-cmd (and (boundp 'minibuffer-confirm-exit-commands)
                                        (append icicle-confirm-exit-commands
                                                minibuffer-confirm-exit-commands))))
               (icicle-exit-minibuffer)
             (minibuffer-message "<span class="quote">Confirm</span>")
             nil))
          (t
           (setq icicle-current-input  (icicle-input-from-minibuffer))
           (let* ((icicle-prefix-complete-and-exit-p   t) <span class="linecomment">; Suppress the throw or the msg plus the</span>
                  (icicle-apropos-complete-and-exit-p  t) <span class="linecomment">; wait involved in completing again.</span>
                  (candidates
                   <span class="linecomment">;; If we're not using `icicle-candidates-alist', complete the input again.</span>
                   <span class="linecomment">;; If we're using `icicle-candidates-alist', try filtering it against just the</span>
                   <span class="linecomment">;; input.</span>
                   <span class="linecomment">;;   If the input is already complete, then we're done.  If not, then filtering</span>
                   <span class="linecomment">;;   will give nil and we will just continue to display the candidates.  If there</span>
                   <span class="linecomment">;;   are multiple matches, then the user can either cycle or complete again.</span>
                   (if (not icicle-candidates-alist)
                       (if (eq icicle-current-completion-mode 'apropos)
                           (icicle-apropos-complete-no-display 'nomsg)
                         (icicle-prefix-complete-no-display 'nomsg))
                     (icicle-filter-alist icicle-candidates-alist (list icicle-current-input)))))
             (cond
               ((member (icicle-upcase-if-ignore-case (icicle-minibuf-input-sans-dir))
                        (mapcar #'icicle-upcase-if-ignore-case icicle-completion-candidates))
                (icicle-exit-minibuffer))
               (t
                (icicle-display-candidates-in-Completions))))))))


(defun icicle-upcase-if-ignore-case (strg)
  "<span class="quote">Return (upcase STRG) if `completion-ignore-case', else return STRG.</span>"
  (if completion-ignore-case
      <span class="linecomment">;; Ignore errors - e.g. Emacs 20 for plist of `dired-revert' put through (format "%s").</span>
      (or (condition-case nil (upcase strg) (error nil)) <span class="linecomment">; Ignore errors (e.g. Emacs 20).</span>
          strg)
    strg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete-and-exit () <span class="linecomment">; Bound to `S-RET' in `minibuffer-local-must-match-map'.</span>
  "<span class="quote">If the minibuffer contents is a valid apropos completion, then exit.
Otherwise try to complete it.  If completion leads to a valid
completion, then exit.
This is to `minibuffer-complete-and-exit' as `icicle-apropos-complete'
is to `minibuffer-complete'.  That is, it is the regexp-match version.</span>"
  (interactive)
  (setq icicle-last-input  (icicle-input-from-minibuffer))
  (let* ((icicle-apropos-complete-and-exit-p  t) <span class="linecomment">; Suppress the throw or the msg plus the wait.</span>
         (candidates                          (icicle-apropos-complete)))
    (when (and candidates (null (cdr candidates))) (old-exit-minibuffer)))) <span class="linecomment">; Single candidate.</span>


<span class="linecomment">;; REPLACE ORIGINAL `choose-completion' in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Don't iconify frame or bury buffer.</span>
<span class="linecomment">;; Don't strip text properties.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-choose-completion)
(fset 'old-choose-completion (symbol-function 'choose-completion)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-choose-completion ()
  "<span class="quote">Choose the completion that point is in or next to.</span>"
  (interactive)
  (let ((buffer     completion-reference-buffer)
	(base-size  completion-base-size)
        beg end completion)
    (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
      (setq end  (point)
            beg  (1+ (point))))
    (when (and (&gt;= (point) (icicle-start-of-candidates-in-Completions))
               (get-text-property (1- (point)) 'mouse-face))
      (setq end  (1- (point))
            beg  (point)))
    (unless beg	(error "<span class="quote">No completion here</span>"))
    (setq beg         (previous-single-property-change beg 'mouse-face)
          end         (or (next-single-property-change end 'mouse-face) (point-max))
          <span class="linecomment">;; $$$$ completion  (buffer-substring-no-properties beg end))</span>
          completion  (buffer-substring beg end))
    <span class="linecomment">;; (let ((owindow  (selected-window)))</span>
    <span class="linecomment">;;   (if (and (one-window-p t 'selected-frame) (window-dedicated-p (selected-window)))</span>
    <span class="linecomment">;;    (iconify-frame (selected-frame)) ; Iconify special buffer's frame</span>
    <span class="linecomment">;;  (or (window-dedicated-p (selected-window)) (bury-buffer)))</span>
    <span class="linecomment">;;   (select-window owindow))</span>
    (unless (or (not (member completion icicle-extra-candidates))
                icicle-extra-candidates-dir-insert-p)
      (setq base-size  0))
    (choose-completion-string completion buffer base-size)))


<span class="linecomment">;; REPLACE ORIGINAL `mouse-choose-completion' in `mouse.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Return the number of the completion.</span>
<span class="linecomment">;; Don't strip text properties.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-mouse-choose-completion)
(fset 'old-mouse-choose-completion (symbol-function 'mouse-choose-completion)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-choose-completion (event) <span class="linecomment">; Bound to `mouse-2' in *Completions*.</span>
  "<span class="quote">Click a completion candidate in buffer `*Completions*', to choose it.
Return the number of the candidate: 0 for first, 1 for second, ...</span>"
  (interactive "<span class="quote">e</span>")
  <span class="linecomment">;; $$$$$ (unless (active-minibuffer-window) (error "Minibuffer is not active"))</span>
  <span class="linecomment">;; Give temporary modes such as isearch a chance to turn off.</span>
  (run-hooks 'mouse-leave-buffer-hook)
  (let* ((buffer       (window-buffer))
         (orig-buffer  buffer)
         choice base-size)
    (save-excursion
      (set-buffer (window-buffer (posn-window (event-start event))))
      (when completion-reference-buffer (setq buffer  completion-reference-buffer))
      (setq base-size  completion-base-size)
      (save-excursion
        (goto-char (posn-point (event-start event)))
        (let (beg end)
          (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
            (setq end  (point)
                  beg  (1+ (point))))
          (unless beg (error "<span class="quote">No completion here</span>"))
          (setq beg  (previous-single-property-change beg 'mouse-face)
                end  (or (next-single-property-change end 'mouse-face) (point-max)))
          <span class="linecomment">;; `icicle-insert-candidates' doesn't put `mouse-face' on the final \n of a candidate</span>
          <span class="linecomment">;; in *Completions*. Add the newline back. `icicle-insert-candidates' puts property</span>
          <span class="linecomment">;; `icicle-keep-newline' on the newline if it is part of the candidate, as opposed to</span>
          <span class="linecomment">;; being just part of the display in columns.</span>
          (when (and (eq ?\n (char-after end)) (get-text-property end 'icicle-keep-newline))
            (setq end  (1+ end)))
          <span class="linecomment">;; $$$$$$ (setq choice  (buffer-substring-no-properties beg end)))))</span>
          (setq choice  (buffer-substring beg end)))))
    <span class="linecomment">;; $$$$$ (if (eq orig-buffer (get-buffer "*Completions*"))</span>
    <span class="linecomment">;;    (icicle-remove-Completions-window)</span>
    <span class="linecomment">;;    (save-selected-window (icicle-remove-Completions-window)))</span>
    (setq icicle-candidate-nb  (icicle-nb-of-candidate-in-Completions (posn-point
                                                                       (event-start event))))
    (when (and (icicle-file-name-input-p) insert-default-directory
               (or (not (member choice icicle-extra-candidates))
                   icicle-extra-candidates-dir-insert-p))
      (let ((dir  (icicle-file-name-directory-w-default icicle-current-input)))
        (with-current-buffer buffer
          (icicle-clear-minibuffer)
          (insert dir)
          (setq choice     (concat dir choice)
                base-size  0))))
    (choose-completion-string choice buffer base-size))
  icicle-candidate-nb)

(defun icicle-nb-of-candidate-in-Completions (position)
  "<span class="quote">Return number of completion candidate at POSITION in *Completions*.
POSITION is a buffer position.</span>"
  (let ((compl-buf  (get-buffer "<span class="quote">*Completions*</span>")))
    (unless compl-buf (error "<span class="quote">No *Completions* buffer</span>"))
    (save-window-excursion
      (set-buffer compl-buf)
      (goto-char position)
      <span class="linecomment">;; If in a completion, move to its start, and set POSITION there.</span>
      (let ((prop  (get-text-property  (1- (point)) 'mouse-face)))
        (when (and prop (eq prop (get-text-property (point) 'mouse-face)))
          (goto-char (previous-single-property-change (point) 'mouse-face nil
                                                      (icicle-start-of-candidates-in-Completions)))))
      (setq position  (point))
      <span class="linecomment">;; Binary search.</span>
      (let ((cand-nb  (/ (length icicle-completion-candidates) 2))
            (last-nb  0)
            delta)
        (goto-char (point-min))
        (icicle-move-to-next-completion cand-nb t)
        (while (/= (point) position)
          (setq delta    (max 1 (/ (abs (- cand-nb last-nb)) 2))
                last-nb  cand-nb)
          (cond ((&lt; (point) position)
                 (icicle-move-to-next-completion delta t)
                 (setq cand-nb  (+ cand-nb delta)))
                (t
                 (icicle-move-to-next-completion (- delta) t)
                 (setq cand-nb  (- cand-nb delta)))))
        (set-buffer-modified-p nil)
        (1- cand-nb)))))


<span class="linecomment">;; REPLACE ORIGINAL `switch-to-completions' defined in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Selects *Completions* window even if on another frame.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-switch-to-completions)
(fset 'old-switch-to-completions (symbol-function 'switch-to-completions)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-switch-to-completions ()
  "<span class="quote">Select the completion list window, *Completions*.</span>"
  (interactive)
  <span class="linecomment">;; Make sure we have a completions window.</span>
  (or (get-buffer-window "<span class="quote">*Completions*</span>") (minibuffer-completion-help))
  (let ((window  (get-buffer-window "<span class="quote">*Completions*</span>" 0))) <span class="linecomment">; Added 0 arg.</span>
    (when window
      (select-window window)
      (goto-char (icicle-start-of-candidates-in-Completions)))))

<span class="linecomment">;; The branch that deletes a history element is based on Juri Linkov's</span>
<span class="linecomment">;; `delete-history-element', proposed for Emacs 22 but rejected by RMS.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-erase-minibuffer-or-history-element () <span class="linecomment">; Bound to `M-k' in minibuffer.</span>
  "<span class="quote">`icicle-erase-minibuffer' or, if using history, delete history element.</span>"
  (interactive)
  (if (not (memq last-command '(previous-history-element next-history-element
                                icicle-erase-minibuffer-or-history-element
                                previous-matching-history-element next-matching-history-element)))
      (icicle-erase-minibuffer)
    (let* ((curr-pos  (1- minibuffer-history-position))
           (current   (nth curr-pos (and (boundp minibuffer-history-variable)
                                         (symbol-value minibuffer-history-variable)))))
      (cond ((= minibuffer-history-position 1)
             (set minibuffer-history-variable (and (boundp minibuffer-history-variable)
                                                   (cdr (symbol-value minibuffer-history-variable)))))
            ((&gt; minibuffer-history-position 1)
             (setcdr (nthcdr (- minibuffer-history-position 2)
                             (and (boundp minibuffer-history-variable)
                                  (symbol-value minibuffer-history-variable)))
                     (nthcdr minibuffer-history-position
                             (and (boundp minibuffer-history-variable)
                                  (symbol-value minibuffer-history-variable))))))
      (condition-case nil
          (cond ((memq last-command '(next-history-element next-matching-history-element))
                 (next-history-element 1)
                 (setq this-command  'next-history-element))
                ((memq last-command '(previous-history-element previous-matching-history-element))
                 (next-history-element 1)
                 (previous-history-element 1)
                 (setq this-command  'previous-history-element)))
        (error (condition-case nil
                   (cond ((memq last-command '(next-history-element next-matching-history-element))
                          (previous-history-element 1)
                          (setq this-command  'previous-history-element))
                         ((memq last-command
                                '(previous-history-element previous-matching-history-element))
                          (next-history-element 1)
                          (setq this-command  'next-history-element)))
                 (error nil))))
      (when (and current (wholenump curr-pos))
        (icicle-msg-maybe-in-minibuffer "<span class="quote">Deleted `%s'</span>" current)))))
 
<span class="linecomment">;;(@* "Icicles commands")</span>

<span class="linecomment">;;; Icicles commands -------------------------------------------------</span>

<span class="linecomment">;;(@* "Minibuffer editing commands")</span>

<span class="linecomment">;;; Minibuffer editing commands  . . . . . . . . . . . . . . . . . . .</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; All except `icicle-erase-minibuffer' are bound in the minibuffer to whatever the same</span>
<span class="linecomment">;;; command without `icicle-' is bound to globally.</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-delete-char-untabify (n &optional killflag)
  "<span class="quote">`backward-delete-char-untabify' + update *Completions* with matches.
See description of `backward-delete-char-untabify'.</span>"
  (interactive "<span class="quote">*p\nP</span>")
  (icicle-call-then-update-Completions #'backward-delete-char-untabify n killflag))

<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-backward-char (n &optional killflag) <span class="linecomment">; Bound to `DEL' in minibuffer.</span>
  "<span class="quote">`delete-backward-char' and update *Completions* with input matches.
See description of `delete-backward-char'.</span>"
  (interactive "<span class="quote">*p\nP</span>")
  (icicle-call-then-update-Completions #'delete-backward-char n killflag))

<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-char (n &optional killflag) <span class="linecomment">; Bound to `C-d' in minibuffer.</span>
  "<span class="quote">`delete-char' and update *Completions* with input matches.
See description of `delete-char'.</span>"
  (interactive "<span class="quote">*p\nP</span>")
  (icicle-call-then-update-Completions #'delete-char n killflag))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-word (arg)  <span class="linecomment">; Bound to `M-DEL' (`M-backspace') in minibuffer.</span>
  "<span class="quote">`backward-kill-word' and update *Completions* with input matches.
See description of `backward-kill-word'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-word arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-word (arg)           <span class="linecomment">; Bound to `M-d' in minibuffer.</span>
  "<span class="quote">`kill-word' and update *Completions* with regexp input matches.
See description of `kill-word'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-word arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-sexp (arg)  <span class="linecomment">; Bound to `C-M-backspace' in minibuffer.</span>
  "<span class="quote">`backward-kill-sexp' and update *Completions* with input matches.
See description of `backward-kill-sexp'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-sexp arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-sexp (arg)           <span class="linecomment">; Bound to `C-M-delete' and `C-M-k' in minibuffer.</span>
  "<span class="quote">`kill-sexp' and update *Completions* with regexp input matches.
See description of `kill-sexp'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-sexp arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-sentence (arg) <span class="linecomment">; Bound to `C-x DEL' in minibuffer.</span>
  "<span class="quote">`backward-kill-sentence' and update *Completions* with input matches.
See description of `backward-kill-sentence'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-sentence arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-sentence (arg)
  "<span class="quote">`kill-sentence' and update *Completions* with regexp input matches.
See description of `kill-sentence'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-sentence arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-backward-kill-paragraph (arg) <span class="linecomment">; Bound to `C-backspace' in minibuffer, except for files.</span>
  "<span class="quote">`backward-kill-paragraph' and update *Completions* with input matches.
See description of `backward-kill-paragraph'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'backward-kill-paragraph arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-paragraph (arg)      <span class="linecomment">; Bound to `C-delete' in minibuffer.</span>
  "<span class="quote">`kill-paragraph' and update *Completions* with regexp input matches.
See description of `kill-paragraph'.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-call-then-update-Completions #'kill-paragraph arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-line (arg)           <span class="linecomment">; Bound to `C-k' and `deleteline' in minibuffer.</span>
  "<span class="quote">`kill-line' and update *Completions* with regexp input matches.
See description of `kill-line'.</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-call-then-update-Completions #'kill-line arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-kill-region (beg end)     <span class="linecomment">; Bound to `C-w' in minibuffer.</span>
<span class="linecomment">;; Don't bother with Emacs 22 optional 3rd arg.</span>
  "<span class="quote">`kill-region' and update *Completions* with regexp input matches.
See description of `kill-region'.</span>"
  (interactive "<span class="quote">r</span>")
  (icicle-call-then-update-Completions #'kill-region beg end))

<span class="linecomment">;;;###autoload</span>
(when (fboundp 'kill-region-wimpy)
  (defun icicle-kill-region-wimpy (beg end) <span class="linecomment">; Bound to `C-w' in minibuffer.</span>
    "<span class="quote">`kill-region-wimpy' and update *Completions* with input matches.
See description of `kill-region-wimpy'.</span>"
    (interactive "<span class="quote">r</span>")
    (icicle-call-then-update-Completions #'kill-region-wimpy beg end)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-up-directory () <span class="linecomment">; Bound to `C-backspace' in minibuffer, for file-name completion.</span>
  "<span class="quote">Replace minibuffer input with parent directory, then upate *Completions*.</span>"
  (interactive)
  (icicle-call-then-update-Completions #'icicle-replace-input-w-parent-dir))

(defun icicle-replace-input-w-parent-dir ()
  "<span class="quote">Replace minibuffer input with the parent directory.</span>"
  (interactive)
  (goto-char (point-max))
  (let ((directoryp  (equal directory-sep-char (char-before)))
        (bob         (icicle-minibuffer-prompt-end)))
    (while (and (&gt; (point) bob) (not (equal directory-sep-char (char-before))))
      (delete-backward-char 1))
    (when directoryp
      (delete-backward-char 1)
      (while (and (&gt; (point) bob) (not (equal directory-sep-char (char-before))))
        (delete-backward-char 1)))))

<span class="linecomment">;;; ;;;###autoload</span>
<span class="linecomment">;;; (defun icicle-kill-failed-input ()      ; Bound to `C-M-l' in minibuffer during completion.</span>
<span class="linecomment">;;;   "Kill (delete) the part of the input that does not complete.</span>
<span class="linecomment">;;; Repeat to delete more."</span>
<span class="linecomment">;;;   (interactive)</span>
<span class="linecomment">;;;   (goto-char (1- (point-max)))</span>
<span class="linecomment">;;;   (while (and (not (bobp))</span>
<span class="linecomment">;;;               (memq (get-text-property (point) 'face)</span>
<span class="linecomment">;;;                     '(icicle-input-completion-fail icicle-input-completion-fail-lax)))</span>
<span class="linecomment">;;;     (delete-char 1)</span>
<span class="linecomment">;;;     (backward-char 1))</span>
<span class="linecomment">;;;   (unless (eobp) (forward-char))</span>
<span class="linecomment">;;;   (icicle-highlight-input-noncompletion))</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-goto/kill-failed-input () <span class="linecomment">; Bound to `C-M-l' in minibuffer during completion.</span>
  "<span class="quote">Go to start of input portion that does not complete.  Repeat to kill.
Kill (delete) the part of the input that does not complete.
Repeat to delete more.</span>"
  (interactive)
  (if (eq last-command this-command)
      (unless (eobp) (kill-line))
    (goto-char (icicle-minibuffer-prompt-end))
    (while (and (not (eobp))
                (not (memq (get-text-property (point) 'face)
                           '(icicle-input-completion-fail icicle-input-completion-fail-lax))))
      (forward-char))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-transpose-chars (arg)     <span class="linecomment">; Bound to `C-t' in minibuffer.</span>
  "<span class="quote">`transpose-chars' and update *Completions* with regexp input matches.
See description of `transpose-chars'.</span>"
  (interactive "<span class="quote">*P</span>")
  (icicle-call-then-update-Completions #'transpose-chars arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-transpose-words (arg)     <span class="linecomment">; Bound to `M-t' in minibuffer.</span>
  "<span class="quote">`transpose-words' and update *Completions* with regexp input matches.
See description of `transpose-words'.</span>"
  (interactive "<span class="quote">*p</span>")
  (icicle-call-then-update-Completions #'transpose-words arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-transpose-sexps (arg)    <span class="linecomment">; Bound to `C-M-t' in minibuffer.</span>
  "<span class="quote">`transpose-sexps' and update *Completions* with regexp input matches.
See description of `transpose-sexps'.</span>"
  (interactive "<span class="quote">*p</span>")
  (icicle-call-then-update-Completions #'transpose-sexps arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-yank (arg)                <span class="linecomment">; Bound to `C-y' and `S-insert' in minibuffer.</span>
  "<span class="quote">`yank' and update *Completions* with regexp input matches.
See description of `yank'.</span>"
  (interactive "<span class="quote">*P</span>")
  (icicle-call-then-update-Completions #'yank arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-yank-pop (arg)            <span class="linecomment">; Bound to `M-y' and `M-insert' in minibuffer.</span>
  "<span class="quote">`yank-pop' and update *Completions* with regexp input matches.
See description of `yank-pop'.</span>"
  (interactive "<span class="quote">*p</span>")
  (icicle-call-then-update-Completions #'yank-pop arg))

<span class="linecomment">;;;###autoload</span>
(when (fboundp 'yank-secondary)         <span class="linecomment">; Defined in `second-sel.el'.</span>
  (defun icicle-yank-secondary ()       <span class="linecomment">; Bound to `C-M-y' in minibuffer.</span>
    "<span class="quote">Insert the secondary selection at point.
Move point to the end of the inserted text.  Does not change mark.</span>"
    (interactive "<span class="quote">*</span>")
    (icicle-call-then-update-Completions #'yank-secondary))
  <span class="linecomment">;; Tell `delete-selection-mode' to replace active region by yanked secondary selection.</span>
  (put 'icicle-yank-secondary 'delete-selection 'yank))


<span class="linecomment">;; Tell `delete-selection-mode' to replace active region by yanked secondary selection.</span>
(put 'icicle-mouse-yank-secondary 'delete-selection 'yank)
<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-yank-secondary (event) <span class="linecomment">; Bound to `M-mouse-2' in minibuffer.</span>
  "<span class="quote">Insert the secondary selection where you click.
Move point to the end of the inserted text.
If `mouse-yank-at-point' is non-nil, insert at point
regardless of where you click.</span>"
  (interactive "<span class="quote">*e</span>")
  (icicle-call-then-update-Completions #'mouse-yank-secondary event))


<span class="linecomment">;; Make delete-selection mode recognize self-insertion, so it replaces region text.</span>
(put 'icicle-self-insert 'delete-selection t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-self-insert (n) <span class="linecomment">;; Bound in minibuf to stuff bound globally to `self-insert-command'.</span>
  "<span class="quote">`self-insert' and update *Completions* with regexp input matches.
See description of `self-insert'.</span>"
  (interactive "<span class="quote">p</span>")
  (if executing-kbd-macro
      (funcall #'self-insert-command n)
    (icicle-call-then-update-Completions #'self-insert-command n)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-a-space ()
  "<span class="quote">Insert a space.
For convenience in the minibuffer - does the same thing as `C-q SPC'.
To use this, bind it to some key sequence in keymaps
`minibuffer-local-completion-map',
`minibuffer-local-filename-completion-map', and
`minibuffer-local-must-match-map'.</span>"
  (interactive) (insert ?\ ))

<span class="linecomment">;;;###autoload</span>
(defun icicle-erase-minibuffer ()       <span class="linecomment">; Bound to `M-S-backspace', `M-S-delete' in minibuffer.</span>
  "<span class="quote">Delete all user input in the minibuffer, then update completions.</span>"
  (interactive)
  (icicle-call-then-update-Completions #'icicle-clear-minibuffer))
 
<span class="linecomment">;;(@* "Commands to sort completion candidates")</span>

<span class="linecomment">;;; Commands to sort completion candidates . . . . . . . . . . . . . .</span>

<span class="linecomment">;; We don't bother to define a command for the sort functions `icicle-prefix-keys-first-p' and</span>
<span class="linecomment">;; `icicle-command-names-alphabetic-p'.  They are bound in `icicle-complete-keys'.</span>

<span class="linecomment">;; The order here defines the reverse order of `icicle-sort-functions-alist'.</span>
<span class="linecomment">;; The first here is also the default sort order.  Entries are traversed by `C-,' in</span>
<span class="linecomment">;; `icicle-sort-functions-alist' order.</span>

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">alphabetical</span>" <span class="linecomment">; `icicle-sort-alphabetical'</span>
    icicle-case-string-less-p
  "<span class="quote">Sort completion candidates alphabetically.
Ignore letter case if `completion-ignore-case' or `case-fold-search'
is non-nil.</span>")

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">special candidates first</span>" <span class="linecomment">; `icicle-sort-special-candidates-first'</span>
    icicle-special-candidates-first-p
  "<span class="quote">Sort completion candidates by putting special candidates first.
Otherwise, sorting is alphabetical.  Ignore letter case if
`completion-ignore-case' or `case-fold-search' is non-nil.</span>")

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">extra candidates first</span>" <span class="linecomment">; `icicle-sort-extra-candidates-first'</span>
    icicle-extra-candidates-first-p
  "<span class="quote">Sort completion candidates by putting extra candidates first.
Otherwise, sorting is alphabetical.  Ignore letter case if
`completion-ignore-case' or `case-fold-search' is non-nil.
An extra candidate is one that is a member of
`icicle-extra-candidates'.</span>")

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">proxy candidates first</span>" <span class="linecomment">; `icicle-sort-proxy-candidates-first'</span>
    icicle-proxy-candidate-first-p
  "<span class="quote">Sort completion candidates by putting proxy candidates first.
Otherwise, sorting is alphabetical.  Ignore letter case if
`completion-ignore-case' or `case-fold-search' is non-nil.</span>")

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">case insensitive</span>" <span class="linecomment">; `icicle-sort-case-insensitive'</span>
    icicle-case-insensitive-string-less-p
  "<span class="quote">Sort completion candidates alphabetically, but case-insenstively.</span>")

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">by 2nd parts alphabetically</span>" <span class="linecomment">; `icicle-sort-by-2nd-parts-alphabetically'</span>
    icicle-2nd-part-string-less-p
  "<span class="quote">Sort multi-completion candidates alphabetically by their second parts.
After that, sort alphabetically by the first parts.  Ignore letter
case if `completion-ignore-case' or `case-fold-search' is non-nil.</span>")

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">by last file modification time</span>"
    icicle-last-modified-first-p        <span class="linecomment">; `icicle-sort-by-last-file-modification-time'</span>
  "<span class="quote">Sort file-name completion candidates in order of last modification.
If not doing file-name completion, then sort alphabetically.</span>")

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">by directories last</span>" <span class="linecomment">; `icicle-sort-by-directories-last'</span>
    icicle-dirs-last-p
  "<span class="quote">Sort file-name completion candidates so that directories are last.
If not doing file-name completion, then sort alphabetically.</span>")

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">by last use</span>" <span class="linecomment">; `icicle-sort-by-last-use'</span>
    icicle-most-recent-first-p
  "<span class="quote">Sort completion candidates in order of last use as minibuffer input.</span>")

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">by abbrev frequency</span>" <span class="linecomment">; `icicle-sort-by-abbrev-frequency'</span>
    icicle-command-abbrev-used-more-p
  "<span class="quote">Sort abbrev completion candidates by frequency of use
Otherwise, sort alphabetically.  Ignore letter case if
`completion-ignore-case' or `case-fold-search' is non-nil.</span>")

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">by previous use alphabetically</span>"
    icicle-historical-alphabetic-p      <span class="linecomment">; `icicle-sort-by-previous-use-alphabetically'</span>
  "<span class="quote">Sort completion candidates by previous use and alphabetically.
Candidates matching previous inputs are available first.  Candidates
are in two groups, each of which is sorted alphabetically separately:
those matching previous inputs, followed by those that have not yet
been used.</span>")

<span class="linecomment">;;;###autoload</span>
(icicle-define-sort-command "<span class="quote">turned OFF</span>" nil <span class="linecomment">; `icicle-sort-turned-OFF'</span>
  "<span class="quote">Do not sort completion candidates.</span>")

<span class="linecomment">;;;###autoload</span>
(defun icicle-dispatch-C-comma ()       <span class="linecomment">; Bound to `C-,' in the minibuffer.</span>
  "<span class="quote">Do the right thing for `C-,'.
When candidate sorting is possible, call `icicle-change-sort-order'.
When searching, call `icicle-toggle-search-replace-whole'.
Otherwise, do nothing.

Bound to `C-,' in the minibuffer.</span>"
  (interactive)
  (cond (icicle-searching-p (icicle-toggle-search-replace-whole))
        (icicle-inhibit-sort-p (message "<span class="quote">Cannot sort candidates now</span>"))
        (t (call-interactively #'icicle-change-sort-order))))

(defalias 'toggle-icicle-search-replace-common-match 'icicle-toggle-search-replace-common-match)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-search-replace-common-match () <span class="linecomment">; Bound to `M-;' in the minibuffer.</span>
  "<span class="quote">Toggle the value of `icicle-search-replace-common-match-flag'.
Note that that option has no effect if
`icicle-expand-input-to-common-match-flag' is nil.
Bound to `M-;' in the minibuffer.</span>"
  (interactive)
  (setq icicle-search-replace-common-match-flag  (not icicle-search-replace-common-match-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-search-replace-common-match-flag
                                      "<span class="quote">Replacing expanded common match is now ON</span>"
                                    "<span class="quote">Replacing expanded common match is now OFF</span>")))

(defalias 'toggle-icicle-search-replace-whole 'icicle-toggle-search-replace-whole)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-search-replace-whole () <span class="linecomment">; Bound to `C-,' in the minibuffer.</span>
  "<span class="quote">Toggle the value of `icicle-search-replace-whole-candidate-flag'.
Bound to `C-,' in the minibuffer when searching.</span>"
  (interactive)
  (setq icicle-search-replace-whole-candidate-flag  (not icicle-search-replace-whole-candidate-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-search-replace-whole-candidate-flag
                                      "<span class="quote">Replacing whole search context is now ON</span>"
                                    "<span class="quote">Replacing whole search context is now OFF</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-change-sort-order (&optional arg alternativep) <span class="linecomment">; Bound to `C-,' in minibuffer.</span>
  "<span class="quote">Choose a sort order.
With a numeric prefix arg, reverse the current sort order.

If plain `C-u' is used or `C-u' is not used at all:

- Use completion if `icicle-change-sort-order-completion-flag' is
  non-nil and no prefix arg is used, or if it is nil and a prefix arg
  is used.

- Otherwise, just cycle to the next sort order.

This command updates `icicle-sort-function'.  Non-interactively,
optional arg ALTERNATIVEP means change the current alternative sort
order instead, updating `icicle-alternative-sort-function'.</span>"
  (interactive "<span class="quote">P</span>")
  (if (and (interactive-p) icicle-inhibit-sort-p)
      (icicle-msg-maybe-in-minibuffer "<span class="quote">Cannot sort candidates now</span>")
    (if (and arg (not (consp arg)))
        (icicle-reverse-sort-order)
      (let (next-order)
        (cond ((or (and icicle-change-sort-order-completion-flag (not arg))
                   (and (not icicle-change-sort-order-completion-flag) arg))
               (setq next-order  (let ((icicle-whole-candidate-as-text-prop-p  nil)
                                       (enable-recursive-minibuffers           t))
                                   (completing-read
                                    (format "<span class="quote">New %ssort order: </span>" (if alternativep "<span class="quote">alternative </span>" "<span class="quote"></span>"))
                                    (icicle-current-sort-functions)
                                    nil t)))
               (set (if alternativep 'icicle-alternative-sort-function 'icicle-sort-function)
                    (cdr (assoc next-order icicle-sort-functions-alist))))
              (t
               (let ((orders  (mapcar #'car (icicle-current-sort-functions))))
                 (setq next-order  (or (cadr (memq (icicle-current-sort-order alternativep) orders))
                                       (car orders)))
                 (set (if alternativep 'icicle-alternative-sort-function 'icicle-sort-function)
                      (cdr (assoc next-order icicle-sort-functions-alist))))))
        (icicle-complete-again-update)
        (icicle-msg-maybe-in-minibuffer
         "<span class="quote">%sorting is now %s</span>" (if alternativep "<span class="quote">Alternative s</span>" "<span class="quote">S</span>") next-order)))))

(defun icicle-current-sort-functions ()
  "<span class="quote">Subset of `icicle-sort-functions-alist' that is currently appropriate.</span>"
  (icicle-remove-if (lambda (pred)
                      (setq pred  (cdr pred))
                      (and pred (symbolp pred)
                           (or (and (get pred 'icicle-proxy-sort-predicate)
                                    (not icicle-add-proxy-candidates-flag))
                               (and (get pred 'icicle-file-name-sort-predicate)
                                    (not (icicle-file-name-input-p)))
                               (and (get pred 'icicle-command-sort-predicate)
                                    (not (and (eq minibuffer-completion-table obarray)
                                              <span class="linecomment">;; But this will fail if predicate is more complex.</span>
                                              (eq minibuffer-completion-predicate 'commandp))))
                               <span class="linecomment">;; Sort order for multi-completions. `minibuffer-completion-table'</span>
                               <span class="linecomment">;; could be a function (e.g. `icicle-describe-opt-of-type-complete')</span>
                               <span class="linecomment">;; or it could be a list of multi-completions.</span>
                               (and (get pred 'icicle-multi-completion-sort-predicate)
                                    (not (icicle-maybe-multi-completion-completing-p))))))
                    icicle-sort-functions-alist))

(defun icicle-maybe-multi-completion-completing-p ()
  "<span class="quote">Returns non-nil if we might currently be multi-completion completing.
Note: If `minibuffer-completion-table' is a function, multi-completion
is possible but not sure.  Return non-nil in that case.</span>"
  (or (functionp minibuffer-completion-table) icicle-list-use-nth-parts))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dispatch-M-comma ()       <span class="linecomment">; Bound to `M-,' in the minibuffer.</span>
  "<span class="quote">Do the right thing for `M-,'.
If sorting is possible, call `icicle-change-alternative-sort-order'.
If searching, call `icicle-search-define-replacement'.
Otherwise, do nothing.

Bound to `M-,' in the minibuffer.</span>"
  (interactive)
  (cond (icicle-searching-p (icicle-search-define-replacement))
        (icicle-inhibit-sort-p (message "<span class="quote">Cannot sort candidates now</span>"))
        (t (icicle-change-alternative-sort-order))))

<span class="linecomment">;; Free vars here: `scan-fn-or-regexp' is bound in `icicle-search' (a parameter).</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-search-define-replacement () <span class="linecomment">; Bound to `M-,' in the minibuffer.</span>
  "<span class="quote">Prompt user and set new value of `icicle-search-replacement'.
Bound to `M-,' in the minibuffer.</span>"
  (interactive)
  (setq icicle-search-replacement
        (let ((enable-recursive-minibuffers  t)
              (icicle-completion-candidates  icicle-completion-candidates)
              (icicle-current-input          icicle-current-input)
              (icicle-candidate-nb           icicle-candidate-nb)
              (icicle-update-input-hook      nil))
          (icicle-completing-read-history "<span class="quote">Replace with: </span>" 'icicle-search-replacement-history)))
  <span class="linecomment">;; Just a sanity check.  Cannot really test equivalence of two regexps.</span>
  (while (if icicle-search-replace-whole-candidate-flag
             (equal icicle-search-replacement scan-fn-or-regexp)
           (equal icicle-search-replacement icicle-current-input))
    (setq icicle-search-replacement
          (let ((enable-recursive-minibuffers  t)
                (icicle-completion-candidates  icicle-completion-candidates)
                (icicle-current-input          icicle-current-input)
                (icicle-candidate-nb           icicle-candidate-nb)
                (icicle-update-input-hook      nil))
            (icicle-completing-read-history "<span class="quote">Replacement = replaced.  Replace with: </span>"
                                            'icicle-search-replacement-history)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-change-alternative-sort-order (&optional arg) <span class="linecomment">; Bound to `M-,' in minibuffer.</span>
  "<span class="quote">Choose an alternative sort order.
Similar to command `icicle-change-sort-order', but change the
alternative sort order, not the current sort order.</span>"
  (interactive "<span class="quote">P</span>")
  (if (and (interactive-p) icicle-inhibit-sort-p)
      (icicle-msg-maybe-in-minibuffer "<span class="quote">Cannot sort candidates now</span>")
    (icicle-change-sort-order arg t)))

(defun icicle-current-sort-order (alternativep)
  "<span class="quote">Current sort order, or nil if sorting is inactive.
If ALTERNATIVEP is non-nil, the alternative sort order is returned.</span>"
  (car (rassq (if alternativep icicle-alternative-sort-function icicle-sort-function)
              icicle-sort-functions-alist)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-reverse-sort-order ()
  "<span class="quote">Reverse the current sort order.</span>"
  (interactive)
  (if (and (interactive-p) icicle-inhibit-sort-p)
      (icicle-msg-maybe-in-minibuffer "<span class="quote">Cannot sort candidates now</span>")
    (setq icicle-reverse-sort-p  (not icicle-reverse-sort-p))
    (icicle-display-candidates-in-Completions icicle-reverse-sort-p)
    (icicle-complete-again-update)
    (icicle-msg-maybe-in-minibuffer
     (format "<span class="quote">Sort order is %s</span>" (if icicle-reverse-sort-p "<span class="quote">REVERSED</span>" "<span class="quote">no longer reversed</span>")))))
 
<span class="linecomment">;;(@* "Other commands to be used mainly in the minibuffer")</span>

<span class="linecomment">;;; Other commands to be used mainly in the minibuffer . . . . . . . .</span>

<span class="linecomment">;; $$ Probably need to do something to work around problem of Windows</span>
<span class="linecomment">;; selecting the new frame, when `pop-up-frames' is non-nil.  Need to</span>
<span class="linecomment">;; redirect focus back to the frame with the minibuffer.  Leave it as</span>
<span class="linecomment">;; is, for now, in hopes Emacs will eventually fix this.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-minibuffer-help ()        <span class="linecomment">; Bound to `C-?' in minibuffer.</span>
  "<span class="quote">Describe Icicles minibuffer and *Completion* buffer bindings.</span>"
  (interactive)
  (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
    (when (icicle-completing-p)
      (princ (concat "<span class="quote">You are completing input</span>" (and icicle-candidate-action-fn
                                                     "<span class="quote"> for an Icicles multi-command</span>")
                     "<span class="quote">.\n\n</span>"))
      (princ "<span class="quote">To show help on individual completion candidates:
     Current candidate                       C-M-RET, C-M-mouse-2
     Next, previous prefix-match candidate   C-M-down, C-M-up
     Next, previous apropos-match candidate  C-M-next, C-M-prior\n\n</span>")
      (when icicle-candidate-action-fn
        (princ "<span class="quote">To act on individual candidates:
     Current candidate                       C-RET, C-mouse-2
     Next, previous prefix-match candidate   C-down, C-up
     Next, previous apropos-match candidate  C-next, C-prior
     All candidates at once                  C-!
     Delete object named by candidate        S-delete
     Object-action: apply a fn to candidate  M-RET</span>"))
      (when icicle-candidate-alt-action-fn
        (princ "<span class="quote">\nFor alternative action, use `C-S-' instead of `C-',
  except use `M-!' instead of `C-!' to act on all.\n</span>")))
    (if icicle-completing-p
        (princ (concat "<span class="quote">\n</span>" (icicle-help-string-completion)))
      (princ (icicle-help-string-non-completion))))
  <span class="linecomment">;; Don't bother to do this for Emacs 21.3.  Its `help-insert-xref-button' signature is different.</span>
  (when (and (&gt; emacs-major-version 21)
             (require 'help-mode nil t) (fboundp 'help-insert-xref-button)) <span class="linecomment">; In `help-mode.el'.</span>
    (save-excursion
      (with-current-buffer (get-buffer "<span class="quote">*Help*</span>")
        (let ((buffer-read-only  nil))
          (goto-char (point-min))
          (help-insert-xref-button "<span class="quote">[Icicles Help on the Web]</span>" 'icicle-help-button)
          (insert "<span class="quote">                        </span>")
          (help-insert-xref-button "<span class="quote">[Icicles Doc, Part 1]</span>" 'icicle-commentary1-button)
          (insert "<span class="quote">\n</span>")
          (help-insert-xref-button "<span class="quote">[Icicles Options & Faces]</span>" 'icicle-customize-button)
          (insert "<span class="quote">                        </span>")
          (help-insert-xref-button "<span class="quote">[Icicles Doc, Part 2]</span>" 'icicle-commentary2-button)
          (insert "<span class="quote">\n\n</span>")
          (goto-char (point-max))
          (insert "<span class="quote">\n\nSend an Icicles bug report: `\\[icicle-send-bug-report]'.\n\n</span>")
          (help-insert-xref-button "<span class="quote">[Icicles Help on the Web]</span>" 'icicle-help-button)
          (insert "<span class="quote">                        </span>")
          (help-insert-xref-button "<span class="quote">[Icicles Doc, Part 1]</span>" 'icicle-commentary1-button)
          (insert "<span class="quote">\n</span>")
          (help-insert-xref-button "<span class="quote">[Icicles Options & Faces]</span>" 'icicle-customize-button)
          (insert "<span class="quote">                        </span>")
          (help-insert-xref-button "<span class="quote">[Icicles Doc, Part 2]</span>" 'icicle-commentary2-button)
          (insert "<span class="quote">\n\n</span>")
          (goto-char (point-min))))))
  (select-window (minibuffer-window))
  (select-frame-set-input-focus (selected-frame)))

(defun icicle-help-string-completion ()
  "<span class="quote">Update the bindings within the Icicles completion help string.</span>"
  (icicle-S-iso-lefttab-to-S-TAB
   (substitute-command-keys
    (concat
     (format "<span class="quote">\\&lt;minibuffer-local-completion-map&gt; 

                    Icicles Minibuffer Completion
                    -----------------------------

Minibuffer input can be completed in several ways.
These are the main Icicles actions and their minibuffer key bindings:

 * Show Icicles minibuffer help (this).      \\[icicle-minibuffer-help]
     For help on individual completion candidates, see \"Show help on
     individual completion candidates\", below.

 * Abandon or commit your input.
     Abandon input                           \\[icicle-abort-recursive-edit]
     Commit input to Emacs                   RET
       Complete partial input, then commit   \\&lt;minibuffer-local-must-match-map&gt;\
\\[icicle-apropos-complete-and-exit]\\&lt;minibuffer-local-completion-map&gt;

 * Toggle Icicles options on the fly.        Key:   \tCurrently:
     Highlighting of past inputs             \\[icicle-toggle-highlight-historical-candidates]\t%S
     Removal of duplicate candidates         \\[icicle-toggle-transforming]\t%S
     Change sort order                       \\[icicle-dispatch-C-comma]\t%s
     Change alternative sort order           \\[icicle-dispatch-M-comma]\t%s
     Swap alternative sort                   \\[icicle-toggle-alternative-sorting]\t- (swaps) -
     Case sensitivity                        \\[icicle-toggle-case-sensitivity]\t%S
     Escaping of special regexp chars        \\[icicle-toggle-regexp-quote]\t%S
     Incremental completion                  \\[icicle-toggle-incremental-completion]\t%S
     Input expansion to common match         \\[icicle-toggle-expand-to-common-match]\t%S
     Hiding common match in *Completions*    \\[icicle-toggle-hiding-common-match]\t%S
     Change apropos match function           \\[icicle-next-apropos-match-function]\t%s
     Fuzzy prefix completion                 \\[icicle-toggle-fuzzy-completion]\t%S
     Inclusion of proxy candidates           \\[icicle-toggle-proxy-candidates]\t%S
     Ignoring certain file extensions        \\[icicle-dispatch-C-.]\t%S
     Checking for remote file names          \\[icicle-dispatch-C-^]\t%S
     Ignoring space prefix                   \\[icicle-toggle-ignored-space-prefix]\t%S
     Using `C-' for multi-command actions    \\[icicle-toggle-C-for-actions]\t%S
     Using `~' for your home directory       \\[icicle-toggle-~-for-home-dir]\t%S
     `icicle-search' all-current highlights  \\[icicle-dispatch-C-^]\t%S
     Whole-word searching                    \\[icicle-dispatch-M-q]\t%S
     Removal of `icicle-search' highlighting \\[icicle-dispatch-C-.]\t%S
     Replacement of whole search hit         \\[icicle-dispatch-C-comma]\t%S
     Replacement of expanded common match    \\[icicle-toggle-search-replace-common-match]\t%S

 * Regexp-quote input, then apropos-complete \\[icicle-regexp-quote-input]

 * Change the set of completion candidates.  Modify your input.
     Edit your input                         (just edit in minibuffer)
     Erase your input (clear minibuffer)     \\[icicle-erase-minibuffer-or-history-element]
     Goto/kill non-matching portion of input \\[icicle-goto/kill-failed-input]
     Retrieve previous completion inputs     \\[icicle-retrieve-previous-input], \
\\[icicle-retrieve-next-input]
     Match another regexp (chaining)         \\[icicle-narrow-candidates]
     Satisfy another predicate (chaining)    \\[icicle-narrow-candidates-with-predicate]
     Remove a candidate from set of matches  delete, S-mouse-2
     Yank text at cursor into minibuffer     \\[icicle-insert-string-at-point]
     Insert text (string) from a variable    \\[icicle-insert-string-from-variable]
     Insert `icicle-list-join-string'        \\[icicle-insert-list-join-string]
     Insert previously entered input         \\[icicle-insert-history-element]
     Insert key description (key completion) \\[icicle-dispatch-M-q]

 * Complete your current input in the minibuffer.
     Apropos (regexp) completion             \\[icicle-apropos-complete]
       Without displaying candidates         \\[icicle-prefix-complete-no-display]
       Complete and match another regexp     \\[icicle-apropos-complete-and-narrow]
     Prefix completion
       As much as possible                   \\[icicle-prefix-complete]
         Without displaying candidates       \\[icicle-prefix-complete-no-display]
       A word at a time                      \\[icicle-prefix-word-complete]
     Complete and commit (if required match) \\&lt;minibuffer-local-must-match-map&gt;\
\\[icicle-apropos-complete-and-exit]\\&lt;minibuffer-local-completion-map&gt;
     Complete search string using past input \\[icicle-apropos-complete]

 * Display/navigate completions for current input (in *Completions*).
     Show completion candidates
       Prefix completion                     \\[icicle-prefix-complete] (repeat)
       Apropos completion                    \\[icicle-apropos-complete]
     Move between minibuffer and list        \\&lt;completion-list-mode-map&gt;\
\\[icicle-insert-completion]
     Cycle among completion candidates       right, left, \
\\[icicle-move-to-next-completion], \\[icicle-move-to-previous-completion]
       Within a *Completions* column         down, up
     Choose a completion candidate           \\[choose-completion], \
\\[mouse-choose-completion]\\&lt;minibuffer-local-completion-map&gt;

 * Cycle among input candidates.
     Prefix-completion candidates            down, up
     Apropos-completion candidates           next, prior
     Minibuffer history items                \\[next-history-element], \
\\[previous-history-element]
     Completion history items                \\[icicle-retrieve-previous-input], \
\\[icicle-retrieve-next-input]

 * Show help on individual completion candidates.
     Current candidate                       C-M-RET, C-M-mouse-2
     Next, previous prefix-match candidate   C-M-down, C-M-up
     Next, previous apropos-match candidate  C-M-next, C-M-prior

 * Choose a previous input from the minibuffer history.
     Complete to insert a previous input     \\[icicle-insert-history-element]
     Complete against history items          \\[icicle-history], \
\\[icicle-keep-only-past-inputs]
     Restrict candidates to history items    \\[icicle-keep-only-past-inputs]
     List history items first in Completions \\[icicle-toggle-alternative-sorting]
     Cycle among minibuffer history items    \\[next-history-element], \
\\[previous-history-element]
     Search among minibuffer history items   \
\\[next-matching-history-element], \\[previous-matching-history-element]

 * Delete history entries
     Delete current entry (cycling)          \\[icicle-erase-minibuffer-or-history-element]
     Delete any or all entries               \\[icicle-clear-current-history]

 * Multi-commands: Act on completion candidates.
   For alternative action, use `C-S-' instead of `C-', but
   `C-|' and `M-|' are alternative action versions of `C-!' and `M-!'.
     Current candidate                       C-RET, C-mouse-2
     Next, previous prefix-match candidate   C-down, C-up
     Next, previous apropos-match candidate  C-next, C-prior
     Act on each matching candidate, in turn C-!
     Act on the list of matching candidates  M-!
     Delete object named by candidate        S-delete
     Remove candidate from set of matches    delete, S-mouse-2
     Save candidate (add to those saved)     insert, M-S-mouse-2
     Object-action: apply a fn to candidate  M-RET

 * Search and replace (e.g. `C-`').
     Use action keys (prefix `C-') to navigate.
     Use alternative action keys (prefix `C-S-') to replace matches.
     Toggle input highlighting at all hits   \\[icicle-dispatch-C-^]
     Toggle whole-word searching             \\[icicle-dispatch-M-q]
     Toggle escaping of special regexp chars \\[icicle-toggle-regexp-quote]
     Toggle removal of search highlighting   \\[icicle-dispatch-C-.]

     Replace all                             C-|
     Redefine the replacement string         \\[icicle-dispatch-M-comma]
     Toggle literal replacement              \\[icicle-toggle-literal-replacement]
     Toggle replacement of whole search hit  \\[icicle-dispatch-C-comma]
     Toggle replacement of common match      \\[icicle-toggle-search-replace-common-match]

 * Perform set operations on candidate sets.
     Remove candidate from current set       delete, S-mouse-2
     Add current candidate to saved set      insert, M-S-mouse-2
     Retrieve saved candidates from...
       `icicle-saved-completion-candidates'  \\[icicle-candidate-set-retrieve]
       another variable                      \\[icicle-candidate-set-retrieve-from-variable]
       a cache file                          \\[icicle-candidate-set-retrieve-persistent]
     Retrieve more saved candidates          \\[icicle-candidate-set-retrieve-more]
     Save candidates in current set to...
       `icicle-saved-completion-candidates'  \\[icicle-candidate-set-save]
       another variable                      \\[icicle-candidate-set-save-to-variable]
       a cache file                          \\[icicle-candidate-set-save-persistently]
     Save more candidates to current set     \\[icicle-candidate-set-save-more]
     Save, save more selected candidates     \\[icicle-candidate-set-save-selected], \
\\[icicle-candidate-set-save-more-selected]  with region
     Clear all saved candidates              \\[icicle-candidate-set-save-selected] \
with empty region
     Add new or update existing saved set
       \\[icicle-add/update-saved-completion-set]
     Remove a saved completion set
       \\[icicle-remove-saved-completion-set]
     Swap current and saved sets             \\[icicle-candidate-set-swap]
     Define current set by evaluating sexp   \\[icicle-candidate-set-define]
     Restrict candidates to history items    \\[icicle-keep-only-past-inputs]
     Set complement                          \\[icicle-candidate-set-complement]
     Set difference                          \\[icicle-candidate-set-difference]
     Set union                               \\[icicle-candidate-set-union]
     Set intersection                        \\[icicle-candidate-set-intersection]
     Set intersection using regexp           \\[icicle-narrow-candidates]
     Set intersection using predicate        \\[icicle-narrow-candidates-with-predicate]
       Save current predicate to a variable  \\[icicle-save-predicate-to-variable]
       Insert string variable as input       \\[icicle-insert-string-from-variable]

 * Adjust Icicles options incrementally on the fly (uses Do Re Mi).
     `icicle-candidate-width-factor'         \\[icicle-doremi-candidate-width-factor]
     `icicle-inter-candidates-min-spaces'    \\[icicle-doremi-inter-candidates-min-spaces]

Remember: You can always input any character (e.g. \\[icicle-prefix-complete]) that is bound
          to a command by preceding it with \\&lt;global-map&gt;\\[quoted-insert].

Though it has no direct connection with completion, you can use \
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-pp-eval-expression-in-minibuffer]'
in the minibuffer at any time to evaluate an Emacs-Lisp expression.
This calls `icicle-pp-eval-expression-in-minibuffer', which displays
the result in the echo area or a popup buffer, *Pp Eval Output*.
It also provides some of the Emacs-Lisp key bindings during expression
editing.</span>"
             icicle-highlight-historical-candidates-flag
             icicle-transform-function
             (and icicle-sort-function (car (rassoc icicle-sort-function
                                                    icicle-sort-functions-alist)))
             (and icicle-alternative-sort-function
                  (car (rassoc icicle-sort-function
                               icicle-sort-functions-alist)))
             (not case-fold-search)
             icicle-regexp-quote-flag
             icicle-incremental-completion-flag
             icicle-expand-input-to-common-match-flag
             icicle-hide-common-match-in-Completions-flag
             (car (rassq icicle-apropos-complete-match-fn
                         icicle-apropos-match-fns-alist))
             icicle-fuzzy-completion-flag
             icicle-add-proxy-candidates-flag
             icicle-key-descriptions-use-&lt;&gt;-flag
             (and completion-ignored-extensions t)
             icicle-test-for-remote-files-flag
             icicle-ignore-space-prefix-flag
             icicle-use-C-for-actions-flag
             icicle-use-~-for-home-dir-flag
             icicle-search-highlight-all-current-flag
             icicle-search-whole-word-flag
             icicle-search-cleanup-flag                
             icicle-search-replace-whole-candidate-flag
             icicle-search-replace-common-match-flag)
     icicle-general-help-string
     "<span class="quote"> 

These are all of the minibuffer bindings during completion:

\\{minibuffer-local-completion-map}</span>"))))

(defun icicle-help-string-non-completion ()
  "<span class="quote">Description of Icicles minibuffer bindings when not completing input.</span>"
  (icicle-S-iso-lefttab-to-S-TAB
   (substitute-command-keys
    (concat "<span class="quote">\\&lt;minibuffer-local-completion-map&gt;\
              Icicles Minibuffer Input when Not Completing
              --------------------------------------------

These are the main Icicles minibuffer key bindings when completion is
not available:

 * Show this help.                           \\[icicle-minibuffer-help]

 * Abandon your input.                       \\[icicle-abort-recursive-edit]

 * Commit your input to Emacs.               RET

 * Modify your input.
     Edit your input                         (just edit in minibuffer)
     Erase your input (clear minibuffer)     \\[icicle-erase-minibuffer-or-history-element]
     Yank text at cursor into minibuffer     \\[icicle-insert-string-at-point]
     Insert text (string) from a variable    \\[icicle-insert-string-from-variable]
     Insert previously entered input         \\[icicle-insert-history-element]

 * Choose a previous input from the minibuffer history.
     Complete to insert a previous input     \\[icicle-insert-history-element]
     Cycle among minibuffer history items    \\[next-history-element], \
\\[previous-history-element]
     Search among minibuffer history items   \
\\[next-matching-history-element], \\[previous-matching-history-element]

 * Delete history entries
     Delete current entry (cycling)          \\[icicle-erase-minibuffer-or-history-element]
     Delete any or all entries               \\[icicle-clear-current-history]

 * Evaluate an Emacs-Lisp sexp on the fly    \\[icicle-pp-eval-expression-in-minibuffer]

Remember: You can always input any character that is bound to a
          command by preceding it with \\&lt;global-map&gt;\\[quoted-insert].</span>"
            icicle-general-help-string

            "<span class="quote"> 
These are the minibuffer bindings when not completing input:

\\{minibuffer-local-map}</span>"))))

(when (and (&gt; emacs-major-version 21)
           (require 'help-mode nil t) (get 'help-xref 'button-category-symbol)) <span class="linecomment">; In `button.el'</span>
  (define-button-type 'icicle-help-button
      :supertype 'help-xref
      'help-function #'(lambda () (browse-url "<span class="quote">http://www.emacswiki.org/cgi-bin/wiki/Icicles</span>"))
      'help-echo
      (purecopy "<span class="quote">mouse-2, RET: Icicles documentation on the Emacs Wiki (requires Internet access)</span>"))
  (define-button-type 'icicle-commentary1-button
      :supertype 'help-xref
      'help-function #'(lambda ()
                         (finder-commentary "<span class="quote">icicles-doc1</span>")
                         (when (require 'linkd nil t) (linkd-mode 1))
                         (when (require 'fit-frame nil t) (fit-frame)))
      'help-echo (purecopy "<span class="quote">mouse-2, RET: Icicles documentation, Part 1 (no Internet needed)</span>"))
  (define-button-type 'icicle-commentary2-button
      :supertype 'help-xref
      'help-function #'(lambda ()
                         (finder-commentary "<span class="quote">icicles-doc2</span>")
                         (when (require 'linkd nil t) (linkd-mode 1))
                         (when (require 'fit-frame nil t) (fit-frame)))
      'help-echo (purecopy "<span class="quote">mouse-2, RET: Icicles documentation, Part 2 (no Internet needed)</span>"))
  (define-button-type 'icicle-customize-button
      :supertype 'help-xref
      'help-function #'(lambda () (customize-group-other-window 'Icicles))
      'help-echo (purecopy "<span class="quote">mouse-2, RET: Customize/Browse Icicles Options & Faces</span>")))


<span class="linecomment">;; This is just the macro expansion of the following:</span>
<span class="linecomment">;; `(def-completion-wrapper icicle-abort-recursive-edit :minibuffer-separator)'.</span>
<span class="linecomment">;; Taken from the definition of `def-completion-wrapper' in `completion.el'.</span>
(put 'icicle-abort-recursive-edit 'completion-function 'use-completion-minibuffer-separator)
<span class="linecomment">;;;###autoload</span>
(defun icicle-abort-recursive-edit ()   <span class="linecomment">; Bound to `C-]', `C-g' in minibuf, `C-g',`q' in *Completions*</span>
  "<span class="quote">Abort command that requested this recursive edit or minibuffer input.
This calls `abort-recursive-edit' after killing the *Completions*
buffer or (if called from the minibuffer) removing its window.

By default, Icicle mode remaps all key sequences that are normally
bound to `abort-recursive-edit' to `icicle-abort-recursive-edit'.  If
you do not want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive)
  (if (not (active-minibuffer-window))
      (when (get-buffer "<span class="quote">*Completions*</span>") (kill-buffer (get-buffer "<span class="quote">*Completions*</span>")))
    (icicle-remove-Completions-window))
  (abort-recursive-edit))

(defun icicle-ensure-overriding-map-is-bound ()
  "<span class="quote">Set `overriding-terminal-local-map' to `icicle-universal-argument-map'.</span>"
  (if (not (boundp 'overriding-map-is-bound)) <span class="linecomment">; Emacs 20, 21.</span>
      (setq overriding-terminal-local-map  icicle-universal-argument-map)
    (unless overriding-map-is-bound     <span class="linecomment">; Emacs 22</span>
      (setq saved-overriding-map           overriding-terminal-local-map
            overriding-terminal-local-map  icicle-universal-argument-map
            overriding-map-is-bound        t))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-digit-argument (arg) <span class="linecomment">; Bound to `C-&lt;0-9&gt;', `M-&lt;0-9&gt;', `C-M-&lt;0-9&gt;' in minibuffer.</span>
  "<span class="quote">`digit-argument', but also echo the prefix.</span>"
  (interactive "<span class="quote">P</span>")
  (let* ((char   (if (integerp last-command-char)
                     last-command-char
                   (get last-command-char 'ascii-character)))
         (digit  (- (logand char ?\177) ?0)))
    (cond ((integerp arg)
           (setq prefix-arg  (+ (* arg 10) (if (&lt; arg 0) (- digit) digit))))
          ((eq arg '-)
           <span class="linecomment">;; Treat -0 as just -, so that -01 will work.</span>
           (setq prefix-arg  (if (zerop digit) '- (- digit))))
          (t
           (setq prefix-arg  digit))))
  (setq universal-argument-num-events  (length (this-command-keys)))
  (icicle-ensure-overriding-map-is-bound)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-negative-argument (arg) <span class="linecomment">; Bound to `M--', `C-M--' in minibuffer.</span>
  "<span class="quote">`negative-argument', but also echo the prefix.</span>"
  (interactive "<span class="quote">P</span>")
  (cond ((integerp arg) (setq prefix-arg  (- arg)))
        ((eq arg '-) (setq prefix-arg  nil))
        (t (setq prefix-arg  '-)))
  (setq universal-argument-num-events  (length (this-command-keys)))
  (icicle-ensure-overriding-map-is-bound)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-universal-argument ()    <span class="linecomment">; Bound to `C-u' in minibuffer.</span>
  "<span class="quote">`universal-argument', but also echo the prefix.</span>"
  (interactive)
  (setq prefix-arg                     (list 4)
        universal-argument-num-events  (length (this-command-keys)))
  (icicle-ensure-overriding-map-is-bound)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-universal-argument-more (arg)
  "<span class="quote">`universal-argument-more', but also echo the prefix.</span>"
  (interactive "<span class="quote">P</span>")
  (universal-argument-more arg)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-universal-argument-other-key (arg)
  "<span class="quote">`universal-argument-other-key', but also echo the prefix.</span>"
  (interactive "<span class="quote">P</span>")
  (universal-argument-other-key arg)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-universal-argument-minus (arg)
  "<span class="quote">`universal-argument-minus', but also echo the prefix.</span>"
  (interactive "<span class="quote">P</span>")
  (universal-argument-minus arg)
  (icicle-msg-maybe-in-minibuffer "<span class="quote">prefix %S</span>" prefix-arg))

(defun icicle-retrieve-next-input (&optional arg <span class="linecomment">; Bound to `C-S-l' (`C-L') in minibuffer.</span>
                                   dont-complete-p)
  "<span class="quote">Retrieve next minibuffer input.  Like
`icicle-retrieve-previous-input', but traverses history toward the
present.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-retrieve-next-input]').</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-retrieve-previous-input arg dont-complete-p 'interactive-p))

(defun icicle-retrieve-previous-input (&optional arg <span class="linecomment">; Bound to `C-l' in minibuffer.</span>
                                       dont-complete-p reversep)
  "<span class="quote">Retrieve previous minibuffer input.
The possible inputs were not necessarily those entered with `RET'.
With a negative prefix arg, this just empties the completion history.
Otherwise:
 Use completion if `icicle-C-l-uses-completion-flag' is non-nil and no
   prefix arg is used, or if it is nil and a prefix arg is used, or if
   `icicle-retrieve-previous-input' is not used interactively.
 Otherwise, just cycle to the previous input.

Non-interactive arguments:
 Non-nil REVERSEP flips the direction to next from previous.
 Non-nil DONT-COMPLETE-P means don't perform completion at the end.

You can use this command only from buffer *Completions or from the
minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-retrieve-previous-input]').</span>"
  (interactive "<span class="quote">P</span>")
  (let ((interactive-p       (or (interactive-p) (eq reversep 'interactive-p)))
        (prev-inputs-var     (if (icicle-file-name-input-p)
                                 'icicle-previous-raw-file-name-inputs
                               'icicle-previous-raw-non-file-name-inputs))
        <span class="linecomment">;; `irpi-was-cycling-p' is used to remember, for the second `C-l' in a row, that the first</span>
        <span class="linecomment">;; `C-l' came after cycling.  In that case, the second `C-l' restores the current raw input.</span>
        (irpi-was-cycling-p  icicle-cycling-p))
    (when interactive-p (icicle-barf-if-outside-Completions-and-minibuffer))
    (cond ((wholenump (prefix-numeric-value arg))
           (let ((input  "<span class="quote"></span>"))
             (save-selected-window
               (select-window (minibuffer-window))
               (icicle-clear-minibuffer)
               (let ((prev-inputs  (symbol-value prev-inputs-var)))
                 (setq input
                       (if (and interactive-p (or (and icicle-C-l-uses-completion-flag (not arg))
                                                  (and (not icicle-C-l-uses-completion-flag) arg)))
                           (let ((icicle-whole-candidate-as-text-prop-p   nil)
                                 (enable-recursive-minibuffers            t)
                                 (icicle-show-Completions-initially-flag  t))
                             (prog1 (completing-read
                                     "<span class="quote">Retrieve input: </span>" (mapcar #'list prev-inputs) nil t)
                               (setq icicle-last-input  nil)))
                         (if (or (not interactive-p)
                                 (not (memq last-command '(icicle-retrieve-next-input
                                                           icicle-retrieve-previous-input))))
                             <span class="linecomment">;; We use this one, to exclude common-match expansions from completion</span>
                             <span class="linecomment">;; history, and to save the typed input only when you complete.</span>
                             (if icicle-cycling-p icicle-last-input icicle-current-raw-input)

                           <span class="linecomment">;; You can use this one instead, if you want to include common-match</span>
                           <span class="linecomment">;; expansions and save the typed input even when you don't complete.</span>
                           <span class="linecomment">;; (or icicle-last-input icicle-current-raw-input)</span>
                           
                           (let ((next  (member icicle-current-raw-input prev-inputs)))
                             (unless next (setq next  prev-inputs))
                             (if reversep
                                 (or (let ((res     ())
                                           (inputs  prev-inputs))
                                       (while (and (consp inputs) (not (eq inputs next)))
                                         (push (pop inputs) res))
                                       (car res))
                                     (car (last prev-inputs)))
                               <span class="linecomment">;; If we were cycling before the first `C-l', then need to pick up the</span>
                               <span class="linecomment">;; current raw input.  Otherwise, we need to pick up the previous one.</span>
                               (prog1 (if irpi-was-cycling-p (car next) (cadr next))
                                 (setq irpi-was-cycling-p  nil))))))) <span class="linecomment">; So third `C-l' acts normally.</span>
                 (when input
                   (setq icicle-current-raw-input  input)
                   (insert input)
                   (icicle-highlight-initial-whitespace input) <span class="linecomment">; (e.g. user typo).</span>
                   (icicle-place-cursor input))))
             (unless dont-complete-p
               (let ((icicle-edit-update-p  t))
                 (funcall (or icicle-last-completion-command 'icicle-apropos-complete))
                 <span class="linecomment">;; Restore raw input.  Cycling resets it to "", so `icicle-save-or-restore-input'</span>
                 <span class="linecomment">;; doesn't use out-of-date raw input (cycling does not necessarily follow completion</span>
                 <span class="linecomment">;; or completion of the same kind).</span>
                 (setq icicle-current-raw-input  input)))
             (setq icicle-last-input  nil <span class="linecomment">; So `TAB' will expand it - `icicle-save-or-restore-input'.</span>
                   icicle-cycling-p   irpi-was-cycling-p))) <span class="linecomment">; Let next `C-l' know the state.</span>
          (t
           (set prev-inputs-var nil)
           (setq icicle-current-raw-input  "<span class="quote"></span>")
           (icicle-msg-maybe-in-minibuffer "<span class="quote">Cleared completion history</span>")))))

<span class="linecomment">;; $$ No longer bound.  Now we bind `icicle-retrieve-previous-input', instead, to `C-l'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-retrieve-last-input ()
  "<span class="quote">Put the last real input into the minibuffer.
Use this to replace a completion candidate inserted during cycling.
If `icicle-expand-input-to-common-match-flag' is non-nil or this is
prefix completion, then using this once restores the expanded common
match string, and using it twice in succession restores your original
input.

You can use this command only from buffer *Completions or from the
minibuffer.</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (save-selected-window
    (select-window (minibuffer-window))
    (icicle-clear-minibuffer)
    (if (and (or icicle-expand-input-to-common-match-flag (eq icicle-current-completion-mode 'prefix))
             (eq last-command 'icicle-retrieve-last-input))
        (insert icicle-current-raw-input)
      (insert icicle-current-input))
    <span class="linecomment">;;$$$ (when (interactive-p) (setq icicle-last-completion-command  nil))</span>
    (let ((input  (if (and (or icicle-expand-input-to-common-match-flag
                               (eq icicle-current-completion-mode 'prefix))
                           (eq last-command this-command))
                      icicle-current-raw-input
                    icicle-current-input)))
      (icicle-highlight-initial-whitespace input) <span class="linecomment">; Highlight initial whitespace (e.g. user typo).</span>
      (icicle-place-cursor input)))
  (deactivate-mark))

<span class="linecomment">;; $$ No longer used.  It was originally used in `icicle-retrieve-last-input'.</span>
(defun icicle-insert-input (input)
  "<span class="quote">Insert INPUT.  Prepend the directory if appropriate.</span>"
  (insert (if (and (icicle-file-name-input-p) insert-default-directory
                   (or (not (member input icicle-extra-candidates))
                       icicle-extra-candidates-dir-insert-p))
              (icicle-expand-file-name input (file-name-directory input))
            input)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-history-element () <span class="linecomment">; Bound to `M-o' in the minibuffer.</span>
  "<span class="quote">Use completion to insert a previously entered input in the minibuffer.
Always available for any minibuffer input, not just during completion.</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (when (and (boundp minibuffer-history-variable) (consp (symbol-value minibuffer-history-variable)))
    (let ((enable-recursive-minibuffers  t))
      (insert (icicle-completing-read-history "<span class="quote">Choose input: </span>" minibuffer-history-variable))))
  (when (and icicle-mode (memq icicle-default-value '(preselect-start preselect-end)))
    (icicle-select-minibuffer-contents)
    (setq deactivate-mark  nil)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-string-at-point (&optional arg) <span class="linecomment">; Bound to `M-.' in minibuffer.</span>
  "<span class="quote">Insert text at the cursor into the minibuffer.
Each time this command is called, some text at or near the cursor is
inserted into the minibuffer.  One of two things happens, depending on
the value of option `icicle-default-thing-insertion' and whether or
not you use `C-u'.

`icicle-thing-at-point-functions' is a cons of two parts - call them
ALTERNATIVES and FORWARD-THING.

If ALTERNATIVES is not nil and one of the following is true:
 - FORWARD-THING is nil
 - the value of `icicle-default-thing-insertion' is `alternatives' and
   you have not used `C-u' (without #) in this series of `M-.'
 - the value of `icicle-default-thing-insertion' is `more-of-the-same'
   and you have used `C-u' (without #) in this series of `M-.'
then the next function in ALTERNATIVES is used to retrieve the text to
be inserted.

If FORWARD-THING is not nil and one of the following is true:
 - ALTERNATIVES is nil
 - the value of `icicle-default-thing-insertion' is `more-of-the-same'
   and you have not used `C-u' in this series of `M-.'
 - the value of `icicle-default-thing-insertion' is `alternatives' and
   you have used `C-u' in this series of `M-.'
then function FORWARD-THING is used to retrieve the text to be
inserted.

If `C-u' is used with a numeric argument (not just plain `C-u'), then
function FORWARD-THING is used to retrieve the text to be inserted,
and the argument determines the number of things to grab.  It also
determines the direction of thing-grabbing: A negative argument grabs
text to the left of the cursor; a positive argument grabs text to the
right.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-at-point]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (when (consp icicle-thing-at-point-functions) <span class="linecomment">; Option should always be a cons cell.</span>
    (unless (eq last-command this-command) (setq icicle-default-thing-insertion-flipped-p  nil))
    (let ((alt-fns       (car icicle-thing-at-point-functions))
          (fwd-thing-fn  (cdr icicle-thing-at-point-functions))
          (flipped       (or icicle-default-thing-insertion-flipped-p <span class="linecomment">; Already flipped.</span>
                             (setq icicle-default-thing-insertion-flipped-p
                                   (if (eq 'alternatives icicle-default-thing-insertion)
                                       arg <span class="linecomment">; Either `C-u' or `C-u 3' flips it for `alternatives'.</span>
                                     (consp arg)))))) <span class="linecomment">; Only `C-u' flips it for `more-of-the-same'.</span>
      (cond
        <span class="linecomment">;; Use alternative text-grabbing functions successively.</span>
        ((and alt-fns (or (if (eq 'alternatives icicle-default-thing-insertion)
                              (not flipped) <span class="linecomment">; Normal behavior for `alternatives'.</span>
                            flipped)    <span class="linecomment">; Flipped behavior for `more-of-the-same'.</span>
                          (not fwd-thing-fn))) <span class="linecomment">; No alternative.</span>
         (setq icicle-successive-grab-count  1 <span class="linecomment">; In this mode, reset other mode's accumulator.</span>
               icicle-thing-at-pt-fns-pointer
               (if (eq last-command this-command) <span class="linecomment">; If repeated, get next text-grabbing function.</span>
                   (mod (1+ icicle-thing-at-pt-fns-pointer) (length alt-fns))
                 0))
         (let ((thing   "<span class="quote"></span>")
               (alt-fn  (nth icicle-thing-at-pt-fns-pointer alt-fns)))
           (save-excursion (set-buffer icicle-pre-minibuffer-buffer)
                           (setq thing  (funcall alt-fn)))
           (setq thing  (or thing "<span class="quote">nil</span>"))
           (icicle-insert-thing thing)
           (icicle-msg-maybe-in-minibuffer (format "<span class="quote">`%s'</span>" alt-fn))))

        <span class="linecomment">;; Use same text-grabbing function successively.</span>
        ((and fwd-thing-fn (or (if (eq 'alternatives icicle-default-thing-insertion)
                                   flipped <span class="linecomment">; Flipped behavior for `alternatives'.</span>
                                 (not flipped)) <span class="linecomment">; Normal behavior for `more-of-the-same'.</span>
                               (not alt-fns))) <span class="linecomment">; No alternative.</span>
         (if (and arg (atom arg))

             <span class="linecomment">;; Explicit numeric arg.  If it doesn't change direction, then increment</span>
             <span class="linecomment">;; existing count.  Otherwise, set count absolutely.</span>
             (if (eq last-command this-command)
                 (if (= (icicle-signum icicle-successive-grab-count) <span class="linecomment">; Repeated `M-.'.</span>
                        (icicle-signum (prefix-numeric-value arg)))
                     (setq icicle-successive-grab-count <span class="linecomment">; Same direction - increment count.</span>
                           (* (icicle-signum icicle-successive-grab-count)
                              (+ (abs icicle-successive-grab-count)
                                 (abs (prefix-numeric-value arg)))))
                   (setq icicle-successive-grab-count  (prefix-numeric-value arg))) <span class="linecomment">; New dir - set.</span>
               (setq icicle-successive-grab-count  (prefix-numeric-value arg))) <span class="linecomment">; First `M-.' - set.</span>

           <span class="linecomment">;; No explicit numeric arg.</span>
           <span class="linecomment">;; If first `M-.' or plain `C-u', set count. Otherwise, increment count.</span>
           (if (eq last-command this-command)
               (setq icicle-successive-grab-count <span class="linecomment">; Repeated `M-.'.</span>
                     (if (consp arg)
                         <span class="linecomment">;; We're here from plain `C-u' with `alternatives' - use 1, not 4.</span>
                         (if (wholenump icicle-successive-grab-count) 1 -1)
                       (if (wholenump icicle-successive-grab-count) <span class="linecomment">; Increment count.</span>
                           (+ icicle-successive-grab-count (abs (prefix-numeric-value arg)))
                         (- icicle-successive-grab-count (abs (prefix-numeric-value arg))))))
             (setq icicle-successive-grab-count  1))) <span class="linecomment">; First `M-.' - reset count.</span>
         (let ((things  "<span class="quote"></span>"))
           (save-excursion
             (set-buffer (cadr (buffer-list)))
             (setq things  (buffer-substring-no-properties
                            (point)
                            (save-excursion (funcall fwd-thing-fn icicle-successive-grab-count)
                                            (point)))))
           (icicle-insert-thing things)))))))

(defun icicle-signum (num)
  "<span class="quote">Return 1 if NUM is positive, -1 if negative, 0 if zero.</span>"
  (cond ((&lt; num 0) -1) ((&gt; num 0) 1) (t 0)))

(defun icicle-insert-thing (text &optional no-replace-p)
  "<span class="quote">Insert TEXT in the minibuffer.
TEXT replaces the last text that was inserted, if this command repeats
the last and NO-REPLACE-P is nil.</span>"
  (when (and (stringp text) (not (string= "<span class="quote"></span>" text)))
    (remove-text-properties 0 (length text) '(face nil) text)
    (when (and (eq last-command this-command) (not no-replace-p)
               icicle-insert-string-at-pt-start) <span class="linecomment">; Ensure that we've defined the ends.</span>
      (delete-region icicle-insert-string-at-pt-start icicle-insert-string-at-pt-end))
    (setq icicle-insert-string-at-pt-start  (point))
    (insert text)
    (setq icicle-insert-string-at-pt-end  (point))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-string-from-variable (askp) <span class="linecomment">; Bound to `C-=' in the minibuffer.</span>
  "<span class="quote">Insert text into the minibuffer from a variable.
By default, the variable is user option `icicle-input-string'.
To insert from a different variable, use a prefix argument; you are
then prompted for the variable to use.  You can use command
`icicle-save-string-to-variable' to save a string to a variable.
Typically, you store a regexp or part of a regexp in the variable.
This command is bound in the minibuffer to `C-=', by default.
This is especially useful when used with command `icicle-search'.

Some regexps that you might want to assign to variables:

 \"[A-Za-z0-9_.-]+@[A-Za-z0-9_.-]+\"          ; Email address
 \"\\\\([0-9]+\\\.[0-9]+\\\.[0-9]+\\\.[0-9]+\\\\)\"     ; IP address
 \"[0-9]\\\\\\\={4\\\\}-[0-9]\\\\\\\={2\\\\}-[0-9]\\\\\\\={2\\\\}\"   ; Date: 2006-04-14, Time:
 \"^[ \\\=\\t]*[0-9]?[0-9]\\\\([:.]?[0-9][0-9]\\\\)?\\\\(am\\\\|pm\\\\|AM\\\\|PM\\\\)?\"
 \"`\\\\(\\\\sw\\\\sw+\\\\)'\"                        ; Words inside `_'
 \"\\\\*.*\\\\*\"                                 ; Special buffer name: *_*

Standard Emacs Lisp libraries are full of regexps that you can assign
to variables for use with `C-='.
 See `align.el' for regexps for programming languages.
 See `url-dav.el' for regexps matching iso8601 dates.
 See `rmail.el', `sendmail.el', and `mh-show.el' for regexps matching
 mail-header fields.

Imenu regexps occurring as parts of different values of
`imenu-generic-expression' for different buffer types can be used as
variable values for `C-='.  They all work fine with `icicle-search',
turning it into a browser or navigator for the given mode.

See, for example, `generic-x.el' and `lisp-mode.el'.  Here is a regexp
for Javascript function definitions from `generic-x.el':

 \"^function\\\\s-+\\\\([A-Za-z0-9_]+\\\\)\"

And `lisp-imenu-generic-expression' (in `lisp-mode.el') provides
regexps for Lisp function, variable, and type definitions.  Here is
the variable-definition regexp:

 \"^\\\\s-*(\\\\(def\\\\(c\\\\(onst\\\\(ant\\\\)?\\\\|ustom\\\\)\\\\|ine-symbol-macro\\\\|
 parameter\\\\|var\\\\)\\\\)\\\\s-+\\\\(\\\\(\\\\sw\\\\|\\\\s_\\\\)+\\\\)\"

Command `icicle-imenu' exploits this to automatically let you browse
definitions.  It is a specialization of `icicle-search' for Imenu.

For more useful regexps, grep for `font-lock-keywords' in Emacs `lisp'
directory and subdirs.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-from-variable]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (save-selected-window
    (select-window (minibuffer-window))
    (if askp
        (let* ((icicle-whole-candidate-as-text-prop-p  nil)
               (enable-recursive-minibuffers           t)
               (var
                (intern
                 (completing-read
                  "<span class="quote">Insert text from variable: </span>"
                  (mapcar  #'list
                           (mapcar 'symbol-name
                                   '(adaptive-fill-first-line-regexp adaptive-fill-regexp
                                     add-log-current-defun-header-regexp
                                     ange-ftp-gateway-prompt-pattern allout-bullets-string
                                     allout-line-boundary-regexp allout-regexp
                                     comment-start-skip comment-end comint-prompt-regexp
                                     ffap-url-regexp find-face-regexp find-function-regexp
                                     find-variable-regexp imenu-example--function-name-regexp-c
                                     org-plain-time-of-day-regexp outline-heading-end-regexp
                                     outline-line-boundary-regexp outline-plain-bullets-string
                                     outline-regexp page-delimiter paragraph-separate paragraph-start
                                     rmail-mime-charset-pattern sentence-end shell-prompt-pattern
                                     telnet-prompt-pattern temp-file-name-pattern
                                     thing-at-point-url-regexp)))
                  (lambda (cand) (boundp (intern (car cand))))
                  nil nil (if (boundp 'variable-name-history)
                              'variable-name-history
                            'icicle-variable-name-history))))
               <span class="linecomment">;; Make sure we use the buffer-local value of the variable, if there is one.</span>
               (text
                (with-current-buffer (cadr (buffer-list)) (symbol-value var))))
          (icicle-insert-thing text 'no-replace))
      (icicle-insert-thing icicle-input-string 'no-replace))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-list-join-string () <span class="linecomment">; Bound to `C-M-j' in the minibuffer during completion.</span>
  "<span class="quote">Insert `icicle-list-join-string' in the minibuffer.</span>"
  (interactive)
  (icicle-insert-thing icicle-list-join-string 'no-replace)
  (let ((len  (length icicle-list-join-string)))
    (when (and (fboundp '1on1-fit-minibuffer-frame) <span class="linecomment">; Defined in `oneonone.el'.</span>
               (string= "<span class="quote">\C-j</span>" (substring icicle-list-join-string (1- len) len)))
      (1on1-fit-minibuffer-frame))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dispatch-M-q (&optional arg) <span class="linecomment">; Bound to `M-q' in the minibuffer.</span>
  "<span class="quote">Do the right thing for `M-q'.
If searching, call `icicle-toggle-search-whole-word'.
Otherwise, call `icicle-insert-key-description'.
Bound to `M-q' in the minibuffer.</span>"
  (interactive "<span class="quote">P</span>") <span class="linecomment">; Argument is ignored for `icicle-toggle-search-whole-word'.</span>
  (cond (icicle-searching-p (icicle-toggle-search-whole-word))
        (t (icicle-insert-key-description arg))))

(defalias 'toggle-icicle-search-whole-word 'icicle-toggle-search-whole-word)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-search-whole-word () <span class="linecomment">; Bound to `M-q' in the minibuffer.</span>
  "<span class="quote">Toggle the value of `icicle-search-whole-word-flag'.
The new value takes effect for the next Icicles search command.
Bound to `M-q' in the minibuffer when searching.</span>"
  (interactive)
  (setq icicle-search-whole-word-flag  (not icicle-search-whole-word-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-search-whole-word-flag
                                      "<span class="quote">Whole-word searching is now ON, starting with next search</span>"
                                    "<span class="quote">Whole-word searching is now OFF, starting with next search</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-key-description (toggle-angle-brackets-p) <span class="linecomment">; Bound to `M-q' in minibuffer.</span>
  "<span class="quote">Read key and insert its description.
For example, if the key read is ^F, then \"C-f\" is inserted.

`icicle-key-descriptions-use-&lt;&gt;-flag' determines whether angle
brackets (`&lt;', `&gt;') are used for named keys, such as function
keys, but a prefix argument reverses the meaning of
`icicle-key-descriptions-use-&lt;&gt;-flag'.

Bound to `M-q' in the minibuffer during key completion.</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let* ((enable-recursive-minibuffers  t)
         (key
          (progn (minibuffer-message "<span class="quote"> [Quoting key]</span>") (read-event))))
    (insert (single-key-description key (if toggle-angle-brackets-p
                                            icicle-key-descriptions-use-&lt;&gt;-flag
                                          (not icicle-key-descriptions-use-&lt;&gt;-flag))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-pp-eval-expression-in-minibuffer (insert-value) <span class="linecomment">; Bound to `M-:' in minibuffer.</span>
  "<span class="quote">Evaluate an Emacs-Lisp expression and pretty-print its value.
This just calls `pp-eval-expression' from a recursive minibuffer.</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (let ((enable-recursive-minibuffers  t))
    (call-interactively 'icicle-pp-eval-expression))
  (select-window (minibuffer-window))
  (select-frame-set-input-focus (selected-frame)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-newline-in-minibuffer (arg) <span class="linecomment">; Bound to `C-j' in minibuffer.</span>
  "<span class="quote">Insert a newline character (`C-j'), in the minibuffer.
Then, if `1on1-fit-minibuffer-frame' is defined, call it to fit a
standalone minibuffer frame to the new minibuffer contents.</span>"
  (interactive "<span class="quote">p</span>")
  (icicle-self-insert arg)
  (when (fboundp '1on1-fit-minibuffer-frame) (1on1-fit-minibuffer-frame)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-candidate-per-mode (&optional nth) <span class="linecomment">;; Bound to `icicle-modal-cycle-down-keys'</span>
                                                      <span class="linecomment">;; in minibuffer.</span>
  "<span class="quote">Replace input by NTH next completion candidate.
Default value of NTH is 1, meaning use the next candidate.
Negative NTH means use a previous, not subsequent, candidate.

Uses the next prefix or apropos completion command, depending on
`icicle-current-completion-mode'.  If that is nil and
`icicle-cycling-respects-completion-mode' is non-nil, uses the next
history element instead.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-candidate-per-mode]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (case icicle-current-completion-mode
    (prefix
     (setq this-command  'icicle-next-prefix-candidate)
     (icicle-next-prefix-candidate nth))
    (apropos
     (setq this-command  'icicle-next-apropos-candidate)
     (icicle-next-apropos-candidate nth))
    ((nil)
     (when icicle-cycling-respects-completion-mode
       (next-history-element (or nth 1))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-candidate-per-mode (&optional nth) <span class="linecomment">;; Bound to `icicle-modal-cycle-up-keys'</span>
                                                          <span class="linecomment">;; in minibuffer.</span>
  "<span class="quote">Replace input by NTH previous completion candidate.
Default value of NTH is 1, meaning use the previous candidate.
Negative NTH means use a subsequent, not previous, candidate.

Uses the previous prefix or apropos completion command, depending on
`icicle-current-completion-mode'. If that is nil and
`icicle-cycling-respects-completion-mode' is non-nil, uses the
previous history element instead.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-candidate-per-mode]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-next-candidate-per-mode (- (or nth 1))))


(put 'icicle-previous-prefix-candidate 'icicle-cycling-command t)
(put 'icicle-previous-prefix-candidate 'icicle-prefix-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-prefix-candidate (&optional nth) <span class="linecomment">; Bound to `C-p', `up' in minibuffer.</span>
  "<span class="quote">Replace input by NTH previous prefix completion for an input.
Default value of NTH is 1, meaning use the previous prefix completion.
Negative NTH means use a subsequent, not previous, prefix completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-prefix-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq nth  (or nth 1))
  (icicle-next-prefix-candidate (- nth)))


(put 'icicle-next-prefix-candidate 'icicle-cycling-command t)
(put 'icicle-next-prefix-candidate 'icicle-prefix-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-prefix-candidate (&optional nth) <span class="linecomment">; Bound to `down', `C-n' in minibuffer.</span>
  "<span class="quote">Replace input by NTH next prefix completion for an input.
Default value of NTH is 1, meaning use the next prefix completion.
Negative NTH means use a previous, not subsequent, prefix completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-prefix-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq icicle-current-completion-mode  'prefix)
  (icicle-next-candidate nth (if (icicle-file-name-input-p)
                                 'icicle-file-name-prefix-candidates
                               'icicle-prefix-candidates)))


(put 'icicle-previous-apropos-candidate 'icicle-cycling-command t)
(put 'icicle-previous-apropos-candidate 'icicle-apropos-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-apropos-candidate (&optional nth) <span class="linecomment">; Bound to `prior', `M-v' in minibuffer.</span>
  "<span class="quote">Replace input by NTH previous apropos completion for an input.
Default value of NTH is 1, meaning use the previous apropos completion.
Negative NTH means use a subsequent, not previous, apropos completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-apropos-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq nth  (or nth 1))
  (icicle-next-apropos-candidate (- nth)))


(put 'icicle-next-apropos-candidate 'icicle-cycling-command t)
(put 'icicle-next-apropos-candidate 'icicle-apropos-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-apropos-candidate (&optional nth) <span class="linecomment">; Bound to `next', `C-v' in minibuffer.</span>
  "<span class="quote">Replace input by NTH next apropos completion for an input.
Default value of NTH is 1, meaning use the next apropos completion.
Negative NTH means use a previous, not subsequent, apropos completion.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-apropos-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq icicle-current-completion-mode  'apropos)
  (icicle-next-candidate nth (if (icicle-file-name-input-p)
                                 'icicle-file-name-apropos-candidates
                               'icicle-apropos-candidates)
                         'regexp-p))

<span class="linecomment">;; Bound to `C-' `icicle-modal-cycle-up-keys' in minibuffer.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-candidate-per-mode-action (&optional nth)
  "<span class="quote">`icicle-previous-candidate-per-mode' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-candidate-per-mode'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-candidate-per-mode-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-candidate-per-mode #'icicle-candidate-action nth))

<span class="linecomment">;; Bound to `C-' `icicle-modal-cycle-down-keys' in minibuffer</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-candidate-per-mode-action (&optional nth)
  "<span class="quote">`icicle-next-candidate-per-mode' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-candidate-per-mode'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-candidate-per-mode-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-candidate-per-mode #'icicle-candidate-action nth))


(put 'icicle-previous-prefix-candidate-action 'icicle-cycling-command t)
(put 'icicle-previous-prefix-candidate-action 'icicle-prefix-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-prefix-candidate-action (&optional nth) <span class="linecomment">; Bound to `C-up', `M-{' in minibuf.</span>
  "<span class="quote">`icicle-previous-prefix-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-prefix-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-prefix-candidate #'icicle-candidate-action nth))


(put 'icicle-next-prefix-candidate-action 'icicle-cycling-command t)
(put 'icicle-next-prefix-candidate-action 'icicle-prefix-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-prefix-candidate-action (&optional nth) <span class="linecomment">; Bound to `C-down', `M-}' in minibuf.</span>
  "<span class="quote">`icicle-next-prefix-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-prefix-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-prefix-candidate #'icicle-candidate-action nth))


(put 'icicle-previous-apropos-candidate-action 'icicle-cycling-command t)
(put 'icicle-previous-apropos-candidate-action 'icicle-apropos-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-apropos-candidate-action (&optional nth) <span class="linecomment">; Bound to `C-prior', `C-x &gt;' in minib</span>
  "<span class="quote">`icicle-previous-apropos-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-apropos-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-apropos-candidate #'icicle-candidate-action nth))


(put 'icicle-next-apropos-candidate-action 'icicle-cycling-command t)
(put 'icicle-next-apropos-candidate-action 'icicle-apropos-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-apropos-candidate-action (&optional nth) <span class="linecomment">; Bound to `C-next', `C-x &lt;' in minibuffer</span>
  "<span class="quote">`icicle-next-apropos-candidate' and `icicle-candidate-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-apropos-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-apropos-candidate #'icicle-candidate-action nth))


(put 'icicle-previous-prefix-candidate-alt-action 'icicle-cycling-command t)
(put 'icicle-previous-prefix-candidate-alt-action 'icicle-prefix-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-prefix-candidate-alt-action (&optional nth) <span class="linecomment">; Bound to `C-S-up' in minibuffer.</span>
  "<span class="quote">`icicle-previous-prefix-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-prefix-candidate-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-prefix-candidate #'icicle-candidate-alt-action nth))


(put 'icicle-next-prefix-candidate-alt-action 'icicle-cycling-command t)
(put 'icicle-next-prefix-candidate-alt-action 'icicle-prefix-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-prefix-candidate-alt-action (&optional nth) <span class="linecomment">; Bound to `C-S-down' in minibuffer.</span>
  "<span class="quote">`icicle-next-prefix-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-prefix-candidate-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-prefix-candidate #'icicle-candidate-alt-action nth))


(put 'icicle-previous-apropos-candidate-alt-action 'icicle-cycling-command t)
(put 'icicle-previous-apropos-candidate-alt-action 'icicle-apropos-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-apropos-candidate-alt-action (&optional nth) <span class="linecomment">; Bound to `C-S-prior' in minibuf.</span>
  "<span class="quote">`icicle-previous-apropos-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-previous-apropos-candidate-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-apropos-candidate #'icicle-candidate-alt-action nth))


(put 'icicle-next-apropos-candidate-alt-action 'icicle-cycling-command t)
(put 'icicle-next-apropos-candidate-alt-action 'icicle-apropos-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-apropos-candidate-alt-action (&optional nth) <span class="linecomment">; Bound to `C-S-next' in minibuffer.</span>
  "<span class="quote">`icicle-next-apropos-candidate' and `icicle-candidate-alt-action'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-next-apropos-candidate-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-apropos-candidate #'icicle-candidate-alt-action nth))


(put 'icicle-help-on-previous-prefix-candidate 'icicle-cycling-command t)
(put 'icicle-help-on-previous-prefix-candidate 'icicle-prefix-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-help-on-previous-prefix-candidate (&optional nth) <span class="linecomment">; Bound to `C-M-up' in minibuf.</span>
  "<span class="quote">`icicle-previous-prefix-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-help-on-previous-prefix-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-prefix-candidate #'icicle-help-on-candidate nth))


(put 'icicle-help-on-next-prefix-candidate 'icicle-cycling-command t)
(put 'icicle-help-on-next-prefix-candidate 'icicle-prefix-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-help-on-next-prefix-candidate (&optional nth) <span class="linecomment">; Bound to `C-M-down' in minibuf.</span>
  "<span class="quote">`icicle-next-prefix-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-prefix-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-help-on-next-prefix-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-prefix-candidate #'icicle-help-on-candidate nth))


(put 'icicle-help-on-previous-apropos-candidate 'icicle-cycling-command t)
(put 'icicle-help-on-previous-apropos-candidate 'icicle-apropos-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-help-on-previous-apropos-candidate (&optional nth) <span class="linecomment">; Bound to `C-M-prior' in minibuf.</span>
  "<span class="quote">`icicle-previous-apropos-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-previous-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-help-on-previous-apropos-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-previous-apropos-candidate #'icicle-help-on-candidate nth))


(put 'icicle-help-on-next-apropos-candidate 'icicle-cycling-command t)
(put 'icicle-help-on-next-apropos-candidate 'icicle-apropos-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-help-on-next-apropos-candidate (&optional nth) <span class="linecomment">; Bound to `C-M-next' in minibuf.</span>
  "<span class="quote">`icicle-next-apropos-candidate' and `icicle-help-on-candidate'.
Option `icicle-act-before-cycle-flag' determines which occurs first.

Optional argument NTH is as for `icicle-next-apropos-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-help-on-next-apropos-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-successive-action #'icicle-next-apropos-candidate #'icicle-help-on-candidate nth))

(defun icicle-successive-action (nav-fn action-fn nth)
  "<span class="quote">Call NAV-FN and ACTION-FN.  Pass NTH to ACTION-FN.
Set `icicle-current-completion-mode'.  The order respects the setting
of `icicle-act-before-cycle-flag'.</span>"
  (setq icicle-current-completion-mode
        (if (get nav-fn 'icicle-apropos-cycling-command) 'apropos 'prefix))
  (cond (icicle-act-before-cycle-flag
         (save-excursion (save-selected-window (funcall action-fn))) (funcall nav-fn nth))
        (t
         (funcall nav-fn nth) (save-excursion (save-selected-window (funcall action-fn))))))


(put 'icicle-prefix-complete 'icicle-cycling-command t)
(put 'icicle-prefix-complete 'icicle-prefix-cycling-command t)
(put 'icicle-prefix-complete 'icicle-completing-command t)
(put 'icicle-prefix-complete 'icicle-prefix-completing-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-prefix-complete ()        <span class="linecomment">; Bound to `TAB' in minibuffer.</span>
  "<span class="quote">Complete the minibuffer contents as far as possible, as a prefix.
Repeat this to cycle among candidate completions.
If no characters can be completed, display the possible completions.
Candidate completions are appropriate names whose prefix is the
minibuffer input, where appropriateness is determined by the context
\(command, variable, and so on).
Return nil if there is no valid completion.
Otherwise, return the list of completion candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-prefix-complete-1))


(put 'icicle-prefix-complete-no-display 'icicle-cycling-command t)
(put 'icicle-prefix-complete-no-display 'icicle-prefix-cycling-command t)
(put 'icicle-prefix-complete-no-display 'icicle-completing-command t)
(put 'icicle-prefix-complete-no-display 'icicle-prefix-completing-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-prefix-complete-no-display (&optional no-msg-p) <span class="linecomment">; Bound to `C-M-TAB' in minibuffer.</span>
  "<span class="quote">Like `icicle-prefix-complete', but without displaying *Completions*.
Optional arg NO-MSG-P non-nil means do not show a minibuffer message
indicating that candidates were updated.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete-no-display]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-prefix-complete-1 (if no-msg-p 'no-msg 'no-display)))


(put 'icicle-prefix-word-complete 'icicle-cycling-command t)
(put 'icicle-prefix-word-complete 'icicle-prefix-cycling-command t)
(put 'icicle-prefix-word-complete 'icicle-completing-command t)
(put 'icicle-prefix-word-complete 'icicle-prefix-completing-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-prefix-word-complete ()   <span class="linecomment">; Bound to `M-SPC' in minibuffer.</span>
  "<span class="quote">Complete the minibuffer contents at most a single word.
Repeating this completes additional words.
Spaces and hyphens in candidates are considered word separators.
If only a single candidate matches, the input is completed entirely.
Return nil if there is no valid completion, else t.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-word-complete]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-prefix-complete-1 nil t))

<span class="linecomment">;;;###autoload</span>
(defun icicle-prefix-complete-1 (&optional no-display-p word-p)
  "<span class="quote">Helper function for `icicle-prefix-complete(-no-display)'.
Return the list of completion candidates.
Optional argument NO-DISPLAY-P non-nil means do not display buffer
 *Completions*.  If the value is `no-msg', then do not show any
  message either.  NO-DISPLAY-P is passed to
 `icicle-display-candidates-in-Completions' as its second arg.
Optional argument WORD-P non-nil means complete only a word at a time.</span>"
  (let ((ipc1-was-cycling-p  icicle-cycling-p))
    (setq icicle-current-input            (if (and icicle-last-input
                                                   icicle-cycling-p
                                                   (not icicle-edit-update-p)
                                                   (eq icicle-current-completion-mode 'prefix)
                                                   (or (not word-p) (eq this-command last-command))
                                                   (symbolp last-command) (get last-command
                                                                               'icicle-cycling-command)
                                                   icicle-completion-candidates)
                                              icicle-last-input
                                            (icicle-input-from-minibuffer))
          icicle-current-completion-mode  'prefix
          icicle-input-fail-pos           nil
          icicle-cycling-p                nil)
    (when (icicle-file-name-input-p)
      (setq icicle-current-input  (abbreviate-file-name (substitute-in-file-name
                                                         icicle-current-input))))
    (let ((word-complete-input      "<span class="quote"></span>")
          (input-before-completion  icicle-current-input)
          return-value)
      (unless (and (stringp icicle-current-input) (stringp icicle-last-input)
                   (string= icicle-current-input icicle-last-input)
                   (get last-command 'icicle-prefix-completing-command)
                   (not word-p))
        (unless (or icicle-edit-update-p (get-buffer-window "<span class="quote">*Completions*</span>" 0) no-display-p)
          (message "<span class="quote">Computing completion candidates...</span>"))
        (if (not word-p)
            (setq icicle-completion-candidates
                  (condition-case nil
                      (if (icicle-file-name-input-p)
                          (icicle-file-name-prefix-candidates icicle-current-input)
                        (icicle-prefix-candidates icicle-current-input))
                    (error icicle-completion-candidates))) <span class="linecomment">; No change if completion error.</span>
          <span class="linecomment">;; Complete a word.  Save input before trying to complete.</span>
          <span class="linecomment">;; Update `icicle-current-input': `minibuffer-complete-word' might have completed the input</span>
          <span class="linecomment">;; beyond a complete candidate - e.g. `forwar-char' to `forward-char-'.</span>
          (setq word-complete-input   (icicle-input-from-minibuffer)
                return-value
                (let ((temp-buffer-show-hook       nil) <span class="linecomment">; Don't let it fit frame here.</span>
                      (completion-auto-help        nil) <span class="linecomment">; Don't show *Completions*.</span>
                      (minibuffer-message-timeout  0)) <span class="linecomment">; No timeout.</span>
                  (icicle-clear-minibuffer)
                  (insert icicle-current-input)
                  (save-selected-window (minibuffer-complete-word)))
                icicle-current-input  (icicle-input-from-minibuffer)) <span class="linecomment">; Update input.</span>
          <span class="linecomment">;; If incremental compl., or completed some, or not repeated, then update input and recompute.</span>
          (when (or icicle-edit-update-p
                    (&gt; (length icicle-current-input) (length word-complete-input))
                    (not (eq this-command last-command)))
            (setq word-complete-input           icicle-current-input
                  icicle-completion-candidates  (condition-case nil
                                                    (if (icicle-file-name-input-p)
                                                        (icicle-file-name-prefix-candidates
                                                         icicle-current-input)
                                                      (icicle-prefix-candidates icicle-current-input))
                                                  (error icicle-completion-candidates)))))
        (message nil))                  <span class="linecomment">; Clear out "Computing completion candidates..." message.</span>
      <span class="linecomment">;; If input matches an empty directory, then use that directory as the sole completion.</span>
      (when (and (icicle-file-name-input-p) (null icicle-completion-candidates)
                 (string-match "<span class="quote">/$</span>" icicle-current-input)
                 (icicle-prefix-any-file-name-candidates-p (directory-file-name icicle-current-input)))
        (setq icicle-completion-candidates  '("<span class="quote"></span>")))
      (unless word-p (setq return-value  icicle-completion-candidates)) <span class="linecomment">; Word returns special value.</span>
      (icicle-save-or-restore-input)
      (cond ((null icicle-completion-candidates)
             (setq icicle-nb-of-other-cycle-candidates  0)
             (let ((icicle-incremental-completion-flag <span class="linecomment">; Upgrade if OK for explicit.</span>
                    (or (memq icicle-highlight-input-completion-failure
                              '(explicit-strict explicit explicit-remote))
                        icicle-incremental-completion-flag)))
               (icicle-highlight-input-noncompletion))
             (save-selected-window (icicle-remove-Completions-window))
             (unless (eq no-display-p 'no-msg)
               (minibuffer-message (if (and icicle-fuzzy-completion-flag (featurep 'fuzzy-match))
                                       "<span class="quote">  [No fuzzy completions]</span>"
                                     "<span class="quote">  [No prefix completions]</span>"))))
            ((null (cdr icicle-completion-candidates)) <span class="linecomment">; Single candidate.  Update minibuffer.</span>
             (setq icicle-nb-of-other-cycle-candidates  0)
             (unless icicle-edit-update-p
               (icicle-clear-minibuffer)
               (setq icicle-last-completion-candidate  (car icicle-completion-candidates))
               (let ((inserted  (if (and (icicle-file-name-input-p) insert-default-directory
                                         (or (not (member icicle-last-completion-candidate
                                                          icicle-extra-candidates))
                                             icicle-extra-candidates-dir-insert-p))
                                    (icicle-abbreviate-or-expand-file-name
                                     icicle-last-completion-candidate
                                     (icicle-file-name-directory-w-default icicle-current-input))
                                  icicle-last-completion-candidate)))
                 (insert inserted)
                 (when (and (icicle-file-name-input-p)
                            (icicle-file-directory-p (icicle-abbreviate-or-expand-file-name inserted)))
                   (setq icicle-default-directory  (icicle-abbreviate-or-expand-file-name inserted)))))
             (icicle-transform-sole-candidate)
             (unless (boundp 'icicle-prefix-complete-and-exit-p)
               (icicle-highlight-complete-input)
               (cond (icicle-top-level-when-sole-completion-flag
                      (set minibuffer-history-variable
                           (cons (car icicle-completion-candidates)
                                 (symbol-value minibuffer-history-variable)))
                      (condition-case icicle-prefix-complete-1
                          (throw 'icicle-read-top
                            (if (and (icicle-file-name-input-p) insert-default-directory
                                     (or (not (member (car icicle-completion-candidates)
                                                      icicle-extra-candidates))
                                         icicle-extra-candidates-dir-insert-p))
                                (expand-file-name (car icicle-completion-candidates))
                              (car icicle-completion-candidates)))
                        (no-catch (setq icicle-current-input  (car icicle-completion-candidates))
                                  (icicle-retrieve-last-input)
                                  icicle-current-input)
                        (error (message (error-message-string icicle-prefix-complete-1)))))
                     ((and icicle-edit-update-p (not (eq no-display-p 'no-msg)))
                      (minibuffer-message
                       (format (if (and icicle-fuzzy-completion-flag (featurep 'fuzzy-match))
                                   "<span class="quote">  [One fuzzy completion: %s]</span>"
                                 "<span class="quote">  [One prefix completion: %s]</span>")
                               (car icicle-completion-candidates))))
                     ((not (eq no-display-p 'no-msg))
                      (minibuffer-message
                       (if (and icicle-fuzzy-completion-flag (featurep 'fuzzy-match))
                           "<span class="quote">  [Sole fuzzy completion]</span>"
                         "<span class="quote">  [Sole prefix completion]</span>"))))
               (save-selected-window (icicle-remove-Completions-window))))
            (t                          <span class="linecomment">; Multiple candidates.</span>
             (if icicle-edit-update-p
                 (icicle-display-candidates-in-Completions nil no-display-p)
               (unless word-p
                 (icicle-clear-minibuffer)
                 (save-window-excursion
                   <span class="linecomment">;; Shouldn't need to explicitly select minibuffer like this, since `*Completions*'</span>
                   <span class="linecomment">;; input is directed there.  But there seems to be an Emacs bug somewhere, because</span>
                   <span class="linecomment">;; although using just `insert' inserts the input in the minibuffer OK, in some</span>
                   <span class="linecomment">;; cases the cursor might not follow the insertion.</span>
                   (select-window (active-minibuffer-window))
                   (insert icicle-current-input)))
               (deactivate-mark)
               (icicle-highlight-initial-whitespace icicle-current-input)
               (when (and (icicle-file-name-input-p)
                          (icicle-file-directory-p icicle-last-completion-candidate))
                 (setq icicle-default-directory  (icicle-abbreviate-or-expand-file-name
                                                  icicle-last-completion-candidate)))
               (when (member (icicle-upcase-if-ignore-case (icicle-minibuf-input-sans-dir
                                                            icicle-current-input))
                             (mapcar #'icicle-upcase-if-ignore-case icicle-completion-candidates))
                 (icicle-highlight-complete-input))
               (cond (<span class="linecomment">;; Candidates visible.  If second prefix complete, cycle, else update candidates.</span>
                      (get-buffer-window "<span class="quote">*Completions*</span>" 0)
                      (if (and (or ipc1-was-cycling-p icicle-next-prefix-complete-cycles-p)
                               (get icicle-last-completion-command 'icicle-prefix-completing-command)
                               (if word-p
                                   <span class="linecomment">;; Word completion cycles only if both of these are true:</span>
                                   <span class="linecomment">;; * Input is not yet complete (null `return-value').</span>
                                   <span class="linecomment">;; * Either last command was an edit and input does not end in `-',</span>
                                   <span class="linecomment">;;          or the current input is from cycling.</span>
                                   <span class="linecomment">;; E.g. `M-x fo M-SPC r M-SPC' cycles among foreground-color etc.</span>
                                   (and (not return-value)
                                        (or (and (not (get last-command
                                                           'icicle-prefix-completing-command))
                                                 (not (eq (aref icicle-current-input
                                                                (1- (length icicle-current-input)))
                                                          ?-)))
                                            (not (string= icicle-last-input word-complete-input))))
                                 (get last-command 'icicle-prefix-completing-command)))
                          <span class="linecomment">;; Second prefix complete in a row.  Cycle down.</span>
                          (icicle-next-candidate 1 (if (icicle-file-name-input-p)
                                                       'icicle-file-name-prefix-candidates
                                                     'icicle-prefix-candidates))
                        <span class="linecomment">;; User did something else (e.g. changed input).  Update the candidates.</span>
                        (icicle-display-candidates-in-Completions nil no-display-p)))
                     (<span class="linecomment">;; No candidates shown.  Could be first completion or could follow `C-M-(S-)TAB'.</span>
                      icicle-TAB-shows-candidates-flag
                      (if (not (and (or ipc1-was-cycling-p icicle-next-prefix-complete-cycles-p)
                                    (get icicle-last-completion-command
                                         'icicle-prefix-completing-command)
                                    (get last-command 'icicle-prefix-completing-command)
                                    (not word-p)))
                          <span class="linecomment">;; First prefix complete is enough to update candidates.</span>
                          (icicle-display-candidates-in-Completions nil no-display-p)
                        <span class="linecomment">;; Second prefix complete.  If `TAB', then it follows `C-M-TAB', so show window.</span>
                        (unless no-display-p (icicle-display-candidates-in-Completions nil))
                        (icicle-next-candidate 1 (if (icicle-file-name-input-p)
                                                     'icicle-file-name-prefix-candidates
                                                   'icicle-prefix-candidates))))
                     (<span class="linecomment">;; No candidates shown.  Second prefix complete.</span>
                      <span class="linecomment">;; If NO-DISPLAY-P and either not WORD-P or input is complete, then cycle down.</span>
                      <span class="linecomment">;; Else, vanilla Emacs: second `TAB' shows candidates.</span>
                      (and (get icicle-last-completion-command 'icicle-prefix-completing-command)
                           (get last-command 'icicle-prefix-completing-command)
                           completion-auto-help)
                      (if (or (not no-display-p) (and word-p (not return-value)))
                          (icicle-display-candidates-in-Completions nil)
                        (icicle-next-candidate 1 (if (icicle-file-name-input-p)
                                                     'icicle-file-name-prefix-candidates
                                                   'icicle-prefix-candidates))))
                     <span class="linecomment">;; Vanilla Emacs.  Input is complete, but exist other candidates with same prefix.</span>
                     ((and (member icicle-current-input icicle-completion-candidates)
                           (not (eq no-display-p 'no-msg)))
                      (minibuffer-message "<span class="quote">  [Complete, but not unique]</span>"))))))
      (setq icicle-last-completion-command
            (if word-p 'icicle-prefix-word-complete 'icicle-prefix-complete))
      (setq icicle-next-prefix-complete-cycles-p
            (equal input-before-completion (icicle-input-from-minibuffer)))
      return-value)))


(put 'icicle-apropos-complete 'icicle-cycling-command t)
(put 'icicle-apropos-complete 'icicle-apropos-cycling-command t)
(put 'icicle-apropos-complete 'icicle-completing-command t)
(put 'icicle-apropos-complete 'icicle-apropos-completing-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete ()       <span class="linecomment">; Bound to `S-TAB' in minibuffer.</span>
  "<span class="quote">Complete the minibuffer contents as far as possible.
Repeat this to cycle among candidate completions.
This uses \"apropos completion\", defined as follows:
A completion contains the minibuffer input somewhere, as a substring.
Display a list of possible completions in buffer *Completions*.
Candidate completions are appropriate names that match the current
input, taken as a regular expression, where appropriateness is
determined by the context (command, variable, and so on).
Return nil if there is no valid completion.
Otherwise, return the list of completion candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-apropos-complete]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let* ((error-msg  nil)
         (candidates
          (condition-case lossage
              (icicle-apropos-complete-1)
            (invalid-regexp
             (setq error-msg  (cadr lossage))
             (when (string-match "<span class="quote">\\`Premature \\|\\`Unmatched \\|\\`Invalid </span>" error-msg)
               (setq error-msg  "<span class="quote">incomplete input</span>")))
            (error (setq error-msg  (error-message-string lossage))))))
    (when error-msg (minibuffer-message (concat "<span class="quote">  </span>" error-msg)))
    candidates))


(put 'icicle-apropos-complete-no-display 'icicle-cycling-command t)
(put 'icicle-apropos-complete-no-display 'icicle-apropos-cycling-command t)
(put 'icicle-apropos-complete-no-display 'icicle-completing-command t)
(put 'icicle-apropos-complete-no-display 'icicle-apropos-completing-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete-no-display (&optional no-msg-p) <span class="linecomment">; Bound to `C-M-S-TAB' in minibuffer.</span>
  "<span class="quote">Like `icicle-apropos-complete', but without displaying *Completions*.
Optional arg NO-MSG-P non-nil means do not show a minibuffer message
indicating that candidates were updated.
You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-apropos-complete-no-display]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let* ((error-msg  nil)
         (candidates
          (condition-case lossage
              (icicle-apropos-complete-1 (if no-msg-p 'no-msg 'no-display))
            (invalid-regexp
             (setq error-msg  (cadr lossage))
             (when (string-match "<span class="quote">\\`Premature \\|\\`Unmatched \\|\\`Invalid </span>" error-msg)
               (setq error-msg  "<span class="quote">incomplete input</span>")))
            (error (setq error-msg  (error-message-string lossage))))))
    (when error-msg (minibuffer-message (concat "<span class="quote">  </span>" error-msg)))
    candidates))

(defun icicle-apropos-complete-1 (&optional no-display-p)
  "<span class="quote">Helper function for `icicle-apropos-complete(-no-display)'.
This does everything except deal with regexp-match errors.
Return the list of completion candidates.

Optional argument NO-DISPLAY-P non-nil means do not display buffer
*Completions*.  If the value is `no-msg', then do not show any
message either.  NO-DISPLAY-P is passed to
`icicle-display-candidates-in-Completions' as its second arg.</span>"
  (let ((iac1-was-cycling-p  icicle-cycling-p)
        input-before-completion)
    (setq icicle-current-input            (if (and icicle-last-input
                                                   icicle-cycling-p
                                                   (not icicle-edit-update-p)
                                                   (eq icicle-current-completion-mode 'apropos)
                                                   (symbolp last-command) (get last-command
                                                                               'icicle-cycling-command)
                                                   icicle-completion-candidates)
                                              icicle-last-input
                                            (icicle-input-from-minibuffer))
          icicle-current-completion-mode  'apropos        
          icicle-input-fail-pos           nil
          icicle-cycling-p                nil)
    (when (icicle-file-name-input-p)
      (setq icicle-current-input  (abbreviate-file-name
                                   (if icicle-regexp-quote-flag
                                       (substitute-in-file-name icicle-current-input)
                                     icicle-current-input))))
    (setq input-before-completion  icicle-current-input)
    (unless (or icicle-edit-update-p (get-buffer-window "<span class="quote">*Completions*</span>" 0) no-display-p)
      (message "<span class="quote">Computing completion candidates...</span>"))
    (unless (and (stringp icicle-current-input) (stringp icicle-last-input)
                 (string= icicle-current-input icicle-last-input)
                 (get last-command 'icicle-apropos-completing-command))
      (setq icicle-completion-candidates
            (condition-case nil
                (if (icicle-file-name-input-p)
                    (icicle-file-name-apropos-candidates icicle-current-input)
                  (icicle-apropos-candidates icicle-current-input))
              (error icicle-completion-candidates)))) <span class="linecomment">; No change if completion error.</span>
    <span class="linecomment">;; If input matches an empty directory, then use that directory as the sole completion.</span>
    (when (and (icicle-file-name-input-p) (null icicle-completion-candidates)
               (string-match "<span class="quote">/$</span>" icicle-current-input)
               (icicle-apropos-any-file-name-candidates-p (directory-file-name icicle-current-input)))
      (setq icicle-completion-candidates  '("<span class="quote"></span>")))
    (icicle-save-or-restore-input)
    (cond ((null icicle-completion-candidates)
           (setq icicle-nb-of-other-cycle-candidates  0)
           (let ((icicle-incremental-completion-flag <span class="linecomment">; Upgrade if OK for explicit.</span>
                  (or (memq icicle-highlight-input-completion-failure
                            '(explicit-strict explicit explicit-remote))
                      icicle-incremental-completion-flag)))
             (icicle-highlight-input-noncompletion))
           (save-selected-window (icicle-remove-Completions-window))
           (unless (eq no-display-p 'no-msg)
             (minibuffer-message (let ((typ  (car (rassq icicle-apropos-complete-match-fn
                                                         icicle-apropos-match-fns-alist))))
                                   (concat "<span class="quote">  [No </span>" typ (and typ "<span class="quote"> </span>") "<span class="quote">completion]</span>")))))
          ((null (cdr icicle-completion-candidates)) <span class="linecomment">; Single candidate. Update minibuffer.</span>
           (setq icicle-nb-of-other-cycle-candidates  0)
           (unless icicle-edit-update-p
             (icicle-clear-minibuffer)
             (setq icicle-last-completion-candidate  (car icicle-completion-candidates))
             (let ((inserted  (if (and (icicle-file-name-input-p) insert-default-directory
                                       (or (not (member icicle-last-completion-candidate
                                                        icicle-extra-candidates))
                                           icicle-extra-candidates-dir-insert-p))
                                  (icicle-abbreviate-or-expand-file-name
                                   icicle-last-completion-candidate
                                   (icicle-file-name-directory-w-default icicle-current-input))
                                icicle-last-completion-candidate)))
               (insert inserted)
               (when (and (icicle-file-name-input-p)
                          (icicle-file-directory-p (icicle-abbreviate-or-expand-file-name inserted)))
                 (setq icicle-default-directory  (icicle-abbreviate-or-expand-file-name
                                                  inserted)))))
           (save-selected-window (icicle-remove-Completions-window))
           (icicle-transform-sole-candidate)
           (unless (boundp 'icicle-apropos-complete-and-exit-p)
             (icicle-highlight-complete-input)
             (cond (icicle-top-level-when-sole-completion-flag
                    (set minibuffer-history-variable (cons (car icicle-completion-candidates)
                                                           (symbol-value minibuffer-history-variable)))
                    (condition-case icicle-apropos-complete-1
                        (throw 'icicle-read-top
                          (if (and (icicle-file-name-input-p) insert-default-directory
                                   (or (not (member (car icicle-completion-candidates)
                                                    icicle-extra-candidates))
                                       icicle-extra-candidates-dir-insert-p))
                              (expand-file-name (car icicle-completion-candidates))
                            (car icicle-completion-candidates)))
                      (no-catch (setq icicle-current-input  (car icicle-completion-candidates))
                                (icicle-retrieve-last-input)
                                icicle-current-input)
                      (error (message (error-message-string icicle-apropos-complete-1)))))
                   ((and icicle-edit-update-p (not (eq no-display-p 'no-msg)))
                    (minibuffer-message (format "<span class="quote">  [One apropos completion: %s]</span>"
                                                (car icicle-completion-candidates))))
                   ((not (eq no-display-p 'no-msg))
                    (minibuffer-message "<span class="quote">  [Sole apropos completion]</span>")))))
          (t                            <span class="linecomment">; Multiple candidates.</span>
           (if icicle-edit-update-p
               (icicle-display-candidates-in-Completions nil no-display-p)
             (icicle-clear-minibuffer)
             (insert icicle-current-input) <span class="linecomment">; Update minibuffer.</span>
             (deactivate-mark)
             (icicle-highlight-initial-whitespace icicle-current-input)
             (when (and (icicle-file-name-input-p)
                        (icicle-file-directory-p icicle-last-completion-candidate))
               (setq icicle-default-directory  (icicle-abbreviate-or-expand-file-name
                                                icicle-last-completion-candidate)))
             (when (member (icicle-upcase-if-ignore-case (icicle-minibuf-input-sans-dir
                                                          icicle-current-input))
                           (mapcar #'icicle-upcase-if-ignore-case icicle-completion-candidates))
               (icicle-highlight-complete-input))
             (cond (<span class="linecomment">;; Candidates already displayed.  If second `S-TAB', cycle, else update candidates.</span>
                    (get-buffer-window "<span class="quote">*Completions*</span>" 0)
                    (if (and
                         (or iac1-was-cycling-p icicle-next-apropos-complete-cycles-p)
                         (get icicle-last-completion-command 'icicle-apropos-completing-command)
                         (get last-command 'icicle-apropos-completing-command))
                        <span class="linecomment">;; Second `S-TAB' in a row.  Cycle down.</span>
                        (icicle-next-candidate 1 (if (icicle-file-name-input-p)
                                                     'icicle-file-name-apropos-candidates
                                                   'icicle-apropos-candidates)
                                               'regexp-p)
                      <span class="linecomment">;; User did something else (e.g. changed input).  (Possibly) update the display.</span>
                      (icicle-display-candidates-in-Completions nil no-display-p)))
                   (t
                    (if (not (and
                              (or iac1-was-cycling-p icicle-next-apropos-complete-cycles-p)
                              (get icicle-last-completion-command
                                   'icicle-apropos-completing-command)
                              (get last-command 'icicle-apropos-completing-command)))
                        (icicle-display-candidates-in-Completions nil no-display-p)
                      <span class="linecomment">;; Second apropos complete.  If `S-TAB', it follows `C-M-S-TAB', so show window.</span>
                      (unless no-display-p (icicle-display-candidates-in-Completions nil))
                      (icicle-next-candidate 1 (if (icicle-file-name-input-p)
                                                   'icicle-file-name-apropos-candidates
                                                 'icicle-apropos-candidates)
                                             'regexp-p)))))))
    (setq icicle-last-completion-command  'icicle-apropos-complete)
    (setq icicle-next-apropos-complete-cycles-p
          (equal input-before-completion (icicle-input-from-minibuffer)))
    icicle-completion-candidates))

(defun icicle-transform-sole-candidate ()
  "<span class="quote">Transform matching candidate according to `icicle-list-use-nth-parts'.</span>"
  (when icicle-list-use-nth-parts
    (let ((newcand  (icicle-transform-multi-completion (car icicle-completion-candidates))))
      (icicle-clear-minibuffer)
      (insert newcand)
      (setq icicle-completion-candidates      (list newcand)
            icicle-last-completion-candidate  newcand))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-switch-to-Completions-buf () <span class="linecomment">; Bound to `C-insert' in minibuffer.</span>
  "<span class="quote">Select the completion list window.
The cursor is placed on the first occurrence of the current minibuffer
content.  You can use \\&lt;completion-list-mode-map&gt;\
`\\[icicle-insert-completion]' to get back to the minibuffer.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-switch-to-Completions-buf]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (setq icicle-current-input  (icicle-input-from-minibuffer))
  (let ((window     (get-buffer-window "<span class="quote">*Completions*</span>" 0))
        (search-fn  'search-forward))
    (unless window                      <span class="linecomment">; Make sure we have a completions window.</span>
      (icicle-apropos-complete)
      (setq window     (get-buffer-window "<span class="quote">*Completions*</span>" 0)
            search-fn  're-search-forward)) <span class="linecomment">; Use regexp search: input is not yet complete.</span>
    (when window
      (select-window window)
      (let ((case-fold-search  (if (and (icicle-file-name-input-p)
                                        (boundp 'read-file-name-completion-ignore-case))
                                   read-file-name-completion-ignore-case
                                 completion-ignore-case)))
        (goto-char (icicle-start-of-candidates-in-Completions))
        (when (icicle-file-name-input-p)
          (setq icicle-current-input  (icicle-file-name-nondirectory icicle-current-input)))
        (when (and (get icicle-last-completion-command 'icicle-apropos-completing-command)
                   <span class="linecomment">;; $$ Previously allowed the -action's.</span>
                   (not (and (symbolp last-command) (get last-command 'icicle-cycling-command))))
          (setq search-fn  're-search-forward)) <span class="linecomment">; Use regexp search: input is not yet complete.</span>
        (while (and (not (eobp))
                    (save-restriction
                      (narrow-to-region (point) (next-single-property-change (point) 'mouse-face
                                                                             nil (point-max)))
                      (not (funcall search-fn icicle-current-input nil 'leave-at-end)))))
        (unless (eobp)
          (goto-char (match-beginning 0))
          (let ((prop  (get-text-property (1- (point)) 'mouse-face)))
            <span class="linecomment">;; If in a completion, move to the start of it.</span>
            (when (and prop (eq prop (get-text-property (point) 'mouse-face)))
              (goto-char (previous-single-property-change (point) 'mouse-face nil (point-min)))))
          (icicle-place-overlay
           (point) (next-single-property-change (point) 'mouse-face nil (point-max))
           'icicle-current-completion-candidate-overlay 'icicle-current-candidate-highlight
           100 (current-buffer)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-insert-completion (&optional completion) <span class="linecomment">; Bound to `C-insert' in *Completions*.</span>
  "<span class="quote">Select the active minibuffer window.  Insert current completion.
The current candidate in *Completions* (under the cursor) is inserted
into the minibuffer as the current input.  You can use \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-switch-to-Completions-buf]'
to switch to the *Completions* window.

You can use this command only from buffer *Completions* (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-insert-completion]').

Non-interactively, optional arg COMPLETION is the completion inserted.</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (when (active-minibuffer-window)
    (unwind-protect                     <span class="linecomment">; If no current completion, return to minibuffer anyway.</span>
         (progn
           (setq completion  (or completion (icicle-current-completion-in-Completions)))
           (select-window (active-minibuffer-window))
           (with-current-buffer (window-buffer) <span class="linecomment">; Needed if *Completions* is redirected to minibuffer.</span>
             (goto-char (icicle-minibuffer-prompt-end))
             (icicle-clear-minibuffer)
             (insert (if (and (icicle-file-name-input-p) insert-default-directory
                              (or (not (member icicle-current-input icicle-extra-candidates))
                                  icicle-extra-candidates-dir-insert-p))
                         (icicle-file-name-directory-w-default icicle-current-input)
                       "<span class="quote"></span>")
                     completion)
             (setq icicle-current-input  (icicle-input-from-minibuffer))))
      (select-window (active-minibuffer-window)))))

(defun icicle-current-completion-in-Completions ()
  "<span class="quote">The completion candidate under the cursor in buffer *Completions*.
Return the name as a string.</span>" <span class="linecomment">; See also `choose-completion' and `mouse-choose-completion'.</span>
  (let ((buffer          completion-reference-buffer)
        (base-size       completion-base-size)
        (start-of-cands  (icicle-start-of-candidates-in-Completions))
        beg end)
    (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
      (setq end  (point)
            beg  (1+ (point))))
    (when (and (&gt; (point) start-of-cands) (get-text-property (1- (point)) 'mouse-face))
      (setq end  (1- (point))
            beg  (point)))
    (setq beg  (previous-single-property-change (or beg (point)) 'mouse-face nil start-of-cands)
          end  (next-single-property-change (or end (point)) 'mouse-face nil (point-max)))
    (unless beg (error "<span class="quote">No completion here</span>"))
    <span class="linecomment">;; `icicle-insert-candidates' doesn't put `mouse-face' on the final \n of a candidate</span>
    <span class="linecomment">;; in *Completions*. Add the newline back. `icicle-insert-candidates' puts property</span>
    <span class="linecomment">;; `icicle-keep-newline' on the newline if it is part of the candidate, as opposed to</span>
    <span class="linecomment">;; being just part of the display in columns.</span>
    (when (and (eq ?\n (char-after end)) (get-text-property end 'icicle-keep-newline))
      (setq end  (1+ end)))
    <span class="linecomment">;; $$$$ (buffer-substring-no-properties beg end)))</span>
    (buffer-substring beg end)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-switch-to/from-minibuffer () <span class="linecomment">; Bound to `pause' in Icicle mode.</span>
  "<span class="quote">Switch to minibuffer or previous buffer, in other window.
If current buffer is the minibuffer, then switch to the buffer that
was previously current.  Otherwise, switch to the minibuffer.</span>"
  (interactive)
  (unless (active-minibuffer-window) (error "<span class="quote">Minibuffer is not active</span>"))
  (if (eq (selected-window) (active-minibuffer-window))
      (switch-to-buffer-other-window icicle-pre-minibuffer-buffer)
    (select-window (active-minibuffer-window))))


<span class="linecomment">;; Replaces `previous-completion' (defined in `simple.el').</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-move-to-previous-completion (n) <span class="linecomment">; Bound to `left', `S-TAB' in *Completions*.</span>
  "<span class="quote">Move to the previous item in the completion list.

You can use this command only from buffer *Completions* (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-move-to-previous-completion]').</span>"
  (interactive "<span class="quote">p</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (setq n  (or n 0))
  (icicle-move-to-next-completion (- n)))


<span class="linecomment">;; Replaces `next-completion' (defined in `simple.el').</span>
<span class="linecomment">;; This is the same code, except:</span>
<span class="linecomment">;; 1. This highlights the current candidate.</span>
<span class="linecomment">;; 2. This wraps around from first to last and last to first.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-move-to-next-completion (n &optional no-minibuffer-follow-p) <span class="linecomment">; Bound to `right', `TAB'</span>
                                        <span class="linecomment">;  in *Completions*.</span>
  "<span class="quote">Move to the next item in the completion list.
With prefix argument N, move N items (negative N means move backward).
Optional second argument, if non-nil, means do not copy the completion
back to the minibuffer.

You can use this command only from buffer *Completions* (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-move-to-next-completion]').</span>"
  (interactive "<span class="quote">p</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (setq n  (or n 0))
  (let ((beg  (icicle-start-of-candidates-in-Completions))
        (end  (point-max)))
    (while (and (&gt; n 0) (not (eobp)))
      <span class="linecomment">;; If in a completion, move to the end of it.</span>
      (when (get-text-property (point) 'mouse-face)
        (goto-char (next-single-property-change (point) 'mouse-face nil end)))
      <span class="linecomment">;; Move to start of next one.</span>
      (unless (get-text-property (point) 'mouse-face)
        (goto-char (or (next-single-property-change (point) 'mouse-face)
                       beg)))           <span class="linecomment">; Wrap back to first candidate.</span>
      (setq n  (1- n)))
    (while (and (&lt; n 0) (&gt;= (count-lines 1 (point)) (if icicle-show-Completions-help-flag 3 2)))
      (let ((prop  (get-text-property (1- (point)) 'mouse-face)))
        <span class="linecomment">;; If in a completion, move to the start of it.</span>
        (when (and prop (eq prop (get-text-property (point) 'mouse-face)))
          (goto-char (previous-single-property-change (point) 'mouse-face nil beg))))
      <span class="linecomment">;; Move to end of the previous completion.</span>
      (unless (or (&lt; (count-lines 1 (point)) (if icicle-show-Completions-help-flag 3 2))
                  (get-text-property (1- (point)) 'mouse-face))
        (goto-char (or (previous-single-property-change (point) 'mouse-face)
                       end)))           <span class="linecomment">; Wrap back to last candidate.</span>
      <span class="linecomment">;; Move to the start of that one.</span>
      (goto-char (previous-single-property-change (point) 'mouse-face nil beg))
      (setq n  (1+ n)))
    (icicle-place-overlay
     (point) (next-single-property-change (point) 'mouse-face nil end)
     'icicle-current-completion-candidate-overlay 'icicle-current-candidate-highlight
     100 (current-buffer)))
  (unless no-minibuffer-follow-p
    (save-excursion (save-window-excursion (icicle-insert-completion)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-previous-line ()          <span class="linecomment">; Bound to `up' *Completions*.</span>
  "<span class="quote">Move up a line, in *Completions* buffer.  Wrap around first to last.
You can use this command only from buffer *Completions* (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-previous-line]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (let ((opoint          (point))
        (curr-col        1)
        (next-line-cols  1)
        (eol             (save-excursion (end-of-line) (point))))
    (save-excursion
      (beginning-of-line)
      (while (and (&lt; (point) opoint) (re-search-forward "<span class="quote">[^ ] +</span>" eol t))
        (setq curr-col  (1+ curr-col))))
    (forward-line -1)
    (when (&lt; (point) (icicle-start-of-candidates-in-Completions))
      (goto-char (point-max)) (beginning-of-line)) <span class="linecomment">; Wrap around</span>
    (let ((eol  (save-excursion (end-of-line) (point))))
      (save-excursion
        (beginning-of-line)
        (while (re-search-forward "<span class="quote">[^ ] +[^ ]</span>" eol t) (setq next-line-cols  (1+ next-line-cols)))))
    (if (&gt; curr-col next-line-cols)
        (icicle-move-to-next-completion (1- next-line-cols))
      (icicle-move-to-next-completion (1- curr-col)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-next-line ()              <span class="linecomment">; Bound to `down' in *Completions*.</span>
  "<span class="quote">Move down a line, in *Completions* buffer.  Wrap around last to first.
You can use this command only from buffer *Completions* (`\\&lt;completion-list-mode-map&gt;\
\\[icicle-next-line]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions))
  (let ((opoint          (point))
        (curr-col        1)
        (next-line-cols  1)
        (eol             (save-excursion (end-of-line) (point))))
    (save-excursion
      (beginning-of-line)
      (while (and (&lt; (point) opoint) (re-search-forward "<span class="quote">[^ ] +</span>" eol t))
        (setq curr-col  (1+ curr-col))))
    (forward-line 1)
    (when (eobp) (goto-char (icicle-start-of-candidates-in-Completions))) <span class="linecomment">; Wrap around</span>
    (let ((eol  (save-excursion (end-of-line) (point))))
      (save-excursion
        (beginning-of-line)
        (while (re-search-forward "<span class="quote">[^ ] +[^ ]</span>" eol t) (setq next-line-cols  (1+ next-line-cols)))))
    (if (&gt; curr-col next-line-cols)
        (icicle-move-to-next-completion (1- next-line-cols))
      (icicle-move-to-next-completion (1- curr-col)))))

<span class="linecomment">;; Same as `end-of-line+' in `misc-cmds.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-end-of-line+ (&optional n) <span class="linecomment">; Bound to `C-e' in minibuffer and in *Completions*.</span>
  "<span class="quote">Move cursor to end of current line or end of next line if repeated.
This is similar to `end-of-line', but:
  If called interactively with no prefix arg:
     If the previous command was also `end-of-line+', then move to the
     end of the next line.  Else, move to the end of the current line.
  Otherwise, move to the end of the Nth next line (Nth previous line
     if N&lt;0).  Command `end-of-line', by contrast, moves to the end of
     the (N-1)th next line.</span>"
  (interactive
   (list (if current-prefix-arg (prefix-numeric-value current-prefix-arg) 0)))
  (unless n (setq n  0))                <span class="linecomment">; non-interactive with no arg</span>
  (if (and (eq this-command last-command) (not current-prefix-arg))
      (forward-line 1)
    (forward-line n))
  (let ((inhibit-field-text-motion  t)) <span class="linecomment">; Emacs 22+, so we get past the end of the prompt field.</span>
    (end-of-line)))

<span class="linecomment">;; Same as `beginning-of-line+' in `misc-cmds.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-beginning-of-line+ (&optional n) <span class="linecomment">; Bound to `C-a' in minibuffer and in *Completions*.</span>
  "<span class="quote">Move cursor to beginning of current line or next line if repeated.
This is the similar to `beginning-of-line', but:
1. With arg N, the direction is the opposite: this command moves
   backward, not forward, N lines.
2. If called interactively with no prefix arg:
      If the previous command was also `beginning-of-line+', then move
      to the beginning of the previous line.  Else, move to the
      beginning of the current line.
   Otherwise, move to the beginning of the Nth previous line (Nth next
      line if N&lt;0).  Command `beginning-of-line', by contrast, moves to
      the beginning of the (N-1)th next line.</span>"
  (interactive
   (list (if current-prefix-arg (prefix-numeric-value current-prefix-arg) 0)))
  (unless n (setq n  0))                <span class="linecomment">; non-interactive with no arg</span>
  (if (and (eq this-command last-command) (not current-prefix-arg))
      (forward-line -1)
    (forward-line (- n)))
  (when (bobp) (goto-char (icicle-minibuffer-prompt-end))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-all-candidates-action ()  <span class="linecomment">; Bound to `C-!' in minibuffer.</span>
  "<span class="quote">Take action on all completion candidates.
Apply `icicle-candidate-action-fn' successively to each saved
completion candidate (if any) or each candidate that matches the
current input (a regular expression).  The candidates that were not
successfully acted upon are listed in buffer *Help*.

If there are saved completion candidates, then they are acted on;
if not, then all current matching candidates are acted on.

If `icicle-candidate-action-fn' is nil but
`icicle-all-candidates-list-action-fn' is not, then apply the latter
to the list of candidates as a whole, instead.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-all-candidates-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (unless (or icicle-all-candidates-list-action-fn icicle-candidate-action-fn)
    (error "<span class="quote">No action defined</span>"))
  (if icicle-candidate-action-fn
      (icicle-all-candidates-action-1 icicle-candidate-action-fn nil)
    (icicle-all-candidates-action-1 icicle-all-candidates-list-action-fn t)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-all-candidates-alt-action () <span class="linecomment">; Bound to `C-|' in minibuffer.</span>
  "<span class="quote">Take alternative action on all completion candidates.
Apply `icicle-candidate-alt-action-fn' successively to each saved
completion candidate (if any) or each candidate that matches the
current input (a regular expression).  The candidates that were not
successfully acted upon are listed in buffer *Help*.

If there are saved completion candidates, then they are acted on; if
not, then all current matching candidates are acted on.

If `icicle-candidate-alt-action-fn' is nil but
`icicle-all-candidates-list-alt-action-fn' is not, then apply the
latter to the list of candidates as a whole, instead.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-all-candidates-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (unless (or icicle-all-candidates-list-alt-action-fn icicle-candidate-alt-action-fn)
    (error "<span class="quote">No alternative action defined</span>"))
  (if icicle-candidate-alt-action-fn
      (icicle-all-candidates-action-1 icicle-candidate-alt-action-fn nil)
    (icicle-all-candidates-action-1 icicle-all-candidates-list-alt-action-fn t)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-all-candidates-list-action () <span class="linecomment">; Bound to `M-!' in minibuffer.</span>
  "<span class="quote">Take action on the list of all completion candidates.
Apply `icicle-all-candidates-list-action-fn' to the list of saved
completion candidates or the list of candidates that match the current
input (a regular expression).

If there are saved completion candidates, then they are acted on; if
not, then all current matching candidates are acted on.

If `icicle-all-candidates-list-action-fn' is nil but
`icicle-candidate-action-fn' is not, then apply the latter to each
matching candidate in turn, and print the candidates that were not
successfully acted upon in buffer *Help*.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-all-candidates-list-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (unless (or icicle-all-candidates-list-action-fn icicle-candidate-action-fn)
    (error "<span class="quote">No action defined</span>"))
  (if icicle-all-candidates-list-action-fn
      (icicle-all-candidates-action-1 icicle-all-candidates-list-action-fn t)
    (icicle-all-candidates-action-1 icicle-candidate-action-fn nil)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-all-candidates-list-alt-action () <span class="linecomment">; Bound to `M-|' in minibuffer.</span>
  "<span class="quote">Take alternative action on the list of all completion candidates.
Apply `icicle-all-candidates-list-alt-action-fn' to the list of saved
completion candidates or the list of completion candidates that match
the current input (a regular expression).

If there are saved completion candidates, then they are acted on;
if not, then all current matching candidates are acted on.

If `icicle-all-candidates-list-alt-action-fn' is nil but
`icicle-candidate-alt-action-fn' is not, then apply the latter to each
matching candidate in turn, and print the candidates that were not
successfully acted upon in buffer *Help*.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-all-candidates-list-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (unless (or icicle-all-candidates-list-alt-action-fn icicle-candidate-alt-action-fn)
    (error "<span class="quote">No alternative action defined.</span>"))
  (if icicle-all-candidates-list-alt-action-fn
      (icicle-all-candidates-action-1 icicle-all-candidates-list-alt-action-fn t)
    (icicle-all-candidates-action-1 icicle-candidate-alt-action-fn nil)))

(defun icicle-all-candidates-action-1 (fn-var listp)
  "<span class="quote">Helper function for `icicle-all-candidates(-alt)-action'.</span>"
  (let* ((local-saved
          (catch 'i-a-c-a-1
            (dolist (cand icicle-saved-completion-candidates icicle-saved-completion-candidates)
              (unless (member cand icicle-completion-candidates) (throw 'i-a-c-a-1 nil)))))
         (candidates                      (or local-saved icicle-completion-candidates))
         (failures                        nil)
         (icicle-all-candidates-action-p  t))
    (when local-saved (setq icicle-completion-candidates  local-saved))
    (if listp
        (funcall fn-var candidates)
      (while candidates
        (let ((error-msg  (condition-case act-on-each
                              (icicle-candidate-action-1 fn-var nil (car candidates))
                            (error (error-message-string act-on-each)))))
          (when error-msg (setq failures  (cons (cons (car candidates) error-msg) failures)))
          (setq candidates  (cdr candidates))))
      (when failures
        (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
          (princ "<span class="quote">Action failures:</span>")(terpri)(terpri)
          (mapcar (lambda (entry)
                    (princ (car entry)) (princ "<span class="quote">:</span>") (terpri) (princ "<span class="quote">  </span>")
                    (princ (cdr entry)) (terpri))
                  failures))))))
<span class="linecomment">;; $$$$$$ (icicle-abort-recursive-edit))</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-action ()       <span class="linecomment">; Bound to `C-RET' in minibuffer.</span>
  "<span class="quote">Take action on the current minibuffer-completion candidate.
If `icicle-candidate-action-fn' is non-nil, it is a function to apply
to the current candidate, to perform the action.

If `icicle-candidate-action-fn' is nil, the default action is
performed: display help on the candidate - see
`icicle-help-on-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-candidate-action-1 icicle-candidate-action-fn))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-alt-action ()   <span class="linecomment">; Bound to `C-S-RET' in minibuffer.</span>
  "<span class="quote">Take alternative action on the current completion candidate.
If `icicle-candidate-alt-action-fn' is non-nil, it is a
function to apply to the current candidate, to perform the action.

If `icicle-candidate-alt-action-fn' is nil, the default action
is performed: display help on the candidate - see
`icicle-help-on-candidate'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-alt-action]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-candidate-action-1 icicle-candidate-alt-action-fn 'alternative-p))

(defun icicle-candidate-action-1 (fn-var &optional altp cand)
  "<span class="quote">Helper function for `icicle-candidate(-alt)-action'
Optional arg ALTP non-nil means FN-VAR is alternative action function.
Optional arg CAND non-nil means it is the candidate to act on.</span>"
  (when cand (setq icicle-last-completion-candidate  cand))
  (cond ((not fn-var) (icicle-help-on-candidate cand)) <span class="linecomment">; It doesn't `icicle-raise-Completions-frame'.</span>
        ((icicle-require-match-p)
         <span class="linecomment">;; If no last candidate, then reset to first candidate matching input.</span>
         (unless (stringp icicle-last-completion-candidate)
           (setq icicle-last-completion-candidate  icicle-current-input
                 last-command                      (if altp
                                                       'icicle-candidate-alt-action
                                                     'icicle-candidate-action))
           (icicle-next-candidate 1 (if (eq icicle-current-completion-mode 'prefix)
                                        'icicle-prefix-candidates
                                      'icicle-apropos-candidates)
                                  (not (eq icicle-current-completion-mode 'prefix))))
         <span class="linecomment">;; Save stuff in case calling FN-VAR does its own completion.</span>
         (let ((icicle-candidate-nb               icicle-candidate-nb)
               (icicle-last-completion-candidate  icicle-last-completion-candidate)
               (icicle-completion-candidates      icicle-completion-candidates))
           (when icicle-completion-candidates
             (funcall fn-var icicle-last-completion-candidate)))
         (when icicle-use-candidates-only-once-flag (icicle-remove-candidate-display-others 'all))
         (icicle-raise-Completions-frame))
        (t
         (let ((icicle-last-input         (or cand (icicle-input-from-minibuffer)))
               (icicle-default-directory  icicle-default-directory))
           (when (and (icicle-file-name-input-p) (icicle-file-directory-p icicle-last-input))
             (setq icicle-default-directory  icicle-last-input))
           <span class="linecomment">;; Save stuff in case calling FN-VAR does its own completion.</span>
           (let ((icicle-candidate-nb               icicle-candidate-nb)
                 (icicle-last-completion-candidate  icicle-last-completion-candidate)
                 (icicle-completion-candidates      icicle-completion-candidates))
             (funcall fn-var icicle-last-input))
           (when (and icicle-use-candidates-only-once-flag
                      (equal icicle-last-input
                             (if (icicle-file-name-input-p)
                                 (expand-file-name icicle-last-completion-candidate
                                                   (file-name-directory icicle-last-input))
                               icicle-last-completion-candidate)))
             (icicle-remove-candidate-display-others 'all))
           (icicle-raise-Completions-frame)))))

<span class="linecomment">;; Bound to `C-down-mouse-2' (`C-mouse-2') in *Completions*.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-candidate-action (event)
  "<span class="quote">Take action on the completion candidate clicked by `mouse-2'.
If `icicle-candidate-action-fn' is non-nil, it is a function to apply
to the clicked candidate, to perform the action.

If `icicle-candidate-action-fn' is nil, the default action is
performed: display help on the candidate - see
`icicle-help-on-candidate'.</span>"
  (interactive "<span class="quote">e</span>")
  (icicle-mouse-candidate-action-1 event icicle-candidate-action-fn))

<span class="linecomment">; Bound to `C-S-down-mouse-2' (`C-S-mouse-2') in *Completions*.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-candidate-alt-action (event)
  "<span class="quote">Take alternative action on the candidate clicked by `mouse-2'.
If `icicle-candidate-alt-action-fn' is non-nil, it is a
function to apply to the clicked candidate, to perform the action.

If `icicle-candidate-action-fn' is nil, the default action is
performed: display help on the candidate - see
`icicle-help-on-candidate'.</span>"
  (interactive "<span class="quote">e</span>")
  (icicle-mouse-candidate-action-1 event icicle-candidate-alt-action-fn))

(defun icicle-mouse-candidate-action-1 (event fn-var)
  "<span class="quote">Helper function for `icicle-mouse-candidate(-alt)-action'.</span>"
  (run-hooks 'mouse-leave-buffer-hook)  <span class="linecomment">; Give temp modes such as isearch a chance to turn off.</span>
  (let ((posn-buf  (window-buffer (posn-window (event-start event))))
        (posn-pt   (posn-point (event-start event)))
        (posn-col  (car (posn-col-row (event-start event))))
        (posn-row  (cdr (posn-col-row (event-start event))))
        choice)
    (read-event)                        <span class="linecomment">; Swallow mouse up event.</span>
    (save-excursion
      (set-buffer posn-buf)
      (goto-char posn-pt)
      (let (beg end)
        (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
          (setq end  (point)
                beg  (1+ (point))))
        (unless beg (error "<span class="quote">No completion here</span>"))
        (setq beg  (previous-single-property-change beg 'mouse-face)
              end  (or (next-single-property-change end 'mouse-face) (point-max)))
        <span class="linecomment">;; `icicle-insert-candidates' doesn't put `mouse-face' on the final \n of a candidate</span>
        <span class="linecomment">;; in *Completions*. Add the newline back. `icicle-insert-candidates' puts property</span>
        <span class="linecomment">;; `icicle-keep-newline' on the newline if it is part of the candidate, as opposed to</span>
        <span class="linecomment">;; being just part of the display in columns.</span>
        (when (and (eq ?\n (char-after end)) (get-text-property end 'icicle-keep-newline))
          (setq end  (1+ end)))
        (setq choice  (if (and (icicle-file-name-input-p) insert-default-directory
                               (or (not (member (buffer-substring-no-properties beg end)
                                                icicle-extra-candidates))
                                   icicle-extra-candidates-dir-insert-p))
                          (concat default-directory (buffer-substring-no-properties beg end))
                        <span class="linecomment">;; $$$$$$ (buffer-substring-no-properties beg end))))))</span>
                        (buffer-substring beg end)))
        (remove-text-properties 0 (length choice) '(mouse-face nil) choice)))
    (save-window-excursion
      (select-window (active-minibuffer-window))
      (delete-region (icicle-minibuffer-prompt-end) (point-max))
      (insert choice))
    (setq icicle-candidate-nb               (icicle-nb-of-candidate-in-Completions posn-pt)
          icicle-last-completion-candidate  choice)
    (if (not fn-var)
        (icicle-help-on-candidate)      <span class="linecomment">; Doesn't `icicle-raise-Completions-frame'.</span>
      <span class="linecomment">;; Save stuff in case calling FN-VAR does its own completion.</span>
      (let ((icicle-candidate-nb               icicle-candidate-nb)
            (icicle-last-completion-candidate  icicle-last-completion-candidate)
            (icicle-completion-candidates      icicle-completion-candidates))
        (funcall fn-var icicle-last-completion-candidate))
      (when icicle-use-candidates-only-once-flag (icicle-remove-candidate-display-others 'all))
      (when icicle-completion-candidates (icicle-update-and-next))
      (icicle-raise-Completions-frame posn-col posn-row))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-remove-candidate ()       <span class="linecomment">; Bound to `delete' in minibuffer during completion.</span>
  "<span class="quote">Remove current completion candidate from the set of candidates.
This has no effect on the object, if any, represented by the
candidate; in particular, that object is not deleted.

Note: For Emacs versions prior to 22, this does not really remove a
file-name candidate as a possible candidate.  If you use \\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete] or \\[icicle-apropos-complete],
it will reappear as a possible candidate.

You can use this command only from the minibuffer (`\\[icicle-remove-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (icicle-remove-candidate-display-others))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-remove-candidate (event) <span class="linecomment">; Bound to `S-mouse-2' in *Completions*.</span>
  "<span class="quote">Remove clicked completion candidate from the set of candidates.
This has no effect on the object, if any, represented by the
candidate; in particular, that object is not deleted.

See `icicle-remove-candidate' for more information.</span>"
  (interactive "<span class="quote">e</span>")
  (run-hooks 'mouse-leave-buffer-hook)  <span class="linecomment">; Give temp modes such as isearch a chance to turn off.</span>
  (let ((posn-buf  (window-buffer (posn-window (event-start event))))
        (posn-pt   (posn-point (event-start event)))
        beg end)
    (read-event)                        <span class="linecomment">; Swallow mouse up event.</span>
    (save-excursion
      (set-buffer posn-buf)
      (goto-char posn-pt)
      (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
        (setq end  (point)
              beg  (1+ (point))))
      (unless beg (error "<span class="quote">No completion here</span>"))
      (setq beg  (previous-single-property-change beg 'mouse-face)
            end  (or (next-single-property-change end 'mouse-face) (point-max)))
      <span class="linecomment">;; `icicle-insert-candidates' doesn't put `mouse-face' on the final \n of a candidate</span>
      <span class="linecomment">;; in *Completions*. Add the newline back. `icicle-insert-candidates' puts property</span>
      <span class="linecomment">;; `icicle-keep-newline' on the newline if it is part of the candidate, as opposed to</span>
      <span class="linecomment">;; being just part of the display in columns.</span>
      (when (and (eq ?\n (char-after end)) (get-text-property end 'icicle-keep-newline))
        (setq end  (1+ end)))
      (setq icicle-candidate-nb               (icicle-nb-of-candidate-in-Completions posn-pt)
            icicle-last-completion-candidate  (buffer-substring beg end))))
  (icicle-remove-candidate-display-others))

(defun icicle-remove-candidate-display-others (&optional allp)
  "<span class="quote">Remove current completion candidate from list of possible candidates.
Redisplay *Completions*, unless there is only one candidate left.
Non-nil optional argument ALLP means remove all occurrences of the
current candidate.  Otherwise (nil) means remove only the current
occurrence.</span>"
  (unless (stringp icicle-last-completion-candidate)
    (setq icicle-last-completion-candidate  icicle-current-input
          last-command                      'icicle-delete-candidate-object)
    (icicle-next-candidate 1 (if (eq icicle-current-completion-mode 'prefix)
                                 'icicle-prefix-candidates
                               'icicle-apropos-candidates)
                           (not (eq icicle-current-completion-mode 'prefix))))
  (let ((maybe-mct-cand  (cond ((consp minibuffer-completion-table)
                                (icicle-mctized-display-candidate icicle-last-completion-candidate))
                               ((arrayp minibuffer-completion-table)
                                (intern icicle-last-completion-candidate))
                               (t
                                icicle-last-completion-candidate))))
    (icicle-remove-cand-from-lists icicle-last-completion-candidate maybe-mct-cand allp))
  (icicle-update-and-next))


(put 'icicle-delete-candidate-object 'icicle-cycling-command t)
(put 'icicle-delete-candidate-object 'icicle-prefix-cycling-command t)
(put 'icicle-delete-candidate-object 'icicle-apropos-cycling-command t)
<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-candidate-object (&optional allp) <span class="linecomment">; Bound to `S-delete' in minibuffer.</span>
  "<span class="quote">Delete the object named by the current completion candidate.
With a prefix argument, delete *ALL* objects named by the current set
of candidates, after confirmation.

Do nothing if `icicle-deletion-action-flag' is nil.

Otherwise:

* If the value of variable `icicle-delete-candidate-object' is a
  function, then apply it to the current completion candidate.  This
  should delete some object named by the completion candidate.

* If `icicle-delete-candidate-object' is not a function, then it
  should be a symbol bound to an alist.  In this case, invoke
  `icicle-delete-candidate-object' to delete the object named by the
  current completion candidate from that alist.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-delete-candidate-object]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (when icicle-deletion-action-flag
    (if allp
        (if (null icicle-completion-candidates)
            (message "<span class="quote">Nothing to delete - use `S-TAB', `TAB', or a cycle key</span>")
          (if (not (let ((icicle-completion-candidates  icicle-completion-candidates))
                     (yes-or-no-p "<span class="quote">Are you SURE you want to DELETE ALL of the matching objects? </span>")))
              (message "<span class="quote">OK, nothing deleted</span>")
            (dolist (cand icicle-completion-candidates) (icicle-delete-candidate-object-1 cand t))
            (icicle-erase-minibuffer)))
      <span class="linecomment">;; If no last candidate, then reset to first candidate matching input.</span>
      (unless (stringp icicle-last-completion-candidate)
        (setq icicle-last-completion-candidate  icicle-current-input
              last-command                      'icicle-delete-candidate-object)
        (icicle-next-candidate 1 (if (eq icicle-current-completion-mode 'prefix)
                                     'icicle-prefix-candidates
                                   'icicle-apropos-candidates)
                               (not (eq icicle-current-completion-mode 'prefix))))
      (icicle-delete-candidate-object-1 icicle-last-completion-candidate))))

(defun icicle-delete-candidate-object-1 (cand &optional no-display-p)
  "<span class="quote">Helper function for `icicle-delete-candidate-object'.
Delete object named CAND.
Optional arg NO-DISPLAY-P non-nil means don't update *Completions*.</span>"
  (let ((display-cand  cand)            <span class="linecomment">; Use local vars: values might change.</span>
        (maybe-mct-cand
         (cond ((consp minibuffer-completion-table) (icicle-mctized-display-candidate cand))
               ((arrayp minibuffer-completion-table) (intern cand))
               (t cand))))
    (save-selected-window
      (if (functionp icicle-delete-candidate-object)
          (funcall icicle-delete-candidate-object cand)
        (icicle-delete-current-candidate-object cand)))
    (icicle-remove-cand-from-lists display-cand maybe-mct-cand nil) <span class="linecomment">; Use local vars.</span>
    (unless no-display-p (message "<span class="quote">Deleted object named: `%s'</span>" display-cand) (sit-for 1.0)))
  (unless no-display-p (icicle-update-and-next))
  (select-window (minibuffer-window))
  (select-frame-set-input-focus (selected-frame)))

(defun icicle-delete-current-candidate-object (&optional cand)
  "<span class="quote">Delete the object(s) corresponding to the current completion candidate.
The value of `icicle-delete-candidate-object' must be a symbol
\(variable) that is bound to a list of completion-candidate objects.

The entries in the list must be completion candidates for the current
call to `completing-read', but the list itself need not be the
COLLECTION argument to `completing-read'.  For example, the list might
be a list of symbols, and the COLLECTION argument might be an obarray
that contains those symbols.

The list can be an alist, a list of strings, or a list of symbols.
Delete, from this list, the objects that correspond to the current
completion candidate.  If the variable is also a user option, then
save the option, after deleting the candidate object.

The full candidate object is what is deleted.  If the list contains
multiple identical objects that correspond to the current completion
candidate, they are all deleted.</span>"
  (setq cand  (or cand icicle-last-completion-candidate))
  (let ((val  (and (symbolp icicle-delete-candidate-object)
                   (symbol-value icicle-delete-candidate-object))))
    <span class="linecomment">;; The message could more accurately say "Value of `icicle-delete-candidate-object' must be</span>
    <span class="linecomment">;; a symbol bound to a list", but this makes more sense.</span>
    (unless (and val (consp val)) (error "<span class="quote">Cannot delete candidate objects now</span>"))
    (set icicle-delete-candidate-object <span class="linecomment">; Update the variable.</span>
         (cond ((or icicle-whole-candidate-as-text-prop-p icicle-candidates-alist)
                (delete (icicle-get-alist-candidate cand) val))
               ((consp (car val))
                (icicle-assoc-delete-all cand val))
               ((stringp (car val)) (delete cand val))
               ((symbolp (car val)) (delete (intern cand) val))
               (t (error "<span class="quote">Entry in list value of `icicle-delete-candidate-object' is \
not a cons, string, or symbol</span>")))))
  (when (user-variable-p icicle-delete-candidate-object) <span class="linecomment">; Save the new user-option value.</span>
    (funcall icicle-customize-save-variable-function
             icicle-delete-candidate-object
             (symbol-value icicle-delete-candidate-object))))

(defun icicle-remove-cand-from-lists (disp-cand mct-cand allp)
  "<span class="quote">Delete first occurence or all occurences of candidate.
The appropriate form of the candidate is removed from each of these:
 `icicle-candidates-alist'
 `icicle-completion-candidates'
 `minibuffer-completion-table' (if it is an alist)
DISP-CAND is the display form of the candidate to delete.
MCT-CAND is the MCT alist candidate that corresponds to DISP-CAND.
If any of these conditions is true, remove all occurrences of CAND:
 * ALLP is non-nil
 * `icicle-transform-function' is `icicle-remove-duplicates'
 * `icicle-transform-function' is `icicle-remove-dups-if-extras'
   and `icicle-extra-candidates' is non-nil</span>"
  (setq allp  (or allp (eq icicle-transform-function 'icicle-remove-duplicates)
                  (and (eq icicle-transform-function 'icicle-remove-dups-if-extras)
                       icicle-extra-candidates)))
  (when icicle-candidates-alist
    (setq icicle-candidates-alist
          (if allp
              (icicle-assoc-delete-all disp-cand icicle-candidates-alist)
            (delete (icicle-get-alist-candidate disp-cand) icicle-candidates-alist))))
  (when (consp icicle-completion-candidates)
    (setq icicle-completion-candidates
          (if allp                      <span class="linecomment">; Delete only the first occurrence, or all if ALLP.</span>
              (delete disp-cand icicle-completion-candidates)
            (icicle-delete-count disp-cand icicle-completion-candidates 1))))
  <span class="linecomment">;; Update `minibuffer-completion-predicate' or `read-file-name-predicate'</span>
  <span class="linecomment">;; to effectively remove this candidate.</span>
  (cond ((and (icicle-file-name-input-p)
              (boundp 'read-file-name-predicate) <span class="linecomment">; Emacs 22+ only.</span>
              read-file-name-predicate)
         (setq read-file-name-predicate
               (if read-file-name-predicate
                   (lexical-let ((curr-pred read-file-name-predicate))
                     `(lambda (file-cand)
                       (and (not (equal ',disp-cand file-cand)) (funcall ',curr-pred file-cand))))
                 `(lambda (file-cand) (not (equal ',disp-cand file-cand))))))
        <span class="linecomment">;; &lt; Emacs 22.  Do nothing for file name.</span>
        <span class="linecomment">;; `TAB' or `S-TAB' will bring it back as a candidate.</span>
        ((icicle-file-name-input-p))
        (minibuffer-completion-predicate <span class="linecomment">; Add excluding candidate to existing predicate.</span>
         (setq minibuffer-completion-predicate
               (lexical-let ((curr-pred minibuffer-completion-predicate))
                 `(lambda (cand) (and (not (equal ',mct-cand cand)) (funcall ',curr-pred cand))))))
        (t                              <span class="linecomment">; Set predicate to excluding candidate.</span>
         (setq minibuffer-completion-predicate  `(lambda (cand) (not (equal ',mct-cand cand)))))))
<span class="linecomment">;; $$$$$$$$$$$$ COULD USE THIS INSTEAD of updating the predicate,</span>
<span class="linecomment">;; but it works only when `minibuffer-completion-table' is an alist.</span>
<span class="linecomment">;;   (when (consp minibuffer-completion-table)</span>
<span class="linecomment">;;     (setq minibuffer-completion-table</span>
<span class="linecomment">;;           (if allp</span>
<span class="linecomment">;;               (delete mct-cand minibuffer-completion-table)</span>
<span class="linecomment">;;             (icicle-delete-count mct-cand minibuffer-completion-table 1)))))</span>

(defun icicle-update-and-next ()
  "<span class="quote">Update *Completions* and make next candidate current.
If we don't know which candidate number this is, just display.</span>"
  (cond ((and icicle-completion-candidates (cdr icicle-completion-candidates)) <span class="linecomment">; &gt; 1 candidates left.</span>
         (icicle-maybe-sort-and-strip-candidates)
         (message "<span class="quote">Displaying completion candidates...</span>")
         (save-selected-window (icicle-display-candidates-in-Completions))
         (when (wholenump icicle-candidate-nb)
           (with-current-buffer "<span class="quote">*Completions*</span>"
             (goto-char (icicle-start-of-candidates-in-Completions))
             (icicle-move-to-next-completion
              (mod icicle-candidate-nb (length icicle-completion-candidates)))
             (set-window-point (get-buffer-window "<span class="quote">*Completions*</span>" 0) (point))
             (setq icicle-last-completion-candidate  (icicle-current-completion-in-Completions))
             (set-buffer-modified-p nil))))
        (icicle-completion-candidates   <span class="linecomment">; Single candidate left</span>
         (save-selected-window (icicle-remove-Completions-window))
         (let ((completion  (icicle-transform-multi-completion (car icicle-completion-candidates))))
           (select-window (active-minibuffer-window))
           (with-current-buffer (window-buffer) <span class="linecomment">; Needed if *Completions* redirected to minibuffer.</span>
             (goto-char (icicle-minibuffer-prompt-end))
             (icicle-clear-minibuffer)
             (insert (if (and (icicle-file-name-input-p) insert-default-directory
                              (or (not (member icicle-current-input icicle-extra-candidates))
                                  icicle-extra-candidates-dir-insert-p))
                         (icicle-file-name-directory-w-default icicle-current-input)
                       "<span class="quote"></span>")
                     completion))))
        (t                              <span class="linecomment">; No candidates left</span>
         <span class="linecomment">;; $$$$$$$$ `icicle-abort-recursive-edit' and `exit-recursive-edit' don't work,</span>
         <span class="linecomment">;; because they take us back to top level.</span>
         <span class="linecomment">;; $$$$ DO NOTHING? Do (icicle-remove-Completions-window)? Do (icicle-erase-minibuffer)?</span>
         (icicle-erase-minibuffer))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-help-on-candidate (event) <span class="linecomment">; Bound to `C-M-mouse-2' in minibuffer.</span>
  "<span class="quote">Display help on the minibuffer-completion candidate clicked by mouse.</span>"
  (interactive "<span class="quote">e</span>")
  (let ((icicle-candidate-action-fn  nil)) (icicle-mouse-candidate-action event)))

<span class="linecomment">;; Free vars here: `orig-buf' is bound in `icicle-complete-keys'.</span>
<span class="linecomment">;;                 `icicle-complete-keys-alist' is bound in `icicles-var.el'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-help-on-candidate (&optional cand) <span class="linecomment">; Bound to `C-M-RET', `C-help', `C-f1' in minibuffer.</span>
                                        <span class="linecomment">; Bound to `C-M-RET' in *Completions.</span>
  "<span class="quote">Display help on the current minibuffer-completion candidate.
The help displayed depends on the type of candidate, as follows:

 menu item - the corresponding command is described using
             `describe-function' (only if `lacarte.el' is loaded)
 command or other function - described using `describe-function'
 keymap variable - described using `describe-keymap'
                   (if available - see library `help-fns+.el')
 user option or other variable - described using `describe-variable'
 face - described using `describe-face'
 command abbreviation - described using `apropos-command' for matches
 property list - described using `apropos-describe-plist'
 buffer name - modes described using `describe-mode' (Emacs &gt; 20)
 file name - file properties described

In the minibuffer, you can also use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-help-on-next-apropos-candidate]', `\\[icicle-help-on-previous-apropos-candidate]',
`\\[icicle-help-on-next-prefix-candidate]', and \
`\\[icicle-help-on-previous-prefix-candidate]', to display help on the candidate and then
move to the next or previous candidate.  See, for example,
`icicle-help-on-next-apropos-candidate'.
\
You can use this command only from the minibuffer or *Completions*
\(`\\[icicle-help-on-candidate]').</span>"
  (interactive)                         <span class="linecomment">; Interactively, just describes itself.</span>
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (let ((frame-with-focus  (selected-frame))
        (cand-symb         nil)
        transformed-cand)
    (cond (cand (setq icicle-last-completion-candidate  cand))
          ((eq (current-buffer) (get-buffer "<span class="quote">*Completions*</span>"))
           (setq icicle-last-completion-candidate  (icicle-current-completion-in-Completions)))
          <span class="linecomment">;; If no last candidate, then reset to first candidate matching input.</span>
          ((not (stringp icicle-last-completion-candidate))
           (setq icicle-last-completion-candidate  icicle-current-input
                 last-command                      'icicle-help-on-candidate)
           (icicle-next-candidate 1 (if (eq icicle-current-completion-mode 'prefix)
                                        'icicle-prefix-candidates
                                      'icicle-apropos-candidates)
                                  (not (eq icicle-current-completion-mode 'prefix)))))
    (cond (<span class="linecomment">;; Use special help function.</span>
           icicle-candidate-help-fn
           (funcall icicle-candidate-help-fn icicle-last-completion-candidate))

          (<span class="linecomment">;; Call to `lacarte-execute-menu-command' (defined in `lacarte.el').</span>
           <span class="linecomment">;; Use command associated with menu item.</span>
           (consp lacarte-menu-items-alist) <span class="linecomment">; `lacarte-menu-items-alist' is in `lacarte.el'.</span>
           (setq cand-symb  (cdr (assoc icicle-last-completion-candidate lacarte-menu-items-alist)))
           (if cand-symb
               (icicle-help-on-candidate-symbol cand-symb)
             (icicle-msg-maybe-in-minibuffer "<span class="quote">No help</span>"))) <span class="linecomment">; Menu item with lambda definition.</span>

          (<span class="linecomment">;; A key-completion candidate.  Get the true command from the candidate.</span>
           (boundp 'icicle-completing-keys-p)
           (save-match-data
             (string-match "<span class="quote">\\(.+\\)  =  \\(.+\\)</span>" icicle-last-completion-candidate)
             (setq cand-symb  (intern-soft (substring icicle-last-completion-candidate
                                                      (match-beginning 2) (match-end 2))))
             (cond ((eq '\.\.\. cand-symb) <span class="linecomment">; Prefix key - describe its binding.</span>
                    (with-current-buffer orig-buff
                      (describe-key (car-safe
                                     (cdr-safe
                                      (assq (intern-soft
                                             (substring icicle-last-completion-candidate
                                                        (match-beginning 0) (match-end 0)))
                                            icicle-complete-keys-alist))))))
                   (cand-symb (icicle-help-on-candidate-symbol cand-symb)) <span class="linecomment">; Describe key's command.</span>
                   (t (icicle-msg-maybe-in-minibuffer "<span class="quote">No help</span>")))))

          (t<span class="linecomment">;; Transform candidate, in case it's a multi-completion.</span>
           (setq transformed-cand  (icicle-transform-multi-completion
                                    icicle-last-completion-candidate))
           <span class="linecomment">;; If buffer or file, describe its properties.  Otherwise, create symbol and get its help.</span>
           (cond ((and (bufferp (get-buffer transformed-cand))
                       (with-current-buffer transformed-cand (describe-mode) t)))
                 ((file-exists-p transformed-cand) (icicle-describe-file transformed-cand))
                 (t (icicle-help-on-candidate-symbol (intern transformed-cand))))))
    <span class="linecomment">;;$$$ (icicle-raise-Completions-frame)</span>

    <span class="linecomment">;; This is a hack for MS Windows - otherwise, we can't continue to get more candidates,</span>
    <span class="linecomment">;; because the *Help* frame takes the focus away from the minibuffer frame.</span>
    <span class="linecomment">;; MS Windows always gives focus to a newly created frame - in this case, *Help*.</span>
    (let* ((help-window  (get-buffer-window "<span class="quote">*Help*</span>" 0))
           (help-frame   (and help-window (window-frame help-window))))
      (when help-frame (redirect-frame-focus help-frame frame-with-focus))))
  (message nil))                        <span class="linecomment">; Let minibuffer contents show immmediately.</span>

(defun icicle-help-on-candidate-symbol (symb)
  "<span class="quote">Helper function for `icicle-help-on-candidate'.  The arg is a symbol.</span>"
  (cond ((and (fboundp 'describe-keymap) (boundp symb) (keymapp (symbol-value symb)))
         (describe-keymap symb))
        ((fboundp symb) (describe-function symb))
        ((boundp symb) (describe-variable symb))
        ((facep symb) (describe-face symb))
        ((assq symb (mapcar #'cdr icicle-command-abbrev-alist))
         (let ((regexp  (icicle-command-abbrev-regexp symb))) (apropos-command regexp)))
        ((symbol-plist symb) (apropos-describe-plist symb))
        (t
         (setq symb  (symbol-name symb)) <span class="linecomment">; Convert symbol to string, and try some more.</span>
         (cond ((and (bufferp (get-buffer symb))
                     (with-current-buffer (get-buffer symb) (describe-mode) t)))
               ((file-exists-p symb) (icicle-describe-file symb))
               (t (icicle-msg-maybe-in-minibuffer "<span class="quote">No help</span>"))))))

<span class="linecomment">;; This is the same as `describe-file' in `misc-cmds.el', but we avoid requiring that library.</span>
<span class="linecomment">;; This is a top-level command, but we put it here to avoid library require cycles.</span>
<span class="linecomment">;;;###autoload</span>
(if (and (not (fboundp 'icicle-describe-file)) (fboundp 'describe-file))
    (fset 'icicle-describe-file (symbol-function 'describe-file))
  (defun icicle-describe-file (filename) <span class="linecomment">; Suggestion: bind to `C-h M-f'.</span>
    "<span class="quote">Describe the file named FILENAME.
If FILENAME is nil, describe the current directory.</span>"
    (interactive "<span class="quote">FDescribe file: </span>")
  (unless filename (setq filename  default-directory))
    (help-setup-xref (list #'icicle-describe-file filename) (interactive-p))
    (let ((attrs  (file-attributes filename)))
      (unless attrs (error(format "<span class="quote">Cannot open file `%s'</span>" filename)))
      (let* ((type             (nth 0 attrs))
             (numlinks         (nth 1 attrs))
             (uid              (nth 2 attrs))
             (gid              (nth 3 attrs))
             (last-access      (nth 4 attrs))
             (last-mod         (nth 5 attrs))
             (last-status-chg  (nth 6 attrs))
             (size             (nth 7 attrs))
             (permissions      (nth 8 attrs))
             <span class="linecomment">;; Skip 9: t iff file's gid would change if file were deleted and recreated.</span>
             (inode            (nth 10 attrs))
             (device           (nth 11 attrs))
             (help-text
              (concat (format "<span class="quote">Properties of `%s':\n\n</span>" filename)
                      (format "<span class="quote">Type:                       %s\n</span>"
                              (cond ((eq t type) "<span class="quote">Directory</span>")
                                    ((stringp type) (format "<span class="quote">Symbolic link to `%s'</span>" type))
                                    (t "<span class="quote">Normal file</span>")))
                      (format "<span class="quote">Permissions:                %s\n</span>" permissions)
                      (and (not (eq t type)) (format "<span class="quote">Size in bytes:              %g\n</span>" size))
                      (format-time-string
                       "<span class="quote">Time of last access:        %a %b %e %T %Y (%Z)\n</span>" last-access)
                      (format-time-string
                       "<span class="quote">Time of last modification:  %a %b %e %T %Y (%Z)\n</span>" last-mod)
                      (format-time-string
                       "<span class="quote">Time of last status change: %a %b %e %T %Y (%Z)\n</span>" last-status-chg)
                      (format "<span class="quote">Number of links:            %d\n</span>" numlinks)
                      (format "<span class="quote">User ID (UID):              %s\n</span>" uid)
                      (format "<span class="quote">Group ID (GID):             %s\n</span>" gid)
                      (format "<span class="quote">Inode:                      %S\n</span>" inode)
                      (format "<span class="quote">Device number:              %s\n</span>" device))))
        (with-output-to-temp-buffer "<span class="quote">*Help*</span>" (princ help-text))
        help-text))))                   <span class="linecomment">; Return displayed text.</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-read-fn-invoke () <span class="linecomment">; Bound to `M-RET' in minibuffer.</span>
  "<span class="quote">Read function name.  Invoke function on current completion candidate.
Set `icicle-candidate-action-fn' to the interned name.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-read-fn-invoke]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  <span class="linecomment">;; If no last candidate, then reset to first candidate matching input.</span>
  (unless (stringp icicle-last-completion-candidate)
    (setq icicle-last-completion-candidate  icicle-current-input
          last-command                      'icicle-candidate-action)
    (icicle-next-candidate 1 (if (eq icicle-current-completion-mode 'prefix)
                                 'icicle-prefix-candidates
                               'icicle-apropos-candidates)
                           (not (eq icicle-current-completion-mode 'prefix))))
  (let ((icicle-whole-candidate-as-text-prop-p  nil)
        (enable-recursive-minibuffers           t)
        (icicle-saved-completion-candidate      icicle-last-completion-candidate)
        (icicle-candidate-action-fn             'icicle-apply-to-saved-candidate))
    (icicle-apply-to-saved-candidate
     (completing-read (format "<span class="quote">Function to apply to `%s': </span>" icicle-saved-completion-candidate)
                      obarray 'functionp))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-candidate-read-fn-invoke (event) <span class="linecomment">; Bound to `M-mouse-2' in *Completions*.</span>
  "<span class="quote">Read function name.  Invoke function on candidate clicked by mouse.</span>"
  (interactive "<span class="quote">e</span>")
  (run-hooks 'mouse-leave-buffer-hook) <span class="linecomment">; Give temp modes such as isearch a chance to turn off.</span>
  (let ((buffer    (window-buffer))
        (posn-win  (posn-window (event-start event)))
        (posn-col  (car (posn-col-row (event-start event))))
        (posn-row  (cdr (posn-col-row (event-start event))))
        choice base-size)
    <span class="linecomment">;; (read-event)                 ; Swallow mouse up event. $$ Not needed if bound to up event.</span>
    (save-excursion
      (set-buffer (window-buffer posn-win))
      (when completion-reference-buffer (setq buffer  completion-reference-buffer))
      (setq base-size  completion-base-size)
      (save-excursion
        (goto-char (posn-point (event-start event)))
        (let (beg end)
          (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
            (setq end  (point)
                  beg  (1+ (point))))
          (unless beg (error "<span class="quote">No completion here</span>"))
          (setq beg     (previous-single-property-change beg 'mouse-face)
                end     (or (next-single-property-change end 'mouse-face)(point-max))
                choice  (buffer-substring-no-properties beg end)))))
    (setq icicle-candidate-nb               (icicle-nb-of-candidate-in-Completions
                                             (posn-point (event-start event)))
          icicle-last-completion-candidate  choice)
    (let ((icicle-whole-candidate-as-text-prop-p  nil)
          (enable-recursive-minibuffers           t)
          (icicle-saved-completion-candidate      icicle-last-completion-candidate)
          (icicle-candidate-action-fn             'icicle-apply-to-saved-candidate))
      (icicle-apply-to-saved-candidate
       (completing-read (format "<span class="quote">Function to apply to `%s': </span>" icicle-saved-completion-candidate)
                        obarray 'functionp)))))

(defun icicle-apply-to-saved-candidate (function &optional use-icicle-candidates-alist-p)
  "<span class="quote">Apply FUNCTION to `icicle-saved-completion-candidate'.
If `current-prefix-arg' is non-nil, then pretty-print the result using
`pp-eval-expression'.</span>"
  (let ((real-fn  (if use-icicle-candidates-alist-p
                      (cdr (icicle-get-alist-candidate function))
                    (car (read-from-string function)))))
    <span class="linecomment">;; Actually, we should test more than `functionp', to rule out macros and special forms.</span>
    (unless (functionp real-fn) (error "<span class="quote">Not a function: `%S'</span>" real-fn))
    (condition-case icicle-candidate-read-fn-invoke
        (if current-prefix-arg
            (icicle-pp-eval-expression '(funcall real-fn icicle-saved-completion-candidate))
          (funcall real-fn icicle-saved-completion-candidate))
      (error (message  (format "<span class="quote">ERROR invoking `%S' on `%s': %s</span>" real-fn
                               icicle-saved-completion-candidate
                               (error-message-string icicle-candidate-read-fn-invoke)))
             (sleep-for 6)))
    (select-window (minibuffer-window))
    (select-frame-set-input-focus (selected-frame))
    (icicle-raise-Completions-frame)))

(defun icicle-raise-Completions-frame (&optional mouse-col mouse-row)
  "<span class="quote">Raise *Completions* frame, if displayed.
This helps keep *Completions* on top.

If `icicle-Completions-frame-at-right-flag' is non-nil and
*Completions* is in its own frame, then move that frame to the right,
out of the way.

Non-nil optional args MOUSE-COL and MOUSE-ROW move the mouse pointer
to column MOUSE-COL and row MOUSE-ROW.  Do this because
`icicle-candidate-action-fn' can call `select-frame-set-input-focus',
which can position mouse pointer on a standalone minibuffer frame.</span>"
  <span class="linecomment">;; Raise *Completions* frame, if displayed.  This helps keep *Completions* on top.</span>
  (let ((compl-win  (get-buffer-window "<span class="quote">*Completions*</span>" 'visible)))
    (when compl-win
      (save-window-excursion
        (select-window compl-win)
        <span class="linecomment">;; Move frame to the right, out of the way.</span>
        (when (and (one-window-p t) icicle-Completions-frame-at-right-flag)
          (modify-frame-parameters
           (selected-frame)             <span class="linecomment">; Hard-code 7 here - what does it depend on?</span>
           `((left . ,(- (x-display-pixel-width) (+ (frame-pixel-width) 7)))))
          (raise-frame)
          (when (and (integerp mouse-col) (integerp mouse-row))
            (set-mouse-position (selected-frame) mouse-col mouse-row)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-Completions-mouse-3-menu (event) <span class="linecomment">; Bound to `C-mouse-3' in *Completions.</span>
  "<span class="quote">Pop-up menu on `C-mouse-3' for the current candidate in *Completions*.</span>"
  (interactive "<span class="quote">e</span>")
  (run-hooks 'mouse-leave-buffer-hook) <span class="linecomment">; Give temp modes such as isearch a chance to turn off.</span>
  (let ((buffer    (window-buffer))
        (posn-win  (posn-window (event-start event)))
        (posn-col  (car (posn-col-row (event-start event))))
        (posn-row  (cdr (posn-col-row (event-start event))))
        candidate base-size menu-choice)
    <span class="linecomment">;; (read-event)                 ; Swallow mouse up event. $$ Not needed if bound to up event.</span>
    (save-excursion
      (set-buffer (window-buffer posn-win))
      (when completion-reference-buffer (setq buffer  completion-reference-buffer))
      (setq base-size  completion-base-size)
      (save-excursion
        (goto-char (posn-point (event-start event)))
        (let (beg end)
          (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
            (setq end  (point)
                  beg  (1+ (point))))
          (unless beg (error "<span class="quote">No completion here</span>"))
          (setq beg       (previous-single-property-change beg 'mouse-face)
                end       (or (next-single-property-change end 'mouse-face)(point-max))
                candidate (buffer-substring-no-properties beg end)))))
    (setq icicle-candidate-nb  (icicle-nb-of-candidate-in-Completions
                                (posn-point (event-start event)))
          icicle-last-completion-candidate candidate
          menu-choice
          (x-popup-menu
           event
           (list
            "<span class="quote">Completion Candidate</span>"
            (list
             "<span class="quote">$$ NOT USED $$</span>"
             '("<span class="quote">Help About  (`C-M-RET')</span>" . icicle-help-on-candidate)
             '("<span class="quote">Act On  (`C-RET', `C-mouse-2')</span>" . icicle-candidate-action)
             '("<span class="quote">Apply a Function To...  (`M-RET', `M-mouse-2')</span>" . icicle-candidate-read-fn-invoke)
             '("<span class="quote">Insert in Minibuffer  (`insert')</span>" .
               (lambda ()
                 (interactive)
                 (select-window (active-minibuffer-window))
                 (goto-char (icicle-minibuffer-prompt-end))
                 (icicle-clear-minibuffer)
                 (insert icicle-last-completion-candidate)))
             '("<span class="quote">--</span>")
             '("<span class="quote">--</span>")
             '("<span class="quote">Change Sort Order  (`C-,')</span>" . icicle-change-sort-order)
             '("<span class="quote">Change Alternative Sort Order  (`M-,')</span>" . icicle-change-alternative-sort-order)
             '("<span class="quote">Swap Alternative Sort  (`C-M-,')</span>" . icicle-toggle-alternative-sorting)
             '("<span class="quote">--</span>")
             '("<span class="quote">Save All  (`C-M-&gt;')</span>" . icicle-candidate-set-save)
             '("<span class="quote">             to Variable...  (`C-M-})' </span>" . icicle-candidate-set-save-to-variable)
             '("<span class="quote">             to Cache File...  (`C-})</span>" . icicle-candidate-set-save-persistently)
             '("<span class="quote">Add All to Saved  (`C-&gt;')</span>" . icicle-candidate-set-save-more)
             '("<span class="quote">Save Selected (Region) Candidates  (`C-M-)')</span>" . icicle-candidate-set-save-selected)
             '("<span class="quote">Add Selected (Region) Candidates  (`C-)')</span>" . icicle-candidate-set-save-more-selected)
             '("<span class="quote">Retrieve Saved  (`C-M-&lt;')</span>" . icicle-candidate-set-retrieve)
             '("<span class="quote">Retrieve More Saved  (`C-&lt;')</span>" . icicle-candidate-set-retrieve-more)
             '("<span class="quote">--</span>")
             '("<span class="quote">Complement All  (`C-~')</span>" . icicle-candidate-set-complement)
             '("<span class="quote">Or Match Alternative... (`M-+')</span>" . icicle-widen-candidates)
             '("<span class="quote">Match Also Regexp...  (`M-*')</span>" . icicle-narrow-candidates)
             '("<span class="quote">Satisfy Also Predicate...  (`M-&')</span>" . icicle-narrow-candidates-with-predicate)
             '("<span class="quote">Save Predicate to Variable...  (`C-M-&')</span>" . icicle-save-predicate-to-variable)
             '("<span class="quote">Intersect Saved  (`C-*')</span>" . icicle-candidate-set-intersection)
             '("<span class="quote">Subtract Saved  (`C--')</span>" . icicle-candidate-set-difference)
             '("<span class="quote">Add (Union) Saved  (`C-+')</span>" . icicle-candidate-set-union)
             '("<span class="quote">Only Previously Entered  (`M-pause')</span>" . icicle-keep-only-past-inputs)
             '("<span class="quote">--</span>")
             '("<span class="quote">Act on Each Individually (`C-!')</span>" . icicle-all-candidates-action)
             '("<span class="quote">Act on All as a List  (`M-!')</span>" . icicle-all-candidates-list-action)
             '("<span class="quote">--</span>")
             '("<span class="quote">Toggle Highlighting Past Inputs  (`C-pause')</span>" .
               icicle-toggle-highlight-historical-candidates)
             '("<span class="quote">Toggle Duplicate Removal  (`C-$')</span>" . icicle-toggle-transforming)
             '("<span class="quote">Toggle Case Sensitivity  (`C-A')</span>" . icicle-toggle-case-sensitivity)
             '("<span class="quote">Regexp-Quote Input  (`C-M-;')</span>" . icicle-regexp-quote-input)
             '("<span class="quote">Toggle Escaping Special Regexp Chars  (`C-`')</span>" . icicle-toggle-regexp-quote)
             '("<span class="quote">Toggle Incremental Completion  (`C-#')</span>" . icicle-toggle-incremental-completion)
             '("<span class="quote">Toggle Common Match Expansion  (`C-;')</span>" . icicle-toggle-expand-to-common-match)
             '("<span class="quote">Toggle Hiding Common Match (`C-M-.')</span>" . icicle-toggle-hiding-common-match)
             '("<span class="quote">Change Apropos Match Function  (`M-(')</span>" . icicle-next-apropos-match-function)
             '("<span class="quote">Toggle Fuzzy Prefix Completion  (`C-(')</span>" . icicle-toggle-fuzzy-completion)
             '("<span class="quote">Toggle Including Proxy Candidates  (`C-M-_')</span>" . icicle-toggle-proxy-candidates)
             '("<span class="quote">Toggle WYSIWYG for *Completions*</span>" . icicle-toggle-WYSIWYG-Completions)
             '("<span class="quote">Toggle Angle Brackets</span>" . icicle-toggle-angle-brackets)
             '("<span class="quote">Toggle Ignored File Extensions  (`C-.')</span>" . icicle-toggle-ignored-extensions)
             '("<span class="quote">Toggle Checking Remote Files  (`C-^')</span>" . icicle-toggle-remote-file-testing)
             '("<span class="quote">Toggle Ignoring Space Prefix  (`M-_')</span>" . icicle-toggle-ignored-space-prefix)
             '("<span class="quote">Toggle Using `C-' for Actions  (`M-g')</span>" . icicle-toggle-C-for-actions)
             '("<span class="quote">Toggle Using `~' for $HOME  (`M-~')</span>" . icicle-toggle-~-for-home-dir)
             '("<span class="quote">--</span>")
             '("<span class="quote">Toggle All-Current Search Highlighting  (`C-^')</span>" .
               icicle-toggle-highlight-all-current)
             '("<span class="quote">Toggle Whole-Word Searching  (`M-q')</span>" . icicle-toggle-search-whole-word)
             '("<span class="quote">Toggle Removal of Search Highlighting  (`C-.')</span>" . icicle-toggle-search-cleanup)
             '("<span class="quote">Toggle Replacing Whole Search Hit  (`C-,')</span>" . icicle-toggle-search-replace-whole)
             '("<span class="quote">Toggle Replacing Expanded Common Match  (`M-;')</span>" .
               icicle-toggle-search-replace-common-match)
             '("<span class="quote">--</span>")
             '("<span class="quote">+ Toggle Any Option...</span>" . icicle-toggle-option)
             '("<span class="quote">+ Turn Off Option...</span>" . icicle-reset-option-to-nil)
             '("<span class="quote">+ Turn On Option...</span>" . icicle-set-option-to-t)
             '("<span class="quote">--</span>")
             '("<span class="quote">Restore Previous Completion Input  (`C-l')</span>" . icicle-retrieve-previous-input)
             '("<span class="quote">Restore Next Completion Input  (`C-L')</span>" . icicle-retrieve-next-input)
             '("<span class="quote">One-Off Eval...  (`M-:')</span>" . icicle-pp-eval-expression-in-minibuffer)
             '("<span class="quote">Insert `icicle-input-string'  (`C-=')</span>" . icicle-insert-string-from-variable)
             '("<span class="quote">--</span>")
             '("<span class="quote">Icicles Help  (`C-?')</span>" . icicle-minibuffer-help)))))
    (and menu-choice (call-interactively menu-choice))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-widen-candidates ()       <span class="linecomment">; Bound to `M-+' in minibuffer.</span>
  "<span class="quote">Complete, allowing also candidates that match an alternative regexp.
You are prompted for the alternative input pattern.  Use `RET' to
enter it.

To (apropos) complete using a wider set of candidates, you use this
command after you have completed (`TAB' or `S-TAB').  A shortcut is to
use `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-apropos-complete-and-widen]' - \
it is the same as `S-TAB' followed by `\\[icicle-widen-candidates]'.

This command turns off `icicle-expand-input-to-common-match-flag', for
clarity.  You can use `\\[icicle-toggle-expand-to-common-match]' \
to toggle that option.</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (unless icicle-completion-candidates
    (error (substitute-command-keys
            "<span class="quote">No completion candidates.  Did you use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete]' or `\\[icicle-apropos-complete]'?</span>")))
  (let* ((raw-input                     icicle-current-raw-input)
         (enable-recursive-minibuffers  t)
         (new-regexp                    (icicle-read-string "<span class="quote">Or match alternative: </span>"
                                                            nil regexp-history)))
    (setq icicle-current-raw-input
          (concat (if (&lt; emacs-major-version 22) "<span class="quote">\\(</span>" "<span class="quote">\\(?:</span>") raw-input "<span class="quote">\\|</span>" new-regexp "<span class="quote">\\)</span>")
          icicle-expand-input-to-common-match-flag  nil))
  (icicle-clear-minibuffer)
  (insert icicle-current-raw-input)
  (let ((icicle-edit-update-p  t)) (icicle-apropos-complete))
  (icicle-msg-maybe-in-minibuffer "<span class="quote">Expansion to common match is OFF. \
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-expand-to-common-match]' to toggle</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-narrow-candidates ()      <span class="linecomment">; Bound to `M-*' in minibuffer.</span>
  "<span class="quote">Narrow the set of completion candidates using another input regexp.
This, in effect, performs a set intersection operation on 1) the set
of candidates in effect before the operation and 2) the set of
candidates that match the current input.  You can repeatedly use this
command to continue intersecting candidate sets, progressively
narrowing the set of matches.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-narrow-candidates]').</span>"
  <span class="linecomment">;; We handle `no-catch' errors here because `old-completing-read' and</span>
  <span class="linecomment">;; `old-read-file-file-name' can still be called in Icicle mode by, for instance, an</span>
  <span class="linecomment">;; `interactive' spec (e.g. (interactive "bBuffer: ")).  In that case, we throw to a</span>
  <span class="linecomment">;; non-existant catch.  After doing that, we just insert the result, to pass it to the</span>
  <span class="linecomment">;; next-higher recursive minibuffer.</span>
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let (<span class="linecomment">;; Restore match function, in case it was bound to nil, e.g., by `C-h C-o'.</span>
        (icicle-apropos-complete-match-fn  icicle-last-apropos-complete-match-fn)
        (enable-recursive-minibuffers      t))
    (cond ((null icicle-completion-candidates)
           (error
            (substitute-command-keys
             "<span class="quote">No completion candidates.  Did you use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete]' or `\\[icicle-apropos-complete]'?</span>")))
          ((null (cdr icicle-completion-candidates))
           (if (not icicle-top-level-when-sole-completion-flag)
               (minibuffer-message "<span class="quote">  [Sole completion]</span>")
             (set minibuffer-history-variable (cons (car icicle-completion-candidates)
                                                    (symbol-value minibuffer-history-variable)))
             (condition-case i-narrow-candidates
                 (throw 'icicle-read-top
                   (if (and (icicle-file-name-input-p) insert-default-directory
                            (or (not (member (car icicle-completion-candidates)
                                             icicle-extra-candidates))
                                icicle-extra-candidates-dir-insert-p))
                       (expand-file-name (car icicle-completion-candidates))
                     (car icicle-completion-candidates)))
               (no-catch (setq icicle-current-input  (car icicle-completion-candidates))
                         (icicle-retrieve-last-input)
                         icicle-current-input)
               (error (message (error-message-string i-narrow-candidates))))))
          (t
           (let* (<span class="linecomment">;; $$$$$$$$$$$$$ (icicle-whole-candidate-as-text-prop-p  nil)</span>
                  (current-candidates  icicle-completion-candidates)
                  (result
                   (if (and (&gt; emacs-major-version 21) (icicle-file-name-input-p))
                       (read-file-name "<span class="quote">Match also (regexp): </span>"
                                       (icicle-file-name-directory-w-default icicle-current-input)
                                       nil icicle-require-match-p nil
                                       (lambda (file-cand) (member file-cand current-candidates)))
                     <span class="linecomment">;; In Emacs &lt; 22, there is no PREDICATE arg to `read-file-name', so</span>
                     <span class="linecomment">;; we use `completing-read' even for file-name completion.  In that case, we</span>
                     <span class="linecomment">;; tack the `default-directory' onto each candidate, unless it is already an</span>
                     <span class="linecomment">;; absolute file name.  We also let completion functions (e.g. `S-TAB') know</span>
                     <span class="linecomment">;; that this is not really file-name completion.</span>
                     (completing-read
                      "<span class="quote">Match also (regexp): </span>"
                      (cond ((icicle-file-name-input-p)
                             (setq minibuffer-completing-file-name  nil) <span class="linecomment">; Disavow completing file.</span>
                             (let ((dir  (icicle-file-name-directory-w-default icicle-current-input)))
                               (mapcar (lambda (file)
                                         (list (if (file-name-absolute-p file)
                                                   file
                                                 (concat dir file))))
                                       icicle-completion-candidates)))
                            (icicle-whole-candidate-as-text-prop-p
                             (mapcar (lambda (cand) (icicle-get-alist-candidate (car cand)))
                                     (icicle-filter-alist minibuffer-completion-table
                                                          icicle-completion-candidates)))
                            (t
                             (mapcar #'list icicle-completion-candidates)))
                      nil icicle-require-match-p nil minibuffer-history-variable))))
             <span class="linecomment">;; Normally, `icicle-narrow-candidates' is called from the minibuffer.</span>
             <span class="linecomment">;; If not, just return the result read.</span>
             (if (&gt; (minibuffer-depth) 0)
                 (condition-case i-narrow-candidates
                     (throw 'icicle-read-top result)
                   (no-catch (setq icicle-current-input  result)
                             (icicle-retrieve-last-input)
                             icicle-current-input)
                   (error (message (error-message-string i-narrow-candidates))))
               result))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete-and-widen () <span class="linecomment">; Bound to `S-DEL' in minibuffer.</span>
  "<span class="quote">Like `icicle-apropos-complete' followed by `icicle-widen-candidates'.
That is, `S-TAB' followed by `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-widen-candidates]'.
You must enter the new, alternative input pattern using `RET'.</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  <span class="linecomment">;; $$$$$ (let ((icicle-top-level-when-sole-completion-flag  t))</span>
  (when (eq icicle-current-completion-mode 'prefix)
    (let ((icicle-incremental-completion-p  nil)
          (escaped-input                    (regexp-quote icicle-last-input)))
      (setq escaped-input  (if (icicle-file-name-input-p)
                               (concat (file-name-directory escaped-input) "<span class="quote">^</span>"
                                       (file-name-nondirectory escaped-input))
                             (concat "<span class="quote">^</span>" escaped-input)))
      (icicle-erase-minibuffer)
      (insert escaped-input)))
  (icicle-apropos-complete)
  (icicle-widen-candidates))

<span class="linecomment">;;;###autoload</span>
(defun icicle-apropos-complete-and-narrow () <span class="linecomment">; Bound to `S-SPC' in minibuffer.</span>
  "<span class="quote">Like `icicle-apropos-complete' followed by `icicle-narrow-candidates'.
That is, `S-TAB' followed by `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-narrow-candidates]'.</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  <span class="linecomment">;; $$$$$ (let ((icicle-top-level-when-sole-completion-flag  t))</span>
  (when (eq icicle-current-completion-mode 'prefix)
    (let ((icicle-incremental-completion-p  nil)
          (escaped-input                    (regexp-quote icicle-last-input)))
      (setq escaped-input  (if (icicle-file-name-input-p)
                               (concat (file-name-directory escaped-input) "<span class="quote">^</span>"
                                       (file-name-nondirectory escaped-input))
                             (concat "<span class="quote">^</span>" escaped-input)))
      (icicle-erase-minibuffer)
      (insert escaped-input)))
  (icicle-apropos-complete)
  (icicle-narrow-candidates))

<span class="linecomment">;;;###autoload</span>
(defun icicle-narrow-candidates-with-predicate () <span class="linecomment">; Bound to `M-&' in minibuffer.</span>
  "<span class="quote">Narrow the set of completion candidates by applying a predicate.
You can repeatedly use this command to apply additional predicates,
progressively narrowing the set of candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-narrow-candidates-with-predicate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (let (<span class="linecomment">;; Restore match function, in case it was bound to nil, e.g., by `C-h C-o'.</span>
        (icicle-apropos-complete-match-fn  icicle-last-apropos-complete-match-fn)
        (last-completion-cmd               (or icicle-last-completion-command
                                               'icicle-apropos-complete))
        (enable-recursive-minibuffers      t))
    (cond ((null icicle-completion-candidates)
           (error
            (substitute-command-keys
             "<span class="quote">No completion candidates.  Did you use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-prefix-complete]' or `\\[icicle-apropos-complete]'?</span>")))
          ((null (cdr icicle-completion-candidates))
           (if (not icicle-top-level-when-sole-completion-flag)
               (minibuffer-message "<span class="quote">  [Sole completion]</span>")
             (set minibuffer-history-variable (cons (car icicle-completion-candidates)
                                                    (symbol-value minibuffer-history-variable)))
             (condition-case i-narrow-candidates
                 (throw 'icicle-read-top
                   (if (and (icicle-file-name-input-p) insert-default-directory
                            (or (not (member (car icicle-completion-candidates)
                                             icicle-extra-candidates))
                                icicle-extra-candidates-dir-insert-p))
                       (expand-file-name (car icicle-completion-candidates))
                     (car icicle-completion-candidates)))
               (no-catch (setq icicle-current-input  (car icicle-completion-candidates))
                         (icicle-retrieve-last-input)
                         icicle-current-input)
               (error (message (error-message-string i-narrow-candidates))))))
          (t
           <span class="linecomment">;; Read new predicate to apply.</span>
           (let ((pred  (icicle-read-from-minibuf-nil-default "<span class="quote">Additional predicate to apply: </span>"
                                                              nil read-expression-map t
                                                              (if (boundp 'function-name-history)
                                                                  'function-name-history
                                                                'icicle-function-name-history))))
             <span class="linecomment">;; Update `read-file-name-predicate' or `minibuffer-completion-predicate'</span>
             <span class="linecomment">;; to also use new predicate, PRED.</span>
             (cond ((and (icicle-file-name-input-p) (boundp 'read-file-name-predicate))
                    <span class="linecomment">;; File name input, Emacs 22+.  Update `read-file-name-predicate'.</span>
                    (setq read-file-name-predicate
                          (if read-file-name-predicate
                              (lexical-let ((curr-pred read-file-name-predicate))
                                `(lambda (file-cand)
                                  (and (funcall ',curr-pred file-cand) (funcall ',pred file-cand))))
                            pred)))
                   ((icicle-file-name-input-p)
                    <span class="linecomment">;; File name input, Emacs &lt; 22.  We can do nothing for file name.</span>
                    <span class="linecomment">;; `TAB' or `S-TAB' will unfortunately bring it back as a candidate.</span>
                    )
                   (t
                    <span class="linecomment">;; Non-file name input.  Update `minibuffer-completion-predicate'.</span>
                    (setq minibuffer-completion-predicate
                          (if minibuffer-completion-predicate
                              (lexical-let ((curr-pred minibuffer-completion-predicate))
                                `(lambda (cand)
                                  (and (funcall ',curr-pred cand) (funcall ',pred cand))))
                            pred)))))))
    (funcall last-completion-cmd)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-save-predicate-to-variable (askp) <span class="linecomment">; Bound to `C-M-&' in minibuffer.</span>
  "<span class="quote">Save the current completion predicate to a variable.
By default, the variable is `icicle-input-string'.  If you use a
prefix argument, then you are prompted for the variable to use.

You can retrieve the saved predicate as a string using `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-from-variable]'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-save-predicate-to-variable]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (let* ((pred                                   minibuffer-completion-predicate)
         (icicle-whole-candidate-as-text-prop-p  nil)
         (enable-recursive-minibuffers           t)
         (var                                    (if askp
                                                     (intern (completing-read
                                                              "<span class="quote">Save candidates in variable: </span>" obarray
                                                              'boundp nil nil
                                                              (if (boundp 'variable-name-history)
                                                                  'variable-name-history
                                                                'icicle-variable-name-history)))
                                                   'icicle-input-string)))
    (set var (prin1-to-string pred))
    (save-selected-window (select-window (minibuffer-window))
                          (minibuffer-message (format "<span class="quote">  [Predicate SAVED to `%s']</span>" var)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-swap ()     <span class="linecomment">; Bound to `C-%' in minibuffer.</span>
  "<span class="quote">Swap the saved set and current sets of completion candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-swap]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (setq icicle-saved-completion-candidates
        (prog1 icicle-completion-candidates
          (setq icicle-completion-candidates  icicle-saved-completion-candidates)))
  (minibuffer-message "<span class="quote">  [Saved set of candidates SWAPPED with current]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-define ()   <span class="linecomment">; Bound to `C-:' in minibuffer.</span>
  "<span class="quote">Define the set of current completion candidates by evaluating a sexp.
The Lisp sexp must evaluate to a list of strings, such as is returned
by `all-completions'.

You can use this command at top level or from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-define]').</span>"
  (interactive)
  (let* ((enable-recursive-minibuffers  t)
         (evald-sexp                    (eval-minibuffer
                                         "<span class="quote">Set the completion candidates to sexp (eval): </span>")))
    (if (or (null evald-sexp) (and (consp evald-sexp) (stringp (car evald-sexp))))
        (setq icicle-completion-candidates  evald-sexp)
      (error "<span class="quote">Sexp did not evaluate to a list of strings: %S</span>" evald-sexp)))
  (icicle-maybe-sort-and-strip-candidates)
  (message "<span class="quote">List of completion candidates DEFINED: %S</span>" icicle-completion-candidates)
  (when (&gt; (minibuffer-depth) 0)
    (message "<span class="quote">Displaying completion candidates...</span>")
    (with-output-to-temp-buffer "<span class="quote">*Completions*</span>"
      (display-completion-list icicle-completion-candidates))
    (icicle-narrow-candidates)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-difference () <span class="linecomment">; Bound to `C--' in minibuffer.</span>
  "<span class="quote">Take the set difference between the current and saved candidates.
The new set of candidates is the set of candidates prior to executing
this command minus the saved set of candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-difference]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (icicle-candidate-set-1 'icicle-set-difference "<span class="quote">  [saved set of candidates SUBTRACTED]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-union ()    <span class="linecomment">; Bound to `C-+' in minibuffer.</span>
  "<span class="quote">Take the set union between the current and saved candidates.
The new set of candidates is the union of the saved set of candidates
and the set of candidates prior to executing this command.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-union]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (icicle-candidate-set-1 'icicle-set-union "<span class="quote">  [saved set of candidates ADDED]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-intersection () <span class="linecomment">; Bound to `C-*' in minibuffer.</span>
  "<span class="quote">Take the set intersection between the current and saved candidates.
The new set of candidates is the intersection of the saved set of
candidates and the set of candidates prior to executing this command.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-intersection]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (icicle-candidate-set-1 'icicle-set-intersection
                          "<span class="quote">  [INTERSECTION of saved and current sets of candidates]</span>"))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-complement () <span class="linecomment">; Bound to `C-~' in minibuffer.</span>
  "<span class="quote">Complement the set of current completion candidates.
The new set of candidates is the set of `all-completions' minus the
set of candidates prior to executing this command - that is, all
possible completions of the appropriate type, except for those that
are in the current set of completions.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-complement]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (setq icicle-completion-candidates
        (icicle-set-difference
         (all-completions "<span class="quote"></span>" minibuffer-completion-table minibuffer-completion-predicate
                          icicle-ignore-space-prefix-flag)
         icicle-completion-candidates))
  (icicle-maybe-sort-and-strip-candidates)
  (message "<span class="quote">Displaying completion candidates...</span>")
  (with-output-to-temp-buffer "<span class="quote">*Completions*</span>" (display-completion-list icicle-completion-candidates))
  (minibuffer-message "<span class="quote">  [Set of candidates COMPLEMENTED]</span>")
  (icicle-narrow-candidates))

(defun icicle-candidate-set-truncate (n) <span class="linecomment">; Bound to `M-$' in minibuffer.</span>
  "<span class="quote">Trim the set of current completion candidates at the end.
The first N candidates are kept.  N is read.</span>"
  <span class="linecomment">;; Ugly hack: `icicle-saved-completion-candidates-internal'.  No way to bind a variable</span>
  <span class="linecomment">;; in `interactive' and have the binding be active in the function body.</span>
  (interactive
   (list (let ((enable-recursive-minibuffers  t))
           (setq icicle-saved-completion-candidates-internal  icicle-completion-candidates)
           (if current-prefix-arg
               (prefix-numeric-value current-prefix-arg)
             (read-number "<span class="quote">Number of candidates to keep: </span>")))))
  (setq icicle-completion-candidates  icicle-saved-completion-candidates-internal)
  (setcdr (nthcdr (1- n) icicle-completion-candidates) nil)
  (icicle-maybe-sort-and-strip-candidates)
  (message "<span class="quote">Displaying completion candidates...</span>")
  (with-output-to-temp-buffer "<span class="quote">*Completions*</span>" (display-completion-list icicle-completion-candidates))
  (message (format "<span class="quote">  [Set of candidates TRUNCATED to %d]</span>" n))
  (icicle-narrow-candidates))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve (&optional arg) <span class="linecomment">; Bound to `C-M-&lt;' in minibuffer.</span>
  "<span class="quote">Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-save/unsave-candidate]', `M-S-mouse-2',
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-save]', \
`\\[icicle-candidate-set-save-to-variable]', or `\\[icicle-candidate-set-save-persistently]'.

With no prefix arg, retrieve candidates from variable
 `icicle-saved-completion-candidates'.
With a numeric prefix arg, retrieve candidates from another variable.
With a plain prefix arg (`C-u'), retrieve candidates from a cache file
 or, if option `icicle-filesets-as-saved-completion-sets-flag' is
 non-nil, an Emacs fileset name (Emacs 22 or later).  To use filesets,
 you must also load library `filesets' and use `(filesets-init)'.

Completion is available when you are prompted for a cache file,
fileset, or variable name.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (icicle-candidate-set-retrieve-1 arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve-1 (arg &optional morep)
  "<span class="quote">Helper function for `icicle-candidate-set-retrieve(-more)'.
ARG is the same as the raw prefix arg for `icicle-candidate-set-retrieve'.
MOREP non-nil means add the saved candidates, don't replace existing.</span>"
  (let ((name        nil)
        (variablep   (and arg (atom arg)))
        (curr-cands  icicle-completion-candidates)
        saved-cands)
    (if arg
        (let ((icicle-whole-candidate-as-text-prop-p  nil)
              (enable-recursive-minibuffers           t))
          (if variablep
              <span class="linecomment">;; Retrieve from a variable.  Prompt user for the variable to use.</span>
              (setq saved-cands
                    (append (and morep curr-cands)
                            (symbol-value
                             (setq name  (intern
                                          (completing-read <span class="linecomment">; Variable name.</span>
                                           "<span class="quote">Retrieve candidates from variable: </span>"
                                           icicle-saved-candidates-variables-obarray
                                           nil nil nil (if (boundp 'variable-name-history)
                                                           'variable-name-history
                                                         'icicle-variable-name-history)))))))
            <span class="linecomment">;; Retrieve from a persistent set (and save to `icicle-saved-completion-candidates').</span>
            (setq name  (completing-read "<span class="quote">Retrieve candidates from persistent set: </span>"
                                         (if (and icicle-filesets-as-saved-completion-sets-flag
                                                  (featurep 'filesets) filesets-data)
                                             (append filesets-data icicle-saved-completion-sets)
                                           icicle-saved-completion-sets)
                                         nil nil nil 'icicle-completion-set-history))
            (icicle-retrieve-candidates-from-set name)
            (setq saved-cands  (append (and morep curr-cands) icicle-saved-completion-candidates))))
      <span class="linecomment">;; Retrieve from the default variable, `icicle-saved-completion-candidates'.</span>
      (setq saved-cands  (append (and morep curr-cands)
                                 icicle-saved-completion-candidates)))
    (cond ((null saved-cands)
           (deactivate-mark)
           (icicle-display-candidates-in-Completions)
           (message "<span class="quote">No saved candidates to restore</span>") (sit-for 2))
          (t
           (setq icicle-completion-candidates <span class="linecomment">; Remove directories if completing file names</span>
                 (if (icicle-file-name-input-p) <span class="linecomment">; using `read-file-name'.</span>
                     (mapcar #'file-name-nondirectory saved-cands)
                   saved-cands))
           (cond ((and (consp icicle-completion-candidates) (null (cdr icicle-completion-candidates)))
                  (icicle-remove-Completions-window)
                  (icicle-insert-completion (car icicle-completion-candidates)) <span class="linecomment">; Insert sole cand.</span>
                  (minibuffer-message "<span class="quote">  [Sole candidate restored]</span>")
                  (save-selected-window (select-window (minibuffer-window))
                                        (icicle-highlight-complete-input)))
                 ((consp icicle-completion-candidates)
                  (deactivate-mark)
                  (icicle-display-candidates-in-Completions)
                  (save-selected-window
                    (select-window (minibuffer-window))
                    (minibuffer-message (if name
                                            (format "<span class="quote">  [Saved candidates RESTORED from %s `%s']</span>"
                                                    (if variablep "<span class="quote">variable</span>" "<span class="quote">cache file</span>") name)
                                          "<span class="quote">  [Saved candidates RESTORED]</span>")))
                  (icicle-narrow-candidates)))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve-more (&optional arg) <span class="linecomment">; Bound to `C-&lt;' in minibuffer.</span>
  "<span class="quote">Retrieve a saved set of completion candidates, adding it current.
The saved candidates are added to those already current.
A prefix argument acts as for `icicle-candidate-set-retrieve'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-more]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (icicle-candidate-set-retrieve-1 arg t))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve-from-variable () <span class="linecomment">; Bound to `C-M-{' in minibuffer.</span>
  "<span class="quote">Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-save/unsave-candidate]', `M-S-mouse-2', or
`\\[icicle-candidate-set-save-to-variable]' (or `\\[icicle-candidate-set-save]' with a numeric \
prefix arg).

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-from-variable]').</span>"
  (interactive)
  (icicle-candidate-set-retrieve 99))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-retrieve-persistent () <span class="linecomment">; Bound to `C-{' in minibuffer.</span>
  "<span class="quote">Retrieve a saved set of completion candidates, making it current.
This retrieves candidates saved with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-persistently]' or `C-u \\[icicle-candidate-set-save]'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-persistent]').</span>"
  (interactive)
  (icicle-candidate-set-retrieve '(1)))

(defun icicle-retrieve-candidates-from-set (set-name)
  "<span class="quote">Retrieve the saved set of completion candidates named SET-NAME.
SET-NAME names an Icicles saved completion set or, if
 `icicle-filesets-as-saved-completion-sets-flag' is non-nil, an Emacs
 fileset.  If that option is non-nil and SET-NAME names a saved
 completion set that contains Emacs filesets, then the files specified
 for the filesets are also retrieved. 
The candidates are retrieved to `icicle-saved-completion-candidates'.</span>"
  (setq icicle-saved-completion-candidates  (icicle-get-candidates-from-saved-set set-name))
  (when icicle-candidates-alist         <span class="linecomment">; Redefine `icicle-candidates-alist'.</span>
    (let ((icicle-whole-candidate-as-text-prop-p  t))
      (setq icicle-candidates-alist  (mapcar #'icicle-get-alist-candidate
                                             icicle-saved-completion-candidates)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-save/unsave-candidate ()  <span class="linecomment">; Bound to `insert' in minibuffer.</span>
  "<span class="quote">Add/remove current candidate to/from `icicle-saved-completion-candidates'.
If the candidate is already saved, then unsave it; otherwise, save it.
You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-save/unsave-candidate]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (if (not (wholenump icicle-candidate-nb))
      (save-selected-window (select-window (minibuffer-window))
                            (minibuffer-message "<span class="quote">  [No current candidate]</span>"))
    (let ((cand  (elt icicle-completion-candidates icicle-candidate-nb)))
      (cond ((member cand icicle-saved-completion-candidates)
             (setq icicle-saved-completion-candidates
                   (delete icicle-last-completion-candidate icicle-saved-completion-candidates))
             (save-selected-window (select-window (minibuffer-window))
                                   (minibuffer-message "<span class="quote">  [Candidate UNsaved]</span>")))
            (t
             (push cand icicle-saved-completion-candidates)
             (save-selected-window (select-window (minibuffer-window))
                                   (minibuffer-message "<span class="quote">  [Candidate SAVED]</span>")))))))
<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-save/unsave-candidate (event) <span class="linecomment">; Bound to `M-S-mouse-2' in *Completions.</span>
  "<span class="quote">Add/remove clicked candidate to/from `icicle-saved-completion-candidates'.
If the candidate is already saved, then unsave it; otherwise, save it.</span>"
  (interactive "<span class="quote">e</span>")
  (run-hooks 'mouse-leave-buffer-hook)  <span class="linecomment">; Give temp modes such as isearch a chance to turn off.</span>
  (let ((buffer    (window-buffer))
        (posn-win  (posn-window (event-start event)))
        (posn-col  (car (posn-col-row (event-start event))))
        (posn-row  (cdr (posn-col-row (event-start event))))
        choice base-size)
    (read-event)                        <span class="linecomment">; Swallow mouse up event.</span>
    (save-excursion
      (set-buffer (window-buffer posn-win))
      (when completion-reference-buffer (setq buffer  completion-reference-buffer))
      (setq base-size  completion-base-size)
      (save-excursion
        (goto-char (posn-point (event-start event)))
        (let (beg end)
          (when (and (not (eobp)) (get-text-property (point) 'mouse-face))
            (setq end  (point)
                  beg  (1+ (point))))
          (unless beg (error "<span class="quote">No completion here</span>"))
          (setq beg     (previous-single-property-change beg 'mouse-face)
                end     (or (next-single-property-change end 'mouse-face)(point-max))
                choice  (buffer-substring-no-properties beg end)))))
    (setq icicle-candidate-nb               (icicle-nb-of-candidate-in-Completions
                                             (posn-point (event-start event)))
          icicle-last-completion-candidate  choice)
    (cond ((member icicle-last-completion-candidate icicle-saved-completion-candidates)
           (setq icicle-saved-completion-candidates
                 (delete icicle-last-completion-candidate icicle-saved-completion-candidates))
           (save-selected-window (select-window (minibuffer-window))
                                 (minibuffer-message "<span class="quote">  [Candidate UNsaved]</span>")))
          (t
           (push icicle-last-completion-candidate icicle-saved-completion-candidates)
           (save-selected-window (select-window (minibuffer-window))
                                 (minibuffer-message "<span class="quote">  [Candidate SAVED]</span>"))))
    (deactivate-mark)
    (icicle-display-candidates-in-Completions)
    (icicle-raise-Completions-frame posn-col posn-row)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-candidate-set-save (ignore &optional arg) <span class="linecomment">; `M-S-mouse-3' in *Completions*.</span>
  "<span class="quote">`icicle-candidate-set-save(-selected)'.
If the region is active in *Completions*, then
`icicle-candidate-set-save-selected'.  Otherwise,
`icicle-candidate-set-save'.</span>"
  (interactive "<span class="quote">e\nP</span>")
  (if (and (get-buffer "<span class="quote">*Completions*</span>")
           (save-current-buffer
             (set-buffer (get-buffer "<span class="quote">*Completions*</span>"))
             (and mark-active (mark) (/= (point) (mark)))))
      (icicle-candidate-set-save-selected arg)
    (icicle-candidate-set-save arg)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-candidate-set-save-more (ignore &optional arg) <span class="linecomment">; `M-mouse-3' in *Completions*.</span>
  "<span class="quote">`icicle-candidate-set-save-more(-selected)'.
If the region is active in *Completions*, then
`icicle-candidate-set-save-more-selected'.  Otherwise,
`icicle-candidate-set-save-more'.</span>"
  (interactive "<span class="quote">e\nP</span>")
  (if (and (get-buffer "<span class="quote">*Completions*</span>")
           (save-current-buffer
             (set-buffer (get-buffer "<span class="quote">*Completions*</span>"))
             (and mark-active (mark) (/= (point) (mark)))))
      (icicle-candidate-set-save-more-selected arg)
    (icicle-candidate-set-save-more arg)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-mouse-save-then-kill (click &optional arg)
  "<span class="quote">`mouse-save-then-kill', but click same place saves selected candidates.</span>"
  (interactive "<span class="quote">e\nP</span>")
  (flet ((mouse-save-then-kill-delete-region (beg end)
           (icicle-mouse-candidate-set-save-more nil arg)))
    (mouse-save-then-kill click))
  (setq this-command  'mouse-save-then-kill))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save (&optional arg) <span class="linecomment">; Bound to `C-M-&gt;' in minibuffer.</span>
  "<span class="quote">Save the set of current completion candidates, for later recall.
Saves candidates in variable `icicle-saved-completion-candidates', by
default.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.  To
 subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of candidates with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (icicle-candidate-set-save-1 icicle-completion-candidates arg))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-more (&optional arg) <span class="linecomment">; Bound to `C-&gt;' in minibuffer.</span>
  "<span class="quote">Add current completion candidates to saved candidates set.
The current candidates are added to those already saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-more]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (icicle-candidate-set-save-1 icicle-completion-candidates arg t))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-selected (&optional arg) <span class="linecomment">; Bound to `C-M-)' in minibuffer.</span>
  "<span class="quote">`icicle-candidate-set-save', but only for the selected candidates.
Candidates at least partially in the region are saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

As a special case, if no candidates are selected, then this empties
the current set of saved candidates.  That is, it UNsaves all saved
candidates.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-selected]').</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-candidate-set-save-selected-1 arg nil 'no-error))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-more-selected (&optional arg) <span class="linecomment">; Bound to `C-)' in minibuffer.</span>
  "<span class="quote">`icicle-candidate-set-save-more', but only for the selected candidates.
Candidates at least partially in the region are added to those saved.
A prefix argument acts the same as for `icicle-candidate-set-save'.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-more-selected]').</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-candidate-set-save-selected-1 arg t))

(defun icicle-candidate-set-save-selected-1 (arg &optional morep no-error-p)
  "<span class="quote">Helper function for `icicle-candidate-set-save(-more)(-region)'.</span>"
  (when (or (get-buffer-window "<span class="quote">*Completions*</span>" 0) no-error-p)
    (let ((beg-cand-nb  0)
          (end-cand-nb  0)
          (candidates   ())
          (orig-buf     (current-buffer)))
      (when (get-buffer-window "<span class="quote">*Completions*</span>" 0) <span class="linecomment">; Do nothing if not displayed.</span>
        (with-current-buffer "<span class="quote">*Completions*</span>"
          (when (and mark-active (mark) (/= (point) (mark)) icicle-completion-candidates)
            (let ((bob  (icicle-start-of-candidates-in-Completions))
                  (eob  (point-max))
                  (beg  (region-beginning))
                  (end  (region-end))
                  temp)
              <span class="linecomment">;; Extend region ends to include all of first and last selected candidates.</span>
              (unless (get-text-property beg 'mouse-face)
                (if (setq temp  (next-single-property-change beg 'mouse-face))
                    (setq beg  temp)
                  (setq beg  (next-single-property-change temp 'mouse-face))))
              (unless (get-text-property end 'mouse-face)
                (if (setq temp  (previous-single-property-change end 'mouse-face))
                    (setq end  temp)
                  (setq end  (previous-single-property-change temp 'mouse-face))))
              (when (&gt; beg end) (error "<span class="quote">No candidates selected</span>")) <span class="linecomment">; Active region but none selected.</span>
              (while (and (&gt;= beg bob) (get-text-property beg 'mouse-face)) (setq beg  (1- beg)))
              (while (and (&lt;= end eob) (get-text-property end 'mouse-face)) (setq end  (1+ end)))
              (setq beg          (1+ beg)
                    end          (1- end)
                    beg-cand-nb  (icicle-nb-of-candidate-in-Completions beg)
                    end-cand-nb  (icicle-nb-of-candidate-in-Completions end))
              (while (&lt;= beg-cand-nb end-cand-nb)
                (push (elt icicle-completion-candidates beg-cand-nb) candidates)
                (setq beg-cand-nb  (1+ beg-cand-nb)))))))
      (setq candidates  (nreverse candidates))
      (icicle-candidate-set-save-1 candidates arg morep t no-error-p)
      (let ((win  (get-buffer-window orig-buf 'visible)))
        (when win (select-window win))))))

(defun icicle-candidate-set-save-1 (new-cands arg &optional morep only-selected-p no-error-p)
  "<span class="quote">Helper function for `icicle-candidate-set-save*'.
NEW-CANDS are the candidates to save.
ARG is the same as the raw prefix arg for `icicle-candidate-set-save'.
MOREP non-nil means add the candidates, don't replace existing set.
ONLY-SELECTED-P non-nil means NEW-CANDS are selected in *Completions*.
NO-ERROR-P non-nil means don't raise an error if NEW-CANDS is nil.</span>"
  (unless (or new-cands no-error-p)
    (error "<span class="quote">Cannot save empty candidates set - did you use `S-TAB' or `TAB'?</span>"))
  (let (where)
    (if arg
        (let ((enable-recursive-minibuffers  t))
          (cond ((consp arg)
                 <span class="linecomment">;; Save to cache file (and to `icicle-saved-completion-candidates').</span>
                 (let* ((file-name
                         (prog1 (let ((icicle-completion-candidates  icicle-completion-candidates))
                                  (icicle-add/update-saved-completion-set))
                           (when (minibuffer-window-active-p (minibuffer-window))
                             (with-output-to-temp-buffer "<span class="quote">*Completions*</span>" <span class="linecomment">; Redisplay.</span>
                               (display-completion-list icicle-completion-candidates)))
                           (select-window (minibuffer-window))))
                        (list-buf   (and morep (find-file-noselect file-name 'nowarn 'raw)))
                        (old-cands  ()))
                   (when morep
                     (unwind-protect
                          (condition-case nil
                              (setq old-cands  (read list-buf))
                            (end-of-file
                             (save-selected-window
                               (select-window (minibuffer-window))
                               (minibuffer-message (format "<span class="quote">  [No completion candidates in file `%s']</span>"
                                                           file-name)))))
                       (kill-buffer list-buf)))
                   <span class="linecomment">;; Convert to readable alist form, from propertized text.  Convert any markers</span>
                   <span class="linecomment">;; to the form (icicle-file-marker FILE POS) or (icicle-marker BUFFER POS).</span>
                   (when (and new-cands (get-text-property 0 'icicle-whole-candidate (car new-cands)))
                     (setq new-cands
                           (mapcar (lambda (cand)
                                     (icicle-markers-to-readable (icicle-get-alist-candidate cand)))
                                   new-cands)))
                   (setq icicle-saved-completion-candidates  (append new-cands old-cands)
                         where                               (format "<span class="quote">cache file `%s'</span>" file-name))
                   (with-temp-message (format "<span class="quote">Writing candidates to cache file `%s'...</span>" file-name)
                     (condition-case err
                         (with-temp-file file-name
                           (prin1 icicle-saved-completion-candidates (current-buffer)))
                       (error (error "<span class="quote">Could not write to cache file.  %S</span>"
                                     (error-message-string err)))))))
                ((zerop (prefix-numeric-value arg))
                 <span class="linecomment">;; Save to a fileset (and to `icicle-saved-completion-candidates').</span>
                 (unless (require 'filesets nil t)
                   (error "<span class="quote">Cannot save to a fileset - feature `filesets' not provided</span>"))
                 (filesets-init)
                 (let ((icicle-completion-candidates  icicle-completion-candidates))
                   (setq where  (completing-read "<span class="quote">Save to fileset: </span>" filesets-data)))
                 (dolist (cand  new-cands) (icicle-add-file-to-fileset cand where))
                 (when (minibuffer-window-active-p (minibuffer-window))
                   (with-output-to-temp-buffer "<span class="quote">*Completions*</span>" <span class="linecomment">; Redisplay.</span>
                     (display-completion-list icicle-completion-candidates)))
                 (select-window (minibuffer-window))
                 (setq where  (format "<span class="quote">`%s'</span>" where)))
                (t <span class="linecomment">;; Save to a variable.  Prompt for the variable to use.</span>
                 (let* ((varname
                         (prog1 (let ((icicle-completion-candidates
                                       icicle-completion-candidates)
                                      (icicle-whole-candidate-as-text-prop-p  nil))
                                  (completing-read (if morep
                                                       "<span class="quote">Add candidates to variable: </span>"
                                                     "<span class="quote">Save candidates in variable: </span>")
                                                   icicle-saved-candidates-variables-obarray
                                                   nil nil nil (if (boundp 'variable-name-history)
                                                                   'variable-name-history
                                                                 'icicle-variable-name-history)))
                           (when (minibuffer-window-active-p (minibuffer-window))
                             (with-output-to-temp-buffer "<span class="quote">*Completions*</span>"
                               (display-completion-list icicle-completion-candidates)))
                           (select-window (minibuffer-window))))
                        (var  (intern varname))) <span class="linecomment">; Intern in standard `obarray'.</span>
                   (intern varname icicle-saved-candidates-variables-obarray) <span class="linecomment">; For completion.</span>
                   (set var (if (and morep (boundp var) (listp (symbol-value var)))
                                (append new-cands (symbol-value var))
                              new-cands))
                   (setq where  (format "<span class="quote">`%s'</span>" var))))))
      <span class="linecomment">;; Save to default variable, `icicle-saved-completion-candidates'.</span>
      (setq where  "<span class="quote">`icicle-saved-completion-candidates'</span>"
            icicle-saved-completion-candidates
            (if (and morep (listp icicle-saved-completion-candidates))
                (append new-cands icicle-saved-completion-candidates)
              new-cands)))
    (deactivate-mark)
    (when (and (minibuffer-window-active-p (minibuffer-window))
               (get-buffer-window "<span class="quote">*Completions*</span>" 'visible))
      (icicle-display-candidates-in-Completions))
    (save-selected-window
      (select-window (minibuffer-window))
      (minibuffer-message
       (if morep
           (if new-cands
               (format "<span class="quote">  [%sandidates ADDED to %s]</span>" (if only-selected-p "<span class="quote">Selected c</span>" "<span class="quote">C</span>") where)
             "<span class="quote">  [NO candidates selected to add]</span>")
         (if new-cands
             (format "<span class="quote">  [%sandidates SAVED to %s]</span>" (if only-selected-p "<span class="quote">Selected c</span>" "<span class="quote">C</span>") where)
           "<span class="quote">  [Saved candidates reset to NONE]</span>"))))))

<span class="linecomment">;; This is actually a top-level command, but it is in this file because it is used by</span>
<span class="linecomment">;; `icicle-candidate-set-save-1'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; We don't define this using `icicle-define-add-to-alist-command', because we want to</span>
<span class="linecomment">;; return the cache-file name.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-add/update-saved-completion-set ()
  "<span class="quote">Add or update an entry in `icicle-saved-completion-sets'.
That is, create a new saved completion set or update an existing one.
You are prompted for the name of a set of completion candidates and
its cache file.  By default, the cache file name is the set name
without spaces, and with file extension `icy'.  List
`icicle-saved-completion-sets' is updated to have an entry with these
set and file names.  Return the cache-file name.</span>"
  (interactive)
  (let* ((icicle-whole-candidate-as-text-prop-p  nil)
         (set-name                               (icicle-substring-no-properties
                                                  (completing-read "<span class="quote">Saved completion set: </span>"
                                                                   icicle-saved-completion-sets nil nil
                                                                   nil 'icicle-completion-set-history)))
         (file-name                              "<span class="quote"></span>"))
    (setq file-name  (expand-file-name
                      (read-file-name "<span class="quote">Cache file for the set: </span>" default-directory nil nil
                                      (concat (icicle-delete-whitespace-from-string set-name) "<span class="quote">.icy</span>"))))
    (while (not (icicle-file-writable-p file-name))
      (setq file-name  (expand-file-name
                        (read-file-name
                         "<span class="quote">Cannot write to that file. Cache file: </span>" default-directory nil nil
                         (concat (icicle-delete-whitespace-from-string set-name) "<span class="quote">.icy</span>")))))
    (setq icicle-saved-completion-sets  <span class="linecomment">; Remove any old definition of this set.</span>
          (icicle-assoc-delete-all set-name icicle-saved-completion-sets))
    (push (cons set-name file-name) icicle-saved-completion-sets) <span class="linecomment">; Add new set definition.</span>
    (funcall icicle-customize-save-variable-function
             'icicle-saved-completion-sets
             icicle-saved-completion-sets)
    (message "<span class="quote">Added set to `icicle-saved-completion-sets': `%s'</span>" set-name)
    file-name))                         <span class="linecomment">; Return cache-file name.</span>

<span class="linecomment">;; Similar to `filesets-add-buffer', but that insists on a buffer.  This is actually a top-level</span>
<span class="linecomment">;; command, but it is in this file because it is used by `icicle-candidate-set-save-1'.</span>
(defun icicle-add-file-to-fileset (&optional file name)
  "<span class="quote">Add FILE to the fileset called NAME.
If FILE is nil, use file of current buffer.
If NAME is nil, prompt for the fileset.</span>"
  (interactive)
  (unless (require 'filesets nil t) (error "<span class="quote">Cannot find library `filesets'</span>"))
  (setq file  (or file (buffer-file-name) (and (interactive-p) (read-file-name "<span class="quote">File to add: </span>"
                                                                               nil nil t))
                  (error "<span class="quote">Current buffer has no associated file</span>"))
        name  (or name (and (interactive-p) (completing-read (format "<span class="quote">Add `%s' to fileset: </span>" file)
                                                             filesets-data))
                  (error "<span class="quote">No fileset</span>")))
  (let ((entry  (or (assoc name filesets-data)
                    (and (interactive-p)
                         (when (y-or-n-p (format "<span class="quote">Fileset `%s' does not exist. Create it? </span>" name))
                           (add-to-list 'filesets-data (list name '(:files)))
                           (message "<span class="quote">Fileset created.  Use `M-x filesets-save-config' to save it.</span>")
                           (car filesets-data))))))
    (if (not entry)
        (when (interactive-p) (message "<span class="quote">Operation cancelled - no fileset</span>"))
      (let* ((files  (filesets-entry-get-files entry)))
        (cond ((filesets-member file files :test 'filesets-files-equalp)
               (message "<span class="quote">`%s' is already in fileset `%s'</span>" file name))
              ((and file (eq (filesets-entry-mode entry) ':files))
               (filesets-entry-set-files entry (cons file files) t)
               (filesets-set-config name 'filesets-data filesets-data))
              (t (error "<span class="quote">Cannot add file. Fileset `%s' is not of type Files (:files)</span>" name)))))))

(defun icicle-markers-to-readable (cand)
  "<span class="quote">Convert (serialize) candidate CAND to Lisp-readable representation.
CAND is a full completion candidate (collection alist entry).
A Lisp-readable candidate uses one of the following forms to represent
a marker:
  (icicle-file-marker  FILE-NAME    MARKER-POSITION)
  (icicle-marker       BUFFER-NAME  MARKER-POSITION)</span>"
  (if (atom cand)
      (if (markerp cand)
          (let ((buf  (marker-buffer cand)))
            (unless buf (error "<span class="quote">Marker in no buffer</span>"))
            (list (if (buffer-file-name buf) 'icicle-file-marker 'icicle-marker)
                  (or (buffer-file-name buf) (buffer-name buf))
                  (marker-position cand)))
        cand)
    (cons (icicle-markers-to-readable (car cand)) (icicle-markers-to-readable (cdr cand)))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-to-variable () <span class="linecomment">; Bound to `C-M-}' in minibuffer.</span>
  "<span class="quote">Save the set of current completion candidates in a variable you choose.
You can retrieve the saved set of candidates with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-from-variable]' (or `\\[icicle-candidate-set-retrieve]'
with a numeric prefix arg).
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-to-variable]').</span>"
  (interactive)
  (icicle-candidate-set-save 99))

<span class="linecomment">;;;###autoload</span>
(defun icicle-candidate-set-save-persistently (filesetp) <span class="linecomment">; Bound to `C-}' in minibuffer.</span>
  "<span class="quote">Save the set of current completion candidates persistently.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of candidates with `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-retrieve-persistent]' or `C-u \\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-candidate-set-save-persistently]').</span>"
  (interactive "<span class="quote">P</span>")
  (icicle-candidate-set-save (if filesetp 0 '(1))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-keep-only-past-inputs (&optional recent-first) <span class="linecomment">; Bound to`M-pause' in minibuffer.</span>
  "<span class="quote">Narrow completion candidates to those that have been used previously.
This filters the set of current completion candidates, keeping only
those that have been used before.  (You must first use `TAB' or
`S-TAB' to establish an explicit candidate set.)

With a prefix arg, the previous inputs are sorted chronologically,
most recent first.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-keep-only-past-inputs]').</span>"
  (interactive "<span class="quote">P</span>")
  (when (interactive-p) (icicle-barf-if-outside-Completions-and-minibuffer))
  (if (and recent-first (interactive-p) icicle-inhibit-sort-p)
      (icicle-msg-maybe-in-minibuffer "<span class="quote">Cannot sort candidates now</span>")
    (let ((icicle-sort-function  (if recent-first 'icicle-most-recent-first-p icicle-sort-function)))
      (when (or recent-first (eq icicle-last-completion-command 'icicle-keep-only-past-inputs))
        (icicle-complete-again-update 'no-display))
      (if (null icicle-completion-candidates)
          (minibuffer-message "<span class="quote">  [No completion candidates to filter]</span>")
        (unless (boundp minibuffer-history-variable) (set minibuffer-history-variable nil))
        (when (consp (symbol-value minibuffer-history-variable))
          (setq icicle-completion-candidates
                (icicle-remove-if-not
                 (lambda (candidate)
                   (when (icicle-file-name-input-p)
                     (setq candidate  (expand-file-name candidate
                                                        (file-name-directory icicle-last-input))))
                   (member candidate (symbol-value minibuffer-history-variable)))
                 icicle-completion-candidates))
          (cond ((null icicle-completion-candidates)
                 (save-selected-window (icicle-remove-Completions-window))
                 (minibuffer-message "<span class="quote">  [None of the completions have been used before]</span>"))
                (t
                 (cond ((and (symbolp last-command) (get last-command 'icicle-cycling-command))
                        (setq icicle-current-input  icicle-last-input)
                        (icicle-retrieve-last-input))
                       (t
                        (setq icicle-current-input  (icicle-input-from-minibuffer))))
                 (cond ((null icicle-completion-candidates)
                        (setq icicle-nb-of-other-cycle-candidates  0)
                        (save-selected-window (icicle-remove-Completions-window))
                        (minibuffer-message "<span class="quote">  [No matching history element]</span>"))
                       ((null (cdr icicle-completion-candidates)) <span class="linecomment">; Single cand. Update minibuffer.</span>
                        (setq icicle-nb-of-other-cycle-candidates  0)
                        (icicle-clear-minibuffer)
                        (setq icicle-last-completion-candidate  (car icicle-completion-candidates))
                        (let ((inserted  (if (and (icicle-file-name-input-p) insert-default-directory
                                                  (or (not (member icicle-last-completion-candidate
                                                                   icicle-extra-candidates))
                                                      icicle-extra-candidates-dir-insert-p))
                                             (icicle-abbreviate-or-expand-file-name
                                              icicle-last-completion-candidate
                                              (icicle-file-name-directory-w-default
                                               icicle-current-input))
                                           icicle-last-completion-candidate)))
                          (insert inserted))
                        (save-selected-window (icicle-remove-Completions-window))
                        (icicle-highlight-complete-input)
                        (minibuffer-message (format "<span class="quote">  [One matching history element]</span>")))
                       (t
                        (when (member icicle-current-input icicle-completion-candidates)
                          (icicle-highlight-complete-input))
                        (icicle-display-candidates-in-Completions)
                        (save-window-excursion
                          (select-window (active-minibuffer-window))
                          (minibuffer-message
                           (concat "<span class="quote">  [Filtered to (matching) historical candidates</span>"
                                   (and recent-first "<span class="quote">, most recent first</span>")
                                   "<span class="quote">]</span>")))))
                 (setq icicle-last-completion-command  'icicle-keep-only-past-inputs)))))
      icicle-completion-candidates)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-scroll-Completions (&optional reverse) <span class="linecomment">; Mouse `wheel-down' in *Completions*</span>
  "<span class="quote">Scroll the *Completions* window down.</span>"
  (interactive "<span class="quote">P</span>")
  (save-selected-window
    (select-window (get-buffer-window "<span class="quote">*Completions*</span>" 0))
    (when (if (interactive-p) reverse current-prefix-arg) <span class="linecomment">; Non-interactive use is for `TAB', `S-TAB'.</span>
      (setq icicle-scroll-Completions-backward-p  (not icicle-scroll-Completions-backward-p)))
    (cond (icicle-scroll-Completions-backward-p
           (if (not (= (window-start) (point-min)))
               (scroll-down nil)
             (unless (= (window-end) (point-max))
               (goto-char (point-max))
               (scroll-down (1- (/ (window-height) 2)))
               (beginning-of-line))))
          (t
           (if (not (= (window-end) (point-max)))
               (scroll-up nil)
             (unless (= (window-start) (point-min))
               (goto-char (icicle-start-of-candidates-in-Completions))))))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-scroll-Completions-up ()  <span class="linecomment">; Mouse `wheel-up' in *Completions*</span>
  "<span class="quote">Scroll the *Completions* window up.</span>"
  (interactive)
  (let ((icicle-scroll-Completions-backward-p  (not icicle-scroll-Completions-backward-p)))
    (icicle-scroll-Completions)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-history ()                <span class="linecomment">; Bound to `M-h' in minibuffer.</span>
  "<span class="quote">Access the appropriate history list using completion or cycling.
The current minibuffer input is interpreted as a regexp and matched
against items in the history list in use for the current command.

Note:

If the required input is a file or directory name, then the entire
minibuffer input is what is matched against the history list.  The
reason for this is that file names in the history list are usually
absolute.  This is unlike the case for normal file-name completion,
which assumes the default directory.

Keep this in mind for apropos (regexp) completion; it means that to
match a file-name using a substring you must, in the minibuffer,
either not specify a directory or explicitly use \".*\" before the
file-name substring.

For example, `/foo/bar/lph' will not apropos-match the previously
input file name `/foo/bar/alphabet-soup.el'; you should use either
`/foo/bar/.*lph' or `lph' (no directory).

This also represents a difference in behavior compared to the similar
command `icicle-keep-only-past-inputs' (\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-keep-only-past-inputs] in the minibuffer).
That command simply filters the current set of completion candidates,
which in the case of file-name completion is a set of relative file
names.

You can use this command only from the minibuffer (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-history]').</span>"
  (interactive)
  (when (interactive-p) (icicle-barf-if-outside-minibuffer))
  (when (icicle-file-name-input-p)
    (setq minibuffer-completion-predicate  nil
          minibuffer-completing-file-name  nil))
  (when (and (arrayp minibuffer-completion-table) minibuffer-completion-predicate)
    (setq minibuffer-completion-predicate
          `(lambda (elt) (funcall ',minibuffer-completion-predicate
                          (intern (if (consp elt) (car elt) elt))))))
  (when (and (boundp minibuffer-history-variable) (consp (symbol-value minibuffer-history-variable)))
    (setq minibuffer-completion-table
          (mapcar #'list (icicle-remove-duplicates (symbol-value minibuffer-history-variable)))))
  (save-selected-window (unless icicle-last-completion-command (icicle-apropos-complete)))
  (cond ((and (symbolp last-command) (get last-command 'icicle-cycling-command))
         (setq icicle-current-input  icicle-last-input)
         (icicle-retrieve-last-input))
        (t
         (setq icicle-current-input  (icicle-input-from-minibuffer)
               icicle-last-input     nil <span class="linecomment">; So `icicle-save-or-restore-input' thinks input has changed.</span>
               last-command          'icicle-history)
         (funcall icicle-last-completion-command))))

<span class="linecomment">;; Not actually a minibuffer command, since `isearch' technically uses the echo area.  This is not</span>
<span class="linecomment">;; shadowed by any `icicle-mode-map' binding, since `isearch-mode-map' is also a minor mode map.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-isearch-complete ()       <span class="linecomment">; Bound to `M-TAB' and `M-o' in `isearch-mode-map'.</span>
  "<span class="quote">Complete the search string using candidates from the search ring.</span>"
  (interactive)
  (cond ((icicle-completing-p)          <span class="linecomment">; Cannot use the var here, since not sure to be in minibuf.</span>
         (setq isearch-string  (if (fboundp 'field-string) (field-string) (buffer-string)))
         (when (icicle-isearch-complete-past-string)
           (if (fboundp 'delete-field) (delete-field) (erase-buffer))
           (insert isearch-string)))
        (t
         (icicle-isearch-complete-past-string)
         (setq isearch-message  (mapconcat 'isearch-text-char-description isearch-string "<span class="quote"></span>"))
         (isearch-edit-string))))

(defun icicle-doremi-candidate-width-factor (&optional increment) <span class="linecomment">; Bound to `C-x w' in the minibuffer.</span>
  "<span class="quote">Change `icicle-candidate-width-factor' incrementally.
Use `right', `left' or mouse wheel to increase or decrease.  You can
use the `Meta' key (e.g. `M-right') to increment in larger steps.

Use `up', `down', or mouse wheel to adjust
`icicle-inter-candidates-min-spaces'.</span>"
  (interactive "<span class="quote">p</span>")
  (unless (require 'doremi nil t) (error "<span class="quote">This command needs library `doremi.el'.</span>"))
  (let ((mini  (active-minibuffer-window)))
    (unwind-protect
         (save-selected-window
           (select-window (minibuffer-window))
           (unless icicle-completion-candidates
             (setq icicle-completion-candidates  (x-defined-colors)))
           (let* ((enable-recursive-minibuffers  t)
                  (doremi-up-key                 'left) <span class="linecomment">; Rebind, so keys are more intuitive for width.</span>
                  (doremi-boost-up-key           'M-left)
                  (doremi-down-key               'right)
                  (doremi-boost-down-key         'M-right))
             (doremi (lambda (new-val)
                       (setq new-val                        (doremi-wrap new-val 1 100)
                             icicle-candidate-width-factor  new-val)
                       (icicle-display-candidates-in-Completions)
                       new-val)
                     icicle-candidate-width-factor
                     (- increment)))    <span class="linecomment">; Reverse, so arrows correspond.</span>
           (when (member (car unread-command-events)
                         (list doremi-up-key doremi-down-key
                               doremi-boost-up-key doremi-boost-down-key))
             (icicle-doremi-inter-candidates-min-spaces increment))
           (setq unread-command-events  ()))
      (unless mini (icicle-remove-Completions-window)))))

(defun icicle-doremi-inter-candidates-min-spaces (&optional increment) <span class="linecomment">; Bound to `C-x |' in minibuffer.</span>
  "<span class="quote">Change `icicle-inter-candidates-min-spaces' incrementally.
Use `up', `down' or mouse wheel to increase or decrease.  You can use
the `Meta' key (e.g. `M-right') to increment in larger steps.

Use `left', `right', or mouse wheel to adjust
`icicle-candidate-width-factor'.</span>"
  (interactive "<span class="quote">p</span>")
  (unless (require 'doremi nil t) (error "<span class="quote">This command needs library `doremi.el'.</span>"))
  (let ((mini  (active-minibuffer-window)))
    (unwind-protect
         (save-selected-window
           (select-window (minibuffer-window))
           (unless icicle-completion-candidates
             (setq icicle-completion-candidates  (x-defined-colors)))
           (let* ((enable-recursive-minibuffers  t))
             (doremi (lambda (new-val)
                       (setq new-val                             (doremi-limit new-val 1 nil)
                             icicle-inter-candidates-min-spaces  new-val)
                       (icicle-display-candidates-in-Completions)
                       new-val)
                     icicle-inter-candidates-min-spaces
                     increment))
           (when (member (car unread-command-events)'(left right M-left M-right))
             (icicle-doremi-candidate-width-factor increment))
           (setq unread-command-events  ()))
      (unless mini (icicle-remove-Completions-window)))))

(defalias 'toggle-icicle-WYSIWYG-Completions 'icicle-toggle-WYSIWYG-Completions)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-WYSIWYG-Completions ()
  "<span class="quote">Toggle the value of option `icicle-WYSIWYG-Completions-flag'.</span>"
  (interactive)
  (setq icicle-WYSIWYG-Completions-flag  (not icicle-WYSIWYG-Completions-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-WYSIWYG-Completions-flag
                                      "<span class="quote">Using WYSIWYG for *Completions* display is now ON</span>"
                                    "<span class="quote">Using WYSIWYG for *Completions* display is now OFF</span>")))

(defalias 'toggle-icicle-~-for-home-dir 'icicle-toggle-~-for-home-dir)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-~-for-home-dir ()  <span class="linecomment">; Bound to `M-~' in the minibuffer.</span>
  "<span class="quote">Toggle the value of option `icicle-use-~-for-home-dir-flag'.
Bound to `M-~' in the minibuffer.</span>"
  (interactive)
  (setq icicle-use-~-for-home-dir-flag  (not icicle-use-~-for-home-dir-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-use-~-for-home-dir-flag
                                      "<span class="quote">Using `~' for home directory is now ON</span>"
                                    "<span class="quote">Using `~' for home directory is now OFF</span>")))

(defalias 'toggle-icicle-C-for-actions 'icicle-toggle-C-for-actions)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-C-for-actions ()   <span class="linecomment">; Bound to `M-g' in the minibuffer.</span>
  "<span class="quote">Toggle the value of option `icicle-use-C-for-actions-flag'.
Bound to `M-g' in the minibuffer.</span>"
  (interactive)
  (setq icicle-use-C-for-actions-flag  (not icicle-use-C-for-actions-flag))
  (icicle-mode) (icicle-mode)
  (icicle-msg-maybe-in-minibuffer (if icicle-use-C-for-actions-flag
                                      "<span class="quote">Using `C-' prefix for multi-command actions is now ON</span>"
                                    "<span class="quote">Using `C-' prefix for multi-command actions is now OFF</span>")))

(defalias 'toggle-icicle-alternative-sorting 'icicle-toggle-alternative-sorting)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-alternative-sorting () <span class="linecomment">; Bound to `C-M-,' in the minibuffer.</span>
  "<span class="quote">Toggle alternative sorting of minibuffer completion candidates.
This swaps `icicle-alternative-sort-function' and `icicle-sort-function'.
Bound to `C-M-,' in the minibuffer.</span>"
  (interactive)
  (let ((alt-sort-fn  icicle-alternative-sort-function))
    (setq icicle-alternative-sort-function  (or icicle-sort-function icicle-last-sort-function)
          icicle-sort-function              (or alt-sort-fn icicle-last-sort-function))
    (icicle-complete-again-update)
    (icicle-msg-maybe-in-minibuffer
     (format "<span class="quote">Sorting: `%s', Alternative: `%s'</span>"
             icicle-sort-function icicle-alternative-sort-function))))

(defalias 'toggle-icicle-sorting 'icicle-toggle-sorting)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-sorting ()         <span class="linecomment">; Not bound to a key.</span>
  "<span class="quote">Toggle sorting of minibuffer completion candidates.
When sorting is active, comparison is done by `icicle-sort-function'.</span>"
  (interactive)
  (if (and (interactive-p) icicle-inhibit-sort-p)
      (icicle-msg-maybe-in-minibuffer "<span class="quote">Cannot sort candidates now</span>")
    (if icicle-sort-function
        (setq icicle-last-sort-function  icicle-sort-function <span class="linecomment">; Save it, for restoring.</span>
              icicle-sort-function       nil)
      (setq icicle-sort-function  icicle-last-sort-function)) <span class="linecomment">; Restore it.</span>
    (icicle-complete-again-update)
    (icicle-msg-maybe-in-minibuffer (if icicle-sort-function
                                        "<span class="quote">Completion-candidate sorting is now ON</span>"
                                      "<span class="quote">Completion-candidate sorting is now OFF</span>"))))

(defalias 'toggle-icicle-angle-brackets 'icicle-toggle-angle-brackets)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-angle-brackets ()
  "<span class="quote">Toggle `icicle-key-descriptions-use-&lt;&gt;-flag'.</span>"
  (interactive)
  (setq icicle-key-descriptions-use-&lt;&gt;-flag  (not icicle-key-descriptions-use-&lt;&gt;-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-key-descriptions-use-&lt;&gt;-flag
                                      "<span class="quote">Displaying &lt;...&gt; in key descriptions is now ON</span>"
                                    "<span class="quote">Displaying &lt;...&gt; in key descriptions is now OFF</span>")))

(defalias 'toggle-icicle-proxy-candidates 'icicle-toggle-proxy-candidates)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-proxy-candidates () <span class="linecomment">; Bound to `C-M-_' in the minibuffer.</span>
  "<span class="quote">Toggle `icicle-add-proxy-candidates-flag'.
Bound to `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-proxy-candidates]' in the minibuffer.
With some commands, you must re-invoke the command for the new value
to take effect.  (This is for performance reasons.)</span>"
  (interactive)
  (setq icicle-add-proxy-candidates-flag  (not icicle-add-proxy-candidates-flag)
        icicle-saved-proxy-candidates     (prog1 icicle-proxy-candidates
                                            (setq icicle-proxy-candidates
                                                  icicle-saved-proxy-candidates)))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-add-proxy-candidates-flag
                                      "<span class="quote">Including proxy candidates is now ON</span>"
                                    "<span class="quote">Including proxy candidates is now OFF</span>")))

(defalias 'toggle-icicle-transforming 'icicle-toggle-transforming)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-transforming ()    <span class="linecomment">; Bound to `C-$' in the minibuffer.</span>
  "<span class="quote">Toggle transforming of minibuffer completion candidates.
When transforming is active, it is done by `icicle-transform-function'.

By default, transformation, if active, simply removes duplicate
candidates.  Icicles commands already \"do the right thing\" when it
comes to duplicate removal, so you might never need this command.

Bound to `C-$' in the minibuffer.</span>"
  (interactive)
  (if icicle-transform-function
      (setq icicle-last-transform-function  icicle-transform-function <span class="linecomment">; Save it, for restoring.</span>
            icicle-transform-function       nil)
    (setq icicle-transform-function  icicle-last-transform-function)) <span class="linecomment">; Restore it.</span>
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-transform-function
                                      "<span class="quote">Completion-candidate transformation is now ON</span>"
                                    "<span class="quote">Completion-candidate transformation is now OFF</span>")))

(defalias 'toggle-icicle-incremental-completion 'icicle-toggle-incremental-completion)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-incremental-completion () <span class="linecomment">; Bound to `C-#' in the minibuffer.</span>
  "<span class="quote">Toggle the value of option `icicle-incremental-completion-flag'.
If the current value is t or `always', then it is set to nil.
If the current value is nil, then it is set to t.
This command never sets the value to non-nil and non-t.

Bound to `C-#' in the minibuffer.</span>"
  (interactive)
  (setq icicle-incremental-completion-flag  (not icicle-incremental-completion-flag)
        icicle-incremental-completion-p     icicle-incremental-completion-flag)
  (icicle-msg-maybe-in-minibuffer (if icicle-incremental-completion-flag
                                      "<span class="quote">Incremental completion is now ON</span>"
                                    "<span class="quote">Incremental completion is now OFF</span>")))

(defalias 'toggle-icicle-expand-to-common-match 'icicle-toggle-expand-to-common-match)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-expand-to-common-match () <span class="linecomment">; Bound to `C-;' in the minibuffer.</span>
  "<span class="quote">Toggle the value of `icicle-expand-input-to-common-match-flag'.
Bound to `C-;' in the minibuffer.</span>"
  (interactive)
  (setq icicle-expand-input-to-common-match-flag  (not icicle-expand-input-to-common-match-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-expand-input-to-common-match-flag
                                      "<span class="quote">Expanding input to common match is now ON</span>"
                                    "<span class="quote">Expanding input to common match is now OFF</span>")))

(defalias 'toggle-icicle-fuzzy-completion 'icicle-toggle-fuzzy-completion)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-fuzzy-completion () <span class="linecomment">; Bound to `C-(' in the minibuffer.</span>
  "<span class="quote">Toggle the value of option `icicle-fuzzy-completion-flag'.
Bound to `C-(' in the minibuffer.</span>"
  (interactive)
  <span class="linecomment">;; If not loaded, try to load `fuzzy-match.el'.</span>
  (when (and (not icicle-fuzzy-completion-flag) (not (featurep 'fuzzy-match))
             (not (require 'fuzzy-match nil t)))
    (error "<span class="quote">You must load library `fuzzy-match.el' for fuzzy completion</span>"))
  (setq icicle-fuzzy-completion-flag  (not icicle-fuzzy-completion-flag)
        icicle-inhibit-sort-p         icicle-fuzzy-completion-flag)
  (icicle-msg-maybe-in-minibuffer (if icicle-fuzzy-completion-flag
                                      "<span class="quote">Fuzzy completion is now ON</span>"
                                    "<span class="quote">Fuzzy completion is now OFF</span>")))

<span class="linecomment">;; Aliases will be removed if there are ever more than two apropos match functions.</span>
(defalias 'toggle-icicle-apropos-match-function 'icicle-next-apropos-match-function)
(defalias 'icicle-toggle-apropos-match-function 'icicle-next-apropos-match-function)
<span class="linecomment">;;;###autoload</span>
(defun icicle-next-apropos-match-function () <span class="linecomment">; Bound to `M-(' in minibuffer.</span>
  "<span class="quote">Cycle to the next apropos completion match function.</span>"
  (interactive)
  (let ((entry  (rassq icicle-apropos-complete-match-fn icicle-apropos-match-fns-alist)))
    (setq icicle-apropos-complete-match-fn
          (or (cdadr (member entry icicle-apropos-match-fns-alist))
              (cdar icicle-apropos-match-fns-alist))
          icicle-last-apropos-complete-match-fn  icicle-apropos-complete-match-fn) <span class="linecomment">; Backup copy.</span>
    (message (format "<span class="quote">%s%s completion now</span>" (upcase (car (rassq icicle-apropos-complete-match-fn
                                                               icicle-apropos-match-fns-alist)))
                     (if (memq icicle-apropos-complete-match-fn
                               '(icicle-levenshtein-match icicle-levenshtein-strict-match))
                         (format "<span class="quote"> (%d)</span>" icicle-levenshtein-distance)
                       "<span class="quote"></span>")))))
    <span class="linecomment">;; (icicle-complete-again-update) ; No - too slow for some completion methods.</span>

<span class="linecomment">;;;###autoload</span>
(defun icicle-dispatch-C-^ ()           <span class="linecomment">; Bound to `C-^' in the minibuffer.</span>
  "<span class="quote">Do the right thing for `C-^'
When Icicles searching, call `icicle-toggle-highlight-all-current'.
Otherwise, call `icicle-toggle-remote-file-testing'.
Bound to `C-^' in the minibuffer.</span>"
  (interactive)
  (if (eq icicle-candidate-action-fn 'icicle-search-action)
      (icicle-toggle-highlight-all-current)
    (icicle-toggle-remote-file-testing)))

(defalias 'toggle-icicle-remote-file-testing 'icicle-toggle-remote-file-testing)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-remote-file-testing () <span class="linecomment">; Bound to `C-^' in the minibuffer.</span>
  "<span class="quote">Toggle `icicle-test-for-remote-files-flag'.
If you use Tramp for accessing remote files, then turning this off
also turns off Tramp file-name completion.  Therefore, if you use this
command to turn off testing of remote file names, then use it also to
turn testing back on (instead of just setting the option to non-nil).

Bound to `C-^' in the minibuffer, except during Icicles searching.</span>"
  (interactive)
  (setq icicle-test-for-remote-files-flag  (not icicle-test-for-remote-files-flag))
  (when (require 'tramp nil t)
    (if (not icicle-test-for-remote-files-flag)
        (tramp-unload-file-name-handlers) <span class="linecomment">; Turn off Tramp remote file-name completion.</span>
      <span class="linecomment">;; Bind `partial-completion-mode' to force `tramp-completion-file-name-handler'</span>
      <span class="linecomment">;; unconditionally, for older Tramp versions than 2.1 (ugly HACK).</span>
      (let ((partial-completion-mode  t))
        (tramp-register-file-name-handler) <span class="linecomment">; The order of these two matters.</span>
        (tramp-register-completion-file-name-handler))))
  (message "<span class="quote">Updating completions...</span>")
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-test-for-remote-files-flag
                                      "<span class="quote">Testing remote file names is now ON</span>"
                                    "<span class="quote">Testing remote file names is now OFF</span>")))

(defalias 'toggle-icicle-highlight-all-current 'icicle-toggle-highlight-all-current)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-highlight-all-current () <span class="linecomment">; Bound to `C-^' in the minibuffer.</span>
  "<span class="quote">Toggle `icicle-search-highlight-all-current-flag'.
Bound to `C-^' in the minibuffer during Icicles searching (only).</span>"
  (interactive)
  (setq icicle-search-highlight-all-current-flag  (not icicle-search-highlight-all-current-flag))
  (let ((icicle-candidate-nb  icicle-candidate-nb))
    <span class="linecomment">;; Rehighlight to see effect of toggle.</span>
    (icicle-erase-minibuffer)
    (icicle-retrieve-last-input))
  (icicle-search-action "<span class="quote">DUMMY</span>")        <span class="linecomment">; Get back to current, and highlight it.</span>
  (icicle-msg-maybe-in-minibuffer
   (if icicle-search-highlight-all-current-flag
       "<span class="quote">Highlighting current input match in each main search hit is now ON</span>"
     "<span class="quote">Highlighting current input match in each main search hit is now OFF</span>"))
  (select-window (minibuffer-window))
  (select-frame-set-input-focus (selected-frame)))

(defalias 'toggle-icicle-hiding-common-match 'icicle-toggle-hiding-common-match)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-hiding-common-match () <span class="linecomment">; Bound to `C-M-.' in the minibuffer.</span>
  "<span class="quote">Toggle `icicle-hide-common-match-in-Completions-flag'.
Bound to `C-M-.' in the minibuffer.</span>"
  (interactive)
  (setq icicle-hide-common-match-in-Completions-flag
        (not icicle-hide-common-match-in-Completions-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-hide-common-match-in-Completions-flag
                                      "<span class="quote">Hiding common match in *Completions* is now ON</span>"
                                    "<span class="quote">Hiding common match in *Completions* is now OFF</span>")))

(defalias 'toggle-icicle-ignored-space-prefix 'icicle-toggle-ignored-space-prefix)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-ignored-space-prefix () <span class="linecomment">; Bound to `M-_' in the minibuffer.</span>
  "<span class="quote">Toggle `icicle-ignore-space-prefix-flag'.
Bound to `M-_' in the minibuffer, except during Icicles searching.

Note: If the current command binds `icicle-ignore-space-prefix-flag'
locally, then it is the local, not the global, value that is changed.
For example, `icicle-buffer' binds it to the value of
`icicle-buffer-ignore-space-prefix-flag'.  If that is non-nil, then
\\&lt;minibuffer-local-completion-map&gt;`\\[icicle-toggle-ignored-space-prefix]' toggles \
`icicle-ignore-space-prefix-flag' to nil only for the
duration of `icicle-buffer'.</span>"
  (interactive)
  (setq icicle-ignore-space-prefix-flag  (not icicle-ignore-space-prefix-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-ignore-space-prefix-flag
                                      "<span class="quote">Ignoring space prefix is now ON</span>"
                                    "<span class="quote">Ignoring space prefix is now OFF</span>")))

(defalias 'toggle-icicle-highlight-historical-candidates
    'icicle-toggle-highlight-historical-candidates)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-highlight-historical-candidates () <span class="linecomment">; Bound to `C-pause' in the minibuffer.</span>
  "<span class="quote">Toggle `icicle-highlight-historical-candidates-flag'.
Bound to `C-pause' in the minibuffer.</span>"
  (interactive)
  (setq icicle-highlight-historical-candidates-flag
        (not icicle-highlight-historical-candidates-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer
   (if icicle-highlight-historical-candidates-flag
       "<span class="quote">Highlighting previously used inputs in *Completions* is now ON</span>"
     "<span class="quote">Highlighting previously used inputs in *Completions* is now OFF</span>")))

<span class="linecomment">;;;###autoload</span>
(defun icicle-dispatch-C-. ()           <span class="linecomment">; Bound to `C-.' in the minibuffer.</span>
  "<span class="quote">Do the right thing for `C-.'.
When using Icicles search (`icicle-search' and similar commands), call
 `icicle-toggle-search-cleanup'.
Otherwise, call `icicle-toggle-ignored-extensions'.

Bound to `C-.' in the minibuffer.</span>"
  (interactive)
  (if icicle-searching-p (icicle-toggle-search-cleanup) (icicle-toggle-ignored-extensions)))

(defalias 'toggle-icicle-ignored-extensions 'icicle-toggle-ignored-extensions)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-ignored-extensions () <span class="linecomment">; Bound to `C-.' in minibuffer except in Icicles search.</span>
  "<span class="quote">Toggle respect of `completion-ignored-extensions'.
Bound to `C-.' in minibuffer during file-name input.</span>"
  (interactive)
  (if (consp completion-ignored-extensions)
      (setq icicle-saved-ignored-extensions   completion-ignored-extensions <span class="linecomment">; Save it.</span>
            completion-ignored-extensions     ()
            icicle-ignored-extensions-regexp  nil)
    (setq completion-ignored-extensions  icicle-saved-ignored-extensions <span class="linecomment">; Restore it.</span>
          icicle-ignored-extensions-regexp <span class="linecomment">; Make regexp for ignored file extensions.</span>
          (concat "<span class="quote">\\(</span>" (mapconcat #'regexp-quote completion-ignored-extensions "<span class="quote">$\\|</span>") "<span class="quote">$\\)\\'</span>")))
  <span class="linecomment">;; Flag to prevent updating `icicle-ignored-extensions-regexp' unless</span>
  <span class="linecomment">;; `completion-ignored-extensions' changes.</span>
  (setq icicle-ignored-extensions  completion-ignored-extensions)
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if completion-ignored-extensions
                                      "<span class="quote">Ignoring selected file extensions is now ON</span>"
                                    "<span class="quote">Ignoring selected file extensions is now OFF</span>")))

(defalias 'toggle-icicle-search-cleanup 'icicle-toggle-search-cleanup)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-search-cleanup ()  <span class="linecomment">; Bound to `C-.' in minibuffer during Icicles search.</span>
  "<span class="quote">Toggle removal of `icicle-search' highlighting after a search.
This toggles option `icicle-search-cleanup-flag'.
Bound to `C-.' in the minibuffer, except for file-name input.</span>"
  (interactive)
  (setq icicle-search-cleanup-flag  (not icicle-search-cleanup-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-search-cleanup-flag
                                      "<span class="quote">Removal of Icicles search highlighting is now ON</span>"
                                    "<span class="quote">Removal of Icicles search highlighting is now OFF</span>")))

<span class="linecomment">;;$$$ (defun icicle-dispatch-C-backquote ()   ; Bound to `C-`' in the minibuffer.</span>
<span class="linecomment">;;   "Do the right thing for `C-`'.</span>
<span class="linecomment">;; When searching, call `icicle-toggle-literal-replacement'.</span>
<span class="linecomment">;; Otherwise, call `icicle-toggle-regexp-quote'.</span>

<span class="linecomment">;; Bound to `C-`' in the minibuffer."</span>
<span class="linecomment">;;   (interactive)</span>
<span class="linecomment">;;   (if icicle-searching-p (icicle-toggle-literal-replacement) (icicle-toggle-regexp-quote)))</span>

(defalias 'toggle-icicle-regexp-quote 'icicle-toggle-regexp-quote)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-regexp-quote ()    <span class="linecomment">; Bound to `C-`' in the minibuffer.</span>
  "<span class="quote">Toggle escaping of regexp special chars (`icicle-regexp-quote-flag').

Bound to `C-`' in the minibuffer.</span>"
  (interactive)
  (setq icicle-regexp-quote-flag  (not icicle-regexp-quote-flag))
  (icicle-complete-again-update)
  (icicle-msg-maybe-in-minibuffer (if icicle-regexp-quote-flag
                                      "<span class="quote">Escaping of regexp special characters is now ON</span>"
                                    "<span class="quote">Escaping of regexp special characters is now OFF</span>")))

(defun icicle-regexp-quote-input (beg end)     <span class="linecomment">; Bound to `C-M-;' in the minibuffer.</span>
  "<span class="quote">Regexp quote current input or its active region, then apropos-complete.
Use this if you want to literally match all what is currently in the
minibuffer or selected text there, but you also want to use that
literal text as part of a regexp for apropos completion.

This turns off `icicle-expand-input-to-common-match-flag'.
You can toggle that option using `C-;'.

Bound to `C-M-;' in the minibuffer.</span>"
  (interactive "<span class="quote">r</span>")
  (icicle-barf-if-outside-Completions-and-minibuffer)
  (let ((regionp  (and mark-active (mark) (/= (point) (mark))))
        quoted-part)
    (save-excursion
      (save-restriction
        (narrow-to-region (if regionp beg (point-min)) (if regionp end (point-max)))
        (setq quoted-part  (regexp-quote (icicle-input-from-minibuffer)))
        (delete-region (point-min) (point-max))
        (insert quoted-part))))
  (setq icicle-current-input                      (icicle-input-from-minibuffer)
        icicle-expand-input-to-common-match-flag  nil)
  (icicle-apropos-complete)
  (icicle-msg-maybe-in-minibuffer (substitute-command-keys "<span class="quote">Expansion to common match is OFF. \
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-expand-to-common-match]' to toggle</span>")))

(defalias 'toggle-icicle-literal-replacement 'icicle-toggle-literal-replacement)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-literal-replacement () <span class="linecomment">; Bound to `C-M-`' in the minibuffer.</span>
  "<span class="quote">Toggle escaping of regexp special chars in replacement text.
This toggles option `icicle-search-replace-literally-flag'.

Bound to `C-M-`' in the minibuffer.</span>"
  (interactive)
  (setq icicle-search-replace-literally-flag  (not icicle-search-replace-literally-flag))
  (icicle-msg-maybe-in-minibuffer (if icicle-search-replace-literally-flag
                                      "<span class="quote">Replacement of text literally is now ON</span>"
                                    "<span class="quote">Replacement of text literally is now OFF</span>")))

(defalias 'toggle-icicle-case-sensitivity 'icicle-toggle-case-sensitivity)
<span class="linecomment">;;;###autoload</span>
(defun icicle-toggle-case-sensitivity (files-p) <span class="linecomment">; Bound to `C-S-a' in the minibuffer, that is, `C-A'.</span>
  "<span class="quote">Toggle case sensitivity.
This toggles `case-fold-search' and `completion-ignore-case'.
With a prefix arg, it toggles `read-file-name-completion-ignore-case'
also (Emacs 22 and later).  More precisely, this command first toggles
the default value of `case-fold-search', and then it sets the other
variables to the value of `case-fold-search'.

Note:
1. This toggles the default value of `case-fold-search'.  This means
that it does not matter which buffer is current when you call this
command - all buffers will be affected henceforth.

2. Some commands bind one or more of these variables, so invoking this
command during command execution will not necessarily toggle the
global values of all of the variables.

Bound to `C-A' in the minibuffer, that is, `C-S-a'.</span>"
  (interactive "<span class="quote">P</span>")
  (setq-default case-fold-search        (not case-fold-search)
                completion-ignore-case  case-fold-search)
  (when (and files-p (boundp 'read-file-name-completion-ignore-case))
    (setq read-file-name-completion-ignore-case  case-fold-search))
  (icicle-complete-again-update)
  (icicle-highlight-lighter)
  (icicle-msg-maybe-in-minibuffer
   (cond ((and case-fold-search (or (not (boundp 'read-file-name-completion-ignore-case))
                                    read-file-name-completion-ignore-case))
          "<span class="quote">Case-sensitive comparison is now OFF, everywhere</span>")
         (case-fold-search "<span class="quote">Case-sensitive comparison is now OFF, except for file names</span>")
         (t
          "<span class="quote">Case-sensitive comparison is now ON, everywhere</span>"))))

<span class="linecomment">;;;###autoload</span>
(defun icicle-remove-Completions-window () <span class="linecomment">; `icicle-delete-window' (`C-x 0') does this in minibuffer.</span>
  "<span class="quote">Remove the *Completions* window.</span>"
  (interactive) (icicle-delete-windows-on "<span class="quote">*Completions*</span>")) <span class="linecomment">; Defined in `icicles-cmd.el'.</span>

<span class="linecomment">;; This is actually a top-level command, but it is in this file because it is used by</span>
<span class="linecomment">;; `icicle-remove-Completions-window'.</span>
<span class="linecomment">;;;###autoload</span>
(defun icicle-delete-windows-on (buffer)
  "<span class="quote">Delete all windows showing BUFFER.
If such a window is alone in its frame, then delete the frame - unless
it is a standalone minibuffer frame.</span>"
  (interactive
   (list (let ((enable-recursive-minibuffers  t))
           (read-buffer "<span class="quote">Remove all windows showing buffer: </span>" (current-buffer) 'existing))))
  (setq buffer  (get-buffer buffer))    <span class="linecomment">; Convert to buffer.</span>
  (when buffer                          <span class="linecomment">; Do nothing if null BUFFER.</span>
    <span class="linecomment">;; Avoid error message "Attempt to delete minibuffer or sole ordinary window".</span>
    (let ((frames  (icicle-frames-on buffer t)))
      (unless (and frames (null (cdr frames)) <span class="linecomment">; One frame shows buffer.</span>
                   (cdr (assoc 'minibuffer (frame-parameters (car frames)))) <span class="linecomment">; Has a minibuffer.</span>
                   (eq (cdr (assoc 'minibuffer (frame-parameters (car frames)))) <span class="linecomment">; It's the active one.</span>
                       (active-minibuffer-window))
                   (save-window-excursion
                     (select-frame (car frames))
                     (one-window-p t 'selected-frame))) <span class="linecomment">; Only one window.</span>
        (let (win)
          (dolist (fr frames)
            (setq win  (get-buffer-window buffer fr))
            (select-window win)
            (if (one-window-p t) (delete-frame) (delete-window (selected-window)))))))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-mcmd)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-mcmd.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icicles-mcmd.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-mcmd.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icicles-mcmd.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icicles-mcmd.el">Administration</a></span><span class="time"><br /> Last edited 2009-02-24 00:41 UTC by <a class="author" title="from inet-nc01-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icicles-mcmd.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
