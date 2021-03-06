<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icicles-var.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-var.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icicles-var.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-var.el" />
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
      title="Changes for icicles-var.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-var.el" /><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icicles-var.el%22">icicles-var.el</a></h1></div><div class="wrapper"><div class="content browse"><p><a href="http://www.emacswiki.org/emacs/download/icicles-var.el">Download</a></p><pre class="code"><span class="linecomment">;;; icicles-var.el --- Internal variables for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-var.el</span>
<span class="linecomment">;; Description: Internal variables for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2009, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:23:26 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Mon Feb 23 16:25:54 2009 (-0800)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 869</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-var.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `apropos', `apropos-fn+var', `cl', `color-theme', `cus-face',</span>
<span class="linecomment">;;   `easymenu', `ffap', `ffap-', `hexrgb', `icicles-opt', `kmacro',</span>
<span class="linecomment">;;   `levenshtein', `thingatpt', `thingatpt+', `wid-edit', `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  internal variables (not to be modified by users.  See `icicles.el'</span>
<span class="linecomment">;;  for documentation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Internal variables defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-abs-file-candidates', `icicle-all-candidates-action-p',</span>
<span class="linecomment">;;    `icicle-all-candidates-list-action-fn',</span>
<span class="linecomment">;;    `icicle-all-candidates-list-alt-action-fn',</span>
<span class="linecomment">;;    `icicle-apply-nomsg', `icicle-apropos-complete-match-fn',</span>
<span class="linecomment">;;    `icicle-bookmark-history', `icicle-buffer-config-history',</span>
<span class="linecomment">;;    `icicle-candidate-action-fn', `icicle-candidate-alt-action-fn',</span>
<span class="linecomment">;;    `icicle-candidate-entry-fn', `icicle-candidate-help-fn',</span>
<span class="linecomment">;;    `icicle-candidate-nb', `icicle-candidate-properties-alist',</span>
<span class="linecomment">;;    `icicle-candidates-alist', `icicle-char-property-value-history',</span>
<span class="linecomment">;;    `icicle-cmd-calling-for-completion', `icicle-color-history',</span>
<span class="linecomment">;;    `icicle-color-theme-history', `icicle-commands-for-abbrev',</span>
<span class="linecomment">;;    `icicle-common-match-string',</span>
<span class="linecomment">;;    `icicle-comp-base-is-default-dir-p',</span>
<span class="linecomment">;;    `icicle-complete-input-overlay', `icicle-complete-keys-alist',</span>
<span class="linecomment">;;    `icicle-complete-on-demand-cmd', `icicle-completing-p',</span>
<span class="linecomment">;;    `icicle-completion-candidates',</span>
<span class="linecomment">;;    `icicle-completion-prompt-overlay',</span>
<span class="linecomment">;;    `icicle-completion-set-history', `icicle-confirm-exit-commands',</span>
<span class="linecomment">;;    `icicle-current-completion-candidate-overlay',</span>
<span class="linecomment">;;    `icicle-current-completion-mode', `icicle-current-input',</span>
<span class="linecomment">;;    `icicle-current-raw-input', `icicle-cycling-p',</span>
<span class="linecomment">;;    `icicle-default-directory',</span>
<span class="linecomment">;;    `icicle-default-thing-insertion-flipped-p',</span>
<span class="linecomment">;;    `icicle-delete-candidate-object', `icicle-dictionary-history',</span>
<span class="linecomment">;;    `icicle-dir-candidate-can-exit-p',</span>
<span class="linecomment">;;    `icicle-doc-last-initial-cand-set', `icicle-edit-update-p',</span>
<span class="linecomment">;;    `icicle-explore-final-choice',</span>
<span class="linecomment">;;    `icicle-explore-final-choice-full', `icicle-extra-candidates',</span>
<span class="linecomment">;;    `icicle-extra-candidates-dir-insert-p',</span>
<span class="linecomment">;;    `icicle-face-name-history', `icicle-fancy-candidates-p',</span>
<span class="linecomment">;;    `icicle-fancy-cands-internal-p', `icicle-font-name-history',</span>
<span class="linecomment">;;    `icicle-frame-alist', `icicle-frame-name-history',</span>
<span class="linecomment">;;    `icicle-function-name-history',</span>
<span class="linecomment">;;    `icicle-fundoc-last-initial-cand-set',</span>
<span class="linecomment">;;    `icicle-general-help-string', `icicle-ignored-extensions',</span>
<span class="linecomment">;;    `icicle-ignored-extensions-regexp',</span>
<span class="linecomment">;;    `icicle-incremental-completion-p',</span>
<span class="linecomment">;;    `icicle-Info-only-rest-of-book-p', `icicle-inhibit-sort-p',</span>
<span class="linecomment">;;    `icicle-inhibit-try-switch-buffer', `icicle-initial-value',</span>
<span class="linecomment">;;    `icicle-input-fail-pos', `icicle-insert-string-at-pt-end',</span>
<span class="linecomment">;;    `icicle-insert-string-at-pt-start', `icicle-kill-history',</span>
<span class="linecomment">;;    `icicle-kmacro-alist', `icicle-kmacro-history',</span>
<span class="linecomment">;;    `icicle-last-apropos-complete-match-fn',</span>
<span class="linecomment">;;    `icicle-last-completion-candidate',</span>
<span class="linecomment">;;    `icicle-last-completion-command', `icicle-last-input',</span>
<span class="linecomment">;;    `icicle-last-sort-function', `icicle-last-top-level-command',</span>
<span class="linecomment">;;    `icicle-last-transform-function', `icicle-list-use-nth-parts',</span>
<span class="linecomment">;;    `icicle-menu-map', `icicle-minor-mode-map-entry',</span>
<span class="linecomment">;;    `icicle-ms-windows-drive-hash', `icicle-must-match-regexp',</span>
<span class="linecomment">;;    `icicle-must-not-match-regexp', `icicle-must-pass-predicate',</span>
<span class="linecomment">;;    `icicle-nb-of-other-cycle-candidates',</span>
<span class="linecomment">;;    `icicle-next-apropos-complete-cycles-p',</span>
<span class="linecomment">;;    `icicle-next-prefix-complete-cycles-p',</span>
<span class="linecomment">;;    `icicle-object-named-types', `icicle-object-predicate-types',</span>
<span class="linecomment">;;    `icicle-old-read-file-name-fn',</span>
<span class="linecomment">;;    `icicle-plist-last-initial-cand-set',</span>
<span class="linecomment">;;    `icicle-pre-minibuffer-buffer', `icicle-post-command-hook',</span>
<span class="linecomment">;;    `icicle-pre-command-hook',</span>
<span class="linecomment">;;    `icicle-previous-raw-file-name-inputs',</span>
<span class="linecomment">;;    `icicle-previous-raw-non-file-name-inputs',</span>
<span class="linecomment">;;    `icicle-proxy-candidate-regexp', `icicle-proxy-candidates',</span>
<span class="linecomment">;;    `icicle-read-expression-map', `icicle-re-no-dot',</span>
<span class="linecomment">;;    `icicle-require-match-p', `icicle-respect-completion-styles-p',</span>
<span class="linecomment">;;    `icicle-reverse-sort-p', `icicle-saved-candidate-overlays',</span>
<span class="linecomment">;;    `icicle-saved-candidates-variables-obarray',</span>
<span class="linecomment">;;    `icicle-saved-completion-candidate',</span>
<span class="linecomment">;;    `icicle-saved-completion-candidates',</span>
<span class="linecomment">;;    `icicle-saved-completion-candidates-internal',</span>
<span class="linecomment">;;    `icicle-saved-ignored-extensions',</span>
<span class="linecomment">;;    `icicle-saved-kmacro-ring-max', `icicle-saved-proxy-candidates',</span>
<span class="linecomment">;;    `icicle-saved-regexp-search-ring-max',</span>
<span class="linecomment">;;    `icicle-saved-region-background',</span>
<span class="linecomment">;;    `icicle-saved-search-ring-max',</span>
<span class="linecomment">;;    `icicle-scroll-Completions-backward-p', `icicle-search-command',</span>
<span class="linecomment">;;    `icicle-search-context-level', `icicle-search-context-regexp',</span>
<span class="linecomment">;;    `icicle-search-current-overlay', `icicle-search-final-choice',</span>
<span class="linecomment">;;    `icicle-search-history', `icicle-search-in-context-fn',</span>
<span class="linecomment">;;    `icicle-searching-p', `icicle-search-level-overlays',</span>
<span class="linecomment">;;    `icicle-search-overlays', `icicle-search-refined-overlays',</span>
<span class="linecomment">;;    `icicle-search-replacement',</span>
<span class="linecomment">;;    `icicle-search-replacement-history',</span>
<span class="linecomment">;;    `icicle-shell-command-candidates',</span>
<span class="linecomment">;;    `icicle-successive-grab-count',</span>
<span class="linecomment">;;    `icicle-text-property-value-history',</span>
<span class="linecomment">;;    `icicle-thing-at-pt-fns-pointer',</span>
<span class="linecomment">;;    `icicle-universal-argument-map',</span>
<span class="linecomment">;;    `icicle-vardoc-last-initial-cand-set',</span>
<span class="linecomment">;;    `icicle-vardoc-last-initial-option-cand-set',</span>
<span class="linecomment">;;    `icicle-variable-name-history',</span>
<span class="linecomment">;;    `icicle-whole-candidate-as-text-prop-p',</span>
<span class="linecomment">;;    `lacarte-menu-items-alist'.</span>
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
<span class="linecomment">;;  (@&gt; "Internal variables (alphabetical)")</span>
 
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

(eval-when-compile                               <span class="linecomment">;; for Emacs &lt; 21: push</span>
 (when (&lt; emacs-major-version 21) (require 'cl)))<span class="linecomment">;; for Emacs &lt; 20: when, unless</span>

(require 'apropos-fn+var nil t) <span class="linecomment">;; (no error if not found): apropos-command,</span>
                                <span class="linecomment">;; apropos-function, apropos-option, apropos-variable</span>
(require 'icicles-opt) <span class="linecomment">;; icicle-sort-function</span>

<span class="linecomment">;;; Defvars to quiet byte-compiler:</span>
(defvar kmacro-ring-max)                <span class="linecomment">; Defined in `kmacro.el' in Emacs 22+.</span>
(defvar minibuffer-confirm-exit-commands) <span class="linecomment">; Defined in `minibuffer.el' in Emacs 23+.</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
 
<span class="linecomment">;;(@* "Internal variables (alphabetical)")</span>

<span class="linecomment">;;; Internal variables (alphabetical) --------------------------------</span>

(defvar lacarte-menu-items-alist nil)    <span class="linecomment">; Defined in `lacarte.el'.</span>

<span class="linecomment">;; These two are defined here so they won't raise an error in `font-lock-add-keywords'.</span>
(defvar font-lock-function-name-face 'font-lock-function-name-face <span class="linecomment">; In `font-lock.el'.</span>
  "<span class="quote">Face name to use for function names.</span>")

(defvar font-lock-keyword-face 'font-lock-keyword-face <span class="linecomment">; Defined in `font-lock.el'.</span>
  "<span class="quote">Face name to use for keywords.</span>")

(defvar icicle-abs-file-candidates nil
  "<span class="quote">Current list of absolute file-name candidates.</span>")

(defvar icicle-all-candidates-action-p nil
  "<span class="quote">Non-nil means that we are acting on all candidates.
That is, `icicle-all-candidates-action-1' is in progress.</span>")

(defvar icicle-all-candidates-list-alt-action-fn nil
  "<span class="quote">Alternative action function to apply to a list of matching completions.</span>")

(defvar icicle-all-candidates-list-action-fn nil
  "<span class="quote">Action function to apply to a list of all matching completions.</span>")

(defvar icicle-apply-nomsg nil
  "<span class="quote">Non-nil means `icicle-apply' does not show status of applying function.</span>")

(defvar icicle-apropos-complete-match-fn 'string-match
  "<span class="quote">Function to filter apropos completion candidates.
Takes as arguments an input string and a completion candidate, and
returns non-nil if the string is considered to match the candidate.

A value of nil instead of a function means completion candidates are
not filtered by the input, except possibly by a function-valued
`minibuffer-completion-table'.</span>")

(defvar icicle-bookmark-history nil "<span class="quote">History for bookmark names.</span>")

(defvar icicle-buffer-config-history nil "<span class="quote">History for buffer configuration names.</span>")

(defvar icicle-candidate-action-fn nil
  "<span class="quote">Action function to apply to current completion candidate.
For `icicle-all-candidates-action' to be able to report successes,
this should return nil for \"success\" and non-nil for \"failure\".</span>")

(defvar icicle-candidate-alt-action-fn nil
  "<span class="quote">Alternative action function to apply to current completion candidate.
For `icicle-all-candidates-alt-action' to be able to report successes,
this should return nil for \"success\" and non-nil for \"failure\".</span>")

(defvar icicle-candidate-entry-fn nil
  "<span class="quote">Function to apply to selected entries in `icicle-candidates-alist'.</span>")

(defvar icicle-candidate-help-fn nil
  "<span class="quote">Help function to be applied to current completion candidate.
If non-nil, it must be a function that accepts a completion candidate
  (a string or a symbol) as argument.
If nil, default help function `icicle-help-on-candidate' is used.</span>")

(defvar icicle-candidate-nb nil
  "<span class="quote">Current completion candidate number, or nil if not cycling candidates.
Numbering starts at zero.</span>")

(defvar icicle-candidate-properties-alist nil
  "<span class="quote">Alist of multi-completion indexes and associated text properties.
The text properties apply to candidates in *Completions*.  Each alist
entry has the form (NTH PROPERTIES) or (NTH PROPERTIES JOIN-TOO).

NTH is a whole-number index identifying the multi-completion part.

PROPERTIES is a list of text properties to apply to the part.

JOIN-TOO non-nil means to also apply PROPERTIES to the join string
that follows the part.

Example alist:

 ((3 (face 'underline))
  (2 (invisible t) t))

The first entry underlines the third multi-completion part.
The second entry makes both the second part and the join string that
follows it invisible.</span>")

(defvar icicle-candidates-alist nil
  "<span class="quote">Alist of candidate entries.
The car (key) of each entry is treated as a completion candidate.
The cdr is some other data to be used when the candidate is chosen.

This is reset to nil at the beginning of each top-level command.  It
is used only by commands that use completion without allowing sorting
of completion candidates.</span>")

(defvar icicle-char-property-value-history nil "<span class="quote">History for character property values.</span>")

(defvar icicle-cmd-calling-for-completion 'ignore
  "<span class="quote">Last command causing display of list of possible completions.</span>")

(defvar icicle-color-history nil "<span class="quote">History for color names.</span>")

(defvar icicle-color-theme-history nil "<span class="quote">History for color-theme names.</span>")

(defvar icicle-commands-for-abbrev nil
  "<span class="quote">List of commands that match the current abbreviation.</span>")

(defvar icicle-common-match-string nil
  "<span class="quote">Expanded common match among all completion candidates.
nil means no such common match is available.</span>")

(defvar icicle-comp-base-is-default-dir-p nil
  "<span class="quote">Non-nil means to use `default-directory' as the completion base.
This means use its length as `completion-base-size'.</span>")

(defvar icicle-complete-input-overlay nil
  "<span class="quote">Overlay used to highlight minibuffer input when it is complete.</span>")

(when (fboundp 'map-keymap)             <span class="linecomment">; Emacs 22+.</span>
  (defvar icicle-complete-keys-alist nil "<span class="quote">Alist of keys and their bindings.
Each alist element is of the form (NAME KEY . BINDING), where:
 NAME is a symbol naming the key and its binding, whose name has form:
   KEYNAME  =  BINDING-NAME
 KEY is the actual key sequence
 BINDING is the actual binding of KEY.</span>"))

(defvar icicle-complete-on-demand-cmd nil
  "<span class="quote">Command invoked by `icicle-complete-on-demand-keys'.
NOTE: If you bind this to non-nil, you will no doubt want to bind it
      to nil in the command that is invoked.</span>")

(defvar icicle-completing-p nil "<span class="quote">Cached value of function `icicle-completing-p'.</span>")

(defvar icicle-completion-candidates nil "<span class="quote">Current list of completion candidates.</span>")

(defvar icicle-completion-prompt-overlay nil
  "<span class="quote">Overlay used to highlight saved completion candidates.</span>")

(defvar icicle-completion-set-history nil "<span class="quote">History for completion-set names.</span>")

(defvar icicle-confirm-exit-commands
  (and (boundp 'minibuffer-confirm-exit-commands)
       (append '(icicle-prefix-complete icicle-prefix-complete-no-display
                 icicle-prefix-word-complete
                 icicle-apropos-complete icicle-apropos-complete-no-display
                 icicle-apropos-complete-and-narrow <span class="linecomment">; ????</span>
                 <span class="linecomment">;; icicle-apropos-complete-and-exit ; ????</span>
                 )
               minibuffer-confirm-exit-commands))
  "<span class="quote">Version of `minibuffer-confirm-exit-commands' for Icicle mode.
Effective starting with Emacs 23.</span>")

(defvar icicle-current-completion-candidate-overlay nil
  "<span class="quote">Overlay used to highlight current completion candidate.</span>")

(defvar icicle-current-completion-mode nil
  "<span class="quote">Symbol `prefix' or `apropos', specifying the current completion mode.</span>")

(defvar icicle-current-input "<span class="quote"></span>" "<span class="quote">Current minibuffer input.</span>")

(defvar icicle-current-raw-input "<span class="quote"></span>" "<span class="quote">Current minibuffer raw (unexpanded) input.
This can be different from `icicle-current-input' only when
`icicle-expand-input-to-common-match-flag' is non-nil.</span>")

(defvar icicle-cycling-p nil
  "<span class="quote">Non-nil means the user is currently cycling completion candidates.</span>")

(defvar icicle-default-directory default-directory
  "<span class="quote">Local copy of `default-directory'.
Set whenever minibuffer is entered or input is completed.</span>")

(defvar icicle-default-thing-insertion-flipped-p nil
  "<span class="quote">Non-nil means a previous `M-.' in this succession was used with `C-u'.
This means that the meaning of `icicle-default-thing-insertion' has
been reversed.</span>")

(defvar icicle-delete-candidate-object nil
  "<span class="quote">Defines deletion action for command `icicle-delete-candidate-object'.
The value can be a function or a symbol bound to an alist.

If the value is a function, then the function is called on the current
completion candidate (a string) to delete some corresponding object.

If the value is a symbol (variable) bound to an alist, then
`icicle-delete-current-candidate-object' is called to delete the
corresponding object from that alist.  If the variable is also a user
option, then the option is saved after the candidate is deleted.

Note that if the value is a variable and you use multi-completion
candidates during completion, then the alist value of the variable
must itself contain multi-completions.  Otherwise, no candidate will
be deleted, because `icicle-delete-current-candidate-object' deletes
the full candidate object.</span>")

(defvar icicle-dictionary-history nil "<span class="quote">History for dictionary entries.</span>")

(defvar icicle-dir-candidate-can-exit-p nil
  "<span class="quote">Non-nil means you can exit the minibuffer when you choose a directory.</span>")

(defvar icicle-doc-history () "<span class="quote">History for documentation entries.</span>")

(defvar icicle-doc-last-initial-cand-set ()
  "<span class="quote">Cache for initial set of completion candidates for `icicle-doc'.</span>")

(defvar icicle-edit-update-p nil
  "<span class="quote">Internal flag: non-nil when editing text in minibuffer.
More precisely, non-nil when updating the completions list inside
simple character-editing commands such as `icicle-self-insert' and
`icicle-delete-backward-char'.</span>")

(defvar icicle-explore-final-choice "<span class="quote"></span>"
  "<span class="quote">Final `icicle-explore' completion choice (a string).</span>")

(defvar icicle-explore-final-choice-full nil
  "<span class="quote">Full alist element that corresponds to `icicle-explore-final-choice'.
This is an element of `icicle-candidates-alist'.
The element's car is a completion-candidate string.</span>")

(defvar icicle-extra-candidates nil "<span class="quote">A list of extra completion candidates (strings).</span>")

(defvar icicle-extra-candidates-dir-insert-p t
  "<span class="quote">Non-nil means, for an extra candidate, insert a directory component.
Can be bound to nil to prevent adding a directory to non file-name
extra candidates during file-name completion.  An extra candidate is
one that is a member of `icicle-extra-candidates'.</span>")

(defvar icicle-face-name-history nil "<span class="quote">History for font names.</span>")

(defvar icicle-fancy-candidates-p nil
  "<span class="quote">Non-nil means we are completing using possibly fancy candidates.
That is, some candidates might have attached properties.

You can bind this in your code if you need to treat fancy candidates
and your code has no direct access to the `completing-read' PROMPT
string.  See section `Candidates with Text Properties' of the Icicles
doc.

If you set this to non-nil, instead of binding it, then Icicles will
always check whether each completion candidate might be fancy.  That
can be costly.</span>")

(defvar icicle-fancy-cands-internal-p nil
  "<span class="quote">Same as `icicle-fancy-candidates-p', but for internal use only.
Do not set or bind this.  This is bound only by `completing-read'.</span>")

(defvar icicle-font-name-history nil "<span class="quote">History for font names.</span>")

(defvar icicle-frame-alist nil "<span class="quote">Alist of frames, returned by `icicle-make-frame-alist'.</span>")

(defvar icicle-frame-name-history nil "<span class="quote">History for frame names.</span>")

(defvar icicle-function-name-history nil "<span class="quote">History for function names.
Each name is a symbol name or a lambda form, as a string.</span>")

(defvar icicle-fundoc-last-initial-cand-set ()
  "<span class="quote">Cache for initial set of completion candidates for `icicle-fundoc'.</span>")

(defvar icicle-general-help-string "<span class="quote">
 

Customize Icicles: `M-x icicle-customize-icicles-group'.
Summary of customizable options and faces (alphabetical order).

Some of the binary options can be toggled - their toggle keys are
noted in parentheses.

* `case-fold-search', `completion-ignore-case',
  (`C-u') `read-file-name-completion-ignore-case'
                                         - Case sensitivity? (`C-A')
* `completion-ignored-extensions'        - Ignored filenames (`C-.')
* `icicle-add-buffer-name-flag'          - Add candidate's buffer?
* `icicle-add-proxy-candidates-flag'     - Include proxies? (`C-M-_')
* `icicle-alternative-sort-function'     - Other sort (`M-,', `C-M-,')
* `icicle-top-level-key-bindings'        - Bind top-level commands
* `icicle-buffer-*'                      - `icicle-buffer' options
* `icicle-candidate-width-factor'        - Width %%, candidate columns
* `icicle-change-region-background-flag' - Change region color?
* `icicle-change-sort-order-completion-flag' - Control `C-,' behavior
* `icicle-color-themes'                  - For `icicle-color-theme'
* `icicle-complete-keys-self-insert-flag'- `S-TAB' for self-insert?
* `icicle-Completions-display-min-input-chars' - Remove *Completions*
                                           if fewer chars input
* `icicle-Completions-frame-at-right-flag'- *Completions* at right?
* `icicle-Completions-window-max-height'  - Max lines in *Completions*
* `icicle-cycle-into-subdirs-flag'       - Explore subdirectories?
* `icicle-cycling-respects-completion-mode' - Completion mode affects
                                           cycling mode?
* `icicle-default-thing-insertion'       - Control behavior of \
\\&lt;minibuffer-local-completion-map&gt;\\[icicle-insert-string-at-point]
* `icicle-default-value'                 - How to treat default value
* `icicle-expand-input-to-common-match-flag'- Expand input? (`C-;')
* `icicle-fuzzy-completion-flag'         - Fuzzy completion? (`C-(')
* `icicle-highlight-historical-candidates-flag'
                                         - Highlight past input?
* `icicle-highlight-input-initial-whitespace-flag'
                                         - Highlight input whitespace?
* `icicle-ignore-space-prefix-flag'      - See initial space? (`M-_')
* `icicle-incremental-completion-delay'  - Before update *Completions*
* `icicle-incremental-completion-flag'   - Icompletion? (`C-#')
* `icicle-incremental-completion-threshold'- # of candidates for delay
* `icicle-input-string'                  - String inserted by `C-='
* `icicle-inter-candidates-min-spaces'   - Min spaces among candidates
* `icicle-key-descriptions-use-&lt;&gt;-flag'  - Show key names with \"&lt;&gt;\"?
* `icicle-keymaps-for-key-completion'    - `S-TAB' = key-complete maps
* `icicle-kmacro-ring-max'               - Icicles `kmacro-ring-max'
* `icicle-list-end-string', `icicle-list-join-string'
                                         - Multi-completion join/end
* `icicle-list-nth-parts-join-string'    - Join split-candidate parts
* `icicle-mark-position-in-candidate'    - Mark position in cycling
* `icicle-minibuffer-setup-hook'         - Functions run after setup
* `icicle-modal-cycle-up-keys', `icicle-modal-cycle-down-keys'
                                         - Keys for modal cycling
* `icicle-next-apropos-match-function'   - Change match func (`M-(')
* `icicle-point-position-in-candidate'   - Cursor position in cycling
* `icicle-redefine-standard-commands-flag'- Redefine std commands?
* `icicle-regexp-quote-flag'             - Escape chars? (`C-`')
* `icicle-regexp-search-ring-max'        - `regexp-search-ring-max'
* `icicle-region-alist'                  - Alist of saved regions
* `icicle-region-auto-open-files-flag'   - Open saved-region files?
* `icicle-region-background'             - Background for region
* `icicle-region-alist'                  - List of regions
* `icicle-regions-name-length-max'       - # chars to name a region
* `icicle-require-match-flag'            - Override REQUIRE-MATCH?
* `icicle-saved-completion-sets'         - Completion sets for \
`\\[icicle-candidate-set-retrieve]'
* `icicle-search-cleanup-flag'           - Remove search highlighting?
                                           (`C-.')
* `icicle-search-context-match-predicate'- Search-context predicate
* `icicle-search-highlight-all-current-flag'- In each hit (`C-^')
* `icicle-search-highlight-context-levels-flag' -
                                           Highlight match subgroups?
* `icicle-search-highlight-threshold'    - # hits to highlight at once
* `icicle-search-hook'                   - Functions run by `C-c `'
* `icicle-search-replace-common-match-flag' - Replace ECM? (`M-;')
* `icicle-search-replace-literally-flag' - Replace text literally?
* `icicle-search-replace-whole-candidate-flag' - Replace input match
                                           or whole search hit?(`C-,')
* `icicle-search-ring-max'               - Icicles `search-ring-max'
* `icicle-search-whole-word-flag'        - Find whole words? (`M-q')
* `icicle-show-Completions-help-flag'    - Show *Completions* help?
* `icicle-show-Completions-initially-flag'- Show *Completions* first?
* `icicle-sort-function'                 - Sort candidates (`C-,')
* `icicle-sort-functions-alist'          - Functions for sorting
* `icicle-special-candidate-regexp'      - To highlight special cands
* `icicle-TAB-shows-candidates-flag'     - 1st `TAB' shows candidates?
* `icicle-test-for-remote-files-flag'    - Check remote files? (`C-^')
* `icicle-thing-at-point-functions'      - Functions to yank things
* `icicle-top-level-when-sole-completion-flag' -
                                           Exit if single completion?
* `icicle-touche-pas-aux-menus-flag'     - Add to standard menus?
* `icicle-transform-function'            - Remove duplicates (`C-$')
* `icicle-update-input-hook'             - Fns run when input changes
* `icicle-use-~-for-home-dir-flag'       - Use `~' for $HOME? (`M-~')
* `icicle-use-C-for-actions-flag'        - `C-' for actions? (`M-g')
* `icicle-use-candidates-only-once-flag' - Remove used candidate?
* `icicle-word-completion-keys'          - Keys for word completion
* `icicle-WYSIWYG-Completions-flag'      - WYSIWYG for *Completions*?
* `icicle-yank-function'                 - Yank function to use

Faces that highlight input in minibuffer.

* `icicle-complete-input'               - Input when it is complete
* `icicle-match-highlight-minibuffer'   - Matched part of input
* `icicle-whitespace-highlight'         - Initial whitespace in input

Faces that highlight candidates in buffer *Completions*.

* `icicle-common-match-highlight-Completions' - Max common substring
* `icicle-current-candidate-highlight'  - Highlight cycle candidate
* `icicle-historical-candidate'         - Highlight candidates used
* `icicle-match-highlight-Completions'  - Matched part of input

Faces that highlight for command `icicle-search'.

* `icicle-search-current-input'         - What input matches
* `icicle-search-main-regexp-current'   - Current match of 1st regexp
* `icicle-search-main-regexp-others'    - Other matches of 1st regexp
 

Some top-level Icicles commands (alphabetical order, with exceptions).

Some are bound in Icicle mode.  Bind the others to keys you like.
See recommended bindings in `icicles.el'.
Multi-commands are indicated by `+': They act any number of times.
You can tell a multi-command when you execute it by the fact that the
input prompt is prefixed by `+'.

+ `clear-option' (alias)               - Set binary option to nil
+ `icicle-add-buffer-candidate'        - To always-candidate buffer
+ `icicle-remove-buffer-candidate'     -   From same
  `icicle-add-buffer-config'           - To `icicle-buffer-configs'
+ `icicle-remove-buffer-config'        -   From same
  `icicle-add-region'                  - To `icicle-region-alist'
+ `icicle-remove-region'               -   From same
  `icicle-add/update-saved-completion-set' - To
                                        `icicle-saved-completion-sets'
+ `icicle-remove-saved-completion-set' -   From same
+ `icicle-apply'                       - Apply function to alist items
  `icicle-apropos'                     - `apropos', but shows matches
  `icicle-apropos-command'             - Enhanced `apropos-command'
  `icicle-apropos-variable'            - Enhanced `apropos-variable'
  `icicle-apropos-zippy'               - Show matching Zippy quotes
+ `icicle-bookmark'(`-other-window')   - Jump to bookmark
+ `icicle-buffer'(`-other-window')     - Switch to buffer (`C-x b')
+ `icicle-buffer-config'               - Pick `icicle-buffer' options
+ `icicle-buffer-list'                 - Choose a list of buffer names
  `icicle-change-alternative-sort-order' - Choose an alternative sort
  `icicle-change-sort-order'           - Choose a sort order
+ `icicle-clear-current-history'       - Clear current history entries
+ `icicle-clear-history'               - Clear entries from a history
+ `icicle-color-theme'                 - Change color theme
+ `icicle-comint-command'              - Reuse command (`C-c TAB')
+ `icicle-comint-search'               - Reuse command (`C-c `')
+ `icicle-command-abbrev'              - `M-x' + abbrevs (`C-x SPC')
+ `icicle-compilation-search'          - Show hits (`C-c `')
+ `icicle-complete-keys'               - Complete keys (`S-TAB')
  `icicle-complete-thesaurus-entry'    - Complete word (`C-c /')
+ `icicle-completing-yank'             - `yank' using completion
+ `icicle-customize-face'              - Multi-`customize-face'
  `icicle-customize-icicles-group'     - Customize options and faces
+ `icicle-delete-file'                 - Delete file/directory
+ `icicle-delete-windows'              - Delete windows (`C-u C-x 0')
+ `icicle-doc'                         - Show doc for fn, var, or face
  `icicle-doremi-candidate-width-factor' - +/- candidate column width
  `icicle-doremi-inter-candidates-min-spaces' - +/- candidate spacing
+ `icicle-execute-extended-command'    - Execute command - multi-`M-x'
+ `icicle-execute-named-keyboard-macro' - Execute named keyboard macro
+ `icicle-file'(`-other-window')       - Visit file/dir (`C-x C-f')
+ `icicle-find-file'(`-other-window')  -         same: relative only
+ `icicle-find-file-absolute'(`-other-window') - same: absolute only
+ `icicle-find-first-tag'(`-other-window') - Find source def (tag)
+ `icicle-font'                        - Change font of frame
+ `icicle-frame-bg'                    - Change background of frame
+ `icicle-frame-fg'                    - Change foreground of frame
+ `icicle-fundoc'                      - Show function description
+ `icicle-goto-global-marker'          - Go to a global marker
+ `icicle-goto-marker'                 - Go to a marker in this buffer
+ `icicle-imenu'                       - Navigate among Imenu entries
+ `icicle-Info-goto-node'              - Multi-cmd `Info-goto-node'
+ `icicle-Info-index'                  - Multi-command `Info-index'
+ `icicle-Info-menu'                   - Multi-command `Info-menu'
+ `icicle-insert-thesaurus-entry'      - Insert thesaurus entry
+ `icicle-kill-buffer'                 - Kill buffer (`C-x k')
+ `icicle-kmacro'                      - Call keyboard macro (`S-f4')
+ `icicle-locate-file'(`-other-window') - Visit file in a directory
  `icicle-minibuffer-help'             - Show Icicles minibuffer help
  `icy-mode' or `icicle-mode'          - Toggle Icicle mode
  `icicle-next-apropos-match-function' - Change match func (`M-(')
+ `icicle-occur'                       - Enhanced `occur' (`C-c '')
+ `icicle-other-window-or-frame'       - Other window/frame (`C-x o')
+ `icicle-plist'                       - Show symbols, property lists
+ `icicle-recent-file'(`-other-window') - Open recently used file
+ `icicle-reset-option-to-nil'         - Set binary option to nil
  `icicle-save-string-to-variable'     - Save text for use with \
`\\[icicle-insert-string-from-variable]'
+ `icicle-search'                      - Search (`C-c `')
+ `icicle-search-keywords'             - Search for keywords (`C-c ^')
+ `icicle-search-region'               - Search multiple regions
+ `icicle-find-tag'                    - Find definition (tag) (`M-.')
+ `icicle-search-text-property'        - Search for face... (`C-c \"')
+ `icicle-search-word'                 - Search for whole word
+ `icicle-select-frame'                - Select a frame by name
+ `icicle-select-region'               - Select a region
+ `icicle-select-window'               - Select window by buffer name
  `icicle-send-bug-report'             - Send Icicles bug report
+ `icicle-set-option-to-t'             - Set binary option to t
  `icicle-toggle-~-for-home-dir'       - Toggle using `~' for $HOME
  `icicle-toggle-alternative-sorting'  - Swap alternative sort
  `icicle-toggle-angle-brackets'       - Toggle angle brackets
  `icicle-toggle-case-sensitivity'     - Toggle case sensitivity
  `icicle-toggle-C-for-actions'        - Toggle using `C-' for actions
  `icicle-toggle-expand-to-common-match' - Toggle input ECM expansion
  `icicle-toggle-fuzzy-completion'     - Toggle fuzzy completion
  `icicle-toggle-highlight-all-current' - Toggle max search highlight
  `icicle-toggle-highlight-historical-candidates'
                                       - Toggle past-input highlight
  `icicle-toggle-ignored-extensions'   - Toggle ignored files
  `icicle-toggle-ignored-space-prefix' - Toggle ignoring space prefix
  `icicle-toggle-incremental-completion' - Toggle icompletion
+ `icicle-toggle-option'               - Toggle binary user option
  `icicle-toggle-proxy-candidates'     - Toggle proxy candidates
  `icicle-toggle-regexp-quote'         - Toggle regexp escaping
  `icicle-toggle-search-cleanup'       - Toggle highlight removal
  `icicle-toggle-search-replace-common-match' - Toggle ECM replacement
  `icicle-toggle-search-whole-word'    - Toggle whole-word searching
  `icicle-toggle-sorting'              - Toggle sorting
  `icicle-toggle-transforming'         - Toggle duplicate removal
  `icicle-toggle-WYSIWYG-Completions'  - Toggle WYSIWYG *Completions*
+ `icicle-vardoc'                      - Show variable description
+ `icicle-where-is'                    - `where-is' multi-command
  `icicle-yank-maybe-completing'       - `yank' + completion (`C-y')
+ `toggle' (alias)                     - Toggle binary user option
 

These are all of the top-level bindings in Icicle mode:

\\{icicle-mode-map}</span>"
  "<span class="quote">General help string included in `icicle-minibuffer-help'.</span>")

(defvar icicle-ignored-extensions completion-ignored-extensions
  "<span class="quote">Copy of `completion-ignored-extensions', serving as a control flag.
When `completion-ignored-extensions' changes, we remake
`icicle-ignored-extensions-regexp'.</span>")

(defvar icicle-ignored-extensions-regexp
  (concat "<span class="quote">\\(</span>" (mapconcat #'regexp-quote completion-ignored-extensions "<span class="quote">$\\|</span>")
          "<span class="quote">$\\)\\'</span>")
  "<span class="quote">Regular expression matching ignored file extensions.
If this is nil, then no file extensions are ignored.
The ignored file extensions come from `completion-ignored-extensions'.</span>")

(defvar icicle-incremental-completion-p nil
  "<span class="quote">Takes the place of `icicle-incremental-completion-flag' during input.
The program updates this to `always' from `t' after *Completions* has
been displayed.</span>")

(defvar icicle-Info-only-rest-of-book-p nil
  "<span class="quote">Non-nil means complete only Info nodes from the rest of the book.</span>")

(defvar icicle-inhibit-sort-p nil
  "<span class="quote">Non-nil means that users cannot sort completion candidates.
They also cannot remove duplicates.</span>")

(defvar icicle-inhibit-try-switch-buffer nil
  "<span class="quote">Non-nil means `icicle-try-switch-buffer' does not switch to `orig-buff'.</span>")

(defvar icicle-initial-value "<span class="quote"></span>"
  "<span class="quote">Initial value used in minibuffer completion.
Any function that reads from the minibuffer and accepts a default
value or initial value should, before reading, put that value in
`icicle-initial-value'.  For example, `completing-read' does that.

In addition, `completing-read' and `read-file-name' will respect this
value, using it as the initial value if none is provided explicitly.
This means that you can bind `icicle-initial-value' around an
expression that calls `completing-read' or `read-file-name', and the
bound value will be used as the initial value.</span>")

(defvar icicle-input-fail-pos nil
  "<span class="quote">Position in minibuffer of start of completion match failure.
Nil means no match failure is known.</span>")

(defvar icicle-insert-string-at-pt-end nil
  "<span class="quote">Position of end of text `icicle-insert-string-at-point' inserted.</span>")

(defvar icicle-insert-string-at-pt-start nil
  "<span class="quote">Position of start of text `icicle-insert-string-at-point' inserted.</span>")

(defvar icicle-kill-history nil "<span class="quote">History of kill-ring entries.</span>")

(when (boundp 'kmacro-ring)             <span class="linecomment">; Emacs 22+</span>
  (defvar icicle-kmacro-alist nil
    "<span class="quote">Alist with elements (CANDIDATE-NAME . RING-ITEM).
CANDIDATE-NAME is 1, 2, 3....

RING-ITEM is an item in `kmacro-ring' or `(kmacro-ring-head)'.</span>")
  (defvar icicle-kmacro-history nil "<span class="quote">History for keyboard-macro names.</span>"))

(defvar icicle-last-apropos-complete-match-fn 'string-match
  "<span class="quote">Last value of `icicle-apropos-complete-match-fn'.</span>")

(defvar icicle-last-completion-candidate "<span class="quote"></span>"
  "<span class="quote">Last completion candidate used in minibuffer completion.</span>")

(defvar icicle-last-completion-command nil "<span class="quote">Last completion command used.</span>")

(defvar icicle-last-input "<span class="quote"></span>" "<span class="quote">Last minibuffer input typed (not from cycling).</span>")

(defvar icicle-last-sort-function (or icicle-sort-function 'icicle-case-string-less-p)
  "<span class="quote">Local copy of `icicle-sort-function', so we can restore it.</span>")

(defvar icicle-last-top-level-command nil "<span class="quote">Last top-level command used.</span>")

(defvar icicle-last-transform-function (or icicle-transform-function
                                           'icicle-remove-duplicates)
  "<span class="quote">Local copy of `icicle-transform-function', so we can restore it.</span>")

(defvar icicle-list-use-nth-parts nil
  "<span class="quote">List of indexes of multi-completion pieces to use.
This is not an internal variable.  You can bind this in your own Lisp
code to affect completion behavior.

An empty list means use the entire multi-completion.  Otherwise,
concatenate, in order, the Nth parts of the multi-completion, where N
is each of the (one-based) indexes, in turn.  Any index larger than
the actual number of parts in the multi-completion means use the last
part.

For example: If the value is (1), then use only the first part of the
multi-completion as the completion candidate. If the value is (2 1),
then use as candidate the second part followed by the first part, the
two parts being joined by option `icicle-list-nth-parts-join-string'.
If the value is (1 99) and the multi-completion has fewer than 99
parts, then use the first and last parts, joined by
`icicle-list-nth-parts-join-string'.  If the value is (2 1 2), then
use the second part, first part, and second part again - you can use a
given part any number of times.</span>")

(defvar icicle-menu-map nil "<span class="quote">Icicles menu-bar menu keymap.</span>")

(defvar icicle-minor-mode-map-entry nil "<span class="quote">Icicles mode entry in `minor-mode-map-alist'.</span>")

(defvar icicle-ms-windows-drive-hash (and (fboundp 'make-hash-table)
                                          (make-hash-table :test 'equal))
  "<span class="quote">Hash table for caching result of MS Windows `NET USE' system calls.
For Emacs 20 and 21, this is not used unless you load library `cl.el'
at runtime.</span>")

(defvar icicle-must-match-regexp nil
  "<span class="quote">A regexp that completion candidates must match, or nil.
If nil, then this does nothing.  If a regexp (string), then show only
candidates whose display form matches it (and matches the user input).
The display form is the string shown in `*Completions*'.

Note: This is similar to the standard variable
`completion-regexp-list', except:
* `completion-regexp-list' is a list of regexps, not just one.
* `icicle-must-match-regexp' is used after filtering using option
  `icicle-transform-function'.

See also `icicle-must-not-match-regexp'.</span>")

(defvar icicle-must-not-match-regexp nil
  "<span class="quote">A regexp that completion candidates must not match, or nil.
If nil, then this does nothing.  If a regexp (string), then show only
candidates whose display form does not match it.
The display form is the string shown in `*Completions*'.
See also `icicle-must-match-regexp'.</span>")

(defvar icicle-must-pass-predicate nil
  "<span class="quote">A predicate that completion candidates must satisfy, or nil.
If nil, then this does nothing.  Otherwise, this is a function of one
argument, a candidate, and only candidates whose display form
satisfies the predicate are displayed.  The display form is the string
shown in `*Completions*'.</span>")

(defvar icicle-nb-of-other-cycle-candidates 0
  "<span class="quote">Number of other candidates available for cycling.
This is for use by other libraries, in particular, `icomplete+.el'.</span>")

(defvar icicle-next-apropos-complete-cycles-p nil
  "<span class="quote">Whether the next apropos-completion command should cycle.</span>")

(defvar icicle-next-prefix-complete-cycles-p nil
  "<span class="quote">Whether the next prefix-completion command should cycle.</span>")

(defvar icicle-object-named-types '("<span class="quote">buffer</span>" "<span class="quote">command</span>" "<span class="quote">face</span>" "<span class="quote">file</span>" "<span class="quote">frame</span>" "<span class="quote">function</span>"
                                    "<span class="quote">option</span>" "<span class="quote">process</span>" "<span class="quote">symbol</span>" "<span class="quote">variable</span>" "<span class="quote">window</span>")
  "<span class="quote">Type names whose objects can easily be associated with names.</span>")

(defvar icicle-object-predicate-types
  (append '("<span class="quote">atom</span>" "<span class="quote">arrayp</span>" "<span class="quote">bool-vector-p</span>" "<span class="quote">bufferp</span>" "<span class="quote">byte-code-function-p</span>"
            "<span class="quote">case-table-p</span>" "<span class="quote">char-or-string-p</span>" "<span class="quote">char-table-p</span>" "<span class="quote">commandp</span>" "<span class="quote">consp</span>" "<span class="quote">facep</span>"
            "<span class="quote">floatp</span>" "<span class="quote">frame-configuration-p</span>" "<span class="quote">frame-live-p</span>" "<span class="quote">framep</span>" "<span class="quote">functionp</span>"
            "<span class="quote">hash-table-p</span>" "<span class="quote">integer-or-marker-p</span>" "<span class="quote">integerp</span>" "<span class="quote">keymapp</span>" "<span class="quote">keywordp</span>" "<span class="quote">listp</span>"
            "<span class="quote">markerp</span>" "<span class="quote">wholenump</span>" "<span class="quote">nlistp</span>" "<span class="quote">numberp</span>" "<span class="quote">number-or-marker-p</span>" "<span class="quote">overlayp</span>"
            "<span class="quote">processp</span>" "<span class="quote">sequencep</span>" "<span class="quote">stringp</span>" "<span class="quote">subrp</span>" "<span class="quote">symbolp</span>" "<span class="quote">syntax-table-p</span>"
            "<span class="quote">user-variable-p</span>" "<span class="quote">vectorp</span>" "<span class="quote">window-configuration-p</span>" "<span class="quote">window-live-p</span>"
            "<span class="quote">windowp</span>")
          <span class="linecomment">;; These are conditional because they are not defined for some Emacs versions.</span>
          (and (fboundp 'display-table-p) '("<span class="quote">display-table-p</span>"))
          (and (fboundp 'string-or-null-p) '("<span class="quote">string-or-null-p</span>"))
          (and (fboundp 'booleanp) '("<span class="quote">booleanp</span>")))
  "<span class="quote">Type names that are predicate names.</span>")

(defvar icicle-plist-last-initial-cand-set ()
  "<span class="quote">Cache for initial set of completion candidates for `icicle-plist'.</span>")

(defvar icicle-post-command-hook nil
  "<span class="quote">Functions added to `post-command-hook' when in Icicle mode.
Use command `icy-mode' (aka `icicle-mode') to set this up properly.</span>")

(defvar icicle-pre-command-hook nil
  "<span class="quote">Functions added to `pre-command-hook' when in Icicle mode.
Use command `icy-mode' (aka `icicle-mode') to set this up properly.</span>")

(defvar icicle-old-read-file-name-fn (and (not (boundp 'read-file-name-function)) <span class="linecomment">; Em 22+</span>
                                          'orig-read-file-name) <span class="linecomment">; Emacs 20, 21</span>
  "<span class="quote">Value of `read-file-name-function' outside of Icicle mode.
For versions of Emacs before 22, this is `read-file-name'.</span>")

(defvar icicle-pre-minibuffer-buffer nil
  "<span class="quote">Buffer that was current before the minibuffer became active.</span>")

(defvar icicle-previous-raw-file-name-inputs nil
  "<span class="quote">Previous inputs user has typed during file-name completion.
These are inputs typed but not necessarily entered with `RET'.</span>")

(defvar icicle-previous-raw-non-file-name-inputs nil
  "<span class="quote">Previous inputs user has typed during non-file-name completion.
These are inputs typed but not necessarily entered with `RET'.</span>")

(defvar icicle-proxy-candidate-regexp nil
  "<span class="quote">Regexp to match proxy candidates, or nil to do nothing.
The candidates are highlighted in buffer *Completions* using face
`icicle-proxy-candidate'.</span>")

(defvar icicle-proxy-candidates nil "<span class="quote">List of proxy completion candidates (strings).</span>")

(defvar icicle-read-expression-map nil
  "<span class="quote">Icicle mode version of `read-expression-map'.
Several Emacs-Lisp mode key bindings are used.</span>")
(unless icicle-read-expression-map
  (let ((map  (make-sparse-keymap)))
    (define-key map "<span class="quote">\M-\t</span>" 'lisp-complete-symbol)
    (define-key map "<span class="quote">\t</span>" 'lisp-indent-line)
    (define-key map "<span class="quote">\e\C-q</span>" 'indent-sexp)
    (define-key map "<span class="quote">\e\t</span>" 'lisp-complete-symbol)
    (define-key map "<span class="quote">\e\C-x</span>" 'eval-defun)
    (define-key map "<span class="quote">\e\C-q</span>" 'indent-pp-sexp)
    <span class="linecomment">;;(define-key map "\177" 'backward-delete-char-untabify)</span>
    (set-keymap-parent map minibuffer-local-map)
    (setq icicle-read-expression-map  map)))

(defvar icicle-re-no-dot "<span class="quote">^\\([^.]\\|\\.\\([^.]\\|\\..\\)\\).*</span>"
  "<span class="quote">Regexp that matches anything except `.' and `..'.</span>")

(defvar icicle-require-match-p nil
  "<span class="quote">Current REQUIRE-MATCH arg to `completing-read' or `read-file-name'.
Starting with Emacs 23, this is no longer enough to tell whether a
match is required - use function `icicle-require-match-p' instead.</span>")

(defvar icicle-respect-completion-styles-p nil
  "<span class="quote">Non-nil means Icicles respects `completion-styles'.
Otherwise, only `basic' style (more or less) is used.
This variable is used starting with Emacs 23, which introduced
`completion-styles'.</span>")

(defvar icicle-reverse-sort-p nil
  "<span class="quote">Non-nil means that candidates are being sorted in the reverse order.</span>")

(defvar icicle-saved-candidate-overlays nil
  "<span class="quote">Overlays used to highlight saved completion candidates.</span>")

(defvar icicle-saved-candidates-variables-obarray (make-vector 100 0)
  "<span class="quote">Obarray of variables you have saved sets of completion candidates in.
Used for completion in `icicle-candidate-set-retrieve-from-variable'.</span>")

(defvar icicle-saved-completion-candidate nil
  "<span class="quote">Completion candidate to be restored after recursive `completing-read'.</span>")

(defvar icicle-saved-completion-candidates nil
  "<span class="quote">Completion candidates saved using `icicle-candidate-set-save'.</span>")

(defvar icicle-saved-completion-candidates-internal nil
  "<span class="quote">Completion candidates saved temporarily by program.</span>")

(defvar icicle-saved-ignored-extensions nil
  "<span class="quote">Local copy of `icicle-ignored-extensions', so we can restore it.</span>")

(when (boundp 'kmacro-ring)             <span class="linecomment">; Emacs 22+</span>
  (defvar icicle-saved-kmacro-ring-max kmacro-ring-max
    "<span class="quote">Saved value of `kmacro-ring-max', so it can be restored.</span>"))

(defvar icicle-saved-regexp-search-ring-max regexp-search-ring-max
  "<span class="quote">Saved value of `search-ring-max', so it can be restored.</span>")

(defvar icicle-saved-proxy-candidates nil "<span class="quote">Saved value of `icicle-proxy-candidates'.</span>")

(defvar icicle-saved-region-background nil
  "<span class="quote">Background of `region' face.  Saved so it can be restored.</span>")

(defvar icicle-saved-search-ring-max search-ring-max
  "<span class="quote">Saved value of `search-ring-max', so it can be restored.</span>")

(defvar icicle-scroll-Completions-backward-p nil
  "<span class="quote">Non-nil means repeated `TAB' or `S-TAB' scrolls *Completions* backward.</span>")

(defvar icicle-search-command 'icicle-search
  "<span class="quote">Command to use for Icicles searches.
You can set a buffer-local value of this variable, to use a specific
search command in a particular mode.</span>")

(defvar icicle-search-context-level 0
  "<span class="quote">Match level for `icicle-search' context regexp.
0 means use whatever matches the whole context regexp as the search
context.  1 means use whatever matches the first subgroup of the
regexp as the search context, and so on.</span>")

(defvar icicle-search-context-regexp "<span class="quote"></span>"
  "<span class="quote">Current search-context regexp used in `icicle-search'.</span>")

(defvar icicle-search-current-overlay nil
  "<span class="quote">Overlay used to highlight current match of `icicle-search' regexp arg.</span>")

(defvar icicle-search-final-choice nil
  "<span class="quote">Final user input from `icicle-search'.
This might or might not be one of the possible search candidates.</span>")

(defvar icicle-search-history nil "<span class="quote">History for `icicle-search' final choices.</span>")

(defvar icicle-search-in-context-fn 'icicle-search-in-context-default-fn
  "<span class="quote">Function used by `icicle-search-action' to act on search context.
The default value is `icicle-search-in-context-default-fn'.
The function must take two arguments:
 - A full search candidate object, which is a cons of the candidate
   name and its source-file marker.
 - A replacement string, or nil, if no replacement is to be made.

When the function is called, the region is narrowed to the current
search context.</span>")

(defvar icicle-searching-p nil "<span class="quote">Non-nil means an Icicles search command is in progress.</span>")

(defvar icicle-search-level-overlays nil
  "<span class="quote">Overlays used to highlight context levels other than the top level.</span>")

(defvar icicle-search-overlays nil
  "<span class="quote">Overlays used to highlight match of `icicle-search' regexp argument.</span>")

(defvar icicle-search-refined-overlays nil
  "<span class="quote">Overlay(s) used to highlight match of current input for `icicle-search'.
If `icicle-search-highlight-threshold' is less than one, then this is
a single overlay (or nil).  Otherwise, this is a list of overlays.</span>")

(defvar icicle-search-replacement nil
  "<span class="quote">Replacement string for use during `icicle-search'.</span>")

(defvar icicle-search-replacement-history nil
  "<span class="quote">History variable for reading replacement string for `icicle-search'.</span>")

(defvar icicle-shell-command-candidates () "<span class="quote">Cache for shell command candidates.</span>")

(defvar icicle-successive-grab-count 0
  "<span class="quote">Number of text things to be grabbed by next `\\&lt;minibuffer-local-map&gt;\
\\[icicle-insert-string-at-point]'.</span>")

(defvar icicle-text-property-value-history nil
  "<span class="quote">History variable for reading text properties.</span>")

<span class="linecomment">;; (defvar icicle-text-properties-alist</span>
<span class="linecomment">;;   '(;; Properties listed in Elisp manual node `Special Properties':</span>
<span class="linecomment">;;     ("category") ("face") ("font-lock-face") ("mouse-face") ("fontified") ("display")</span>
<span class="linecomment">;;     ("help-echo") ("keymap") ("local-map") ("syntax-table") ("read-only") ("invisible")</span>
<span class="linecomment">;;     ("intangible") ("field") ("cursor") ("pointer") ("line-spacing") ("line-height")</span>
<span class="linecomment">;;     ("modification-hooks") ("insert-in-front-hooks") ("insert-behind-hooks")</span>
<span class="linecomment">;;     ("point-entered") ("point-left")</span>
<span class="linecomment">;;     ;; Properties listed in Elisp manual node `Format Properties':</span>
<span class="linecomment">;;     ("hard") ("right-margin") ("left-margin") ("justification")</span>
<span class="linecomment">;;     ;; Properties listed in Elisp manual node `Links and Mouse-1':</span>
<span class="linecomment">;;     ("follow-link")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp':</span>
<span class="linecomment">;;     ("allout-was-hidden") ("ansi-color") ("buffer") ("buffer-name") ("column")</span>
<span class="linecomment">;;     ("button") ("skip") ("literal") ("front-sticky") ("rear-nonsticky") ("composition")</span>
<span class="linecomment">;;     ("untranslated-utf-8") ("yank-handler") ("dired-filename") ("read-face-name")</span>
<span class="linecomment">;;     ("directory") ("message") ("debug") ("font-lock-multiline") ("unknown")</span>
<span class="linecomment">;;     ("insert-in-front-hooks") ("kbd-help") ("hilit-chg") ("ibuffer-filter-group-name")</span>
<span class="linecomment">;;     ("ibuffer-properties") ("ibuffer-title") ("ibuffer-summary")</span>
<span class="linecomment">;;     ("ibuffer-title-header") ("inhibit-line-move-field-capture") ("image-counter")</span>
<span class="linecomment">;;     ("header-line") ("cvs-goal-column") ("occur-target") ("occur-match")</span>
<span class="linecomment">;;     ("foreign-selection") ("before-string") ("after-string") ("ses")</span>
<span class="linecomment">;;     ("smerge-force-highlighting") ("speedbar-function") ("speedbar-token")</span>
<span class="linecomment">;;     ("speedbar-text") ("type") ("stroke-glyph") ("data") ("thumb-image-file")</span>
<span class="linecomment">;;     ("original-file-name") ("associated-dired-buffer") ("tags") ("comment")</span>
<span class="linecomment">;;     ("tumme-thumbnail") ("tutorial-remark") ("vc-cvs-annotate-time") ("end-name")</span>
<span class="linecomment">;;     ("old-name") ("end-link") ("old-link") ("end-perm") ("old-perm") ("perm-changed")</span>
<span class="linecomment">;;     ("widget-doc") ("secret") ("real-field")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/emacs-lisp':</span>
<span class="linecomment">;;     ("elp-symname") ("printed-value") ("duplicable")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/emulation':</span>
<span class="linecomment">;;     ("cursor")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/erc':</span>
<span class="linecomment">;;     ("erc-callback") ("erc-data") ("erc-identified") ("erc-parsed") ("erc-parsed")</span>
<span class="linecomment">;;     ("timestamp") ("erc-prompt")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/eshell':</span>
<span class="linecomment">;;     ("comment") ("arg-begin") ("arg-end") ("escaped") ("history") ("number")</span>
<span class="linecomment">;;     ("test-func")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/gnus':</span>
<span class="linecomment">;;     ("earcon-data") ("earcon-callback") ("gnus-category") ("gnus-part")</span>
<span class="linecomment">;;     ("article-type") ("gnus-decoration") ("dummy-invisible") ("original-date")</span>
<span class="linecomment">;;     ("gnus-data") ("gnus-callback") ("gnus-prev") ("gnus-next") ("gnus-mime-details")</span>
<span class="linecomment">;;     ("gnus-line-format") ("gnus-backlog") ("gnus-image-category")</span>
<span class="linecomment">;;     ("gnus-image-text-deletable") ("gnus-group") ("gnus-level") ("gnus-indentation")</span>
<span class="linecomment">;;     ("gnus-unread") ("gnus-number") ("articles") ("gnus-server") ("gnus-named-server")</span>
<span class="linecomment">;;     ("gnus-intangible") ("gnus-topic") ("gnus-topic-level") ("gnus-topic-unread")</span>
<span class="linecomment">;;     ("gnus-topic-visible") ("gnus-active") ("gnus-position") ("gnus-time")</span>
<span class="linecomment">;;     ("gnus-face") ("gnus-undeletable") ("message-rank") ("egg-end") ("egg-lang")</span>
<span class="linecomment">;;     ("egg-start") ("message-hidden") ("message-deletable") ("buffer") ("from") ("mm")</span>
<span class="linecomment">;;     ("script-name")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/international':</span>
<span class="linecomment">;;     ("kkc-conversion-index") ("advice") ("untranslated-utf-8") ("composition")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/mail':</span>
<span class="linecomment">;;     ("footnote-number") ("rmail-fontified")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/mh-e':</span>
<span class="linecomment">;;     ("mh-data") ("mh-mime-inserted") ("mh-part") ("mh-region") ("mh-callback")</span>
<span class="linecomment">;;     ("mh-button-pressed") ("mh-line-format") ("mh-folder") ("mh-children-p")</span>
<span class="linecomment">;;     ("mh-expanded") ("mh-level") ("mh-count")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/net':</span>
<span class="linecomment">;;     ("feed") ("w3m-image") ("nt-age") ("nt-title") ("nt-guid") ("nt-desc")</span>
<span class="linecomment">;;     ("org-invisible") ("nt-link") ("nt-type") ("nt-face")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/progmodes':</span>
<span class="linecomment">;;     ("c-type") ("c-awk-NL-prop") ("c-is-sws") ("c-decl-arg-start") ("c-decl-end")</span>
<span class="linecomment">;;     ("c-decl-id-start") ("c-decl-type-start") ("message") ("REx-interpolated")</span>
<span class="linecomment">;;     ("in-pod") ("here-doc-group") ("syntax-type") ("indentable") ("REx-part2")</span>
<span class="linecomment">;;     ("first-format-line") ("attrib-group") ("cperl-postpone") ("cpp-data")</span>
<span class="linecomment">;;     ("cpp-callback") ("token") ("ebrowse-tree") ("ebrowse-member") ("ebrowse-what")</span>
<span class="linecomment">;;     ("gdb-enabled") ("gdb-bptno") ("gdb-max-frames") ("link") ("fetch") ("begin-glyph")</span>
<span class="linecomment">;;     ("begin-glyph-layout") ("idlwave-class") ("data") ("source") ("keyword")</span>
<span class="linecomment">;;     ("find-args")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/term':</span>
<span class="linecomment">;;     ("mac-ts-active-input-string")</span>
<span class="linecomment">;;     ;; Others in Emacs-Lisp libraries in directory `lisp/textmodes':</span>
<span class="linecomment">;;     ("fill-space") ("priority") ("test") ("end-glyph") ("begin-glyph") ("org-cwidth")</span>
<span class="linecomment">;;     ("org-dwidth") ("org-dwidth-n") ("org-linked-text") (":org-clock-minutes")</span>
<span class="linecomment">;;     ("org-protected") ("org-date-line") ("org-today") ("day") ("org-agenda-type")</span>
<span class="linecomment">;;     ("time-of-day") ("org-not-done-regexp") ("prefix-length") ("tags") ("org-marker")</span>
<span class="linecomment">;;     ("org-agenda-diary-link") ("org-hd-marker") ("dotime") ("org-category")</span>
<span class="linecomment">;;     ("undone-face") ("done-face") ("xr-alist") ("table-cell") ("text-clones")</span>
<span class="linecomment">;;     ;; Others in my own libraries:</span>
<span class="linecomment">;;     ("font-lock-ignore") ("highlight") ("back-link") ("forward-link"))</span>
<span class="linecomment">;;   "Alist of text properties known to Emacs.</span>
<span class="linecomment">;; Each element is of form (PROP), where PROP is the name of a text</span>
<span class="linecomment">;; property (a string).")</span>

(defvar icicle-thing-at-pt-fns-pointer 0
  "<span class="quote">Current index into the car of `icicle-thing-at-point-functions'.
This points to the current function in the list.</span>")

(defvar icicle-universal-argument-map
  (let ((map  (make-sparse-keymap)))
    (define-key map [t] 'icicle-universal-argument-other-key)
    (define-key map (vector meta-prefix-char t) 'icicle-universal-argument-other-key)
    (define-key map [switch-frame] nil)
    (define-key map [?\C-u] 'icicle-universal-argument-more)
    (define-key map [?-] 'icicle-universal-argument-minus)
    (define-key map [?0] 'icicle-digit-argument)
    (define-key map [?1] 'icicle-digit-argument)
    (define-key map [?2] 'icicle-digit-argument)
    (define-key map [?3] 'icicle-digit-argument)
    (define-key map [?4] 'icicle-digit-argument)
    (define-key map [?5] 'icicle-digit-argument)
    (define-key map [?6] 'icicle-digit-argument)
    (define-key map [?7] 'icicle-digit-argument)
    (define-key map [?8] 'icicle-digit-argument)
    (define-key map [?9] 'icicle-digit-argument)
    (define-key map [kp-0] 'icicle-digit-argument)
    (define-key map [kp-1] 'icicle-digit-argument)
    (define-key map [kp-2] 'icicle-digit-argument)
    (define-key map [kp-3] 'icicle-digit-argument)
    (define-key map [kp-4] 'icicle-digit-argument)
    (define-key map [kp-5] 'icicle-digit-argument)
    (define-key map [kp-6] 'icicle-digit-argument)
    (define-key map [kp-7] 'icicle-digit-argument)
    (define-key map [kp-8] 'icicle-digit-argument)
    (define-key map [kp-9] 'icicle-digit-argument)
    (define-key map [kp-subtract] 'icicle-universal-argument-minus)
    map)
  "<span class="quote">Keymap used while processing `C-u' during Icicles completion.</span>")

(defvar icicle-vardoc-last-initial-cand-set ()
  "<span class="quote">Cache for initial set of completion candidates for `icicle-vardoc'.</span>")

(defvar icicle-vardoc-last-initial-option-cand-set ()
  "<span class="quote">Cache for initial option completion candidates for `icicle-vardoc'.</span>")

(defvar icicle-whole-candidate-as-text-prop-p nil
  "<span class="quote">Non-nil means string candidate has candidate data as text property.
If non-nil, then the value of text property `icicle-whole-candidate'
for a string completion candidate (e.g. what is displayed) is the cdr
of the full completion-candidate alist element.  The car of that
element is the string.</span>")

(defvar icicle-variable-name-history nil "<span class="quote">History for variable names.</span>")

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-var)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-var.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icicles-var.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-var.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icicles-var.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icicles-var.el">Administration</a></span><span class="time"><br /> Last edited 2009-02-24 00:39 UTC by <a class="author" title="from inet-nc01-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icicles-var.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
