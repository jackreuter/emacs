<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icicles-opt.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-opt.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icicles-opt.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-opt.el" />
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
      title="Changes for icicles-opt.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-opt.el" /><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icicles-opt.el%22">icicles-opt.el</a></h1></div><div class="wrapper"><div class="content browse"><p><a href="http://www.emacswiki.org/emacs/download/icicles-opt.el">Download</a></p><pre class="code"><span class="linecomment">;;; icicles-opt.el --- User options (variables) for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-opt.el</span>
<span class="linecomment">;; Description: User options (variables) for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2009, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:22:14 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Fri Feb 20 17:18:56 2009 (-0800)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 2497</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-opt.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `cl', `color-theme', `cus-face', `easymenu', `ffap', `ffap-',</span>
<span class="linecomment">;;   `hexrgb', `kmacro', `levenshtein', `thingatpt', `thingatpt+',</span>
<span class="linecomment">;;   `wid-edit', `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  user options (variables).  See `icicles.el' for documentation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Widgets defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-key-definition'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  User options defined here (in Custom group `Icicles'):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-act-before-cycle-flag', `icicle-add-buffer-name-flag',</span>
<span class="linecomment">;;    `icicle-add-proxy-candidates-flag',</span>
<span class="linecomment">;;    `icicle-alternative-sort-function',</span>
<span class="linecomment">;;    `icicle-apropos-complete-keys',</span>
<span class="linecomment">;;    `icicle-apropos-complete-no-display-keys',</span>
<span class="linecomment">;;    `icicle-apropos-cycle-next-keys',</span>
<span class="linecomment">;;    `icicle-apropos-cycle-next-action-keys',</span>
<span class="linecomment">;;    `icicle-apropos-cycle-previous-keys',</span>
<span class="linecomment">;;    `icicle-apropos-cycle-previous-action-keys',</span>
<span class="linecomment">;;    `icicle-apropos-match-fns-alist',</span>
<span class="linecomment">;;    `icicle-anything-transform-candidates-flag',</span>
<span class="linecomment">;;    `icicle-bookmark-name-length-max', `icicle-buffer-configs',</span>
<span class="linecomment">;;    `icicle-buffer-extras',</span>
<span class="linecomment">;;    `icicle-buffer-ignore-space-prefix-flag',</span>
<span class="linecomment">;;    `icicle-buffer-match-regexp', `icicle-buffer-no-match-regexp',</span>
<span class="linecomment">;;    `icicle-buffer-predicate', `icicle-buffer-require-match-flag'</span>
<span class="linecomment">;;    `icicle-buffer-sort', `icicle-candidate-width-factor',</span>
<span class="linecomment">;;    `icicle-change-region-background-flag',</span>
<span class="linecomment">;;    `icicle-change-sort-order-completion-flag',</span>
<span class="linecomment">;;    `icicle-C-l-uses-completion-flag', `icicle-color-themes',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-complete-replacements',</span>
<span class="linecomment">;;    `icicle-command-abbrev-alist',</span>
<span class="linecomment">;;    `icicle-command-abbrev-match-all-parts-flag',</span>
<span class="linecomment">;;    `icicle-command-abbrev-priority-flag',</span>
<span class="linecomment">;;    `icicle-complete-key-anyway-flag',</span>
<span class="linecomment">;;    `icicle-complete-keys-self-insert-flag',</span>
<span class="linecomment">;;    `icicle-complete-on-demand-keys',</span>
<span class="linecomment">;;    `icicle-completion-history-max-length',</span>
<span class="linecomment">;;    `icicle-Completions-display-min-input-chars',</span>
<span class="linecomment">;;    `icicle-Completions-frame-at-right-flag',</span>
<span class="linecomment">;;    `icicle-Completions-window-max-height',</span>
<span class="linecomment">;;    `icicle-customize-save-flag',</span>
<span class="linecomment">;;    `icicle-customize-save-variable-function',</span>
<span class="linecomment">;;    `icicle-cycle-into-subdirs-flag',</span>
<span class="linecomment">;;    `icicle-cycling-respects-completion-mode',</span>
<span class="linecomment">;;    `icicle-default-thing-insertion', `icicle-default-value',</span>
<span class="linecomment">;;    `icicle-define-alias-commands-flag',</span>
<span class="linecomment">;;    `icicle-deletion-action-flag',</span>
<span class="linecomment">;;    `icicle-expand-input-to-common-match-flag',</span>
<span class="linecomment">;;    `icicle-file-extras', `icicle-file-match-regexp',</span>
<span class="linecomment">;;    `icicle-file-no-match-regexp', `icicle-file-predicate',</span>
<span class="linecomment">;;    `icicle-file-require-match-flag', `icicle-file-sort',</span>
<span class="linecomment">;;    `icicle-filesets-as-saved-completion-sets-flag',</span>
<span class="linecomment">;;    `icicle-fuzzy-completion-flag',</span>
<span class="linecomment">;;    `icicle-guess-cmds-in-path-flag',</span>
<span class="linecomment">;;    `icicle-hide-common-match-in-Completions-flag',</span>
<span class="linecomment">;;    `icicle-highlight-historical-candidates-flag',</span>
<span class="linecomment">;;    `icicle-highlight-input-completion-failure',</span>
<span class="linecomment">;;    `icicle-highlight-input-completion-failure-delay',</span>
<span class="linecomment">;;    `icicle-highlight-input-completion-failure-threshold',</span>
<span class="linecomment">;;    `icicle-highlight-input-initial-whitespace-flag',</span>
<span class="linecomment">;;    `icicle-highlight-lighter-flag',</span>
<span class="linecomment">;;    `icicle-ignore-space-prefix-flag',</span>
<span class="linecomment">;;    `icicle-incremental-completion-delay',</span>
<span class="linecomment">;;    `icicle-incremental-completion-flag',</span>
<span class="linecomment">;;    `icicle-incremental-completion-threshold',</span>
<span class="linecomment">;;    `icicle-inhibit-ding-flag', `icicle-input-string',</span>
<span class="linecomment">;;    `icicle-inter-candidates-min-spaces',</span>
<span class="linecomment">;;    `icicle-isearch-complete-keys', `icicle-key-complete-keys',</span>
<span class="linecomment">;;    `icicle-key-descriptions-use-&lt;&gt;-flag',</span>
<span class="linecomment">;;    `icicle-key-descriptions-use-angle-brackets-flag',</span>
<span class="linecomment">;;    `icicle-keymaps-for-key-completion', `icicle-kmacro-ring-max',</span>
<span class="linecomment">;;    `icicle-levenshtein-distance', `icicle-list-end-string',</span>
<span class="linecomment">;;    `icicle-list-join-string', `icicle-list-nth-parts-join-string',</span>
<span class="linecomment">;;    `icicle-mark-position-in-candidate',</span>
<span class="linecomment">;;    `icicle-minibuffer-setup-hook', `icicle-modal-cycle-down-keys',</span>
<span class="linecomment">;;    `icicle-modal-cycle-down-action-keys',</span>
<span class="linecomment">;;    `icicle-modal-cycle-up-keys',</span>
<span class="linecomment">;;    `icicle-modal-cycle-up-action-keys',</span>
<span class="linecomment">;;    `icicle-option-type-prefix-arg-list',</span>
<span class="linecomment">;;    `icicle-point-position-in-candidate',</span>
<span class="linecomment">;;    `icicle-pp-eval-expression-print-length',</span>
<span class="linecomment">;;    `icicle-pp-eval-expression-print-level',</span>
<span class="linecomment">;;    `icicle-prefix-complete-keys',</span>
<span class="linecomment">;;    `icicle-prefix-complete-no-display-keys',</span>
<span class="linecomment">;;    `icicle-prefix-cycle-next-keys',</span>
<span class="linecomment">;;    `icicle-prefix-cycle-next-action-keys',</span>
<span class="linecomment">;;    `icicle-prefix-cycle-previous-keys',</span>
<span class="linecomment">;;    `icicle-prefix-cycle-previous-action-keys',</span>
<span class="linecomment">;;    `icicle-previous-candidate-keys',</span>
<span class="linecomment">;;    `icicle-redefine-standard-commands-flag',</span>
<span class="linecomment">;;    `icicle-regexp-quote-flag', `icicle-regexp-search-ring-max',</span>
<span class="linecomment">;;    `icicle-region-alist', `icicle-region-auto-open-files-flag',</span>
<span class="linecomment">;;    `icicle-region-background', `icicle-regions-name-length-max',</span>
<span class="linecomment">;;    `icicle-require-match-flag', `icicle-saved-completion-sets',</span>
<span class="linecomment">;;    `icicle-search-cleanup-flag',</span>
<span class="linecomment">;;    `icicle-search-context-match-predicate',</span>
<span class="linecomment">;;    `icicle-search-from-isearch-keys',</span>
<span class="linecomment">;;    `icicle-search-highlight-all-current-flag',</span>
<span class="linecomment">;;    `icicle-search-highlight-context-levels-flag',</span>
<span class="linecomment">;;    `icicle-search-highlight-threshold', `icicle-search-hook',</span>
<span class="linecomment">;;    `icicle-search-replace-common-match-flag',</span>
<span class="linecomment">;;    `icicle-search-replace-literally-flag',</span>
<span class="linecomment">;;    `icicle-search-replace-whole-candidate-flag',</span>
<span class="linecomment">;;    `icicle-search-ring-max', `icicle-search-whole-word-flag',</span>
<span class="linecomment">;;    `icicle-show-Completions-help-flag',</span>
<span class="linecomment">;;    `icicle-show-Completions-initially-flag',</span>
<span class="linecomment">;;    `icicle-sort-function', `icicle-sort-functions-alist',</span>
<span class="linecomment">;;    `icicle-special-candidate-regexp',</span>
<span class="linecomment">;;    `icicle-TAB-shows-candidates-flag',</span>
<span class="linecomment">;;    `icicle-test-for-remote-files-flag',</span>
<span class="linecomment">;;    `icicle-thing-at-point-functions',</span>
<span class="linecomment">;;    `icicle-top-level-key-bindings',</span>
<span class="linecomment">;;    `icicle-top-level-when-sole-completion-flag',</span>
<span class="linecomment">;;    `icicle-touche-pas-aux-menus-flag', `icicle-transform-function',</span>
<span class="linecomment">;;    `icicle-unpropertize-completion-result-flag',</span>
<span class="linecomment">;;    `icicle-update-input-hook', `icicle-use-~-for-home-dir-flag',</span>
<span class="linecomment">;;    `icicle-use-C-for-actions-flag',</span>
<span class="linecomment">;;    `icicle-use-candidates-only-once-flag',</span>
<span class="linecomment">;;    `icicle-word-completion-keys',</span>
<span class="linecomment">;;    `icicle-WYSIWYG-Completions-flag', `icicle-yank-function'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-bind-top-level-commands',</span>
<span class="linecomment">;;    `icicle-buffer-sort-*...*-last', `icicle-increment-color-hue',</span>
<span class="linecomment">;;    `icicle-increment-color-saturation',</span>
<span class="linecomment">;;    `icicle-increment-color-value', `icicle-remap'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  For descriptions of changes to this file, see `icicles-chg.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Note: Occasionally I have renamed or removed an Icicles option.</span>
<span class="linecomment">;;  If you have customized such an option, then your customization</span>
<span class="linecomment">;;  will no longer have any effect.  With the exception of options</span>
<span class="linecomment">;;  `icicle-mode' and `icicle-mode-hook', library `icicles-opt.el'</span>
<span class="linecomment">;;  always contains the complete set of Icicles options.  If your</span>
<span class="linecomment">;;  custom file or init file contains an Icicles option that is not</span>
<span class="linecomment">;;  listed above, then you can remove it because it is obsolete.</span>
 
<span class="linecomment">;;(@&gt; "Index")</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you have library `linkd.el' and Emacs 22 or later, load</span>
<span class="linecomment">;;  `linkd.el' and turn on `linkd-mode' now.  It lets you easily</span>
<span class="linecomment">;;  navigate around the sections of this doc.  Linkd mode will</span>
<span class="linecomment">;;  highlight this Index, as well as the cross-references and section</span>
<span class="linecomment">;;  headings throughout this file.  You can get `linkd.el' here:</span>
<span class="linecomment">;;  http://dto.freeshell.org/notebook/Linkd.html.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  (@&gt; "User options, organized alphabetically, except for dependencies")</span>
 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or</span>
<span class="linecomment">;; modify it under the terms of the GNU General Public License as</span>
<span class="linecomment">;; published by the Free Software Foundation; either version 2, or (at</span>
<span class="linecomment">;; your option) any later version.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful, but</span>
<span class="linecomment">;; WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU</span>
<span class="linecomment">;; General Public License for more details.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(eval-when-compile (when (&lt; emacs-major-version 20) (require 'cl))) <span class="linecomment">;; when, unless</span>

(when window-system (require 'hexrgb nil t))
                            <span class="linecomment">;; (no error if not found): hexrgb-color-values-to-hex,</span>
                            <span class="linecomment">;; hexrgb-increment-(red|green|blue), hexrgb-rgb-to-hsv,</span>
                            <span class="linecomment">;; hexrgb-color-values-to-hex, hexrgb-hsv-to-rgb</span>
(require 'thingatpt)        <span class="linecomment">;; symbol-at-point, thing-at-point, thing-at-point-url-at-point,</span>
(require 'thingatpt+ nil t) <span class="linecomment">;; (no error if not found): symbol-name-nearest-point,</span>
                            <span class="linecomment">;; word-nearest-point</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
 
<span class="linecomment">;;(@* "User options, organized alphabetically, except for dependencies")</span>

<span class="linecomment">;;; User options, organized alphabetically, except for dependencies --</span>

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-act-before-cycle-flag nil
  "<span class="quote">*Nil means cycle to the next or previous candidate, and then act on it.
Non-nil means act on current candidate, then cycle to next or previous.

This affects keys such as the following\\&lt;minibuffer-local-completion-map&gt;:
`C-down', `C-up', `C-next', `C-prior', \
`\\[icicle-help-on-next-prefix-candidate]', `\\[icicle-help-on-previous-prefix-candidate]',
`\\[icicle-help-on-next-apropos-candidate]', `\\[icicle-help-on-previous-apropos-candidate]', \
`\\[icicle-next-prefix-candidate-alt-action]', \
`\\[icicle-previous-prefix-candidate-alt-action]', \
`\\[icicle-next-apropos-candidate-alt-action]', and
`\\[icicle-previous-apropos-candidate-alt-action]'.

Note: A few Icicles commands ignore this setting, in order to \"do the
right thing\".</span>"
  :type 'boolean :group 'Icicles-Key-Bindings :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-add-buffer-name-flag t
  "<span class="quote">*Non-nil means to add the buffer name to completion candidates.
This means that for some Icicles commands, such as `icicle-search' and
`icicle-select-region', the normal completion candidate is treated as
a multi-completion: the name of the buffer associated with it is added
to the candidate and highlighted.

The main advantage is that you can easily see which buffer a candidate
applies to.  Also, the buffer name is part of the candidate, so you
can match against it.

Note: Even when the value is nil, you can use `C-M-mouse-2' and so on
to see information about a candidate, and this information includes
its buffer name whenever a non-nil value would have shown the buffer
name.</span>"
  :type 'boolean :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-add-proxy-candidates-flag nil <span class="linecomment">; Toggle with `C-M-_'.</span>
  "<span class="quote">*Non-nil means to include proxy candidates whenever possible.
A proxy candidate is a special candidate (shown in *Completions* using
face `icicle-special-candidate') whose name is a placeholder for the
real candidate.  The proxy candidate typically stands for some value
obtained from the cursor position or by some action such as clicking
the mouse.  Example candidates include a color or file name, named by
proxy candidates such as `*copied foreground*' or `*file at point*'.

You can toggle this option at any time from the minibuffer using
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-proxy-candidates]'.  However, for \
commands that provide many proxy candidates, if
the flag is off initially when input is read, then you must re-invoke
the completing command for the new value to take effect.  (This is for
performance reasons.)</span>"
  :type 'boolean :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-alternative-sort-function <span class="linecomment">; Toggle with `C-M-,'.</span>
  'icicle-historical-alphabetic-p
  "<span class="quote">*An alternative sort function, in place of `icicle-sort-function'.
You can swap this with `icicle-sort-function' at any time by using
`icicle-toggle-alternative-sorting' (`\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-alternative-sorting]' in the minibuffer).</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) function) :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-anything-transform-candidates-flag nil
  "<span class="quote">*Non-nil means `icicle-anything' transforms completion candidates.
Function `anything-transform-candidates' is used for the transforming.

The advantage of a nil value is that `icicle-anything' then acts as a
multi-command: you can act on multiple candidates, or apply multiple
actions for the same candidate, within a single invocation of
`icicle-anything' (or related commands).

The advantage of a non-nil value is that the displayed candidates
might be more readable.</span>"
  :type 'boolean :group 'Icicles-Completions-Display :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-apropos-complete-keys '([S-tab] [S-iso-lefttab])
  <span class="linecomment">;; $$$$$ The following should be sufficient, but some Emacs 22+ libraries, such as `info.el',</span>
  <span class="linecomment">;; are brain-dead and explicitly bind both `backtab' and `S-tab'.  I filed Emacs bug #1281.</span>
  <span class="linecomment">;;   (if (&gt; emacs-major-version 21)</span>
  <span class="linecomment">;;       '([backtab])</span>
  <span class="linecomment">;;     '([S-tab] [S-iso-lefttab]))</span>
  "<span class="quote">*Key sequences to use for `icicle-apropos-complete'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.</span>"
<span class="linecomment">;; In Emacs 22 and later, `backtab' is the canonical key that represents</span>
<span class="linecomment">;; both `S-tab' and `S-iso-lefttab', so that is used in the default</span>
<span class="linecomment">;; value.  If, for some reason, `backtab' is not being translated to</span>
<span class="linecomment">;; `S-tab' and `S-iso-lefttab' on your platform, you might want to</span>
<span class="linecomment">;; customize the value to ([S-tab] [S-iso-lefttab]).  And if your Emacs</span>
<span class="linecomment">;; version is 22 or later, please file an Emacs bug about the lack of</span>
<span class="linecomment">;; translation.</span>
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-apropos-complete-no-display-keys '([C-M-S-tab] [C-M-S-iso-lefttab])
  "<span class="quote">*Key sequences to use for `icicle-apropos-complete-no-display'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `C-M-S-tab' and `C-M-S-iso-lefttab'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-apropos-cycle-next-keys '([next])
  "<span class="quote">*Key sequences for apropos completion to cycle to the next candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-next-action-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-apropos-cycle-next-action-keys '([C-next])
  "<span class="quote">*Keys for apropos completion to cycle next and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-next-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-apropos-cycle-previous-keys '([prior])
  "<span class="quote">*Key sequences for apropos completion to cycle to the previous candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-previous-action-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-apropos-cycle-previous-action-keys '([C-prior])
  "<span class="quote">*Keys for apropos completion to cycle previous and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-apropos-cycle-previous-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-apropos-match-fns-alist
  `(("<span class="quote">apropos</span>" . string-match)
    ("<span class="quote">scatter</span>" . icicle-scatter-match)
    ,@(and (require 'levenshtein nil t)
           '(("<span class="quote">Levenshtein</span>" . icicle-levenshtein-match)
             ("<span class="quote">Levenshtein strict</span>" . icicle-levenshtein-strict-match))))
  "<span class="quote">*Alist of string-matching functions used by `S-TAB'.
Each element has the form (NAME . FUNCTION), where NAME is a string
name and FUNCTION is the matching function.  NAME is used in messages
to indicate the type of matching.

By default, `S-TAB' is the key for this completion. The actual keys
used are the value of `icicle-apropos-complete-keys'.</span>"
  :type '(alist
          :key-type   (string :tag "<span class="quote">Name used in messages</span>")
          :value-type (symbol :tag "<span class="quote">Matching function</span>"))
  :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-bookmark-name-length-max 40
  "<span class="quote">*Maximum number of characters used to name a bookmark.
When `icicle-bookmark-cmd' is used with a numeric prefix argument, a
bookmark is set whose name is the name of the current buffer, followed
by a space, followed by at most this many characters of text from the
current buffer, starting at the cursor.</span>"
  :type 'integer :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-complete-on-demand-keys '("<span class="quote">\t</span>" [tab])
  "<span class="quote">*Key sequences to invoke completion during `read-from-minibuffer'.
Such a key has no effect unless `icicle-complete-on-demand-cmd' is
bound to a command.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-yank-function 'yank
  "<span class="quote">*Yank function.  A function that takes a prefix argument.  This
should be a command that is bound to whatever key you use to yank
text, whether in Icicle mode or not.  In Icicle mode, command
`icicle-yank-maybe-completing' calls this function, except when
`icicle-yank-maybe-completing' is called from the minibuffer or called
with a negative prefix argument.  `icicle-yank-maybe-completing'
passes the raw prefix argument to `icicle-yank-function'.

By default (see option `icicle-top-level-key-bindings'), the command
that is the value of this option is remapped to
`icicle-yank-maybe-completing' the first time you enter Icicle mode.
If you customize `icicle-yank-function', then, to take advantage of
this default remapping behavior, you will need to save your
customization and then restart Emacs.

Alternatively, you can customize both `icicle-yank-function' and the
corresponding entry in `icicle-top-level-key-bindings', and then
toggle Icicle mode off and then back on.</span>"
  :type 'function :group 'Icicles-Miscellaneous)

(define-widget 'icicle-key-definition 'lazy
  "<span class="quote">Key definition type for Icicle mode keys.
A list of three components: KEY, COMMAND, CONDITION, that represents
an `icicle-mode-map' binding of COMMAND according to KEY, if CONDITION
evaluates to non-nil.

KEY is either a key sequence (string or vector) or a command.
COMMAND is a command.
CONDITION is a sexp.

If KEY is a command, then the binding represented is its remapping to
COMMAND.</span>"
  :indent 1 :offset 0 :tag "<span class="quote"></span>"           <span class="linecomment">; $$$$$ "Icicle Mode Key Definition"</span>
  :type
  '(list
    (choice
     (key-sequence :tag "<span class="quote">Key</span>" :value [ignore])
     <span class="linecomment">;; Use `symbolp' instead of `commandp', in case the library defining the</span>
     <span class="linecomment">;; command is not loaded.</span>
     (restricted-sexp :tag "<span class="quote">Command to remap</span>" :match-alternatives (symbolp) :value ignore))
     <span class="linecomment">;; Use `symbolp' instead of `commandp'...</span>
    (restricted-sexp :tag "<span class="quote">Command</span>" :match-alternatives (symbolp) :value ignore)
    (sexp :tag "<span class="quote">Condition</span>")))

(defun icicle-remap (old new map &optional oldmap)
  "<span class="quote">Bind command NEW in MAP to all keys currently bound to OLD.
If command remapping is available, use that.  Otherwise, bind NEW to
whatever OLD is bound to in MAP, or in OLDMAP, if provided.</span>"
  (if (fboundp 'command-remapping)
      (define-key map (vector 'remap old) new) <span class="linecomment">; Ignore OLDMAP for Emacs 22.</span>
    (substitute-key-definition old new map oldmap)))

(defun icicle-bind-top-level-commands (&optional defs)
  "<span class="quote">Bind top-level commands for Icicle mode.</span>"
  (unless defs (setq defs  icicle-top-level-key-bindings))
  (let (key command condition)
    (dolist (key-def defs)
      (setq key        (car key-def)
            command    (cadr key-def)
            condition  (car (cddr key-def)))
      (when (eval condition)
        (if (symbolp key)
            (icicle-remap key command icicle-mode-map (current-global-map))
          (define-key icicle-mode-map key command))))))            

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-top-level-key-bindings
  `((,(kbd "<span class="quote">&lt;pause&gt;</span>") icicle-switch-to/from-minibuffer    t) <span class="linecomment">; `pause'</span>
    (,(kbd "<span class="quote">C-c `</span>")   icicle-search-generic               t) <span class="linecomment">; `C-c `'</span>
    (,(kbd "<span class="quote">C-c $</span>")   icicle-search-word                  t) <span class="linecomment">; `C-c $'</span>
    (,(kbd "<span class="quote">C-c ^</span>")   icicle-search-keywords              t) <span class="linecomment">; `C-c ^'</span>
    (,(kbd "<span class="quote">C-c '</span>")   icicle-occur                        t) <span class="linecomment">; `C-c ''</span>
    (,(kbd "<span class="quote">C-c =</span>")   icicle-imenu                        t) <span class="linecomment">; `C-c ='</span>
    (,(kbd "<span class="quote">C-c \"</span>")  icicle-search-text-property         t) <span class="linecomment">; `C-c "'</span>
    (,(kbd "<span class="quote">C-c /</span>")   icicle-complete-thesaurus-entry     t) <span class="linecomment">; `C-c /'</span>
    (,(kbd "<span class="quote">C-x M-e</span>") icicle-execute-named-keyboard-macro t) <span class="linecomment">; `C-x M-e'</span>
    (,(kbd "<span class="quote">C-x SPC</span>") icicle-command-abbrev               t) <span class="linecomment">; `C-x SPC'</span>
    (,(kbd "<span class="quote">C-x 5 o</span>") icicle-select-frame                 t) <span class="linecomment">; `C-x 5 o'</span>
    (,(kbd "<span class="quote">C-h C-o</span>") icicle-describe-option-of-type      t) <span class="linecomment">; `C-h C-o'</span>
    ,@(and (require 'kmacro nil t)      <span class="linecomment">; (Emacs 22+)</span>
           `((,(kbd "<span class="quote">S-&lt;f4&gt;</span>")    icicle-kmacro            t))) <span class="linecomment">; `S-f4'</span>
    (abort-recursive-edit           icicle-abort-recursive-edit     t) <span class="linecomment">; `C-]'</span>
    (minibuffer-keyboard-quit     icicle-abort-recursive-edit <span class="linecomment">; `C-g' (minibuffer - `delsel.el')</span>
     (fboundp 'minibuffer-keyboard-quit))
    (execute-extended-command       icicle-execute-extended-command t) <span class="linecomment">; `M-x'</span>
    (switch-to-buffer               icicle-buffer                   t) <span class="linecomment">; `C-x b'</span>
    (switch-to-buffer-other-window  icicle-buffer-other-window      t) <span class="linecomment">; `C-x 4 b'</span>
    (find-file                      icicle-file                     t) <span class="linecomment">; `C-x C-f'</span>
    (find-file-other-window         icicle-file-other-window        t) <span class="linecomment">; `C-x 4 f'</span>
    (bookmark-set                   icicle-bookmark-cmd             t) <span class="linecomment">; `C-x r m'</span>
    <span class="linecomment">;; Don't let Emacs 20 or 21 use `substitute-key-definition' on `M-.' or `M-*', since we need</span>
    <span class="linecomment">;; these keys for the minibuffer.  Leave them unbound in `icicle-mode-map' until Emacs 22+.</span>
    (pop-tag-mark        icicle-pop-tag-mark          (fboundp 'command-remapping)) <span class="linecomment">; `M-*'</span>
    (find-tag            icicle-find-tag              (fboundp 'command-remapping)) <span class="linecomment">; `M-.'</span>
    (eval-expression     icicle-pp-eval-expression    (fboundp 'command-remapping)) <span class="linecomment">; `M-:'</span>
    (pp-eval-expression icicle-pp-eval-expression (fboundp 'command-remapping)) <span class="linecomment">;`M-:' (`pp+.el')</span>
    (find-tag-other-window        icicle-find-first-tag-other-window t) <span class="linecomment">; `C-x 4 .'</span>
    (kill-buffer                  icicle-kill-buffer                 t) <span class="linecomment">; `C-x k'</span>
    (kill-buffer-and-its-windows  icicle-kill-buffer                t) <span class="linecomment">; `C-x k' (`misc-cmds.el')</span>
    (delete-window                icicle-delete-window               t) <span class="linecomment">; `C-x 0'</span>
    (delete-windows-for           icicle-delete-window             t) <span class="linecomment">; `C-x 0' (`frame-cmds.el')</span>
    (other-window-or-frame        icicle-other-window-or-frame     t) <span class="linecomment">; `C-x o' (`frame-cmds.el')</span>
    (other-window                 icicle-other-window-or-frame       t) <span class="linecomment">; `C-x o'</span>
    (exchange-point-and-mark      icicle-exchange-point-and-mark     t) <span class="linecomment">; `C-x C-x'</span>
    (where-is                     icicle-where-is                    t) <span class="linecomment">; `C-h w'</span>
    (,icicle-yank-function        icicle-yank-maybe-completing       t) <span class="linecomment">; `C-y'</span>
    (set-mark-command
     icicle-goto-marker-or-set-mark-command                          t) <span class="linecomment">; `C-@', `C-SPC'</span>
    (pop-global-mark
     icicle-goto-global-marker-or-pop-global-mark                    t) <span class="linecomment">; `C-x C-@', `C-x C-SPC'</span>
    <span class="linecomment">;; For La Carte (`lacarte.el'), not Icicles, but it's convenient to do this here.</span>
    (,(kbd "<span class="quote">ESC M-x</span>")      lacarte-execute-menu-command
     (fboundp 'lacarte-execute-menu-command)) <span class="linecomment">; `ESC M-x'</span>
    (,(kbd "<span class="quote">M-`</span>")          lacarte-execute-menu-command
     (fboundp 'lacarte-execute-menu-command)) <span class="linecomment">; `M-`' - replaces `tmm-menubar'.</span>
    (,(kbd "<span class="quote">&lt;f10&gt;</span>")        lacarte-execute-menu-command
     (fboundp 'lacarte-execute-menu-command))) <span class="linecomment">; `f10' - replaces `menu-bar-open'.</span>
  "<span class="quote">*List of top-level commands to bind in Icicle mode.
Each list element is of custom type `icicle-key-definition' and has
the form (KEY COMMAND CONDITION).

KEY is either a key sequence (string or vector) to bind COMMAND to or
a command to remap to COMMAND.
COMMAND is bound according to the value of KEY, unless the result of
evaluating CONDITION is nil.

In Customize, to specify a key sequence, choose `Key' in the `Value
Menu', then enter a key description such as that returned by `C-h k'.
For convenience, you can use insert each key in the key description by
hitting `C-q' then the key.  For example, to enter the key description
`C-c M-k' you can use `C-q C-c C-q M-k'.

If you customize this option, then you must exit and re-enter Icicle
mode to ensure that the change takes effect.  This is really necessary
only if your changes would undefine a key.

For this option to have an effect upon startup, it must be set before
you enter Icicle mode.  This means that you must ensure that the code
that sets it is invoked before you enter Icicle mode.  If you use
Customize to change this option, then ensure that the code inserted by
Customize into your `user-init-file' or your `custom-file' is invoked
before you enter Icicle mode.</span>"
  :type (if (&gt; emacs-major-version 20)
            '(repeat icicle-key-definition)
          '(repeat
            (list
             (choice
              (restricted-sexp :tag "<span class="quote">Key</span>"
               :match-alternatives ((lambda (x) (or (stringp x) (vectorp x))))
               :value [ignore])
              (restricted-sexp :tag "<span class="quote">Command to remap</span>"
               <span class="linecomment">;; Use `symbolp' instead of `commandp', in case the library defining the</span>
               <span class="linecomment">;; command is not loaded.</span>
               :match-alternatives (symbolp) :value ignore))
             <span class="linecomment">;; Use `symbolp' instead of `commandp'...</span>
             (restricted-sexp :tag "<span class="quote">Command</span>"
              :match-alternatives (symbolp) :value ignore)
             (sexp :tag "<span class="quote">Condition</span>"))))
  :set #'(lambda (sym defs)
           (custom-set-default sym defs)
           (icicle-bind-top-level-commands defs))
  :initialize #'custom-initialize-default
  :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-extras nil
  "<span class="quote">*List of additional buffer-name candidates added to the normal list.
List elements are strings.</span>"
  :type '(repeat string) :group 'Icicles-Buffers :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-ignore-space-prefix-flag t
  "<span class="quote">*Override `icicle-ignore-space-prefix-flag' for `icicle-buffer*'.
Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.</span>"
  :type 'boolean :group 'Icicles-Buffers :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-match-regexp nil
  "<span class="quote">*nil or a regexp that buffer-name completion candidates must match.
If nil, then this does nothing.  If a regexp, then show only
candidates that match it (and match the user input).
See also `icicle-buffer-no-match-regexp'.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) regexp)
  :group 'Icicles-Buffers :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-no-match-regexp nil
  "<span class="quote">*nil or a regexp that buffer-name completion candidates must not match.
If nil, then this does nothing.  If a regexp, then show only
candidates that do not match it.
See also `icicle-buffer-match-regexp'.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) regexp)
  :group 'Icicles-Buffers :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-predicate nil
  "<span class="quote">*nil or a predicate that buffer-name candidates must satisfy.
If nil, then this does nothing.  Otherwise, this is a function of one
argument, a candidate, and only candidates that satisfy the predicate
are displayed.  For example, this value will show only buffers that
are associated with files:

  (lambda (bufname) (buffer-file-name (get-buffer bufname)))</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) function)
  :group 'Icicles-Buffers :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-require-match-flag nil
  "<span class="quote">*Override `icicle-require-match-flag' for `icicle-buffer*' commands.
The possible values are as follows:
- nil means this option imposes nothing on completion;
  the REQUIRE-MATCH argument provided to the function governs behavior
- `no-match-required' means the same as a nil value for REQUIRE-MATCH
- `partial-match-ok' means the same as a t value for REQUIRE-MATCH
- `full-match-required' means the same as a non-nil, non-t value for
  REQUIRE-MATCH

Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.</span>"
  :type '(choice
          (const :tag "<span class="quote">Do not impose any match behavior</span>"   nil)
          (const :tag "<span class="quote">Do not require a match</span>"             no-match-required)
          (const :tag "<span class="quote">Require a partial match, with RET</span>"  partial-match-ok)
          (const :tag "<span class="quote">Require a full match</span>"               full-match-required))
  :group 'Icicles-Buffers :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-sort 'icicle-buffer-sort-*...*-last
  "<span class="quote">*A sort function for buffer names, or nil.
Examples of sort functions are `icicle-buffer-sort-*...*-last' and
`string&lt;'.  If nil, then buffer names are not sorted.  Option
`icicle-sort-function' is bound to `icicle-buffer-sort' by command
`icicle-buffer'.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) function)
  :group 'Icicles-Buffers :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-candidate-width-factor 70
  "<span class="quote">*Percentage of widest candidate width to use for calculating columns.
The number of columns of candidates displayed in *Completions* is no
more than the window width divided by this percentage of the maximum
candidate width.

Increasing this toward 100 spreads columns out. Decreasing it
compresses columns together.  The higher the value, the more
candidates will form well-defined columns, but the likelier that
horizontal space will be wasted between them.  The lower the value,
the more candidates will not line up in columns, but the less
horizontal space will be wasted between them.

When most candidates are almost as wide as the widest candidate, a
high value works well.  When most candidates are much shorter than the
widest candidate, a low value works well.

If you use Do Re Mi (library `doremi.el'), then you can modify this
option incrementally during completion, seeing the effect as it
changes.  Use `C-x w' from the minibuffer, then use the `right' and
`left' arrow keys or the mouse wheel to increment and decrement the
value.  WYSIWYG.</span>"
  :type 'integer :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-change-sort-order-completion-flag nil
  "<span class="quote">*Non-nil means `icicle-change-sort-order' uses completion, by default.
Otherwise, it cycles among the possible sort orders.  You can override
the behavior by using `C-u' with `icicle-change-sort-order'.</span>"
  :type 'boolean :group 'Icicles-Completions-Display :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-C-l-uses-completion-flag nil
  "<span class="quote">*Non-nil means \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-retrieve-previous-input]' uses completion for choosing completion history
entries, by default.  Otherwise, it cycles among the possible previous
inputs.  You can override the behavior by using `C-u' with `\\[icicle-retrieve-previous-input]'.</span>"
  :type 'boolean :group 'Icicles-Minibuffer-Display :group 'Icicles-Matching)

<span class="linecomment">;; Replace this list by your favorite color themes. Each must be the name of a defined function.</span>
<span class="linecomment">;; By default, this includes all color themes defined globally (variable `color-themes').</span>
<span class="linecomment">;;;###autoload</span>
(defcustom icicle-color-themes
  (and (require 'color-theme nil t)
       (delq 'bury-buffer
             (mapcar (lambda (entry) (list (symbol-name (car entry)))) color-themes)))
  "<span class="quote">*List of color themes to cycle through using `M-x icicle-color-theme'.</span>"
  :type 'hook :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-comint-dynamic-complete-replacements
  '((comint-dynamic-complete-filename    'icicle-comint-dynamic-complete-filename)
    (shell-dynamic-complete-command      'icicle-shell-dynamic-complete-command)
    (shell-dynamic-complete-environment-variable
     'icicle-shell-dynamic-complete-environment-variable)
    (shell-dynamic-complete-filename     'icicle-shell-dynamic-complete-filename)
    (ess-complete-filename               'icicle-ess-complete-filename)
    (ess-complete-object-name            'icicle-ess-complete-object-name)
    )
  "<span class="quote">*List of function replacements for `comint-dynamic-complete-functions'.
Instead of using `comint-dynamic-complete-functions' as is, command
`icicle-comint-dynamic-complete' replaces functions in that list
according to the value of this option.

Each option list element is itself a list of two elements.  The first
is a function to replace (a symbol), and the second is the replacement
function (a sexp that evaluates to a function).  For example, this
list element says to replace completion function `foo' by completion
function `my-foo': (foo 'my-foo).

You can use this option to provide Icicles completion for various
modes that inherit from Comint mode or otherwise use
`comint-dynamic-complete'.</span>"
  :type '(repeat (list symbol sexp)) :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-command-abbrev-alist nil
  "<span class="quote">*Alist of command abbreviations and commands, with frequency of use.
Each element has the form (COMMAND ABBREV N), where ABBREV is an
abbreviation of COMMAND and N is the number of times COMMAND has been
invoked via ABBREV.  Both COMMAND and ABBREV are symbols.</span>"
  :type '(alist :key-type symbol :value-type (list symbol integer)) :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-command-abbrev-match-all-parts-flag nil
  "<span class="quote">*Non-nil means `icicle-command-abbrev' matches each command-name part.
Otherwise, an abbrev need match only a prefix of the command name.</span>"
  :type 'boolean :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-command-abbrev-priority-flag nil
  "<span class="quote">*nil means commands take precedence over abbreviations for `\\&lt;icicle-mode-map&gt;\
\\[icicle-command-abbrev]'.</span>"
  :type 'boolean :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-complete-keys-self-insert-flag nil
  "<span class="quote">*Non-nil means `icicle-complete-keys' includes self-inserting keys.
That means keys bound to `self-insert-command'.</span>"
  :type 'boolean :group 'Icicles-Key-Completion)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-completion-history-max-length (if icicle-C-l-uses-completion-flag 1000 100)
  "<span class="quote">*Maximum number of inputs to save in the completion history.
This is the history that you access using \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-retrieve-previous-input]' and `\\[icicle-retrieve-next-input]'.</span>"
  :type 'integer :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-Completions-display-min-input-chars 0
  "<span class="quote">**Completions* window is removed if fewer chars than this are input.
You might want to set this to, say 1 or 2, to avoid display of a large
set of candidates during incremental completion.  The default value of
0 causes this option to have no effect: *Completions* is never removed
based only on the number of input characters.</span>"
  :type 'integer :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-Completions-frame-at-right-flag t
  "<span class="quote">*Non-nil means move *Completions* frame to right edge of display.
This is done by `icicle-candidate-action'.
It only happens if *Completions* is alone in its frame.
This can be useful to make *Completions* more visible.</span>"
  :type 'boolean :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-Completions-window-max-height 30
  "<span class="quote">*Maximum height of *Completions* window, in lines.
The window is fit to the buffer size, with this as maximum height.
Not used if *Completions* is a special buffer with its own frame.
Not used in Emacs releases prior to 21.</span>"
  :type 'integer :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-customize-save-flag t
  "<span class="quote">*Non-nil means save some updated Icicles options when you quit Emacs.
That is, add some functions to `kill-emacs-hook' that call
`customize-save-variable'.  Currently, this includes only function
`icicle-command-abbrev-save', which saves updated option
`icicle-command-abbrev-alist'.</span>"
  :type 'boolean :group 'Icicles-Minibuffer-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-customize-save-variable-function 'customize-save-variable
  "<span class="quote">*Function used to save user option changes.
I RECOMMEND that you do NOT change this.

The option value is a function that has the same signature as
`customize-save-variable' (perhaps with additional arguments after VAR
and VAL, the variable to save and its new value.

If you do not want changes that Icicles commands make to certain user
options to be saved automatically, you can set this to the function
\(symbol) `ignore'.  If you want to use your own function to somehow
save the current value, you can set this to your function.</span>"
  :type 'function :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-cycle-into-subdirs-flag nil
  "<span class="quote">*Non-nil means minibuffer-input cycling explores subdirectories.
If this is non-nil, then you might want to use a function such as
`icicle-dirs-last-p' for option `icicle-sort-function', to prevent
cycling into subdirectories depth first.  Command
`icicle-sort-by-directories-last' does that.</span>"
  :type 'boolean :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-cycling-respects-completion-mode nil
  "<span class="quote">*Non-nil means candidate cycling respects the current completion mode.
The default value of nil means that you use two separate sets of keys for
cycling apropos and prefix completions:
 - `icicle-apropos-cycle-previous-keys' (backward apropos)
   `icicle-apropos-cycle-next-keys'     (forward apropos)
 - `icicle-prefix-cycle-previous-keys'  (backward prefix)
   `icicle-prefix-cycle-next-keys'      (forward prefix)

Non-nil means that you can use a single set of keys (`up' and `down',
by default) to cycle both kinds of completion.  The keys are the
values of `icicle-modal-cycle-up-keys' (backward) and
`icicle-modal-cycle-down-keys' (forward).

The completion mode, and hence the behavior of these keys, is changed
whenever you hit `TAB' or `S-TAB' during completion: the mode is
prefix completion after `TAB' and `apropos' completion after `S-TAB'.

Before you hit `TAB' or `S-TAB', the cycling behavior depends on the
particular non-nil value of the option:

- `prefix'  means cycle prefix completions
- `apropos' means cycle apropos completions
- Any other non-nil value means cycle inputs from the input history

For example, if the value is `apropos' then you can immediately cycle
apropos completions without first hitting `S-TAB'.

Once you have used `TAB' or `S-TAB', the only way to traverse the
history is using `M-p' and `M-n' - `up' and `down' will cycle
completions.

Note: If the option is non-nil you can still use `M-p' and `M-n' to
traverse the input history, and `prior' and `next' to cycle apropos
completions (assuming that those default keys have not been changed).

And if you customize either the modal cycling keys or the prefix
cycling keys so that they are different (e.g. one of those sets is no
longer `up'/`down'), then you can also still use the latter.  In this
case, you need not use `TAB' and `S-TAB' to switch between the two
completion types, even when this option is non-nil - you can use the
separate apropos and prefix cycling keys.</span>"
  :type '(choice
          (const :tag "<span class="quote">No</span>"                                       nil)
          (const :tag "<span class="quote">Yes, and use prefix cycling by default</span>"   prefix)
          (const :tag "<span class="quote">Yes, and use apropos cycling by default</span>"  apropos)
          (other :tag "<span class="quote">Yes, and use history cycling by default</span>"  t))
  :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-default-thing-insertion 'alternatives
  "<span class="quote">*Behavior of successive `\\&lt;minibuffer-local-map&gt;\\[icicle-insert-string-at-point]'.
If `alternatives', then the next function in the `car' of
`icicle-thing-at-point-functions' is used to retrieve the text to be
inserted.
If `more-of-the-same', then the function that is the `cdr' of
`icicle-thing-at-point-functions' is used to retrieve the text to be
inserted.</span>"
  :type `(choice
          (const :tag ,(substitute-command-keys
                        "<span class="quote">Successive calls to `\\&lt;minibuffer-local-map&gt;\
\\[icicle-insert-string-at-point]' use different text-grabbing functions.</span>")
           alternatives)
          (const :tag ,(substitute-command-keys
                        "<span class="quote">Successive calls to `\\&lt;minibuffer-local-map&gt;\
\\[icicle-insert-string-at-point]' grab more text at point.</span>")
           more-of-the-same))
  :group 'Icicles-Key-Bindings)

<span class="linecomment">;; We don't use `define-obsolete-variable-alias' so that byte-compilation in older Emacs</span>
<span class="linecomment">;; works for newer Emacs too.</span>
(when (fboundp 'defvaralias)            <span class="linecomment">; Emacs 22+</span>
  (defvaralias 'icicle-init-value-flag 'icicle-default-value)
  (make-obsolete-variable 'icicle-init-value-flag 'icicle-default-value))

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-default-value t
  "<span class="quote">*How to treat the default value when reading minibuffer input.

When the default value argument to functions such as
`completing-read', `read-file-name', `read-from-minibuffer', and
`read-string' is non-nil and the initial-input argument is nil or
\"\", the default value can be added to the prompt as a hint or
inserted into the minibuffer as the initial input.

Adding it to the prompt is the default behavior and corresponds to the
behavior of vanilla Emacs.

Inserting the default value in the minibuffer as the initial input has
the advantage of not requiring you to use `M-n' to retrieve it.  It
has the disadvantage of making you use `M-p' (or do something else) to
get rid of the default value in the minibuffer if you do not want to
use or edit it.  If you often want to use or edit the default value,
then set `icicle-default-value' to non-nil and non-t.  If you rarely
do so, then set it to nil or t.

If inserted in the minibuffer, the value of this option also
determines whether or not the inserted text is preselected and where
the cursor is left: at the beginning or end of the text.

These are the possible option values:

  nil               - Do not insert default value or add it to prompt.
  t                 - Add default value to prompt.  Do not insert it.
  `insert-start'    - Insert default value and leave cursor at start.
  `insert-end'      - Insert default value and leave cursor at end.
  `preselect-start' - Insert and preselect default value;
                      leave cursor at beginning.
  `preselect-end'   - Insert and preselect default value;
                      leave cursor at end.

My own preference is `insert-end'.

Preselection can be useful in Delete Selection mode or PC Selection
mode.  It makes it easy to replace the value by typing characters, or
delete it by hitting `C-d' or `DEL' (backspace).  However, all of the
initial input is lost if you type or hit `C-d' or `DEL'.  That is
inconvenient if you want to keep most of it and edit it only slightly.</span>"
  :type '(choice
          (const :tag "<span class="quote">Do not insert default value or add it to prompt</span>"            nil)
          (const :tag "<span class="quote">Add default value to prompt (do not insert in minibuffer)</span>"  t)
          (const :tag "<span class="quote">Insert default value.  Leave cursor at beginning</span>"           insert-start)
          (const :tag "<span class="quote">Insert default value.  Leave cursor at end</span>"                 insert-end)
          (const :tag "<span class="quote">Insert default value, select it, leave cursor at beginning</span>"
           preselect-start)
          (const :tag "<span class="quote">Insert default value, select it, leave cursor at end</span>"
           preselect-end))
  :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-define-alias-commands-flag t
  "<span class="quote">*Non-nil means define some commands that do not begin with `icicle-'.
For convenience, a few top-level commands are defined, typically as
aliases for commands with longer names.  For example, command `toggle'
is defined as an alias for command `icicle-toggle-option'.  In any
case, no such command is ever defined by Icicles if a function with
the same name is already defined.</span>"
   :type 'boolean :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-deletion-action-flag t
  "<span class="quote">*Non-nil means `S-delete' during completion deletes the current object.
More precisely, it deletes the object named by the current completion
candidate, if a deletion action is defined for the current command.
If no deletion action is defined, then the value of this option has no
effect.

If you are worried about inadvertently deleting an object by
accidentally hitting `S-delete', you can customize this to nil to
inhibit `S-delete' object deletion during completion.</span>"
  :type 'boolean :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-file-extras nil
  "<span class="quote">*List of additional file-name candidates added to the normal list.
List elements are strings.</span>"
  :type '(repeat string) :group 'Icicles-Files :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-file-match-regexp nil
  "<span class="quote">*nil or a regexp that file-name completion candidates must match.
If nil, then this does nothing.  If a regexp, then show only
candidates that match it (and match the user input).
See also `icicle-file-no-match-regexp'.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) regexp)
  :group 'Icicles-Files :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-file-no-match-regexp nil
  "<span class="quote">*nil or a regexp that file-name completion candidates must not match.
If nil, then this does nothing.  If a regexp, then show only
candidates that do not match it.
See also `icicle-file-match-regexp'.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) regexp)
  :group 'Icicles-Files :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-file-predicate nil
  "<span class="quote">*nil or a predicate that file-name candidates must satisfy.
If nil, then this does nothing.  Otherwise, this is a function of one
argument, a candidate, and only candidates that satisfy the predicate
are displayed.  For example, this value will show only names of files
with more than 5000 bytes:

  (lambda (fil) (&gt; (nth 5 (file-attributes file)) 5000))</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) function)
  :group 'Icicles-Files :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-file-require-match-flag nil
  "<span class="quote">*Override `icicle-require-match-flag' for file-name completion.
The possible values are as follows:
- nil means this option imposes nothing on completion;
  the REQUIRE-MATCH argument provided to the function governs behavior
- `no-match-required' means the same as a nil value for REQUIRE-MATCH
- `partial-match-ok' means the same as a t value for REQUIRE-MATCH
- `full-match-required' means the same as a non-nil, non-t value for
  REQUIRE-MATCH

Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.</span>"
  :type '(choice
          (const :tag "<span class="quote">Do not impose any match behavior</span>"   nil)
          (const :tag "<span class="quote">Do not require a match</span>"             no-match-required)
          (const :tag "<span class="quote">Require a partial match, with RET</span>"  partial-match-ok)
          (const :tag "<span class="quote">Require a full match</span>"               full-match-required))
  :group 'Icicles-Files :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-file-sort nil
  "<span class="quote">*A sort function for file names, or nil.
Examples of sort functions are `icicle-dirs-last-p' and
`icicle-last-modified-first-p'.  If nil, then file names are not
sorted.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) function)
  :group 'Icicles-Files :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-guess-cmds-in-path-flag nil
  "<span class="quote">*Non-nil means all shell commands are available for completion.
This is used in Icicle mode whenever a shell-command is read.

If non-nil, then all executable files (or all files, if option
`shell-completion-execonly' is nil) in your search path are included
among the completion candidates, in addition to any commands that are
guessed as being appropriate for the target files (e.g. marked files
in Dired).

This list of commands is computed once and cached.  If your
environment changes and you want to update the cached list, just
toggle Icicle mode twice.</span>"
  :type 'boolean :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-inhibit-ding-flag nil
  "<span class="quote">*Non-nil means Icicles never uses an audible bell (ding).
If nil, Icicles sometimes signals you with a sound.</span>"
  :type 'boolean :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-expand-input-to-common-match-flag t <span class="linecomment">; Toggle with `C-|'.</span>
  "<span class="quote">*Non-nil means `S-TAB' expands input, still matching all candidates.
Your expanded input is typically the longest common match among all
completion candidates.  The expansion replaces your input.

If you want to edit your original input, use \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-retrieve-previous-input]'.

For apropos completion, your input is, in general, a regexp.  Setting
this option to nil will let you always work with a regexp in the
minibuffer for apropos completion - your regexp is then never replaced
by the expanded common match.

You can toggle this option at any time from the minibuffer using
`C-|'.</span>"
  :type 'boolean :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-fuzzy-completion-flag nil <span class="linecomment">; Toggle with `C-('.</span>
  "<span class="quote">*Non-nil means use fuzzy prefix completion for \
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-prefix-complete]'.
This has no effect if library `fuzzy-match.el' is not used (loaded).
If non-nil, then `TAB' completes non-filename input using fuzzy
prefix matching as defined in `fuzzy-match.el'.  See `fuzzy-match.el'
for details.

This option has no effect on file-name completion.  Fuzzy prefix
completion is always case-sensitive, and leading spaces are taken into
account.  Completion candidates are always sorted by decreasing fuzzy
match strength.  That is, fuzzy completion is not affected by
`\\[icicle-toggle-case-sensitivity]', `C-^', or `C-,'.

You can toggle this option from the minibuffer at any time with \
`\\[icicle-toggle-fuzzy-completion]'.</span>"
  :type 'boolean :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-hide-common-match-in-Completions-flag nil
  "<span class="quote">*Non-nil means hide the common match for your input in *Completions*.
The common match is elided using ellipsis (`...').
You can use `C-M-.' during completion to toggle this option.</span>"
  :type 'boolean :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-highlight-historical-candidates-flag t <span class="linecomment">; Toggle with `C-pause'.</span>
  "<span class="quote">*Non-nil means highlight  *Completions* candidates that have been used.
This is done using face `icicle-historical-candidate'.
Historical candidates are those that you have entered (using `RET' or
`S-RET') previously.  You can toggle this option from the minibuffer
at any time using `C-pause'.</span>"
  :type 'boolean :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-highlight-input-completion-failure 'implicit-strict
  "<span class="quote">*Non-nil means highlight the part of your input that does not complete.
This is done using face `icicle-input-completion-fail' or
`icicle-input-completion-fail-lax'.

You can use `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-goto/kill-failed-input]' \
to go to the start of the highlighted part.
Repeat to kill it.

This highlighting can have a negative impact on performance, because
it can mean recomputing completion candidates multiple times, in order
to determine the longest part that completes.  For this reason, you
can fine tune when you want this highlighting to occur.  The values of
this option and options
`icicle-highlight-input-completion-failure-delay' and
`icicle-highlight-input-completion-failure-threshold' determine when
the highlighting can take place.

In particular, highlighting the non-matching part of remote file names
can be slow.  Two values of this option allow remote file name
highlighting: `always' and `explicit-remote'.  The other values do not
highlight remote file names.  You probably do not want to use a value
of `always'.

If the value is nil, then highlighting never occurs.  If the value is
`explicit-strict', `explicit', or `explicit-remote', then highlighting
occurs only upon demand: when you hit `TAB' or `S-TAB' to request
completion.  If the value is `implicit-strict', `implicit', or
`always', then highlighting occurs also when you update your input
during incremental completion.

If the value is `implicit-strict' or `implicit', then highlighting
occurs not only upon demand but also during incremental completion if
`icicle-incremental-completion-flag' is non-nil.  Remember that you
can toggle incremental completion, using `C-#' in the minibuffer.

I use a value of `implicit' myself, but the default value is
`implicit-strict' because, depending on your setup and use cases,
`implicit' can impact performance for file-name completion (which is
lax, not strict).  I suggest you try `implicit' to see - this feature
is especially useful for file names.

Summary of choices for when to highlight:

nil               Never
`explicit-strict' When you hit `TAB'/`S-TAB' for strict completion
`explicit'        When you hit `TAB'/`S-TAB'
`explicit-remote' When you hit `TAB'/`S-TAB', including remote files
`implicit-strict' During strict completion
`implicit'        During lax or strict completion
`always'          Always, even for names of remote files

After highlighting, you can use `C-M-l' to move the cursor to the
start of the mismatch, for editing there.  You can use a second
`C-M-l' to kill (delete) the mismatch up to the next input line (if
any).  You can repeat `C-M-l' to kill additional input lines.

See also:
* `icicle-highlight-input-completion-failure-delay'
* `icicle-highlight-input-completion-failure-threshold'</span>"
  :type '(choice
          (const :tag "<span class="quote">Never</span>"                                               nil)
          (const :tag "<span class="quote">Explicit (`TAB'/`S-TAB') strict completion</span>"          explicit-strict)
          (const :tag "<span class="quote">Explicit (`TAB'/`S-TAB') lax and strict completion</span>"  explicit)
          (const :tag "<span class="quote">Explicit completion, even of remote file names</span>"      explicit-remote)
          (const :tag "<span class="quote">Strict completion</span>"                                   implicit-strict)
          (const :tag "<span class="quote">Lax and strict completion</span>"                           implicit)
          (const :tag "<span class="quote">Always (including for remote file names)</span>"            always))
  :group 'Icicles-Minibuffer-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-highlight-input-completion-failure-delay 0.7
  "<span class="quote">*Seconds to wait before highlighting non-completing part of your input.
Zero means there is no wait.</span>"
  :type 'number :group 'Icicles-Minibuffer-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-highlight-input-completion-failure-threshold 1000
  "<span class="quote">*More candidates means do not highlight non-completing part of input.
See also `icicle-highlight-input-completion-failure'.</span>"
  :type 'integer :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-highlight-input-initial-whitespace-flag t
  "<span class="quote">*Non-nil means highlight initial whitespace in your input.
This is done using face `icicle-whitespace-highlight'.
Purpose: Otherwise, you might not notice that you accidentally typed
some whitespace at the beginning of your input, so you might not
understand the set of matching candidates (or lack thereof).

Note: Highlighting input completion failure (see option
`icicle-highlight-input-completion-failure') subsumes
initial-whitespace highlighting.  This means that if no completion
candidate starts with whitespace, and if Icicles is highlighting input
completion failure, then only that highlighting is shown.</span>"
  :type 'boolean :group 'Icicles-Minibuffer-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-highlight-lighter-flag t
  "<span class="quote">*Non-nil means highlight the `Icy' mode-line lighter during completion.
See the Icicles doc, section `Nutshell View of Icicles', subsection
`Completion Status Indicators' for more information.</span>"
  :type 'boolean :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-ignore-space-prefix-flag nil <span class="linecomment">; Toggle with `M-_'.</span>
  "<span class="quote">*Non-nil means ignore completion candidates that start with a space.
However, such candidates are not ignored for prefix completion when
the input also starts with a space.  You can toggle this option from
the minibuffer using `M-_'.
Note: Some Icicles functionalities ignore the value of this option.</span>"
  :type 'boolean :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-incremental-completion-delay 0.7
  "<span class="quote">*Number of seconds to wait before updating *Completions* incrementally.
There is no wait if the number of completion candidates is less than
or equal to `icicle-incremental-completion-threshold'.
See also `icicle-incremental-completion-flag'.</span>"
  :type 'number :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-incremental-completion-flag t <span class="linecomment">; Toggle with `C-#'.</span>
  "<span class="quote">*Non-nil means update *Completions* buffer incrementally, as you type.
nil means do not update *Completions* buffer incrementally, as you type.
t means do nothing if *Completions* is not already displayed.
Non-nil and non-t means display *Completions* and update it.
You can toggle this between t and nil from the minibuffer at any time
using `C-#'.

Note: Incremental completion is effectively turned off when a remote
file name is read, that is, whenever your file-name input matches a
remote-file syntax.

See also `icicle-incremental-completion-delay' and
`icicle-incremental-completion-threshold'.</span>"
  :type '(choice
          (const :tag "<span class="quote">Do not update *Completions* incrementally</span>"                nil)
          (const :tag "<span class="quote">Update *Completions* incrementally if already displayed</span>"  t)
          (other :tag "<span class="quote">Update *Completions* incrementally always</span>"                always))
  :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-incremental-completion-threshold 1000
  "<span class="quote">*More candidates means apply `icicle-incremental-completion-delay'.
See also `icicle-incremental-completion-flag' and
`icicle-incremental-completion-delay'.
This threshold is also used to decide when to display the message
 \"Displaying completion candidates...\".</span>"
  :type 'integer :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-input-string "<span class="quote">.*</span>"
  "<span class="quote">*String to insert in minibuffer via `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-insert-string-from-variable]'.
Typically, this is a regexp or a portion of a regexp.</span>"
  :type 'string :group 'Icicles-Miscellaneous)

(when (fboundp 'defvaralias)            <span class="linecomment">; Emacs 22+</span>
  (defvaralias 'icicle-key-descriptions-use-angle-brackets-flag
      'icicle-key-descriptions-use-&lt;&gt;-flag))

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-inter-candidates-min-spaces 1
  "<span class="quote">*Minimum number of spaces between candidates displayed in *Completions*.
If you use Do Re Mi (library `doremi.el'), then you can modify this
option incrementally during completion, seeing the effect as it
changes.  Use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-doremi-inter-candidates-min-spaces]' from the minibuffer, then use the `up' and
`down' arrow keys or the mouse wheel to increment and decrement the
value.  WYSIWYG.</span>"
  :type 'integer :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-isearch-complete-keys
  (append
   (and (eq system-type 'windows-nt) '([C-M-tab])) <span class="linecomment">; Windows uses ALT-TAB for something else.</span>
   '([M-tab] "<span class="quote">\M-\t</span>"                    <span class="linecomment">; Replace vanilla completion.</span>
     "<span class="quote">\M-o</span>"))                           <span class="linecomment">; Like Icicles minibuffer `M-o'.</span>
  "<span class="quote">*Key sequences to use for `icicle-isearch-complete'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.

The default value includes `M-TAB', which replaces the vanilla binding
of `isearch-complete'.

On MS Windows, it also includes `C-M-TAB', because Windows intercepts
`M-TAB' for its own use.  But note that you can also use
\(w32-register-hot-key [M-tab]) to enable Emacs to use `M-TAB'.

The default binding also includes `M-o', in keeping with the Icicles
use of `M-o' during minibuffer completion.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-key-complete-keys '([S-tab] [S-iso-lefttab])
  <span class="linecomment">;; $$$$$ The following should be sufficient, but some Emacs 22+ libraries, such as `info.el',</span>
  <span class="linecomment">;; are brain-dead and explicitly bind both `backtab' and `S-tab'.  I filed Emacs bug #1281.</span>
  <span class="linecomment">;;   (if (&gt; emacs-major-version 21)</span>
  <span class="linecomment">;;       '([backtab])</span>
  <span class="linecomment">;;     '([S-tab] [S-iso-lefttab]))</span>
  "<span class="quote">*Key sequences to use for `icicle-complete-key'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.</span>"
<span class="linecomment">;; In Emacs 22 and later, `backtab' is the canonical key that represents</span>
<span class="linecomment">;; both `S-tab' and `S-iso-lefttab', so that is used in the default</span>
<span class="linecomment">;; value.  If, for some reason, `backtab' is not being translated to</span>
<span class="linecomment">;; `S-tab' and `S-iso-lefttab' on your platform, you might want to</span>
<span class="linecomment">;; customize the value to ([S-tab] [S-iso-lefttab]).  And if your Emacs</span>
<span class="linecomment">;; version is 22 or later, please file an Emacs bug about the lack of</span>
<span class="linecomment">;; translation.</span>
  :type '(repeat sexp) :group 'Icicles-Key-Completion :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-key-descriptions-use-&lt;&gt;-flag nil
  "<span class="quote">*Non-nil means Icicles key descriptions should use angle brackets (&lt;&gt;).
For example, non-nil gives `&lt;mode-line&gt;'; nil gives `mode-line'.

This does not affect Emacs key descriptions outside of
Icicles (e.g. `C-h k' or `C-h w').

This has no effect for versions of Emacs prior to 21, because
they never use angle brackets.</span>"
  :type 'boolean :group 'Icicles-Key-Completion :group 'Icicles-Minibuffer-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-keymaps-for-key-completion
  '(calendar-mode-map dired-mode-map synonyms-mode-map vc-dired-mode-map)
  "<span class="quote">*List of keymaps in which to bind `S-TAB' to `icicle-complete-keys'.
List elements are symbols that are bound to keymaps.

Each keymap should have at least one prefix key.  `S-TAB' is bound in
each keymap, so that you can use it to complete the prefix keys.

If one of the keymaps is not defined when Icicle mode is entered, then
it is ignored.  If you later define it, then just exit and reenter
Icicle mode, to bind `S-TAB' in the newly defined map.  For example,
use `M-x icy-mode' twice after entering Calendar mode, to be able to
complete `calendar-mode' prefix keys such as `A'.

Do not add `global-map' or any keymaps, such as `ctl-x-map', that are
accessible from the global keymap to the list - they are already
treated, by default.

Do not add any of the translation keymaps, `function-key-map',
`key-translation-map', or `iso-transl-ctl-x-8-map' to the list - that
will not work.</span>"
  :type '(repeat symbol) :group 'Icicles-Key-Completion :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(when (boundp 'kmacro-ring)             <span class="linecomment">; Emacs 22+</span>
  (defcustom icicle-kmacro-ring-max (if (boundp 'most-positive-fixnum)
                                        most-positive-fixnum
                                      67108863) <span class="linecomment">; 1/2 of `most-positive-fixnum' on Windows.</span>
    "<span class="quote">*Icicles version of `kmacro-ring-max'.</span>"
    :type 'integer :group 'Icicles-Miscellaneous))

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-levenshtein-distance 1
  "<span class="quote">*Levenshtein distance allowed for strings to be considered as matching.
Icicles matching function `icicle-levenshtein-match' considers a
string to match another if the first string is within this distance of
some substring of the second.
This option is used only if you have library `levenshtein.el'.</span>"
  :type 'integer :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-list-end-string "<span class="quote">

</span>"
  "<span class="quote">*String appended to a completion candidate that is a list of strings.
When a completion candidate is a list of strings, they are joined
pairwise using `icicle-list-join-string', and `icicle-list-end-string'
is appended to the joined strings.  The result is what is displayed as
a completion candidate in buffer *Completions*, and that is what is
matched by your minibuffer input.

The purpose of `icicle-list-end-string' is to allow some separation
between the displayed completion candidates.  Candidates that are
provided to input-reading functions such as `completing-read' as lists
of strings are often displayed using multiple lines of text.  If
`icicle-list-end-string' is \"\", then the candidates appear run
together, with no visual separation.

It is important to remember that `icicle-list-end-string' is part of
each completion candidate in such circumstances.  This matters if you
use a regexp that ends in `$', matching the end of the candidate.</span>"
  :type 'string :group 'Icicles-Completions-Display)

<span class="linecomment">;; Note: If your copy of this file does not have the two-character string "^G^J"</span>
<span class="linecomment">;; (Control-G, Control-J) or, equivalently, \007\012, as the default value, you will want</span>
<span class="linecomment">;; to change the file to have that.  To insert these control characters in the file, use</span>
<span class="linecomment">;; `C-q'.  Emacs Wiki loses the ^G from the file, so I use \007, which works OK.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defcustom icicle-list-join-string (let ((strg  "<span class="quote">\007\012</span>"))
                                     (set-text-properties 0 1 '(display "<span class="quote"></span>") strg)
                                     strg)
  "<span class="quote">*String joining items in a completion that is a list of strings.
When a completion candidate is a list of strings, this string is used
to join the strings in the list, for display and matching purposes.
When completing input, you type regexps that match the strings,
separating them pairwise by the value of `icicle-list-join-string'.
Actually, what you enter is interpreted as a single regexp to be
matched against the joined strings.  Typically, the candidate list
contains two strings: a name and its doc string.

A good value for this option is a string that:
 1) does not normally occur in doc strings,
 2) visually separates the two strings it joins, and
 3) is not too difficult or too long to type.

The default value is \"^G\^J\", that is, control-g followed by
control-j (newline):
 1) ^G does not normally occur in doc strings
 2) a newline visually separates the multiple component strings, which
    helps readability in buffer *Completions*
 3) you can type the value using `C-q C-g C-q C-j'.

For readability (in Emacs 22 and later), the default value has a
`display' property that makes it appear as simply a newline in
*Completions* - the `^G' is hidden.  you can also make the default
value appear this way in your minibuffer input also, by using \
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-insert-list-join-string].'</span>"
  :type 'string :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-list-nth-parts-join-string "<span class="quote"> </span>"
  "<span class="quote">*String joining candidate parts split by `icicle-list-use-nth-parts'.
This has an effect on multi-completion candidates only, and only if
the current command uses `icicle-list-use-nth-parts'.</span>"
  :type 'string :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-mark-position-in-candidate 'input-end
  "<span class="quote">*Position of mark when you cycle through completion candidates.
This is the mark position in the minibuffer.
Possible values are those for `icicle-point-position-in-candidate'.</span>"
  :type '(choice
          (const :tag "<span class="quote">Leave mark at the beginning of the minibuffer input</span>"  input-start)
          (const :tag "<span class="quote">Leave mark at the end of the minibuffer input</span>"        input-end)
          (const :tag "<span class="quote">Leave mark at the beginning of the completion root</span>"   root-start)
          (const :tag "<span class="quote">Leave mark at the end of the completion root</span>"         root-end))
  :group 'Icicles-Minibuffer-Display)

<span class="linecomment">;; Inspired from `icomplete-minibuffer-setup-hook'.</span>
<span class="linecomment">;;;###autoload</span>
(defcustom icicle-minibuffer-setup-hook nil
  "<span class="quote">*Functions run at the end of minibuffer setup for Icicle mode.</span>"
  :type 'hook :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-modal-cycle-down-keys '([down])
  "<span class="quote">*Key sequences to use for modal cycling to the next candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

This is used only if `icicle-cycling-respects-completion-mode' is
non-nil.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-down-action-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-modal-cycle-down-action-keys '([C-down])
  "<span class="quote">*Keys for modal completion to cycle next and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

This is used only if `icicle-cycling-respects-completion-mode' is
non-nil.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-down-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-modal-cycle-up-keys '([up])
  "<span class="quote">*Key sequences to use for modal cycling to the previous candidate.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

This is used only if `icicle-cycling-respects-completion-mode' is
non-nil.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-up-action-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-modal-cycle-up-action-keys '([C-up])
  "<span class="quote">*Keys for modal completion to cycle previous and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

This is used only if `icicle-cycling-respects-completion-mode' is
non-nil.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-modal-cycle-up-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-option-type-prefix-arg-list '(direct inherit inherit-or-value direct-or-value
                                                inherit-or-regexp direct-or-regexp)
  "<span class="quote">*Symbols controlling prefix args for `icicle-describe-option-of-type'.
A list of six symbols taken from this list:

  direct            inherit             inherit-or-value
  direct-or-value   inherit-or-regexp   direct-or-regexp

Choose the order you like.  The list members map, in order left to
right, to these prefix argument keys:

 `C-u C-u'           `C-0'            `C-u'
 `C-9' (positive)    no prefix arg    `C--' (negative)

For the meanings of the symbols, see the doc string of
`icicle-describe-option-of-type', which describes the default
prefix-argument bindings for the command.</span>"
  :type '(list symbol symbol symbol symbol symbol symbol) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-point-position-in-candidate 'root-end
  "<span class="quote">*Position of cursor when you cycle through completion candidates.
This is the cursor position in the minibuffer.
Possible values are:
 `input-start': beginning of the minibuffer input
 `input-end':   end of the minibuffer input
 `root-start':  beginning of the completion root
 `root-end':    end of the completion root
When input is expected to be a file name, `input-start' is just after
the directory, which is added automatically during completion cycling.
See also `icicle-mark-position-in-candidate'.</span>"
  :type '(choice
          (const :tag "<span class="quote">Leave cursor at the beginning of the minibuffer input</span>"  input-start)
          (const :tag "<span class="quote">Leave cursor at the end of the minibuffer input</span>"        input-end)
          (const :tag "<span class="quote">Leave cursor at the beginning of the completion root</span>"   root-start)
          (const :tag "<span class="quote">Leave cursor at the end of the completion root</span>"         root-end))
  :group 'Icicles-Minibuffer-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-previous-candidate-keys '([S-tab] [S-iso-lefttab])
  <span class="linecomment">;; $$$$$ The following should be sufficient, but some Emacs 22+ libraries, such as `info.el',</span>
  <span class="linecomment">;; are brain-dead and explicitly bind both `backtab' and `S-tab'.  I filed Emacs bug #1281.</span>
  <span class="linecomment">;;   (if (&gt; emacs-major-version 21)</span>
  <span class="linecomment">;;       '([backtab])</span>
  <span class="linecomment">;;     '([S-tab] [S-iso-lefttab]))</span>
  "<span class="quote">*Key sequences to use for `icicle-move-to-previous-completion'.
In buffer *Completions*, this moves backward among candidates.

A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.</span>"
<span class="linecomment">;; In Emacs 22 and later, `backtab' is the canonical key that represents</span>
<span class="linecomment">;; both `S-tab' and `S-iso-lefttab', so that is used in the default</span>
<span class="linecomment">;; value.  If, for some reason, `backtab' is not being translated to</span>
<span class="linecomment">;; `S-tab' and `S-iso-lefttab' on your platform, you might want to</span>
<span class="linecomment">;; customize the value to ([S-tab] [S-iso-lefttab]).  And if your Emacs</span>
<span class="linecomment">;; version is 22 or later, please file an Emacs bug about the lack of</span>
<span class="linecomment">;; translation.</span>
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-change-region-background-flag
  (not (eq icicle-point-position-in-candidate icicle-mark-position-in-candidate))
  "<span class="quote">*Non-nil means use color `icicle-region-background' during input.
See `icicle-region-background'.  If you load library `hexrgb.el'
before Icicles, then `icicle-region-background' will be a slightly
different hue from your normal background color.  This makes
minibuffer input easier to read than if your normal `region' face were
used.  This has an effect only during minibuffer input.  A non-nil
value for this option is particularly useful if you use
delete-selection mode.</span>"
  :type 'boolean :group 'Icicles-Minibuffer-Display)

<span class="linecomment">;; This is essentially a version of `doremi-increment-color-component' for hue only.</span>
(defun icicle-increment-color-hue (color increment)
  "<span class="quote">Increase hue component of COLOR by INCREMENT.</span>"
  (unless (featurep 'hexrgb) (error "<span class="quote">`icicle-increment-color-hue' requires library `hexrgb.el'</span>"))
  (unless (string-match "<span class="quote">#</span>" color)      <span class="linecomment">; Convert color name to #hhh...</span>
    (setq color  (hexrgb-color-values-to-hex (x-color-values color))))
  <span class="linecomment">;; Convert RGB to HSV</span>
  (let* ((rgb         (x-color-values color))
         (red         (/ (float (nth 0 rgb)) 65535.0)) <span class="linecomment">; Convert from 0-65535 to 0.0-1.0</span>
         (green       (/ (float (nth 1 rgb)) 65535.0))
         (blue        (/ (float (nth 2 rgb)) 65535.0))
         (hsv         (hexrgb-rgb-to-hsv red green blue))
         (hue         (nth 0 hsv))
         (saturation  (nth 1 hsv))
         (value       (nth 2 hsv)))
    (setq hue  (+ hue (/ increment 100.0)))
    (when (&gt; hue 1.0) (setq hue  (1- hue)))
    (hexrgb-color-values-to-hex (mapcar (lambda (x) (floor (* x 65535.0)))
                                        (hexrgb-hsv-to-rgb hue saturation value)))))

<span class="linecomment">;; This is essentially a version of `doremi-increment-color-component' for saturation only.</span>
(defun icicle-increment-color-saturation (color increment)
  "<span class="quote">Increase saturation component of COLOR by INCREMENT.</span>"
  (unless (featurep 'hexrgb)
    (error "<span class="quote">`icicle-increment-color-saturation' requires library `hexrgb.el'</span>"))
  (unless (string-match "<span class="quote">#</span>" color)      <span class="linecomment">; Convert color name to #hhh...</span>
    (setq color  (hexrgb-color-values-to-hex (x-color-values color))))
  <span class="linecomment">;; Convert RGB to HSV</span>
  (let* ((rgb         (x-color-values color))
         (red         (/ (float (nth 0 rgb)) 65535.0)) <span class="linecomment">; Convert from 0-65535 to 0.0-1.0</span>
         (green       (/ (float (nth 1 rgb)) 65535.0))
         (blue        (/ (float (nth 2 rgb)) 65535.0))
         (hsv         (hexrgb-rgb-to-hsv red green blue))
         (hue         (nth 0 hsv))
         (saturation  (nth 1 hsv))
         (value       (nth 2 hsv)))
    (setq saturation  (+ saturation (/ increment 100.0)))
    (when (&gt; saturation 1.0) (setq saturation  (1- saturation)))
    (hexrgb-color-values-to-hex (mapcar (lambda (x) (floor (* x 65535.0)))
                                        (hexrgb-hsv-to-rgb hue saturation value)))))

<span class="linecomment">;; This is essentially a version of `doremi-increment-color-component' for value only.</span>
(defun icicle-increment-color-value (color increment)
  "<span class="quote">Increase value component (brightness) of COLOR by INCREMENT.</span>"
  (unless (featurep 'hexrgb)
    (error "<span class="quote">`icicle-increment-color-value' requires library `hexrgb.el'</span>"))
  (unless (string-match "<span class="quote">#</span>" color)      <span class="linecomment">; Convert color name to #hhh...</span>
    (setq color  (hexrgb-color-values-to-hex (x-color-values color))))
  <span class="linecomment">;; Convert RGB to HSV</span>
  (let* ((rgb         (x-color-values color))
         (red         (/ (float (nth 0 rgb)) 65535.0)) <span class="linecomment">; Convert from 0-65535 to 0.0-1.0</span>
         (green       (/ (float (nth 1 rgb)) 65535.0))
         (blue        (/ (float (nth 2 rgb)) 65535.0))
         (hsv         (hexrgb-rgb-to-hsv red green blue))
         (hue         (nth 0 hsv))
         (saturation  (nth 1 hsv))
         (value       (nth 2 hsv)))
    (setq value  (+ value (/ increment 100.0)))
    (when (&gt; value 1.0) (setq value  (1- value)))
    (hexrgb-color-values-to-hex (mapcar (lambda (x) (floor (* x 65535.0)))
                                        (hexrgb-hsv-to-rgb hue saturation value)))))

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-pp-eval-expression-print-length nil
  "<span class="quote">*Value for `print-length' while printing value in `pp-eval-expression'.
A value of nil means no limit.</span>"
  :type '(choice (const :tag "<span class="quote">No Limit</span>" nil) integer) :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-pp-eval-expression-print-level nil
  "<span class="quote">*Value for `print-level' while printing value in `pp-eval-expression'.
A value of nil means no limit.</span>"
  :type '(choice (const :tag "<span class="quote">No Limit</span>" nil) integer) :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-prefix-complete-keys '([tab] [(control ?i)])
  "<span class="quote">*Key sequences to use for `icicle-prefix-complete'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-prefix-complete-no-display-keys '([(control meta tab)])
  "<span class="quote">*Key sequences to use for `icicle-prefix-complete-no-display'.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-prefix-cycle-next-keys '([down])
  "<span class="quote">*Key sequences for prefix completion to cycle to the next candidate.
This is also used to move down a line in the *Completions* buffer.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-next-action-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-prefix-cycle-next-action-keys '([C-down])
  "<span class="quote">*Keys for prefix completion to cycle next and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-next-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-prefix-cycle-previous-keys '([up])
  "<span class="quote">*Key sequences for prefix completion to cycle to the previous candidate.
This is also used to move up a line in the *Completions* buffer.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-previous-action-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-prefix-cycle-previous-action-keys '([C-up])
  "<span class="quote">*Keys for prefix completion to cycle previous and perform action.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Option `icicle-use-C-for-actions-flag' swaps these keys with
`icicle-prefix-cycle-previous-keys'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-redefine-standard-commands-flag t
  "<span class="quote">*Non-nil means Icicle mode redefines some standard Emacs commands.</span>"
  :type 'boolean :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-regexp-quote-flag nil <span class="linecomment">; Toggle with `C-`'.</span>
  "<span class="quote">*Non-nil means special characters in regexps are escaped.
This means that no characters are recognized as special: they match
themselves.  This turns apropos completion into simple substring
completion.  It also turns Icicles searching into literal searching.
You can toggle this option from the minibuffer at any
time using `C-`'.</span>"
  :type 'boolean :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-regexp-search-ring-max (if (boundp 'most-positive-fixnum)
                                             (/ most-positive-fixnum 10)
                                           13421772) <span class="linecomment">; 1/10 of `most-positive-fixnum' on Windows.</span>
  "<span class="quote">*Icicles version of `regexp-search-ring-max'.</span>"
  :type 'integer :group 'Icicles-Searching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-region-alist nil
  "<span class="quote">*Alist of regions (in any buffers).
Use commands `icicle-add-region' and `icicle-remove-region' to define
this list.

List elements have the form (STRING BUFFER FILE START END), where:
STRING is the first `icicle-regions-name-length-max' characters in the
  region.
BUFFER is the name of the buffer containing the region.
FILE is the buffer's `buffer-file-name', or nil if not a file buffer.
START and END are character positions that delimit the region.</span>"
  :type '(alist
          :key-type (string :tag "<span class="quote">Tag</span>")
          :value-type (list
                       (string  :tag "<span class="quote">Buffer name</span>")
                       (file    :tag "<span class="quote">File name (absolute)</span>")
                       (integer :tag "<span class="quote">Region start</span>")
                       (integer :tag "<span class="quote">Region end</span>")))
  :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-region-auto-open-files-flag nil
  "<span class="quote">*Non-nil means commands accessing `icicle-region-alist' open its files.
That is, the file of each buffer in `icicle-region-alist' that is
associated with a file is visited, without displaying it.

If this is nil, you can still open all such files at any time, using
command `icicle-region-open-all-files'.</span>"
  :type 'boolean :group 'Icicles-Miscellaneous :group 'Icicles-Searching)

<span class="linecomment">;; You can use `icicle-increment-color-value' in place of `icicle-increment-color-hue', if you</span>
<span class="linecomment">;; prefer highlighting background to be slightly darker instead of a slightly different hue.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defcustom icicle-region-background
  (if (featurep 'hexrgb)
      (let ((bg  (or (and (boundp '1on1-active-minibuffer-frame-background)
                          1on1-active-minibuffer-frame-background) <span class="linecomment">; In `oneonone.el'.</span>
                     (cdr (assq 'background-color (frame-parameters)))
                     (face-background 'region))))
        (if (hexrgb-approx-equal (hexrgb-saturation bg) 0.0)
            (icicle-increment-color-value bg <span class="linecomment">; Grayscale - change bg value slightly.</span>
                                          (if (eq frame-background-mode 'dark)
                                              20
                                            -10))
          (icicle-increment-color-hue bg 24))) <span class="linecomment">; Color - change bg hue slightly.</span>
    (face-background 'region))          <span class="linecomment">; Use normal region background.</span>
  "<span class="quote">*Background color to use for region during minibuffer cycling.
This has no effect if `icicle-change-region-background-flag' is nil.
If you do not define this explicitly, and if you have loaded library
`hexrgb.el' (recommended), then this color will be slightly
different from your frame background.  This still lets you notice the
region, but it makes the region less conspicuous, so you can more
easily read your minibuffer input.</span>"
  :type (if (and (require 'wid-edit nil t) (get 'color 'widget-type)) 'color 'string)
  :group 'Icicles-Minibuffer-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-regions-name-length-max 80
  "<span class="quote">*Maximum number of characters used to name a region.
This many characters, maximum, from the beginning of the region, is
used to name the region.</span>"
  :type 'integer :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-require-match-flag nil
  "<span class="quote">*Control REQUIRE-MATCH arg to `completing-read' and `read-file-name'.
The possible values are as follows:
- nil means this option imposes nothing on completion;
  the REQUIRE-MATCH argument provided to the function governs behavior
- `no-match-required' means the same as a nil value for REQUIRE-MATCH
- `partial-match-ok' means the same as a t value for REQUIRE-MATCH
- `full-match-required' means the same as a non-nil, non-t value for
  REQUIRE-MATCH

Note: This option is provided mainly for use (binding) in
`icicle-define-command' and `icicle-define-file-command'.
You probably do not want to set this globally, but you can.</span>"
  :type '(choice
          (const :tag "<span class="quote">Do not impose any match behavior</span>"   nil)
          (const :tag "<span class="quote">Do not require a match</span>"             no-match-required)
          (const :tag "<span class="quote">Require a partial match, with RET</span>"  partial-match-ok)
          (const :tag "<span class="quote">Require a full match</span>"               full-match-required))
  :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-saved-completion-sets nil
  "<span class="quote">*Completion sets available for `icicle-candidate-set-retrieve'.
The form is ((SET-NAME . CACHE-FILE-NAME)...), where SET-NAME is the
name of a set of completion candidates and CACHE-FILE-NAME is the
absolute name of the cache file that contains those candidates.
You normally do not customize this directly, statically.
Instead, you add or remove sets using commands
`icicle-add/update-saved-completion-set' and
`icicle-remove-saved-completion-set'.</span>"
  :type '(repeat (cons string file)) :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-filesets-as-saved-completion-sets-flag t
  "<span class="quote">*Non-nil means you can use filesets to save candidates persistently.
This means that you can save file-name candidates in a persistent
Icicles saved completion set (cache file) or in in an Emacs fileset.
It also means that an Icicles persistent completion set can contain
filesets, in addition to file names: any number of filesets, and
filesets of different type.  Available only for Emacs 22 and later,
and you must load library `filesets.el'.</span>"
  :type 'boolean :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-cleanup-flag t
  "<span class="quote">*Controls whether to remove highlighting after a search.
If this is nil, highlighting can be removed manually with
`\\[icicle-search-highlight-cleanup]'.</span>"
  :type 'boolean :group 'Icicles-Searching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-context-match-predicate nil
  "<span class="quote">*nil or a predicate that candidate search contexts must satisfy.
If nil, then this does nothing.  Otherwise, this is a predicate of one
argument, a string, and only search contexts that satisfy it are
displayed.  Command `icicle-search' binds internal variable
`icicle-must-pass-predicate' to this value.

Note: This predicate is different from the predicate used by \
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-narrow-candidates-with-predicate]'.
That predicate takes as argument a full search-context candidate,
which includes the context position.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) function) :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-from-isearch-keys '([S-tab] [S-iso-lefttab])
  <span class="linecomment">;; $$$$$ The following should be sufficient, but some Emacs 22+ libraries, such as `info.el',</span>
  <span class="linecomment">;; are brain-dead and explicitly bind both `backtab' and `S-tab'.  I filed Emacs bug #1281.</span>
  <span class="linecomment">;;   (if (&gt; emacs-major-version 21)</span>
  <span class="linecomment">;;       '([backtab])</span>
  <span class="linecomment">;;     '([S-tab] [S-iso-lefttab]))</span>
  "<span class="quote">*Key sequences to use to start `icicle-search' from Isearch.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards - for example, `S-tab' and `S-iso-lefttab'.</span>"
<span class="linecomment">;; In Emacs 22 and later, `backtab' is the canonical key that represents</span>
<span class="linecomment">;; both `S-tab' and `S-iso-lefttab', so that is used in the default</span>
<span class="linecomment">;; value.  If, for some reason, `backtab' is not being translated to</span>
<span class="linecomment">;; `S-tab' and `S-iso-lefttab' on your platform, you might want to</span>
<span class="linecomment">;; customize the value to ([S-tab] [S-iso-lefttab]).  And if your Emacs</span>
<span class="linecomment">;; version is 22 or later, please file an Emacs bug about the lack of</span>
<span class="linecomment">;; translation.</span>
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-highlight-all-current-flag nil <span class="linecomment">; Toggle with `C-^'.</span>
  "<span class="quote">*Non-nil means highlight input match in each context search hit.
Setting this to non-nil can impact performance negatively, because the
highlighting is updated with each input change.  You can toggle this
option from the minibuffer during `C-c`' search using `C-^'.</span>"
  :type 'boolean :group 'Icicles-Searching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-highlight-context-levels-flag t
  "<span class="quote">*Non-nil means highlight 1-8 context levels, within the search context.
Level highlighting is done only when this is non-nil and a subgroup is
not used as the search context, that is, the context corresponds to
the entire search regexp.</span>"
  :type 'boolean :group 'Icicles-Searching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-highlight-threshold 100000
  "<span class="quote">*Max number of context search hits to highlight at once.
This highlighting uses face `icicle-search-main-regexp-others'.</span>"
  :type 'integer :group 'Icicles-Searching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-hook nil
  "<span class="quote">*List of hook functions run by `icicle-search' (see `run-hooks').</span>"
  :type 'hook :group 'Icicles-Searching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-replace-common-match-flag t <span class="linecomment">; Toggle with `C-M-|'.</span>
  "<span class="quote">*Non-nil means to replace the expanded common match of your input.
This has no effect if either
`icicle-search-highlight-all-current-flag' or
`icicle-expand-input-to-common-match-flag' is nil.
You can toggle those options from the minibuffer using `C-^' and
`C-|', respectively.  You can toggle
`icicle-search-replace-common-match-flag' using `C-M-|'.</span>"
  :type 'boolean :group 'Icicles-Searching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-replace-literally-flag nil <span class="linecomment">; Toggle with `M-`'.</span>
  "<span class="quote">*Non-nil means to treat replacement text literally.
Nil means to interpret `\' specially in replacement text, as in the
  LITERAL argument to `replace-match'.
You can use `M-`' to toggle this at any time during Icicles search.</span>"
  :type 'boolean :group 'Icicles-Searching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-replace-whole-candidate-flag t <span class="linecomment">; Toggle with `C-,'.</span>
  "<span class="quote">*Non-nil means replacement during search replaces the entire search hit.
Nil means to replace only what matches your current input.
You can use `C-,' to toggle this at any time during Icicles search.</span>"
  :type 'boolean :group 'Icicles-Searching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-ring-max (if (boundp 'most-positive-fixnum)
                                             (/ most-positive-fixnum 10)
                                           13421772) <span class="linecomment">; 1/10 of `most-positive-fixnum' on Windows.</span>
  "<span class="quote">*Icicles version of `search-ring-max'.</span>"
  :type 'integer :group 'Icicles-Searching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-search-whole-word-flag nil <span class="linecomment">; Toggle with `M-q'.</span>
  "<span class="quote">*Non-nil means that `icicle-search' looks for a whole word.
You can use `M-q' to toggle this at any time during Icicles search.</span>"
  :type 'boolean :group 'Icicles-Searching)

<span class="linecomment">;;;###autoload</span>
(if (and (fboundp 'defvaralias) (boundp 'completion-show-help))
    (defvaralias 'icicle-show-Completions-help-flag 'completion-show-help)
  (defcustom icicle-show-Completions-help-flag t
    "<span class="quote">*Non-nil means display help lines at the top of buffer *Completions*.</span>"
    :type 'boolean :group 'Icicles-Completions-Display))

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-show-Completions-initially-flag nil
  "<span class="quote">*Non-nil means to show buffer *Completions* even without user input.
nil means that *Completions* is shown upon demand, via `TAB' or
`S-TAB'.

Alternatively, you can set option `icicle-incremental-completion-flag'
to a value that is neither nil nor t.  That will display buffer
*Completions* as soon as you type or delete input (but not
initially).</span>"
  :type 'boolean :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-sort-function 'icicle-case-string-less-p <span class="linecomment">; Toggle with `C-,'.</span>
  "<span class="quote">*Comparison function passed to `sort', to sort completion candidates.
This sorting determines the order of candidates when cycling and their
order in buffer *Completions*.  If the value is nil, then no sorting
is done.

When `icicle-cycle-into-subdirs-flag' is non-nil, you might want to
use a function such as `icicle-dirs-last-p' for this option, to
prevent cycling into subdirectories depth first.  Command
`icicle-sort-by-directories-last' does that.

You can toggle sorting at any time using command
`icicle-toggle-sorting', bound to `C-,' in the minibuffer.

Note: Although this is a user option, it may be changed by program
locally, for use in particular contexts.  In particular, you can bind
this to nil in an Emacs-Lisp function, to inhibit sorting in that
context.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) function) :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-buffer-configs
  `(("<span class="quote">All</span>" nil nil nil nil ,icicle-sort-function)
    ("<span class="quote">Files</span>" nil nil (lambda (bufname) (buffer-file-name (get-buffer bufname))) nil
     ,icicle-sort-function)
    ("<span class="quote">Files and Scratch</span>" nil nil (lambda (bufname) (buffer-file-name (get-buffer bufname)))
     ("<span class="quote">*scratch*</span>") ,icicle-sort-function)
    ("<span class="quote">All, *...* Buffers Last</span>" nil nil nil nil icicle-buffer-sort-*...*-last))
  "<span class="quote">*List of option configurations available for `icicle-buffer-config'.
The form is (CONFIG...), where CONFIG is a list of these items:

 - Configuration name                    (string)
 - `icicle-buffer-match-regexp' value    (regexp string)
 - `icicle-buffer-no-match-regexp' value (regexp string)
 - `icicle-buffer-predicate' value       (function)
 - `icicle-buffer-extras' value          (list of strings)
 - `icicle-buffer-sort' value            (function)

A configuration describes which buffer names are displayed during
completion and their order.</span>"
  :type '(repeat (list
                  string                <span class="linecomment">; Configuration name</span>
                  (choice (const :tag "<span class="quote">None</span>" nil) (string :tag "<span class="quote">Match regexp</span>"))
                  (choice (const :tag "<span class="quote">None</span>" nil) (string :tag "<span class="quote">No-match regexp</span>"))
                  (choice (const :tag "<span class="quote">None</span>" nil) (function :tag "<span class="quote">Predicate</span>")) <span class="linecomment">; Predicate</span>
                  (choice (const :tag "<span class="quote">None</span>" nil) (repeat (string :tag "<span class="quote">Extra buffer</span>")))
                  (choice (const :tag "<span class="quote">None</span>" nil) (function :tag "<span class="quote">Sort function</span>"))))
  :group 'Icicles-Buffers)

(defun icicle-buffer-sort-*...*-last (buf1 buf2)
  "<span class="quote">Return non-nil if BUF1 is `string&lt;' BUF2 or only BUF2 starts with \"*\".</span>"
  (let ((b1  (if completion-ignore-case (downcase buf1) buf1))
        (b2  (if completion-ignore-case (downcase buf2) buf2)))
    (if (string-match "<span class="quote">^\\*</span>" b1)
        (and (string-match "<span class="quote">^\\*</span>" b2) (string&lt; b1 b2))
      (or (string-match "<span class="quote">^\\*</span>" b2) (string&lt; b1 b2)))))


(defcustom icicle-sort-functions-alist nil <span class="linecomment">; Emacs 21+</span>
  "<span class="quote">*Alist of sort functions.
You probably do not want to customize this option.  Instead, use macro
`icicle-define-sort-command' to define a new sort function and add it
to this alist.
Each alist element has the form (SORT-ORDER . COMPARISON-FUNCTION).
SORT-ORDER is a short string (or symbol) describing the sort order.
 Examples: \"by date\", \"alphabetically\", \"directories first\".
COMPARISON-FN is a function that compares two strings, returning
 non-nil if and only if the first string sorts before the second.</span>"
  :type '(alist
          :key-type (choice :tag "<span class="quote">Sort order</span>" string symbol)
          :value-type
          (choice (function :tag "<span class="quote">Comparison function</span>") (const :tag "<span class="quote">Do not sort</span>" nil)))
  :group 'Icicles-Completions-Display :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-special-candidate-regexp nil
  "<span class="quote">*Regexp to match special completion candidates, or nil to do nothing.
The candidates are highlighted in buffer *Completions* using face
`icicle-special-candidate'.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) regexp) :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-complete-key-anyway-flag nil
  "<span class="quote">*Non-nil means bind `S-TAB' for key completion even if already
bound.  If nil, then each of the keys in `icicle-key-complete-keys' is
bound to `icicle-complete-keys' in each keymap of
`icicle-keymaps-for-key-completion' only if `S-TAB' is not already
bound in the keymap.

Note: the keys in `icicle-key-complete-keys' are always bound to
`icicle-complete-keys' in `icicle-mode-map'.  This option affects only
the binding of those keys in `icicle-keymaps-for-key-completion'.</span>"
  :type 'boolean :group 'Icicles-Key-Completion :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-TAB-shows-candidates-flag t
  "<span class="quote">*Non-nil means that `TAB' always shows completion candidates.
Nil means follow the standard Emacs behavior of completing to the
longest common prefix, and only displaying the candidates after a
second `TAB'.

Actually, the concerned keys are those defined by option
`icicle-prefix-complete-keys', not necessarily `TAB'.</span>"
  :type 'boolean :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-test-for-remote-files-flag t <span class="linecomment">; Toggle with `C-^'.</span>
  "<span class="quote">*Non-nil means Icicles tests for remote file names.
A value of nil turns off all handling of remote file names by Tramp,
including file-name completion.

The testing due to a non-nil value takes a little time, but the test
result saves time with Tramp handling, and it is used to avoid some
other costly operations when a file is determined to be remote.  These
operations are (a) incremental completion and (b) highlighting of the
part of your current input that does not complete.

Use a nil value only when you are sure that the file names you are
completing are local.  The effect will be a slight speed increase for
operations (a) and (b) for local files.

In addition, a nil value has the effect of ignoring the restriction of
input mismatch highlighting to strict completion.  That is, it treats
an `icicle-highlight-input-completion-failure' value of
`explicit-strict' or `implicit-strict' as if it were `implicit'.  The
assumption here is that you use these highlighting values only to
avoid the cost of remote file name completion.

You can toggle this option from the minibuffer using `C-^' (except
during Icicles search).</span>"
  :initialize (lambda (opt-name val) (set opt-name t))
  :set (lambda (opt-name val)
         (or (not (require 'tramp nil t))
             (prog1 (set opt-name (not val))
               (icicle-toggle-remote-file-testing))))
  :type 'boolean :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-thing-at-point-functions
  (progn (or (require 'ffap- nil t) (require 'ffap nil t)) <span class="linecomment">; Try `ffap-.el' first.</span>
         (cons
          <span class="linecomment">;; 1) Ffap, 2) Lisp symbol or file name, 3) word, 4) url.</span>
          `(,@(and (fboundp 'ffap-guesser) '(ffap-guesser))
            ,(if (fboundp 'symbol-name-nearest-point)
                 'symbol-name-nearest-point
                 (lambda () (symbol-name (symbol-at-point))))
            ,(if (fboundp 'word-nearest-point)
                 'word-nearest-point
                 (lambda () (thing-at-point 'word)))
            thing-at-point-url-at-point)
          'forward-word))
  "<span class="quote">*Functions that return a string at or near the cursor when you use `M-.'.
A cons cell whose car and cdr may each be empty.

The car of the cons cell is a list of functions that grab different
kinds of strings at or near point.  By default, there are four
functions, which grab 1) whatever `ffap-guesser' finds, 2) the symbol
or file name, 3) the word, 4) the URL at point.  Any number of
functions can be used.  They are used in sequence by command
`icicle-insert-string-at-point' (bound to `M-.').

The cdr of the cons cell is nil or a function that advances point one
text thing.  Each time command `icicle-insert-string-at-point' is
called successively, this is called to grab more things of text (of
the same kind).  By default, successive words are grabbed.

If either the car or cdr is empty, then the other alone determines the
behavior of `icicle-insert-string-at-point'.  Otherwise, option
`icicle-default-thing-insertion' determines whether the car or cdr is
used by `icicle-insert-string-at-point'.  `C-u' with no number
reverses the meaning of `icicle-default-thing-insertion'.</span>"
  :type
  '(cons
    (choice
     (repeat (function :tag "<span class="quote">Function to grab some text at point and insert it in minibuffer</span>"))
     (const :tag "<span class="quote">No alternative text-grabbing functions</span>" nil))
    (choice
     (const :tag "<span class="quote">No function to successively grab more text</span>" nil)
     (function :tag "<span class="quote">Function to advance point one text thing</span>")))
  :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-top-level-when-sole-completion-flag nil
  "<span class="quote">*Non-nil means to return to top level if only one matching completion.
The sole completion is accepted.</span>"
  :type 'boolean :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-touche-pas-aux-menus-flag nil
  "<span class="quote">*Non-nil means do not add items to menus except Minibuf and Icicles.
This value is used only when Icicles mode is initially established, so
changing this has no effect after Icicles has been loaded.  However,
you can change it and save the new value so it will be used next time.

For this option to have an effect upon startup, it must be set before
you enter Icicle mode.  This means that you must ensure that the code
that sets it is invoked before you enter Icicle mode.  If you use
Customize to change this option, then ensure that the code inserted by
Customize into your `user-init-file' or your `custom-file' is invoked
before you enter Icicle mode.</span>"
  :type 'boolean :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-transform-function nil <span class="linecomment">; Toggle with `C-$,'.</span>
  "<span class="quote">*Function used to transform the list of completion candidates.
This is applied to the list of initial candidates.
If this is nil, then no transformation takes place.

You can toggle this option at any time from the minibuffer using
`C-$,'.

NOTE: Although this is a user option, you probably do *NOT* want to
customize it.  Icicles commands already \"do the right thing\" when it
comes to candidate transformation.  The value of this option may be
changed by program locally, for use in particular contexts.  For
example, when you use `C-c C-`' (\ `icicle-search-generic') in a
*shell* buffer, Icicles uses this variable with a value of
`icicle-remove-duplicates', to remove duplicate shell commands from
your input history list.

Emacs-Lisp programmers can use this variable to transform the list of
candidates in any way they like.  A typical use is to remove
duplicates, by binding it to `icicle-remove-duplicates' or
`icicle-remove-dups-if-extras'.</span>"
  :type '(choice (const :tag "<span class="quote">None</span>" nil) function) :group 'Icicles-Completions-Display)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-unpropertize-completion-result-flag nil
  "<span class="quote">*Non-nil means strip text properties from the completion result.
Set this option to non-nil only if you need to ensure, for some other
library, that the string returned by `completing-read' and (starting
with Emacs 23) `read-file-name' has no text properties.</span>"
  :type 'boolean :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-update-input-hook nil
  "<span class="quote">*Functions run when minibuffer input is updated (typing or deleting).</span>"
  :type 'hook :group 'Icicles-Miscellaneous)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-use-~-for-home-dir-flag t <span class="linecomment">; Toggle with `M-~'.</span>
  "<span class="quote">*Non-nil means abbreviate your home directory using `~'.
You can toggle this option from the minibuffer at any time using
`M-~'.</span>"
  :type 'boolean :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-use-C-for-actions-flag t <span class="linecomment">; Toggle with `M-g'.</span>
  "<span class="quote">*Non-nil means use modifier `C-' (Control) for multi-command actions.
If nil, then you need no `C-' modifier for actions, and, instead, you
need a `C-' modifier for ordinary candidate cycling.

It is not strictly correct to speak in terms of the `C-' modifier -
that is only the default behavior.  The actual keys concerned are
those defined by these options:

 `icicle-apropos-cycle-next-action-keys'
 `icicle-apropos-cycle-previous-action-keys'
 `icicle-prefix-cycle-next-action-keys'
 `icicle-prefix-cycle-previous-action-keys'
 `icicle-modal-cycle-down-action-keys'
 `icicle-modal-cycle-up-action-keys'

You can toggle this option from the minibuffer at any time using
`M-g'.</span>"
  :type 'boolean :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-use-candidates-only-once-flag nil
  "<span class="quote">*Non-nil means remove each candidate from the set after using it.
When you use a multi-command and act on a candidate (for example, with
`C-RET'), the candidate is removed from those available if this is
non-nil.  If this is nil, then the candidate is not removed, so you
can act on it again.

You can customize this option if you prefer the non-nil behavior all
of the time.  However, most users will not want to do that.

If you write Emacs-Lisp code, you can bind this to non-nil during
completion in contexts where it makes little sense for users to act on
the same candidate more than once.  That way, users cannot choose it
again, and they are not distracted seeing it as a candidate.</span>"
  :type 'boolean :group 'Icicles-Matching)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-word-completion-keys '([(meta ?\ )])
  "<span class="quote">*Key sequences to use for minibuffer prefix word completion.
A list of values that each has the same form as a key-sequence
argument to `define-key'.  It is a list mainly in order to accommodate
different keyboards.

Because file names, in particular, can contain spaces, some people
prefer such a key sequence to be non-printable, such as `M-SPC'.  This
is the default value in Icicles.

But because the spacebar is such a convenient key to hit, other people
prefer to use `SPC' for word completion, and to insert a space some
other way.  The usual way to do that is via `C-q SPC', but command
`icicle-insert-a-space' is provided for convenience.  You can bind
this to `M-SPC', for instance, in `minibuffer-local-completion-map',
`minibuffer-local-completion-map', and
`minibuffer-local-must-match-map'.</span>"
  :type '(repeat sexp) :group 'Icicles-Key-Bindings)

<span class="linecomment">;;;###autoload</span>
(defcustom icicle-WYSIWYG-Completions-flag "<span class="quote">MMMM</span>"
  "<span class="quote">*Non-nil means show candidates in *Completions* using WYSIWYG.
This has an effect only for completion of faces and colors.

The particular non-nil value determines the appearance:
* If t, the candidate is shown with its text properties.
* If a string, the string is propertized and then appended to the
  candidate,  to serve as a color swatch.

Some commands might override a string value with different text.  This
is the case for `icicle-read-color', for instance: the swatch text is
always the color's RGB code.</span>"
  :type '(choice
          (string :tag "<span class="quote">Show candidate plus a WYSIWYG swatch with text...</span>"  :value "<span class="quote">MMMM</span>")
          (const  :tag "<span class="quote">Show candidate itself using WYSIWYG</span>"                t)
          (const  :tag "<span class="quote">Show candidate as is, with no text properties</span>"      nil))
  :group 'Icicles-Completions-Display)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-opt)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-opt.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icicles-opt.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-opt.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icicles-opt.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icicles-opt.el">Administration</a></span><span class="time"><br /> Last edited 2009-02-21 20:38 UTC by <a class="author" title="from c-24-5-128-33.hsd1.ca.comcast.net" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icicles-opt.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
