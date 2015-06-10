<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icicles-fn.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-fn.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icicles-fn.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-fn.el" />
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
      title="Changes for icicles-fn.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-fn.el" /><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icicles-fn.el%22">icicles-fn.el</a></h1></div><div class="wrapper"><div class="content browse"><p><a href="http://www.emacswiki.org/emacs/download/icicles-fn.el">Download</a></p><pre class="code"><span class="linecomment">;;; icicles-fn.el --- Non-interactive functions for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-fn.el</span>
<span class="linecomment">;; Description: Non-interactive functions for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2009, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:25:53 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Sat Feb 28 11:39:20 2009 (-0800)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 9894</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/icicles-fn.el</span>
<span class="linecomment">;; Keywords: internal, extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs 20.x, GNU Emacs 21.x, GNU Emacs 22.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `apropos', `apropos-fn+var', `cl', `color-theme', `cus-face',</span>
<span class="linecomment">;;   `easymenu', `ffap', `ffap-', `hexrgb', `icicles-opt',</span>
<span class="linecomment">;;   `icicles-var', `kmacro', `levenshtein', `thingatpt',</span>
<span class="linecomment">;;   `thingatpt+', `wid-edit', `wid-edit+', `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  non-interactive functions.  See `icicles.el' for documentation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `assq-delete-all', `icicle-2nd-part-string-less-p',</span>
<span class="linecomment">;;    `icicle-abbreviate-or-expand-file-name',</span>
<span class="linecomment">;;    `icicle-any-candidates-p', `icicle-apropos-any-candidates-p',</span>
<span class="linecomment">;;    `icicle-apropos-any-file-name-candidates-p',</span>
<span class="linecomment">;;    `icicle-apropos-candidates', `icicle-assoc-delete-all',</span>
<span class="linecomment">;;    `icicle-barf-if-outside-Completions',</span>
<span class="linecomment">;;    `icicle-barf-if-outside-Completions-and-minibuffer',</span>
<span class="linecomment">;;    `icicle-barf-if-outside-minibuffer',</span>
<span class="linecomment">;;    `icicle-call-then-update-Completions', `icicle-candidate-set-1',</span>
<span class="linecomment">;;    `icicle-case-insensitive-string-less-p',</span>
<span class="linecomment">;;    `icicle-case-string-less-p', `icicle-cdr-lessp',</span>
<span class="linecomment">;;    `icicle-choose-completion-string', `icicle-clear-minibuffer',</span>
<span class="linecomment">;;    `icicle-color-blue-lessp', `icicle-color-green-lessp',</span>
<span class="linecomment">;;    `icicle-color-hue-lessp', `icicle-color-name-w-bg',</span>
<span class="linecomment">;;    `icicle-color-red-lessp', `icicle-color-saturation-lessp',</span>
<span class="linecomment">;;    `icicle-color-value-lessp', `icicle-command-abbrev-save',</span>
<span class="linecomment">;;    `icicle-command-abbrev-used-more-p',</span>
<span class="linecomment">;;    `icicle-command-names-alphabetic-p',</span>
<span class="linecomment">;;    `icicle-complete-again-update', `icicle-completing-p',</span>
<span class="linecomment">;;    `icicle-completing-read', `icicle-completing-read-multiple',</span>
<span class="linecomment">;;    `icicle-completing-read-history',</span>
<span class="linecomment">;;    `icicle-completion-all-completions',</span>
<span class="linecomment">;;    `icicle-completion-setup-function',</span>
<span class="linecomment">;;    `icicle-completion-try-completion', `icicle-custom-type',</span>
<span class="linecomment">;;    `icicle-define-crm-completion-map', `icicle-delete-count',</span>
<span class="linecomment">;;    `icicle-delete-whitespace-from-string',</span>
<span class="linecomment">;;    `icicle-dired-read-shell-command',</span>
<span class="linecomment">;;    `icicle-dired-smart-shell-command', `icicle-dirs-last-p',</span>
<span class="linecomment">;;    `icicle-displayable-cand-from-saved-set',</span>
<span class="linecomment">;;    `icicle-display-cand-from-full-cand',</span>
<span class="linecomment">;;    `icicle-display-completion-list', `icicle-display-Completions',</span>
<span class="linecomment">;;    `icicle-display-candidates-in-Completions',</span>
<span class="linecomment">;;    `icicle-expanded-common-match',</span>
<span class="linecomment">;;    `icicle-expanded-common-match-1', `icicle-expand-file-name',</span>
<span class="linecomment">;;    `icicle-explicit-saved-completion-candidates',</span>
<span class="linecomment">;;    `icicle-extra-candidates-first-p',</span>
<span class="linecomment">;;    `icicle-face-valid-attribute-values', `icicle-file-directory-p',</span>
<span class="linecomment">;;    `icicle-file-name-apropos-candidates',</span>
<span class="linecomment">;;    `icicle-file-name-directory-w-default',</span>
<span class="linecomment">;;    `icicle-file-name-input-p', `icicle-file-name-nondirectory',</span>
<span class="linecomment">;;    `icicle-file-name-prefix-candidates', `icicle-file-readable-p',</span>
<span class="linecomment">;;    `icicle-file-remote-p', `icicle-file-writable-p',</span>
<span class="linecomment">;;    `icicle-filesets-files-under', `icicle-files-within',</span>
<span class="linecomment">;;    `icicle-filter-alist', `icicle-filter-wo-input',</span>
<span class="linecomment">;;    `icicle-first-matching-candidate',</span>
<span class="linecomment">;;    `icicle-fit-completions-window', `icicle-fix-default-directory',</span>
<span class="linecomment">;;    `icicle-frames-on', `icicle-fuzzy-candidates',</span>
<span class="linecomment">;;    `icicle-get-alist-candidate',</span>
<span class="linecomment">;;    `icicle-get-candidates-from-saved-set',</span>
<span class="linecomment">;;    `icicle-dired-guess-shell-command',</span>
<span class="linecomment">;;    `icicle-highlight-candidate-in-Completions',</span>
<span class="linecomment">;;    `icicle-highlight-complete-input',</span>
<span class="linecomment">;;    `icicle-highlight-initial-whitespace',</span>
<span class="linecomment">;;    `icicle-highlight-input-noncompletion',</span>
<span class="linecomment">;;    `icicle-highlight-input-noncompletion-rest',</span>
<span class="linecomment">;;    `icicle-highlight-lighter', `icicle-historical-alphabetic-p',</span>
<span class="linecomment">;;    `icicle-increment-cand-nb+signal-end',</span>
<span class="linecomment">;;    `icicle-input-from-minibuffer', `icicle-insert-candidates',</span>
<span class="linecomment">;;    `icicle-insert-Completions-help-string',</span>
<span class="linecomment">;;    `icicle-isearch-complete-past-string', `icicle-join-nth-parts',</span>
<span class="linecomment">;;    `icicle-key-description', `icicle-kill-a-buffer',</span>
<span class="linecomment">;;    `icicle-last-modified-first-p', `icicle-levenshtein-match',</span>
<span class="linecomment">;;    `icicle-levenshtein-one-match', `icicle-levenshtein-one-regexp',</span>
<span class="linecomment">;;    `icicle-levenshtein-strict-match',</span>
<span class="linecomment">;;    `icicle-lisp-vanilla-completing-read',</span>
<span class="linecomment">;;    `icicle-make-face-candidate',</span>
<span class="linecomment">;;    `icicle-maybe-sort-and-strip-candidates', `icicle-mctize-all',</span>
<span class="linecomment">;;    `icicle-mctized-display-candidate',</span>
<span class="linecomment">;;    `icicle-mctized-full-candidate', `icicle-minibuf-input',</span>
<span class="linecomment">;;    `icicle-minibuf-input-sans-dir', `icicle-minibuffer-prompt-end',</span>
<span class="linecomment">;;    `icicle-most-recent-first-p', `icicle-msg-maybe-in-minibuffer',</span>
<span class="linecomment">;;    `icicle-ms-windows-NET-USE', `icicle-next-candidate',</span>
<span class="linecomment">;;    `icicle-part-1-cdr-lessp', `icicle-part-1-lessp',</span>
<span class="linecomment">;;    `icicle-part-2-lessp', `icicle-part-3-lessp',</span>
<span class="linecomment">;;    `icicle-part-4-lessp', `icicle-part-N-lessp',</span>
<span class="linecomment">;;    `icicle-place-cursor', `icicle-place-overlay',</span>
<span class="linecomment">;;    `icicle-prefix-any-candidates-p',</span>
<span class="linecomment">;;    `icicle-prefix-any-file-name-candidates-p',</span>
<span class="linecomment">;;    `icicle-prefix-candidates', `icicle-prefix-keys-first-p',</span>
<span class="linecomment">;;    `icicle-proxy-candidate-first-p', `icicle-put-at-head',</span>
<span class="linecomment">;;    `icicle-put-whole-cand-prop', `icicle-readable-to-markers',</span>
<span class="linecomment">;;    `icicle-read-char-exclusive', `icicle-read-face-name',</span>
<span class="linecomment">;;    `icicle-read-file-name', `icicle-read-from-minibuffer',</span>
<span class="linecomment">;;    `icicle-read-from-minibuf-nil-default', `icicle-read-number',</span>
<span class="linecomment">;;    `icicle-read-shell-command',</span>
<span class="linecomment">;;    `icicle-read-shell-command-completing', `icicle-read-string',</span>
<span class="linecomment">;;    `icicle-read-string-completing', `icicle-recompute-candidates',</span>
<span class="linecomment">;;    `icicle-redefine-standard-options',</span>
<span class="linecomment">;;    `icicle-redefine-std-completion-fns', `icicle-remove-dots',</span>
<span class="linecomment">;;    `icicle-remove-duplicates', `icicle-remove-dups-if-extras',</span>
<span class="linecomment">;;    `icicle-remove-if', `icicle-remove-if-not',</span>
<span class="linecomment">;;    `icicle-remove-property', `icicle-require-match-p',</span>
<span class="linecomment">;;    `icicle-restore-standard-commands',</span>
<span class="linecomment">;;    `icicle-restore-standard-options',</span>
<span class="linecomment">;;    `icicle-restore-std-completion-fns', `icicle-reversible-sort',</span>
<span class="linecomment">;;    `icicle-saved-fileset-p', `icicle-save-or-restore-input',</span>
<span class="linecomment">;;    `icicle-save-raw-input', `icicle-scatter',</span>
<span class="linecomment">;;    `icicle-scatter-match', `icicle-scroll-or-update-Completions',</span>
<span class="linecomment">;;    `icicle-set-difference', `icicle-set-intersection',</span>
<span class="linecomment">;;    `icicle-set-union', `icicle-shell-command',</span>
<span class="linecomment">;;    `icicle-shell-command-candidates',</span>
<span class="linecomment">;;    `icicle-shell-command-on-region',</span>
<span class="linecomment">;;    `icicle-special-candidates-first-p',</span>
<span class="linecomment">;;    `icicle-start-of-candidates-in-Completions',</span>
<span class="linecomment">;;    `icicle-strip-ignored-files-and-sort',</span>
<span class="linecomment">;;    `icicle-subst-envvar-in-file-name',</span>
<span class="linecomment">;;    `icicle-substring-no-properties', `icicle-substrings-of-length',</span>
<span class="linecomment">;;    `icicle-transform-candidates',</span>
<span class="linecomment">;;    `icicle-transform-multi-completion',</span>
<span class="linecomment">;;    `icicle-unhighlight-lighter', `icicle-unpropertize',</span>
<span class="linecomment">;;    `icicle-unsorted-apropos-candidates',</span>
<span class="linecomment">;;    `icicle-unsorted-file-name-apropos-candidates',</span>
<span class="linecomment">;;    `icicle-unsorted-file-name-prefix-candidates',</span>
<span class="linecomment">;;    `icicle-unsorted-prefix-candidates',</span>
<span class="linecomment">;;    `icicle-value-satisfies-type-p', `icicle-var-inherits-type-p',</span>
<span class="linecomment">;;    `icicle-var-is-of-type-p', `icicle-var-matches-type-p',</span>
<span class="linecomment">;;    `icicle-var-val-satisfies-type-p',</span>
<span class="linecomment">;;    `old-choose-completion-string', `old-completing-read',</span>
<span class="linecomment">;;    `old-completing-read-multiple', `old-completion-setup-function',</span>
<span class="linecomment">;;    `old-dired-smart-shell-command', `old-display-completion-list',</span>
<span class="linecomment">;;    `old-face-valid-attribute-values', `old-read-face-name',</span>
<span class="linecomment">;;    `old-read-file-name', `old-read-from-minibuffer',</span>
<span class="linecomment">;;    `old-read-number', `old-read-string', `old-shell-command',</span>
<span class="linecomment">;;    `old-shell-command-on-region'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Internal variables defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-crm-local-completion-map',</span>
<span class="linecomment">;;    `icicle-crm-local-must-match-map',</span>
<span class="linecomment">;;    `old-crm-local-completion-map', `old-crm-local-must-match-map'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: These EMACS PRIMITIVES have been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `completing-read'              - (See below and doc string.)</span>
<span class="linecomment">;;  `display-completion-list'      - (See below and doc string.)</span>
<span class="linecomment">;;  `face-valid-attribute-values'  - (See below and doc string.)</span>
<span class="linecomment">;;  `read-file-name' Emacs 20, 21 only - (See below and doc string.)</span>
<span class="linecomment">;;  `read-from-minibuffer'         - (See below and doc string.)</span>
<span class="linecomment">;;  `read-string'                  - (See below and doc string.)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `simple.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `choose-completion-string' -</span>
<span class="linecomment">;;     Don't exit minibuffer after `lisp-complete-symbol' completion.</span>
<span class="linecomment">;;  `completion-setup-function' - 1. Put faces on inserted string(s).</span>
<span class="linecomment">;;                                2. Help on help.</span>
<span class="linecomment">;;  `repeat-complex-command' - Use `completing-read' to read command.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following function defined in `filesets.el' has</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `filesets-get-filelist' - Fix.  Bug #976 reported to Emacs devel.</span>
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
<span class="linecomment">;;  (@&gt; "Redefined standard functions")</span>
<span class="linecomment">;;  (@&gt; "Icicles functions - completion display (not cycling)")</span>
<span class="linecomment">;;  (@&gt; "Icicles functions - prefix completion cycling")</span>
<span class="linecomment">;;  (@&gt; "Icicles functions - apropos completion cycling")</span>
<span class="linecomment">;;  (@&gt; "Icicles functions - common helper functions")</span>
<span class="linecomment">;;  (@&gt; "Icicles functions - sort functions")</span>
 
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

(eval-when-compile (require 'cl)) <span class="linecomment">;; case, lexical-let</span>
                                  <span class="linecomment">;; plus, for Emacs &lt; 21: dolist, push, pop</span>
                                  <span class="linecomment">;; plus, for Emacs &lt; 20: when, unless</span>

(when window-system (require 'hexrgb nil t))
  <span class="linecomment">;; (no error if not found): hexrgb-color-name-to-hex, hexrgb-(red|green|blue|hue|saturation|value)</span>
(require 'wid-edit+ nil t) <span class="linecomment">;; (no error if not found):</span>
                           <span class="linecomment">;; redefined color widget (for icicle-var-is-of-type-p)</span>
(require 'icicles-opt)
  <span class="linecomment">;; icicle-Completions-display-min-input-chars, icicle-cycle-into-subdirs-flag,</span>
  <span class="linecomment">;; icicle-expand-input-to-common-match-flag, icicle-highlight-historical-candidates-flag,</span>
  <span class="linecomment">;; icicle-highlight-input-initial-whitespace-flag, icicle-ignore-space-prefix-flag,</span>
  <span class="linecomment">;; icicle-incremental-completion-delay, icicle-incremental-completion-flag,</span>
  <span class="linecomment">;; icicle-incremental-completion-threshold, icicle-default-value, icicle-list-end-string,</span>
  <span class="linecomment">;; icicle-list-join-string, icicle-mark-position-in-candidate, icicle-point-position-in-candidate,</span>
  <span class="linecomment">;; icicle-regexp-quote-flag, icicle-require-match-flag,</span>
  <span class="linecomment">;; icicle-show-Completions-help-flag, icicle-sort-function, icicle-special-candidate-regexp,</span>
  <span class="linecomment">;; icicle-transform-function, icicle-use-~-for-home-dir-flag</span>
(require 'icicles-var)
  <span class="linecomment">;; icicle-candidate-nb, icicle-candidate-action-fn, icicle-candidate-properties-alist,</span>
  <span class="linecomment">;; icicle-cmd-calling-for-completion, icicle-common-match-string, icicle-complete-input-overlay,</span>
  <span class="linecomment">;; icicle-completing-p, icicle-completion-candidates, icicle-current-completion-mode,</span>
  <span class="linecomment">;; icicle-current-input, icicle-current-raw-input, icicle-default-directory, icicle-edit-update-p,</span>
  <span class="linecomment">;; icicle-extra-candidates, icicle-ignored-extensions-regexp, icicle-incremental-completion-p,</span>
  <span class="linecomment">;; icicle-initial-value, icicle-last-completion-candidate, icicle-last-input,</span>
  <span class="linecomment">;; icicle-must-match-regexp, icicle-must-not-match-regexp, icicle-must-pass-predicate,</span>
  <span class="linecomment">;; icicle-nb-of-other-cycle-candidates, icicle-re-no-dot, icicle-reverse-sort-p,</span>
  <span class="linecomment">;; icicle-saved-completion-candidates</span>

<span class="linecomment">;; This requirement is real, but leads to recursion.</span>
<span class="linecomment">;; You should, in any case, just load everything by loading `icicles.el'.</span>
<span class="linecomment">;; (require 'icicles-mode) ;; icicle-mode</span>


<span class="linecomment">;; Byte-compiling this file, you will likely get some error or warning</span>
<span class="linecomment">;; messages. All of the following are benign.  They are due to</span>
<span class="linecomment">;; differences between different versions of Emacs.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Compiling in Emacs 22:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Warning: `directory-sep-char' is an obsolete variable (as of Emacs 21.1); do not use it.</span>
<span class="linecomment">;; Warning: `make-local-hook' is an obsolete function (as of Emacs 21.1); not necessary any more.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Compiling in Emacs 20:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; The following functions are not known to be defined:</span>
<span class="linecomment">;;     minibufferp, minibuffer-prompt-end, field-string, minibuffer-completion-contents,</span>
<span class="linecomment">;;     display-mouse-p, propertize, delete-dups, completing-read-multiple, test-completion,</span>
<span class="linecomment">;;     x-font-family-list, internal-lisp-face-attribute-values, fit-window-to-buffer,</span>
<span class="linecomment">;;     minibuffer-contents-no-properties, filesets-get-fileset-from-name, filesets-init,</span>
<span class="linecomment">;;     filesets-entry-mode, filesets-get-filelist, filesets-directory-files,</span>
<span class="linecomment">;;     filesets-entry-get-filter-dirs-flag, filesets-filter-dir-names, puthash, file-remote-p,</span>
<span class="linecomment">;;     delete-minibuffer-contents, substring-no-properties, redisplay</span>


<span class="linecomment">;;; Defvars to quiet byte-compiler</span>

(when (&lt; emacs-major-version 22)
  (defvar completion-common-substring)
  (defvar completion-root-regexp)
  (defvar directory-sep-char)
  (defvar minibuffer-completing-symbol)
  (defvar minibuffer-prompt-properties)
  (defvar partial-completion-mode)
  (defvar read-file-name-completion-ignore-case)
  (defvar minibuffer-local-filename-completion-map)
  (defvar minibuffer-local-must-match-filename-map)
  (defvar minibuffer-local-filename-must-match-map))

(defvar filesets-data)                  <span class="linecomment">; Defined in `filesets.el'</span>
(defvar shell-completion-execonly)      <span class="linecomment">; Defined in `shell.el'</span>

<span class="linecomment">;; The name changed during development of Emacs 23.</span>
<span class="linecomment">;; Use the new name and alias the old, but don't declare old obsolete (let Emacs 23 do that.)</span>
(when (and (boundp 'minibuffer-local-must-match-filename-map) (fboundp 'defvaralias)) <span class="linecomment">; Emacs 22</span>
  (defvar minibuffer-local-filename-must-match-map minibuffer-local-must-match-filename-map
    "<span class="quote">Local keymap for minibuffer input with completion for filenames with exact match.</span>")
  (defvaralias 'minibuffer-local-must-match-filename-map 'minibuffer-local-filename-must-match-map))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
 
<span class="linecomment">;;(@* "Redefined standard functions")</span>

<span class="linecomment">;;; Redefined standard functions -------------------------------------</span>


<span class="linecomment">;; REPLACE ORIGINAL `choose-completion-string' in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Don't exit minibuffer if this is just a `lisp-complete-symbol' completion.</span>
<span class="linecomment">;; Go to point-max before insert choice.  Respect `icicle-dir-candidate-can-exit-p'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Free variable `completion-reference-buffer' is defined in `simple.el'.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-choose-completion-string)
(fset 'old-choose-completion-string (symbol-function 'choose-completion-string)))

<span class="linecomment">;;;###autoload</span>
(cond ((&gt; emacs-major-version 21)       <span class="linecomment">; Emacs 22</span>
       (defun icicle-choose-completion-string (choice &optional buffer base-size)
         "<span class="quote">Switch to BUFFER and insert the completion choice CHOICE.
BASE-SIZE, if non-nil, says how many characters of BUFFER's text
to keep.  If it is nil, we call `choose-completion-delete-max-match'
to decide what to delete.
If BUFFER is the minibuffer, then exit the minibuffer, unless one of
the following is true:
   - it is reading a file name, CHOICE is a directory, and
     `icicle-dir-candidate-can-exit-p' is nil
   - `completion-no-auto-exit' is non-nil
   - this is just a `lisp-complete-symbol' completion.</span>"
         (let* ((buffer  (or buffer completion-reference-buffer))
                (mini-p  (minibufferp buffer)))
           <span class="linecomment">;; If BUFFER is a minibuffer, barf unless it's currently active.</span>
           (if (and mini-p (or (not (active-minibuffer-window))
                               (not (equal buffer (window-buffer (active-minibuffer-window))))))
               (error "<span class="quote">Minibuffer is not active for completion</span>")
             <span class="linecomment">;; Set buffer so buffer-local `choose-completion-string-functions' works.</span>
             (set-buffer buffer)
             (unless (run-hook-with-args-until-success 'choose-completion-string-functions
                                                       choice buffer mini-p base-size)
               <span class="linecomment">;; Insert the completion into the buffer where completion was requested.</span>
               (if base-size
                   (delete-region (+ base-size (if mini-p (minibuffer-prompt-end) (point-min)))
                                  (if mini-p (point-max) (point)))
                 (choose-completion-delete-max-match choice))
               (when mini-p (goto-char (point-max))) <span class="linecomment">;; $$$$$ (was unconditional)</span>
               (insert choice)
               (remove-text-properties (- (point) (length choice)) (point) '(mouse-face nil))
               <span class="linecomment">;; Update point in the window that BUFFER is showing in.</span>
               (let ((window  (get-buffer-window buffer 0)))
                 (set-window-point window (point)))
               <span class="linecomment">;; If completing for the minibuffer, exit it with this choice,</span>
               <span class="linecomment">;; unless this was a `lisp-complete-symbol' completion.</span>
               (and (not completion-no-auto-exit)
                    (equal buffer (window-buffer (minibuffer-window)))
                    (or minibuffer-completion-table
                        (and icicle-mode (or icicle-extra-candidates icicle-proxy-candidates)))
                    (not (eq 'lisp-complete-symbol icicle-cmd-calling-for-completion))
                    <span class="linecomment">;; Exit the minibuffer if `icicle-dir-candidate-can-exit-p',</span>
                    <span class="linecomment">;; or not reading a file name, or chosen file is not a directory.</span>
                    (if (or icicle-dir-candidate-can-exit-p
                            (not (eq minibuffer-completion-table 'read-file-name-internal))
                            (not (file-directory-p (field-string (point-max)))))
                        (exit-minibuffer)
                      (let ((mini  (active-minibuffer-window)))
                        (select-window mini)
                        (when minibuffer-auto-raise (raise-frame (window-frame mini)))))))))))

      ((&gt; emacs-major-version 20)       <span class="linecomment">; Emacs 21</span>
       (defun icicle-choose-completion-string (choice &optional buffer base-size)
         "<span class="quote">Switch to BUFFER and insert the completion choice CHOICE.
BASE-SIZE, if non-nil, says how many characters of BUFFER's text
to keep.  If it is nil, we call `choose-completion-delete-max-match'
to decide what to delete.
If BUFFER is the minibuffer, then exit the minibuffer, unless one of
the following is true:
   - it is reading a file name, CHOICE is a directory, and
     `icicle-dir-candidate-can-exit-p' is nil
   - `completion-no-auto-exit' is non-nil
   - this is just a `lisp-complete-symbol' completion.</span>"
         (let ((buffer  (or buffer completion-reference-buffer))
               (mini-p  (save-match-data
                          (string-match "<span class="quote">\\` \\*Minibuf-[0-9]+\\*\\'</span>" (buffer-name buffer)))))
           <span class="linecomment">;; If BUFFER is a minibuffer, barf unless it's currently active.</span>
           (if (and mini-p
                    (or (not (active-minibuffer-window))
                        (not (equal buffer
                                    (window-buffer (active-minibuffer-window))))))
               (error "<span class="quote">Minibuffer is not active for completion</span>")
             <span class="linecomment">;; Insert the completion into the buffer where completion was requested.</span>
             (set-buffer buffer)
             (if base-size
                 (delete-region (+ base-size (if mini-p (icicle-minibuffer-prompt-end) (point-min)))
                                (if mini-p (point-max) (point)))
               (choose-completion-delete-max-match choice))
             (when mini-p (goto-char (point-max))) <span class="linecomment">;; $$$$$ (was unconditional)</span>
             (insert choice)
             (remove-text-properties (- (point) (length choice)) (point) '(mouse-face nil))
             <span class="linecomment">;; Update point in the window that BUFFER is showing in.</span>
             (let ((window  (get-buffer-window buffer 0)))
               (set-window-point window (point)))
             <span class="linecomment">;; If completing for the minibuffer, exit it with this choice,</span>
             <span class="linecomment">;; unless this was a `lisp-complete-symbol' completion.</span>
             (and (not completion-no-auto-exit)
                  (equal buffer (window-buffer (minibuffer-window)))
                  (or minibuffer-completion-table
                      (and icicle-mode (or icicle-extra-candidates icicle-proxy-candidates)))
                  (not (eq 'lisp-complete-symbol icicle-cmd-calling-for-completion))
                  <span class="linecomment">;; Exit the minibuffer if `icicle-dir-candidate-can-exit-p',</span>
                  <span class="linecomment">;; or not reading a file name, or chosen file is not a directory.</span>
                  (if (or icicle-dir-candidate-can-exit-p
                          (not (eq minibuffer-completion-table 'read-file-name-internal))
                          (not (file-directory-p (field-string (point-max)))))
                      (exit-minibuffer)
                    (let ((mini  (active-minibuffer-window)))
                      (select-window mini)
                      (when minibuffer-auto-raise (raise-frame (window-frame mini))))))))))

      (t                                <span class="linecomment">; Emacs 20</span>
       (defun icicle-choose-completion-string (choice &optional buffer base-size)
         "<span class="quote">Switch to BUFFER and insert the completion choice CHOICE.
 BASE-SIZE, if non-nil, says how many characters of BUFFER's text
 to keep.  If it is nil, we call `choose-completion-delete-max-match'
 to decide what to delete.
 If BUFFER is the minibuffer, then exit the minibuffer, unless one of
 the following is true:
    - it is reading a file name, CHOICE is a directory, and
      `icicle-dir-candidate-can-exit-p' is nil
    - `completion-no-auto-exit' is non-nil
    - this is just a `lisp-complete-symbol' completion.</span>"
         (let ((buffer  (or buffer completion-reference-buffer))
               (mini-p  (save-match-data
                          (string-match "<span class="quote">\\` \\*Minibuf-[0-9]+\\*\\'</span>" (buffer-name buffer)))))
           <span class="linecomment">;; If BUFFER is a minibuffer, barf unless it's currently active.</span>
           (when (and mini-p
                      (or (not (active-minibuffer-window))
                          (not (equal buffer (window-buffer (active-minibuffer-window))))))
             (error "<span class="quote">Minibuffer is not active for completion</span>"))
           <span class="linecomment">;; Insert the completion into the buffer where completion was requested.</span>
           (set-buffer buffer)
           (if base-size
               (delete-region (+ base-size (point-min)) (if mini-p (point-max) (point)))
             (choose-completion-delete-max-match choice))
           (when mini-p (goto-char (point-max))) <span class="linecomment">;; $$$$$ (was unconditional)</span>
           (insert choice)
           (remove-text-properties (- (point) (length choice)) (point) '(mouse-face nil))
           <span class="linecomment">;; Update point in the window that BUFFER is showing in.</span>
           (let ((window  (get-buffer-window buffer 0)))
             (set-window-point window (point)))
           <span class="linecomment">;; If completing for the minibuffer, exit it with this choice,</span>
           <span class="linecomment">;; unless this was a `lisp-complete-symbol' completion.</span>
           (and (not completion-no-auto-exit)
                (equal buffer (window-buffer (minibuffer-window)))
                (or minibuffer-completion-table
                    (and icicle-mode (or icicle-extra-candidates icicle-proxy-candidates)))
                (not (eq 'lisp-complete-symbol icicle-cmd-calling-for-completion))
                <span class="linecomment">;; Exit the minibuffer if `icicle-dir-candidate-can-exit-p',</span>
                <span class="linecomment">;; or not reading a file name, or chosen file is not a directory.</span>
                (if (or icicle-dir-candidate-can-exit-p
                        (not (eq minibuffer-completion-table 'read-file-name-internal))
                        (not (file-directory-p (buffer-string))))
                    (exit-minibuffer)
                  (select-window (active-minibuffer-window))))))))


<span class="linecomment">;; REPLACE ORIGINAL `completion-setup-function' in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Don't print the help lines here.  Do that in `icicle-display-completion-list' instead.</span>
<span class="linecomment">;; That's so we can fit the *Completions* window to the buffer, including the help lines.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-completion-setup-function)
(fset 'old-completion-setup-function (symbol-function 'completion-setup-function)))

<span class="linecomment">;;;###autoload</span>
(when (&lt; emacs-major-version 22)
  (defun icicle-completion-setup-function ()
    "<span class="quote">Set up for completion.  This goes in `completion-setup-hook'
so it is called after completion-list buffer text is written.</span>"
    (save-excursion
      (let* ((mainbuf        (current-buffer))
             (mbuf-contents  (icicle-input-from-minibuffer))
             <span class="linecomment">;; $$$$$ Should we `expand-file-name' mbuf-contents first?</span>
             (dir-of-input   (and minibuffer-completing-file-name
                                  (file-name-directory mbuf-contents))))
        <span class="linecomment">;; If reading file name and either icicle-comp-base-is-default-dir-p is nil or this is a</span>
        <span class="linecomment">;; completion command, then set `default-directory' so it will be copied into *Completions*.</span>
        (when (and dir-of-input
                   (or (and (symbolp last-command) (get this-command 'icicle-completing-command))
                       (not icicle-comp-base-is-default-dir-p)))
          (with-current-buffer mainbuf (setq default-directory  dir-of-input)))
        (with-current-buffer standard-output
          (completion-list-mode)
          (set (make-local-variable 'completion-reference-buffer) mainbuf)
          (setq completion-base-size
                (cond ((and (eq minibuffer-completion-table 'read-file-name-internal)
                            icicle-comp-base-is-default-dir-p
                            (length default-directory)))
                      ((eq minibuffer-completion-table 'read-file-name-internal)
                       <span class="linecomment">;; For file name completion, use the number of chars before</span>
                       <span class="linecomment">;; the start of the file name component at point.</span>
                       (with-current-buffer mainbuf
                         (save-excursion
                           (skip-chars-backward (format "<span class="quote">^%c</span>" directory-sep-char))
                           (- (point) (icicle-minibuffer-prompt-end)))))
                      ((save-match-data (string-match "<span class="quote">\\` \\*Minibuf-[0-9]+\\*\\'</span>"
                                                      (buffer-name mainbuf)))
                       <span class="linecomment">;; Otherwise, in minibuffer, the whole input is being completed.</span>
                       0))))))))

<span class="linecomment">;;;###autoload</span>
(when (&gt;= emacs-major-version 22)
  (defun icicle-completion-setup-function ()
    "<span class="quote">Set up for completion.  This goes in `completion-setup-hook'
so it is called after completion-list buffer text is written.</span>"
    (save-excursion
      (let* ((mainbuf        (current-buffer))
             (mbuf-contents  (minibuffer-completion-contents))
             <span class="linecomment">;; $$$$$ Should we `expand-file-name' mbuf-contents first?  Vanilla Emacs does that.</span>
             (dir-of-input   (and minibuffer-completing-file-name
                                  (file-name-directory mbuf-contents)))
             common-string-length)
        <span class="linecomment">;; If reading file name and either icicle-comp-base-is-default-dir-p is nil or this is a</span>
        <span class="linecomment">;; completion command, then set `default-directory' so it will be copied into *Completions*.</span>
        (when (and dir-of-input
                   (or (and (symbolp this-command) (get this-command 'icicle-completing-command))
                       (not icicle-comp-base-is-default-dir-p)))
          (with-current-buffer mainbuf (setq default-directory  dir-of-input)))
        (with-current-buffer standard-output
          (completion-list-mode)
          (set (make-local-variable 'completion-reference-buffer) mainbuf)
          (setq completion-base-size
                (cond ((and minibuffer-completing-file-name
                            icicle-comp-base-is-default-dir-p
                            (length default-directory)))
                      ((and (symbolp minibuffer-completion-table)
                            (get minibuffer-completion-table 'completion-base-size-function))
                       <span class="linecomment">;; To compute base size, a function can use the global value of</span>
                       <span class="linecomment">;; `completion-common-substring' or `minibuffer-completion-contents'.</span>
                       (with-current-buffer mainbuf
                         (funcall (get minibuffer-completion-table 'completion-base-size-function))))
                      (minibuffer-completing-file-name
                       <span class="linecomment">;; For file name completion, use the number of chars before</span>
                       <span class="linecomment">;; the start of the file name component at point.</span>
                       (with-current-buffer mainbuf
                         (save-excursion
                           (skip-chars-backward completion-root-regexp)
                           (- (point) (minibuffer-prompt-end)))))
                      ((and (boundp 'minibuffer-completing-symbol) minibuffer-completing-symbol) nil)
                      <span class="linecomment">;; Otherwise, in minibuffer, the base size is 0.</span>
                      ((minibufferp mainbuf) 0)))
          (setq common-string-length
                (cond (completion-common-substring (length completion-common-substring))
                      (completion-base-size (- (length mbuf-contents) completion-base-size))))
          <span class="linecomment">;; Put faces on first uncommon characters and common parts.</span>
          (when (and (integerp common-string-length) (&gt;= common-string-length 0))
            (let ((element-start  (point-min))
                  (maxp           (point-max))
                  element-common-end)
              (while (and (setq element-start  (next-single-property-change element-start
                                                                            'mouse-face))
                          (&lt; (setq element-common-end  (+ element-start common-string-length))
                             maxp))
                (when (get-char-property element-start 'mouse-face)
                  (if (and (&gt; common-string-length 0)
                           (get-char-property (1- element-common-end) 'mouse-face))
                      (put-text-property element-start element-common-end
                                         'font-lock-face 'completions-common-part))
                  (if (get-char-property element-common-end 'mouse-face)
                      (put-text-property element-common-end (1+ element-common-end)
                                         'font-lock-face 'completions-first-difference)))))))))))

(defun icicle-insert-Completions-help-string ()
  "<span class="quote">Add or remove help in *Completions*.
This is controlled by `icicle-show-Completions-help-flag'.  If that
option is nil, remove help; else, add it.</span>"
  (if icicle-show-Completions-help-flag
      (let ((instruction2  (or (and icicle-mode (substitute-command-keys
                                                 (concat "<span class="quote">(\\&lt;minibuffer-local-completion-map&gt;</span>"
                                                         "<span class="quote">\\[icicle-minibuffer-help]: help) </span>")))
                               "<span class="quote"></span>"))
            instruction1)
        (cond ((&lt; emacs-major-version 22)
               (setq instruction1  (if window-system <span class="linecomment">; We have a mouse.</span>
                                       (substitute-command-keys "<span class="quote">Click \\&lt;completion-list-mode-map&gt;\
\\[mouse-choose-completion] on a completion to select it.  </span>")
                                     (substitute-command-keys <span class="linecomment">; No mouse.</span>
                                      "<span class="quote">In this buffer, type \\&lt;completion-list-mode-map&gt;\
\\[choose-completion] to select the completion near point.  </span>"))))
              ((&gt;= emacs-major-version 22)
               (setq instruction1  (if (display-mouse-p) <span class="linecomment">; We have a mouse.</span>
                                       (substitute-command-keys
                                        "<span class="quote">Click \\&lt;completion-list-mode-map&gt;\
\\[mouse-choose-completion] or type \\[choose-completion] on a completion to select it.  </span>")
                                     (substitute-command-keys <span class="linecomment">; No mouse.</span>
                                      "<span class="quote">In this buffer, type \\&lt;completion-list-mode-map&gt;\
\\[choose-completion] to select the completion near point.  </span>")))))
        (goto-char (point-min))
        (put-text-property 0 (length instruction1) 'face 'icicle-Completions-instruction-1
                           instruction1)
        (put-text-property 0 (length instruction2) 'face 'icicle-Completions-instruction-2
                           instruction2)
        (insert instruction1 instruction2 "<span class="quote">\n</span>"))

    <span class="linecomment">;; Not showing help.  Remove standard Emacs help string.</span>
    (goto-char (point-min))
    (re-search-forward "<span class="quote">Possible completions are:\n</span>")
    (delete-region (point-min) (point))))

(defun icicle-read-from-minibuf-nil-default (prompt &optional initial-contents keymap read hist
                                             default-value inherit-input-method)
  "<span class="quote">Like `read-from-minibuffer', but return nil for empty input.
Args are as for `read-from-minibuffer'.
If nothing is input, then nil is returned.</span>"
  (let ((input  (read-from-minibuffer prompt initial-contents keymap nil hist default-value
                                      inherit-input-method)))
    (if (string= "<span class="quote"></span>" input) nil (if read (car (read-from-string input)) input))))

(defun icicle-completing-read-history (prompt &optional hist pred init-input def inherit-i-m)
  "<span class="quote">Lax `completing-read' against entries in history HIST.
Arguments are as for `completing-read'.  HIST is a symbol that is a
history variable.  It defaults to `minibuffer-history'.  Completion is
lax: a match is not required.</span>"
  (setq hist  (or hist 'minibuffer-history))
  (let ((hist-val  (icicle-remove-duplicates (symbol-value hist))))
    (when (and (consp hist-val) (not (stringp (car hist-val)))) <span class="linecomment">; Convert, e.g. `comand-history'.</span>
      (setq hist-val  (mapcar (lambda (v) (format "<span class="quote">%s</span>" v)) hist-val)))
    (completing-read prompt (mapcar #'list hist-val) pred nil init-input hist def inherit-i-m)))


<span class="linecomment">;; Pretty much a straight transcription into Lisp of the C code that defined `completing-read'.</span>
(defun icicle-lisp-vanilla-completing-read (prompt collection &optional predicate require-match
                                            initial-input hist def inherit-input-method)
  "<span class="quote">Lisp version of vanilla Emacs `completing-read'.</span>"
  (let ((pos  0)
        val histvar histpos position init)
    (setq init                             initial-input
          minibuffer-completion-table      collection
          minibuffer-completion-predicate  predicate
          minibuffer-completion-confirm    (if (eq require-match t) nil require-match))
    (setq position  nil)
    (when init
      (when (consp init) (setq position  (cdr init)
                               init      (car init)))
      (unless (stringp init)
        (error "<span class="quote">icicle-lisp-vanilla-completing-read, INIT must be a string: %S</span>" init))
      (if (not position)
          (setq pos  (1+ (length init))) <span class="linecomment">; Default is to put cursor at end of INITIAL-INPUT.</span>
        (unless (integerp position)
          (error "<span class="quote">icicle-lisp-vanilla-completing-read, POSITION must be an integer: %S</span>" position))
        (setq pos  (1+ position))))      <span class="linecomment">; Convert zero-based to one-based.</span>
    (if (symbolp hist)
        (setq histvar  hist
              histpos  nil)
      (setq histvar  (car-safe hist)
            histpos  (cdr-safe hist)))
    (unless histvar (setq histvar  'minibuffer-history))
    (unless histpos (setq histpos  0))
    (setq val  (read-from-minibuffer
                prompt
                (cons init pos)          <span class="linecomment">; initial-contents</span>
                (if (not require-match)  <span class="linecomment">; key map</span>
                    (if (or (not minibuffer-completing-file-name)
                            (eq minibuffer-completing-file-name 'lambda)
                            (not (boundp 'minibuffer-local-filename-completion-map)))
                        minibuffer-local-completion-map
                      minibuffer-local-filename-completion-map)
                  (if (or (not minibuffer-completing-file-name)
                          (eq minibuffer-completing-file-name 'lambda)
                          (not (boundp 'minibuffer-local-filename-must-match-map)))
                      minibuffer-local-must-match-map
                    minibuffer-local-filename-must-match-map))
                nil histvar def inherit-input-method))
    <span class="linecomment">;; Emacs 23 allows DEFAULT-VALUE to be a list of strings - use the first one.</span>
    (when (consp def) (setq def  (car def)))
    (when (and (stringp val) (string= val "<span class="quote"></span>") def) (setq val  def))
    val))


<span class="linecomment">;; REPLACE ORIGINAL `completing-read' (built-in function),</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Allows for completion candidates that are lists of strings.</span>
<span class="linecomment">;; Allows for reading and returning completion candidates that are strings with properties.</span>
<span class="linecomment">;; Adds completion status indicator to minibuffer and mode-line lighter.</span>
<span class="linecomment">;; Removes *Completions* window.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; We use M@R%M=X!L$S+P&L^T*Z instead of HIST, to avoid name capture by</span>
<span class="linecomment">;; `minibuffer-history-variable's value.  If we didn't need to be Emacs 20-compatible, then we</span>
<span class="linecomment">;; could employ `#1=#:hist'...`#1#'...`#1' read syntax to use an uninterned symbol.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-completing-read)
(fset 'old-completing-read (symbol-function 'completing-read)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-completing-read (prompt collection &optional predicate require-match
                               initial-input m@r%m=x!l$s+p&l^t*z def inherit-input-method)
  "<span class="quote">Read string in minibuffer, with completion and cycling of completions.
Prefix completion via \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-prefix-word-complete]' (word) and `\\[icicle-prefix-complete]' (full).
Apropos (regexp) completion via `\\[icicle-apropos-complete]'.

Prefix cycling of candidate completions via `\\[icicle-previous-prefix-candidate]' and \
`\\[icicle-next-prefix-candidate]'.
Apropos cycling of candidate completions via `\\[icicle-previous-apropos-candidate]' and \
`\\[icicle-next-apropos-candidate]'.

Cycling of past minibuffer inputs via `\\[previous-history-element]' and \
`\\[next-history-element]'.
Searching through input history via `\\[previous-matching-history-element]' \
and `\\[next-matching-history-element]'.

Case is ignored if `completion-ignore-case' is non-nil.
Position of the cursor (point) and the mark during completion cycling
  is determined by `icicle-point-position-in-candidate' and
  `icicle-mark-position-in-candidate', respectively.
Highlighting of the matched part of completion candidates during
  cycling is determined by `icicle-match-highlight-minibuffer',
  `icicle-match-highlight-Completions', and
  `icicle-common-match-highlight-Completions'.

Use `\\[icicle-minibuffer-help]' during completion for more information on completion and key
bindings in Icicle mode.

PROMPT is a string to prompt with. It normally ends in a colon and a
space.  If PROMPT has non-nil text property `icicle-fancy-candidates'
on its first character, then completion candidates can be fancy - they
can have properties.  However, if all of the candidates would be
acceptable to vanilla Emacs, then PROMPT need not use property
`icicle-fancy-candidates', even for candidates that have text
properties.  Property `icicle-fancy-candidates' is needed only for
candidates that require encoding and decoding to store and retrieve
properties.  See the Icicles doc, section `Programming with Fancy
Candidates'.

COLLECTION is an obarray or an alist whose elements' cars are strings.
It can also be a function that performs the completion itself.
In Emacs 22 or later, it can also be a hash table or list of strings.

In Icicle mode, the car of an alist entry can also be a list of
strings.  In this case, the completion candidate is a
multi-completion.  The strings are joined pairwise with
`icicle-list-join-string' to form the completion candidate seen by the
user, which is terminated by `icicle-list-end-string'.  You can use
variable `icicle-candidate-properties-alist' to control the appearance
of multi-completions in buffer *Completions*.  You can use variables
`icicle-list-use-nth-parts' and `icicle-list-nth-parts-join-string' to
control the minibuffer behavior of multi-completions.  See the Icicles
documentation for more information.

PREDICATE limits completion to a subset of COLLECTION.

See `try-completion' and `all-completions' for more details on
completion, COLLECTION, and PREDICATE.

REQUIRE-MATCH can take any of these values:
* nil means the user can exit using any input.
* t means the user can exit only if the input is (or completes to) an
  element of COLLECTION or is null.
* In Emacs 23 or later:
  - `confirm' means the user can exit with any input, but if the input
    is not an element of COLLECTION then confirmation is needed.
  - `confirm-after-completion' is similar, except that with
    non-matching input exit is allowed only just after completing.
* Anything else behaves like t, except that hitting `\\[exit-minibuffer]' does not
  exit if it performs non-null completion.

Regardless of the value of REQUIRE-MATCH, if the user input is empty,
then `completing-read' returns DEF or, if DEF is nil, an empty string.

If option `icicle-require-match-flag' is non-nil, it overrides the
value of REQUIRE-MATCH.

If INITIAL-INPUT is non-nil, insert it in the minibuffer initially,
with point positioned at the end.  If it is (STRING . POSITION), the
initial input is STRING, but point is placed at zero-indexed position
POSITION in STRING.  (This is different from `read-from-minibuffer'
and related functions, which use one-indexing for POSITION.)

INITIAL-INPUT is considered deprecated by vanilla Emacs, but not by
Icicles.  If INITIAL-INPUT is nil and DEF is non-nil, the user can use
`next-history-element' to yank DEF into the minibuffer.

HIST, if non-nil, specifies a history list and optionally the initial
position in the list.  It can be a symbol, which is the history list
variable to use, or it can be a cons cell (HISTVAR . HISTPOS).  If a
cons cell, HISTVAR is the history list variable to use, and HISTPOS is
the initial position (the position in the list used by the minibuffer
history commands).  For consistency, you should also specify that
element of the history as the value of INITIAL-INPUT.  Positions are
counted starting from 1 at the beginning of the list.  The variable
`history-length' controls the maximum length of a history list.

DEF, if non-nil, is the default value or the list of default values.
Option `icicle-default-value' controls the treatment of the default
value (or the first default value, if DEF is a list): whether it is
shown in the prompt, substituted for an empty INITIAL-INPUT, and so
on.

If INHERIT-INPUT-METHOD is non-nil, the minibuffer inherits the
current input method and the setting of `enable-multibyte-characters'.

Completion ignores case when `completion-ignore-case' is non-nil.</span>"
  (unless (stringp icicle-initial-value) (setq icicle-initial-value  "<span class="quote"></span>"))
  (unless initial-input (setq initial-input  icicle-initial-value))
  (if (consp initial-input)
      (setq icicle-initial-value  (car initial-input))
    (setq initial-input         (format "<span class="quote">%s</span>" initial-input) <span class="linecomment">; Convert symbol to string</span>
          icicle-initial-value  initial-input))
  (setq icicle-nb-of-other-cycle-candidates  0)

  <span class="linecomment">;; Emacs 23 allows DEF to be a list of strings - use the first one here.</span>
  (let ((def1  (if (consp def) (car def) def)))
    <span class="linecomment">;; Maybe use DEF for INITIAL-INPUT also.</span>
    (when (and icicle-default-value (not (eq icicle-default-value t)) def1
               (stringp initial-input) (string= "<span class="quote"></span>" initial-input))
      (setq initial-input  (if (symbolp def1) (symbol-name def1) def1))
      (when (memq icicle-default-value '(insert-start preselect-start))
        (setq initial-input  (cons initial-input 0)))))

  <span class="linecomment">;; Override REQUIRE-MATCH as needed.</span>
  (setq require-match           (case icicle-require-match-flag
                                  ((nil)               require-match)
                                  (no-match-required   nil)
                                  (partial-match-ok    t)
                                  (full-match-required 'full-match-required))
        icicle-require-match-p  require-match)
  (icicle-highlight-lighter)
  (let* (<span class="linecomment">;; $$$$$$$$$$ `minibuffer-completion-table' binding needed?  `setq' in `*-lisp-vanilla-*'.</span>
         (minibuffer-allow-text-properties  t) <span class="linecomment">; This is nil for completion in vanilla Emacs.</span>
         (minibuffer-completion-table       collection)
         (icicle-fancy-cands-internal-p     (or icicle-whole-candidate-as-text-prop-p
                                                icicle-fancy-candidates-p
                                                (get-text-property
                                                 0 'icicle-fancy-candidates prompt)))
         result)
    <span class="linecomment">;; Transform a cons collection to what is expected for `minibuffer-completion-table'.</span>
    (when icicle-fancy-cands-internal-p
      (let ((c+p  (icicle-mctize-all collection predicate)))
        (setq collection  (car c+p)     <span class="linecomment">; After banalizing for vanilla Emacs.</span>
              predicate   (cadr c+p))))
    <span class="linecomment">;; $$$$$$$$$$$$$ (setq minibuffer-completion-table  collection)</span>
    (cond ((not icicle-mode)
           (setq result  (icicle-lisp-vanilla-completing-read
                          prompt collection predicate require-match initial-input
                          m@r%m=x!l$s+p&l^t*z def inherit-input-method)))
          (t
           (let ((minibuffer-prompt-properties
                  (and (boundp 'minibuffer-prompt-properties) <span class="linecomment">; Emacs 21+ only</span>
                       (icicle-remove-property 'face minibuffer-prompt-properties)))
                 (minibuffer-completing-file-name
                  <span class="linecomment">;; Can't be file-name completion unless it's a function.</span>
                  (and (functionp collection) minibuffer-completing-file-name)))
             (when (&lt; emacs-major-version 21)
               (setq prompt  (concat (and icicle-candidate-action-fn "<span class="quote">+ </span>") prompt)))
             (setq result  (catch 'icicle-read-top
                             (icicle-lisp-vanilla-completing-read
                              prompt collection predicate require-match initial-input
                              m@r%m=x!l$s+p&l^t*z def inherit-input-method)))
             (when icicle-unpropertize-completion-result-flag (icicle-unpropertize result)))))
    <span class="linecomment">;; HACK.  Without this, when REQUIRE-MATCH is non-nil, *Completions* window</span>
    <span class="linecomment">;; does not disappear.</span>
    (when require-match (icicle-remove-Completions-window))
    result))

(defun icicle-mctize-all (coll pred)
  "<span class="quote">Transform collection COLL and predicate PRED for vanilla completion.
COLL is an Icicles collection argument acceptable to
  `icicle-completing-read' but not necessarily to vanilla
  `completing-read': COLL can contain multi-completions.
PRED is a predicate.

Returns a new two-element list of the new collection and predicate:
\(MCT NEWPRED), where MCT is COLL transformed and NEWPRED is PRED
transformed.  MCT is a collection suitable for vanilla
`completing-read'.

COLL is transformed to MCT by applying `icicle-mctized-full-candidate'
to each of its elements.

If PRED is non-nil, then NEWPRED is a predicate that applies PRED to
the cdr of an MCT entry.</span>"
  (when (consp coll)
    <span class="linecomment">;; Copy alist collection COLL, so we don't change the original alist in any way.</span>
    <span class="linecomment">;; Change each entry in COLL using `icicle-mctized-full-candidate'.</span>
    (setq coll  (mapcar #'icicle-mctized-full-candidate coll))
    <span class="linecomment">;; Convert PRED so that, for a cons entry with a string car, PRED uses the cdr (which is the</span>
    <span class="linecomment">;;   original entry) instead.</span>
    (lexical-let ((new-pred  pred))
      (when pred
        (setq pred  (lambda (x)
                      (funcall new-pred (if (and (consp x) (stringp (car x))) (cdr x) x)))))))
  (list coll pred))

(defun icicle-mctized-full-candidate (cand)
  "<span class="quote">Return MCT candidate that corresponds to full candidate CAND.
See the source code for details.</span>"
  <span class="linecomment">;; If neither `icicle-fancy-cands-internal-p' nor `icicle-whole-candidate-as-text-prop-p' is</span>
  <span class="linecomment">;;   non-nil, then just return CAND.</span>
  <span class="linecomment">;; Otherwise:</span>
  <span class="linecomment">;;   If CAND is a string A, we change it to (A) and then treat that (as follows).</span>
  <span class="linecomment">;;   If CAND is (A . B), where A is a string, then we change it to (S A . B), where S is a copy</span>
  <span class="linecomment">;;     of A.  This way, the cdr of each MCT candidate is the original alist candidate, (A . B).</span>
  <span class="linecomment">;;   If CAND is (M . B), where M is a multi-completion (X Y Z...), then we change it to</span>
  <span class="linecomment">;;     (M' A . B), where M' is the display string for the multi-completion M.</span>
  <span class="linecomment">;;   Otherwise, we make no change to CAND.</span>
  <span class="linecomment">;;   If `icicle-whole-candidate-as-text-prop-p' is non-nil and the MCT candidate is a cons (X A . B)</span>
  <span class="linecomment">;;     with a string car X, then we put the cdr, (A . B), as a text property on the car X, so</span>
  <span class="linecomment">;;     we can get back the original (A . B) from the car.</span>
  (if (not (or icicle-fancy-cands-internal-p icicle-whole-candidate-as-text-prop-p))
      cand
    (let ((new-cand
           (cond ((and (consp cand)     <span class="linecomment">; Multi-completion: (("aa" "bb") . cc) -&gt;</span>
                       (consp (car cand)) <span class="linecomment">; ("aa^G\nbb\n\n" ("aa" "bb") . cc)</span>
                       (stringp (caar cand)))
                  (cons (concat (mapconcat #'identity (car cand) icicle-list-join-string)
                                icicle-list-end-string)
                        cand))
                 ((and (consp cand) (stringp (car cand))) <span class="linecomment">; ("aa" . cc) -&gt; ("aa" "aa" . cc)</span>
                  (cons (copy-sequence (car cand)) cand))
                 ((stringp cand)        <span class="linecomment">; "aa" -&gt; ("aa" "aa")</span>
                  (list (copy-sequence cand) cand)) 
                 (t                     <span class="linecomment">; Anything else: (aa), aa -&gt; no change</span>
                  cand))))
      <span class="linecomment">;; Put original alist candidates on display candidates (strings), as a text property.</span>
      (when (and icicle-whole-candidate-as-text-prop-p (consp new-cand) (stringp (car new-cand)))
        (icicle-put-whole-cand-prop new-cand))
      new-cand)))

(defun icicle-put-whole-cand-prop (cand)
  "<span class="quote">Put cdr of CAND on its car, as text property `icicle-whole-candidate'.
This has no side effects.
Returns a new propertized string corresponding to (car CAND).</span>"
  (let ((text-cand  (copy-sequence (car cand))))
    (put-text-property 0 (length text-cand) 'icicle-whole-candidate (cdr cand) text-cand)
    (setcar cand text-cand)
    text-cand))

(defun icicle-mctized-display-candidate (cand)
  "<span class="quote">Return MCT candidate that corresponds to display candidate CAND.</span>"
  (let ((full-cand  (or (icicle-get-alist-candidate cand) (list cand))))
    (cons cand full-cand)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-read-file-name (prompt &optional dir default-filename
                              require-match initial-input predicate)
  "<span class="quote">Read file name, prompting with PROMPT and completing in directory DIR.
Value is not expanded---you must call `expand-file-name' yourself.
DIR should be an absolute directory name.  It defaults to the value of
 `default-directory'.
Default the name to DEFAULT-FILENAME if user exits the minibuffer with
the same non-empty string that was inserted by this function.
 (If DEFAULT-FILENAME is omitted, the visited file name is used,
  but if INITIAL-INPUT is specified, that combined with DIR is used.)
If the user exits with an empty minibuffer, this function returns
an empty string.  (This can only happen if the user erased the
pre-inserted contents or if `insert-default-directory' is nil.)
Fourth arg REQUIRE-MATCH non-nil means require existing file's name.
 Non-nil and non-t means also require confirmation after completion.
Fifth arg INITIAL-INPUT specifies text to start with.
If optional sixth arg PREDICATE is non-nil, possible completions and
 the resulting file name must satisfy `(funcall predicate NAME)'.
 This argument is only available starting with Emacs 22.

Directory names are highlighted in *Completions* using face
`icicle-special-candidate'.

If option `icicle-require-match-flag' is non-nil, it overrides the
value of REQUIRE-MATCH.

Cycling into subdirectories is determined by option
`icicle-cycle-into-subdirs-flag'.  Case is ignored if
`read-file-name-completion-ignore-case' is non-nil.  See also
`read-file-name-function'.

If option `icicle-add-proxy-candidates-flag' is non-nil, then the
following proxy file-name candidates are included.  (This inclusion
can be toggled at any time from the minibuffer, using `C-M-_'.)

* `*mouse-2 file name*' - Click `mouse-2' on a file name to choose it.
* `*point file name*'   - Use the file name at point (cursor).
* Single-quoted file-name variables - Use the variable's value.

Candidates `*mouse-2 file name*' and `*point file name*' are available
only if library `ffap.el' can be loaded.  A file-name variable has
custom type `file' or (file :must-match t).

If this command was invoked with the mouse, use a file dialog box if
`use-dialog-box' is non-nil, and the window system or X toolkit in use
provides a file dialog box.

See also `read-file-name-completion-ignore-case' (Emacs version &gt; 21)
and `read-file-name-function'.</span>"
  (unwind-protect
       (let* ((ffap-available-p                 (or (require 'ffap- nil t) (require 'ffap nil t)))
              <span class="linecomment">;; The next four prevent slowing down `ffap-guesser'.</span>
              (ffap-alist nil)                  (ffap-machine-p-known 'accept)
              (ffap-url-regexp nil)             (ffap-shell-prompt-regexp nil) 
              (fap
               (if (and (eq major-mode 'dired-mode) (fboundp 'dired-get-file-for-visit))
                   (condition-case nil
                       (abbreviate-file-name (dired-get-file-for-visit))
                     (error nil))
                 (and ffap-available-p (ffap-guesser))))
              (mouse-file                       "<span class="quote">*mouse-2 file name*</span>")
              (icicle-special-candidate-regexp  (or icicle-special-candidate-regexp "<span class="quote">.+/$</span>"))
              (icicle-proxy-candidates
               (append 
                (and icicle-add-proxy-candidates-flag
                     (append (and fap (list "<span class="quote">*point file name*</span>"))
                             (and ffap-available-p (list mouse-file))
                             (let ((ipc  ()))
                               (mapatoms
                                (lambda (cand)
                                  (when (and (user-variable-p cand)
                                             (icicle-var-is-of-type-p
                                              cand '(file (file :must-match t))))
                                    (push (concat "<span class="quote">'</span>" (symbol-name cand) "<span class="quote">'</span>") ipc))))
                               ipc)))
                icicle-proxy-candidates))
              (minibuffer-completing-file-name  t)
              result)

         <span class="linecomment">;;  ;; $$$$$$ Does Emacs 23+ need explicit directory? If so, add these three lines</span>
         <span class="linecomment">;;  (unless dir (setq dir  default-directory))</span>
         <span class="linecomment">;;  (unless (file-name-absolute-p dir) (setq dir  (expand-file-name dir)))</span>
         <span class="linecomment">;;  (setq dir  (abbreviate-file-name dir)) ; Use `~' for home directory.</span>

         (setq result  (icicle-read-file-name-1 prompt dir default-filename
                                                require-match initial-input predicate))
         (when ffap-available-p
           (cond ((save-match-data (string-match "<span class="quote">*point file name\\*$</span>" result))
                  (setq result  fap))
                 ((save-match-data (string-match "<span class="quote">*mouse-2 file name\\*$</span>" result))
                  (setq result
                        (progn (let ((e  (read-event "<span class="quote">Click `mouse-2' on file name</span>")))
                                 (read-event) <span class="linecomment">; Get rid of mouse up event.</span>
                                 (save-excursion
                                   (mouse-set-point e)
                                   (if (and (eq major-mode 'dired-mode)
                                            (fboundp 'dired-get-file-for-visit)) <span class="linecomment">; In `dired+.el'.</span>
                                       (condition-case nil <span class="linecomment">; E.g. error: not on file line (ignore)</span>
                                           (abbreviate-file-name (dired-get-file-for-visit))
                                         (error "<span class="quote">No such file</span>"))
                                     (or (ffap-guesser) (error "<span class="quote">No such file</span>"))))))))))
         (when icicle-unpropertize-completion-result-flag (icicle-unpropertize result))
         (let* ((temp  (member (file-name-nondirectory result) icicle-proxy-candidates))
                (symb  (and temp (intern (substring (car temp) 1 (1- (length (car temp))))))))
           (when (and symb (boundp symb)) (setq result  (symbol-value symb))))
         result)
    (setq icicle-proxy-candidates  ())))

<span class="linecomment">;;;###autoload</span>
(defun icicle-read-file-name-1 (prompt &optional dir default-filename
                                require-match initial-input predicate)
  "<span class="quote">Helper function for `icicle-read-file-name'.</span>"
  (setq icicle-nb-of-other-cycle-candidates  0
        icicle-initial-value                 (or initial-input (if (stringp icicle-initial-value)
                                                                   icicle-initial-value
                                                                 "<span class="quote"></span>")))
  (icicle-fix-default-directory)        <span class="linecomment">; Make sure there are no backslashes in it.</span>
  (unless (string= "<span class="quote"></span>" icicle-initial-value) (setq initial-input  icicle-initial-value))

  <span class="linecomment">;; Maybe use DEFAULT-FILENAME for INITIAL-INPUT also, after removing the directory part.</span>
  <span class="linecomment">;; Note that if DEFAULT-FILENAME is null, then we let INITIAL-INPUT remain null too.</span>
  (when (and icicle-default-value  (not (eq icicle-default-value t))
             default-filename      (string= "<span class="quote"></span>" icicle-initial-value))
    (setq initial-input  (file-name-nondirectory default-filename)))

  <span class="linecomment">;; Override REQUIRE-MATCH as needed.</span>
  (setq require-match           (case icicle-require-match-flag
                                  ((nil) require-match)
                                  (no-match-required nil)
                                  (partial-match-ok t)
                                  (full-match-required 'full-match-required))
        icicle-require-match-p  require-match)
  (icicle-highlight-lighter)
  (let ((read-file-name-function  nil)
        result)
    (let ((minibuffer-prompt-properties
           (and (boundp 'minibuffer-prompt-properties) <span class="linecomment">; Emacs 21+ only</span>
                (icicle-remove-property 'face minibuffer-prompt-properties))))
      (when (&lt; emacs-major-version 21)
        (setq prompt  (concat (and icicle-candidate-action-fn "<span class="quote">+ </span>") prompt)))
      (condition-case nil               <span class="linecomment">; If Emacs 22+, use predicate arg.</span>
          (setq result
                (catch 'icicle-read-top
                  (funcall (or icicle-old-read-file-name-fn 'read-file-name) prompt dir
                           default-filename require-match initial-input predicate)))
        (wrong-number-of-arguments
         (setq result
               (catch 'icicle-read-top
                 (funcall (or icicle-old-read-file-name-fn 'read-file-name) prompt dir
                          default-filename require-match initial-input))))))
    <span class="linecomment">;; HACK.  Without this, when REQUIRE-MATCH is non-nil, *Completions* window</span>
    <span class="linecomment">;; does not disappear.</span>
    (when require-match (icicle-remove-Completions-window))
    result))

(defun icicle-fix-default-directory ()
  "<span class="quote">Convert backslashes in `default-directory' to slashes.</span>"
  <span class="linecomment">;; This is a hack.  If you do `C-x 4 f' from a standalone minibuffer</span>
  <span class="linecomment">;; frame, `default-directory' on MS Windows has this form:</span>
  <span class="linecomment">;; `C:\some-dir/'.  There is a backslash character in the string.  This</span>
  <span class="linecomment">;; is not a problem for standard Emacs, but it is a problem for Icicles,</span>
  <span class="linecomment">;; because we interpret backslashes using regexp syntax - they are not</span>
  <span class="linecomment">;; file separators for Icicles.  So, we call `substitute-in-file-name' to</span>
  <span class="linecomment">;; change all backslashes in `default-directory' to slashes.  This</span>
  <span class="linecomment">;; shouldn't hurt, because `default-directory' is an absolute directory</span>
  <span class="linecomment">;; name - it doesn't contain environment variables.  For example, we</span>
  <span class="linecomment">;; convert `C:\some-dir/' to `c:/some-directory/'."</span>
  (setq default-directory  (icicle-abbreviate-or-expand-file-name
                            (substitute-in-file-name default-directory))))

(defun icicle-remove-property (prop plist)
  "<span class="quote">Remove property PROP from property-list PLIST, non-destructively.
Returns the modified copy of PLIST.</span>"
  (let ((cpy     plist)
        (result  ()))
    (while cpy
      (unless (eq prop (car cpy)) (setq result  `(,(cadr cpy) ,(car cpy) ,@result)))
      (setq cpy  (cddr cpy)))
    (nreverse result)))


<span class="linecomment">;; REPLACE ORIGINAL `read-from-minibuffer' (built-in function),</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Respect `icicle-default-value'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; We use M@R%M=X!L$S+P&L^T*Z instead of HIST, to avoid name capture by</span>
<span class="linecomment">;; `minibuffer-history-variable's value.  If we didn't need to be Emacs 20-compatible, then we</span>
<span class="linecomment">;; could employ `#1=#:hist'...`#1#'...`#1' read syntax to use an uninterned symbol.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-read-from-minibuffer)
(fset 'old-read-from-minibuffer (symbol-function 'read-from-minibuffer)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-read-from-minibuffer (prompt &optional initial-contents keymap read
                                    m@r%m=x!l$s+p&l^t*z default-value inherit-input-method)
  "<span class="quote">Read a string from the minibuffer, prompting with string PROMPT.
The optional second arg INITIAL-CONTENTS is an alternative to
  DEFAULT-VALUE.  Vanilla Emacs considers it to be obsolete, but
  Icicles does not.  It is discussed in more detail below.
Third arg KEYMAP is a keymap to use while reading;
  if omitted or nil, the default is `minibuffer-local-map'.
If fourth arg READ is non-nil, then interpret the result as a Lisp object
  and return that object:
  in other words, do `(car (read-from-string INPUT-STRING))'
Fifth arg HIST, if non-nil, specifies a history list and optionally
  the initial position in the list.  It can be a symbol, which is the
  history list variable to use, or it can be a cons cell
  (HISTVAR . HISTPOS).  In that case, HISTVAR is the history list variable
  to use, and HISTPOS is the initial position for use by the minibuffer
  history commands.  For consistency, you should also specify that
  element of the history as the value of INITIAL-CONTENTS.  Positions
  are counted starting from 1 at the beginning of the list.
Sixth arg DEFAULT-VALUE is the default value.  If non-nil, it is available
  for history commands; but, unless READ is non-nil, `read-from-minibuffer'
  does NOT return DEFAULT-VALUE if the user enters empty input!  It returns
  the empty string.  DEFAULT-VALUE can be a string or a list of strings.
  These  become the minibuffer's future history, available using `M-n'.
Seventh arg INHERIT-INPUT-METHOD, if non-nil, means the minibuffer inherits
 the current input method and the setting of `enable-multibyte-characters'.
Eighth arg KEEP-ALL, if non-nil, says to put all inputs in the history list,
 even empty or duplicate inputs.  This is available starting with Emacs 22.
If the variable `minibuffer-allow-text-properties' is non-nil,
 then the string which is returned includes whatever text properties
 were present in the minibuffer.  Otherwise the value has no text properties.

Option `icicle-default-value' controls how the default value, DEF, is
treated.

The remainder of this documentation string describes the
INITIAL-CONTENTS argument in more detail.  If non-nil,
INITIAL-CONTENTS is a string to be inserted into the minibuffer before
reading input.  Normally, point is put at the end of that string.
However, if INITIAL-CONTENTS is (STRING . POSITION), the initial input
is STRING, but point is placed at one-indexed position POSITION in the
minibuffer.  Any integer value less than or equal to one puts point at
the beginning of the string.  *Note* that this behavior differs from
the way such arguments are used in `completing-read' and some related
functions, which use zero-indexing for POSITION.</span>"
  (unless initial-contents (setq initial-contents  "<span class="quote"></span>"))
  <span class="linecomment">;; Emacs 23 allows DEFAULT-VALUE to be a list of strings - use the first one for prompt etc.</span>
  (let ((def-value  (if (consp default-value) (car default-value) default-value)))
    <span class="linecomment">;; Maybe use DEFAULT-VALUE for INITIAL-CONTENTS also.</span>
    (when (and icicle-default-value (not (eq icicle-default-value t))
               def-value (stringp initial-contents)
               (string= "<span class="quote"></span>" initial-contents))
      (setq initial-contents  (if (integerp def-value) <span class="linecomment">; Character</span>
                                  (char-to-string def-value)
                                def-value)))
    (when (and def-value (eq icicle-default-value t)) <span class="linecomment">; Add DEFAULT-VALUE to PROMPT.</span>
      (setq prompt  (if (string-match "<span class="quote">\\(.*\\)\\(: *\\)$</span>" prompt)
                        (concat (substring prompt (match-beginning 1) (match-end 1)) "<span class="quote"> (</span>" def-value
                                "<span class="quote">)</span>" (substring prompt (match-beginning 2) (match-end 2)))
                      (concat prompt def-value)))))
  (let ((on-demand-map  (and keymap (make-sparse-keymap))))
    (when on-demand-map (set-keymap-parent on-demand-map keymap)
          (when icicle-complete-on-demand-cmd
            (dolist (key  icicle-complete-on-demand-keys)
              (define-key on-demand-map key icicle-complete-on-demand-cmd))))
    (old-read-from-minibuffer prompt initial-contents on-demand-map read
                              m@r%m=x!l$s+p&l^t*z default-value inherit-input-method)))


<span class="linecomment">;; REPLACE ORIGINAL `read-number' defined in `subr.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;; 1. Let user enter a numeric variable name, for its value.  Allow completion.</span>
<span class="linecomment">;; 2. Allow for `replace-regexp-in-string' not being defined.</span>
<span class="linecomment">;; 3. Allow for error reading input.</span>
<span class="linecomment">;; 4. Call `ding' if not a number, and don't redisplay for `sit-for'.</span>
<span class="linecomment">;;</span>
(when (fboundp 'read-number)
(or (fboundp 'old-read-number)
(fset 'old-read-number (symbol-function 'read-number)))

(defun icicle-read-number (prompt &optional default)
  "<span class="quote">Read a number in the minibuffer, prompting with PROMPT (a string).
DEFAULT is returned if the user hits `RET' without typing anything.

If option `icicle-add-proxy-candidates-flag' is non-nil, the user can
also enter the name of a numeric variable - its value is returned.
Completion is available for this.  A numeric variable is a variable
whose value or whose custom type is compatible with type `integer',
`number', or `float'.</span>"
  (unwind-protect
       (let ((num  nil)
             (icicle-proxy-candidates
              (and icicle-add-proxy-candidates-flag
                   (let ((ipc ()))
                     (mapatoms
                      (lambda (cand)
                        (when (and (user-variable-p cand)
                                   (icicle-var-is-of-type-p cand (if (&gt;= emacs-major-version 22)
                                                                     '(number integer float)
                                                                   '(number integer))))
                          (push (symbol-name cand) ipc))))
                     ipc)))
             
             <span class="linecomment">;; Emacs 23 allows DEFAULT to be a list of strings - use the first one for prompt etc.</span>
             (default1  (if (consp default) (car default) default)))
         (when default
           (save-match-data
             (setq prompt  (cond ((string-match "<span class="quote">\\(\\):[ \t]*\\'</span>" prompt)
                                  (replace-match (format "<span class="quote"> (default %s)</span>" default1) t t prompt 1))
                                 ((fboundp 'replace-regexp-in-string)
                                  (replace-regexp-in-string
                                   "<span class="quote">[ \t]*\\'</span>" (format "<span class="quote"> (default %s) </span>" default1) prompt t t))
                                 (t prompt)))))
         (when icicle-proxy-candidates (put-text-property 0 1 'icicle-fancy-candidates t prompt))
         (while (progn
                  (let ((str  (completing-read prompt nil nil nil nil nil
                                               (if (consp default)
                                                   (mapcar #'number-to-string default)
                                                 (and default1 (number-to-string default1)))))
                        temp)
                    (setq num  (cond ((zerop (length str)) default1)
                                     ((setq temp  (member str icicle-proxy-candidates))
                                      (symbol-value (intern (car temp))))
                                     ((stringp str) (condition-case nil (read str) (error nil))))))
                  (unless (numberp num)
                    (icicle-ding) (message "<span class="quote">Not a number.  Try again.</span>") (sit-for 0.5 nil t)
                    t)))
         num)
    (setq icicle-proxy-candidates  ())))
)

<span class="linecomment">;; Can't replace standard `read-char-exclusive' with this, because, starting with Emacs 22, it has</span>
<span class="linecomment">;; an optional SECONDS arg that cannot be simulated using `completing-read'.</span>
(defun icicle-read-char-exclusive (prompt &optional inherit-input-method)
  "<span class="quote">Read a character in the minibuffer, prompting with PROMPT (a string).
It is returned as a number.
Optional arg INHERIT-INPUT-METHOD is as for `completing-read'.

If option `icicle-add-proxy-candidates-flag' is non-nil, the user can
also enter the name of a character variable - its value is returned.
Completion is available for this.  A character variable is a variable
whose value is compatible with type `character'.</span>"
  (unwind-protect
       (let* ((char  nil)
              (icicle-proxy-candidates
               (and icicle-add-proxy-candidates-flag
                    (let ((ipc  ()))
                      (mapatoms (lambda (cand)
                                  (when (and (user-variable-p cand)
                                             (icicle-var-is-of-type-p cand '(character)))
                                    (push (symbol-name cand) ipc))))
                      ipc)))
              str temp)
         (when icicle-proxy-candidates (put-text-property 0 1 'icicle-fancy-candidates t prompt))
         (setq str   (completing-read prompt nil nil nil nil nil nil inherit-input-method)
               char  (cond ((zerop (length str)) (error "<span class="quote">No character read</span>"))
                           ((setq temp  (member str icicle-proxy-candidates))
                            (symbol-value (intern (car temp))))
                           ((stringp str)
                            (condition-case nil
                                (progn (when (&gt; (length str) 1)
                                         (message "<span class="quote">First char is used: `%c'</span>"
                                                  (elt str 0)) (sit-for 2))
                                       (elt str 0))
                              (error nil)))))
         char)
    (setq icicle-proxy-candidates  ())))

(defun icicle-read-string-completing (prompt &optional default pred hist)
  "<span class="quote">Read a string in the minibuffer, prompting with PROMPT (a string).
If the user hits `RET' without typing anything, return DEFAULT, or \"\"
  if DEFAULT is nil.
PRED is a predicate that filters the variables available for completion.
HIST is the history list to use, as for `completing-read'.

If option `icicle-add-proxy-candidates-flag' is non-nil, the user can
also enter the name of a string variable - its value is returned.
Completion is available for this.  A string variable is a variable
whose value or whose custom type is compatible with type `string'.</span>"
  (unwind-protect
       (let ((strg  nil)
             (icicle-proxy-candidates
              (and icicle-add-proxy-candidates-flag
                   (let ((ipc ()))
                     (mapatoms (lambda (cand)
                                 (when (and (user-variable-p cand)
                                            (icicle-var-is-of-type-p cand '(string color regexp)))
                                   (push (symbol-name cand) ipc))))
                     ipc)))
             <span class="linecomment">;; Emacs 23 allows DEFAULT to be a list of strings - use the first one for prompt etc.</span>
             (default1  (if (consp default) (car default) default)))
         (when default
           (save-match-data 
             (setq prompt  (cond ((string-match "<span class="quote">\\(\\):[ \t]*\\'</span>" prompt)
                                  (replace-match (format "<span class="quote"> (default %s)</span>" default1) t t prompt 1))
                                 ((fboundp 'replace-regexp-in-string)
                                  (replace-regexp-in-string
                                   "<span class="quote">[ \t]*\\'</span>" (format "<span class="quote"> (default %s) </span>" default1) prompt t t))
                                 (t prompt)))))
         (when icicle-proxy-candidates (put-text-property 0 1 'icicle-fancy-candidates t prompt))
         (let ((strg-read  (completing-read
                            prompt nil pred nil
                            (and (consp hist) (nth (cdr hist) (symbol-value (car hist))))
                            hist default))
               temp)
           (setq strg  (cond ((zerop (length strg-read)) (or default1 "<span class="quote"></span>"))
                             ((setq temp  (member strg-read icicle-proxy-candidates))
                              (setq temp  (symbol-value (intern (car temp))))
                              (cond ((and (symbolp hist) (consp (symbol-value hist)))
                                     (setcar (symbol-value hist) temp))
                                    ((and (consp hist) (symbolp (car hist))
                                          (consp (symbol-value (car hist))))
                                     (setcar (symbol-value (car hist)) temp)))
                              temp)
                             (t strg-read))))
         strg)
    (setq icicle-proxy-candidates  ())))

<span class="linecomment">;; Same as `help-var-is-of-type-p'.</span>
(defun icicle-var-is-of-type-p (variable types &optional mode)
  "<span class="quote">Return non-nil if VARIABLE satisfies one of the custom types in TYPES.
TYPES is a list of `defcustom' type sexps or a list of regexp strings.
TYPES are matched, in order, against VARIABLE's type definition or
VARIABLE's current value, until one is satisfied or all are tried.

If TYPES is a list of regexps, then each is regexp-matched against
VARIABLE's custom type.

Otherwise, TYPES is a list of type sexps, each of which is a
definition acceptable for `defcustom' :type or the first symbol of
such a definition (e.g. `choice').  In this case, two kinds of type
comparison are possible:

1. VARIABLE's custom type, or its first symbol, is matched using
  `equal' against each type in TYPES.

2. VARIABLE's current value is checked against each type in TYPES to
   see if it satisfies one of them.  In this case, VARIABLE's own type
   is not used; VARIABLE might not even be typed - it could be a
   variable not defined using `defcustom'.

For any of the comparisons against VARIABLE's type, either that type
can be checked directly or its supertypes (inherited types) can also
be checked.

These different type-checking possibilities depend on the value of
argument MODE, as follows, and they determine the meaning of the
returned value:

`direct':   VARIABLE's type matches a member of list TYPES
`inherit':  VARIABLE's type matches or is a subtype of a TYPES member
`value':    VARIABLE is bound, and its value satisfies a type in TYPES
`inherit-or-value': `inherit' or `value', tested in that order
`direct-or-value':  `direct' or `value', tested in that order
anything else (default): `inherit'

VARIABLE's current value cannot satisfy a regexp type: it is
impossible to know which concrete types a value must match.</span>"
  (case mode
    ((nil inherit)     (icicle-var-inherits-type-p variable types))
    (inherit-or-value  (or (icicle-var-inherits-type-p variable types)
                           (icicle-var-val-satisfies-type-p variable types)))
    (value             (icicle-var-val-satisfies-type-p variable types))
    (direct            (icicle-var-matches-type-p variable types))
    (direct-or-value   (or (member (get variable 'custom-type) types)
                           (icicle-var-val-satisfies-type-p variable types)))
    (otherwise         (icicle-var-inherits-type-p variable types))))

(defun icicle-var-matches-type-p (variable types)
  "<span class="quote">VARIABLE's type matches a member of TYPES.</span>"
  (catch 'icicle-type-matches
    (let ((var-type  (get variable 'custom-type)))
      (dolist (type types)
        (when (if (stringp type)
                  (save-match-data
                    (string-match type (format "<span class="quote">%s</span>" (format "<span class="quote">%S</span>" var-type))))
                (equal var-type type))
          (throw 'icicle-type-matches t))))
    nil))

(defun icicle-var-inherits-type-p (variable types)
  "<span class="quote">VARIABLE's type matches or is a subtype of a member of list TYPES.</span>"
  (catch 'icicle-type-inherits
    (let ((var-type  (get variable 'custom-type)))
      (dolist (type types)
        (while var-type
          (when (or (and (stringp type)
                         (save-match-data (string-match type (format "<span class="quote">%s</span>" (format "<span class="quote">%S</span>" var-type)))))
                    (equal type var-type))
            (throw 'icicle-type-inherits t))
          (when (consp var-type) (setq var-type  (car var-type)))
          (when (or (and (stringp type)
                         (save-match-data (string-match type (format "<span class="quote">%s</span>" (format "<span class="quote">%S</span>" var-type)))))
                    (equal type var-type))
            (throw 'icicle-type-inherits t))
          (setq var-type  (car (get var-type 'widget-type))))
        (setq var-type  (get variable 'custom-type))))
    nil))

(defun icicle-var-val-satisfies-type-p (variable types)
  "<span class="quote">VARIABLE is bound, and its value satisfies a type in the list TYPES.</span>"
  (and (boundp variable)
       (let ((val  (symbol-value variable)))
         (and (widget-convert (get variable 'custom-type))
              (icicle-value-satisfies-type-p val types)))))

(defun icicle-value-satisfies-type-p (value types)
  "<span class="quote">Return non-nil if VALUE satisfies a type in the list TYPES.</span>"
  (catch 'icicle-type-value-satisfies
    (dolist (type types)
      (unless (stringp type)            <span class="linecomment">; Skip, for regexp type.</span>
        (setq type  (widget-convert type))
        <span class="linecomment">;; Satisfies if either :match or :validate.</span>
        (when (condition-case nil
                  (progn (when (and (widget-get type :match)
                                    (widget-apply type :match value))
                           (throw 'icicle-type-value-satisfies t))
                         (when (and (widget-get type :validate)
                                    (progn (widget-put type :value value)
                                           (not (widget-apply type :validate))))
                           (throw 'icicle-type-value-satisfies t)))
                (error nil))
          (throw 'icicle-type-value-satisfies t))))
    nil))

(defun icicle-custom-type (variable)
  "<span class="quote">Returns the `defcustom' type of VARIABLE.
Returns nil if VARIABLE is not a user option.

Note: If the library that defines VARIABLE has not yet been loaded,
then `icicle-custom-type' loads it.  Be sure you want to do that
before you call this function.</span>"
  (and (custom-variable-p variable)
       (or (get variable 'custom-type) (progn (custom-load-symbol variable)
                                              (get variable 'custom-type)))))


<span class="linecomment">;; REPLACE ORIGINAL `read-string' (built-in function),</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Respect `icicle-default-value' (via use of `read-from-minibuffer').</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; We use M@R%M=X!L$S+P&L^T*Z instead of HISTORY, to avoid name capture by</span>
<span class="linecomment">;; `minibuffer-history-variable's value.  If we didn't need to be Emacs 20-compatible, then we</span>
<span class="linecomment">;; could employ `#1=#:hist'...`#1#'...`#1' read syntax to use an uninterned symbol.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-read-string)
(fset 'old-read-string (symbol-function 'read-string)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-read-string (prompt &optional initial-input m@r%m=x!l$s+p&l^t*z
                           default-value inherit-input-method)
  "<span class="quote">Read a string from the minibuffer, prompting with string PROMPT.
If non-nil, second arg INITIAL-INPUT is a string to insert before reading.
  Vanilla Emacs considers it to be obsolete, but Icicles does not.  It
  behaves like argument INITIAL-CONTENTS in `read-from-minibuffer'.
  See the documentation string of `read-from-minibuffer' for details.
The third arg HISTORY, if non-nil, specifies a history list
  and optionally the initial position in the list.
  See `read-from-minibuffer' for details of HISTORY argument.
Fourth arg DEFAULT-VALUE is the default value.  If non-nil, it is used
 for history commands, and as the value to return if the user enters
 the empty string.
Fifth arg INHERIT-INPUT-METHOD, if non-nil, means the minibuffer inherits
 the current input method and the setting of enable-multibyte-characters.</span>"
  (let ((value  (read-from-minibuffer prompt initial-input nil nil m@r%m=x!l$s+p&l^t*z
                                      default-value inherit-input-method)))
    (if (and default-value (equal value "<span class="quote"></span>")) default-value value)))


<span class="linecomment">;; REPLACE ORIGINAL `read-face-name' in `faces.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Show face names in *Completions* with the faces they name.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-read-face-name)
(fset 'old-read-face-name (symbol-function 'read-face-name)))

<span class="linecomment">;;;###autoload</span>
(cond ((&lt; emacs-major-version 21)
       (defun icicle-read-face-name (prompt) <span class="linecomment">; Emacs 20</span>
         "<span class="quote">Read a face name with completion and return its face symbol.
PROMPT is the prompt.

If option `icicle-add-proxy-candidates-flag' is non-nil, then you can
also enter the name of a face-name variable - its value is returned.
A face-name variable is a variable with custom-type `face'.

If library `eyedropper.el' is used, then you can also choose proxy
candidate `*point face name*' to use the face at point.</span>"
         (require 'eyedropper nil t)
         (let ((icicle-list-nth-parts-join-string  "<span class="quote">: </span>")
               (icicle-list-join-string            "<span class="quote">: </span>")
               (icicle-list-end-string             "<span class="quote"></span>")
               (icicle-list-use-nth-parts          '(1))
               (icicle-proxy-candidates
                (and icicle-add-proxy-candidates-flag
                     (append
                      (and (fboundp 'eyedrop-face-at-point) (list "<span class="quote">*point face name*</span>"))
                      (let ((ipc  ()))
                        (mapatoms
                         (lambda (cand)
                           (when (and (user-variable-p cand) (eq (get cand 'custom-type) 'face))
                             (push `,(concat "<span class="quote">'</span>" (symbol-name cand) "<span class="quote">'</span>") ipc))))
                        ipc))))
               face)
           (put-text-property 0 1 'icicle-fancy-candidates t prompt)
           (while (= (length face) 0)
             (setq face  (icicle-transform-multi-completion
                          (completing-read prompt (mapcar #'icicle-make-face-candidate (face-list))
                                           nil (not (stringp icicle-WYSIWYG-Completions-flag)) nil
                                           (if (boundp 'face-name-history)
                                               'face-name-history
                                             'icicle-face-name-history)))))
           (let ((proxy  (car (member face icicle-proxy-candidates))))
             (cond ((save-match-data (string-match "<span class="quote">*point face name\\*$</span>" face))
                    (eyedrop-face-at-point))
                   (proxy (symbol-value (intern (substring proxy 1 (1- (length proxy))))))
                   (t (intern face)))))))
      ((= emacs-major-version 21)       <span class="linecomment">; Emacs 21</span>
       (defun icicle-read-face-name (prompt)
         "<span class="quote">Read a face name with completion and return its face symbol.
PROMPT is the prompt.

If option `icicle-add-proxy-candidates-flag' is non-nil, then you can
also enter the name of a face-name variable - its value is returned.
A face-name variable is a variable with custom-type `face'.

If library `eyedropper.el' is used, then you can also choose proxy
candidate `*point face name*' to use the face at point.</span>"
         (require 'eyedropper nil t)
         (let ((icicle-list-nth-parts-join-string  "<span class="quote">: </span>")
               (icicle-list-join-string            "<span class="quote">: </span>")
               (icicle-list-end-string             "<span class="quote"></span>")
               (icicle-list-use-nth-parts          '(1))
               (icicle-proxy-candidates
                (and icicle-add-proxy-candidates-flag
                     (append
                      (and (fboundp 'eyedrop-face-at-point) (list "<span class="quote">*point face name*</span>"))
                      (let ((ipc ()))
                        (mapatoms
                         (lambda (cand)
                           (when (and (user-variable-p cand) (eq (get cand 'custom-type) 'face))
                             (push `,(concat "<span class="quote">'</span>" (symbol-name cand) "<span class="quote">'</span>") ipc))))
                        ipc))))
               (face-list  (face-list))
               (def        (thing-at-point 'symbol))
               face)
           (cond ((assoc def face-list)
                  (setq prompt  (concat prompt "<span class="quote"> (default </span>" def "<span class="quote">): </span>")))
                 (t (setq def     nil
                          prompt  (concat prompt "<span class="quote">: </span>"))))
           (put-text-property 0 1 'icicle-fancy-candidates t prompt)
           (while (equal "<span class="quote"></span>" (setq face  (icicle-transform-multi-completion
                                         (completing-read
                                          prompt (mapcar #'icicle-make-face-candidate face-list) nil
                                          (not (stringp icicle-WYSIWYG-Completions-flag)) nil
                                          (if (boundp 'face-name-history)
                                              'face-name-history
                                            'icicle-face-name-history)
                                          def)))))
           (let ((proxy  (car (member face icicle-proxy-candidates))))
             (cond ((save-match-data (string-match "<span class="quote">*point face name\\*$</span>" face))
                    (eyedrop-face-at-point))
                   (proxy (symbol-value (intern (substring proxy 1 (1- (length proxy))))))
                   (t (intern face)))))))
      (t                                <span class="linecomment">; Emacs 22</span>
       (defun icicle-read-face-name (prompt &optional string-describing-default multiple)
         "<span class="quote">Read a face name with completion and return its face symbol
By default, use the face(s) on the character after point.  If that
character has the property `read-face-name', that overrides the `face'
property.

PROMPT should be a string that describes what the caller will do with the face;
  it should not end in a space.
STRING-DESCRIBING-DEFAULT should describe what default the caller will use if
  the user just types RET; you can omit it.
If MULTIPLE is non-nil, return a list of faces (possibly only one).
Otherwise, return a single face.

If option `icicle-add-proxy-candidates-flag' is non-nil, then you can
also enter the name of a face-name variable - its value is returned.
A face-name variable is a variable with custom-type `face'.

If library `palette.el' or `eyedropper.el' is used, then you can also
choose proxy candidate `*point face name*' to use the face at point.</span>"
         (or (require 'palette nil t) (require 'eyedropper nil t))
         (let ((faceprop       (or (get-char-property (point) 'read-face-name)
                                   (get-char-property (point) 'face)))
               (aliasfaces     ())
               (nonaliasfaces  ())
               (icicle-proxy-candidates
                (and icicle-add-proxy-candidates-flag
                     (let ((ipc  ()))
                       (mapatoms
                        (lambda (cand)
                          (when (and (user-variable-p cand) (eq (get cand 'custom-type) 'face))
                            (push `,(concat "<span class="quote">'</span>" (symbol-name cand) "<span class="quote">'</span>") ipc))))
                       ipc)))
               faces)
           <span class="linecomment">;; Undo Emacs 22 brain-dead treatment of PROMPT arg.</span>
           (when (save-match-data (string-match "<span class="quote">: $</span>" prompt))
             (setq prompt  (substring prompt 0 -2)))
           <span class="linecomment">;; Try to get a face name from the buffer.</span>
           (when (memq (intern-soft (thing-at-point 'symbol)) (face-list))
             (setq faces  (list (intern-soft (thing-at-point 'symbol)))))
           <span class="linecomment">;; Add the named faces that the `face' property uses.</span>
           (if (and (consp faceprop)
                    <span class="linecomment">;; Don't treat an attribute spec as a list of faces.</span>
                    (not (keywordp (car faceprop)))
                    (not (memq (car faceprop) '(foreground-color background-color))))
               (dolist (f faceprop) (when (symbolp f) (push f faces)))
             (when (and faceprop (symbolp faceprop)) (push faceprop faces)))
           (delete-dups faces)
           (cond (multiple
                  <span class="linecomment">;; We leave this branch as it is.  Icicles does nothing special with</span>
                  <span class="linecomment">;; `completing-read-multiple'.</span>
                  (require 'crm)
                  (mapatoms (lambda (s) (when (custom-facep s) <span class="linecomment">; Build up the completion tables.</span>
                                          (if (get s 'face-alias)
                                              (push (symbol-name s) aliasfaces)
                                            (push (symbol-name s) nonaliasfaces)))))
                  (let* ((input   (completing-read-multiple <span class="linecomment">; Read the input.</span>
                                   (if (or faces string-describing-default)
                                       (format "<span class="quote">%s (default %s): </span>"
                                               prompt (if faces
                                                          (mapconcat 'symbol-name faces "<span class="quote">,</span>")
                                                        string-describing-default))
                                     (format "<span class="quote">%s: </span>" prompt))
                                   <span class="linecomment">;; This lambda expression is the expansion of Emacs 22 macro</span>
                                   <span class="linecomment">;; (complete-in-turn nonaliasfaces aliasfaces).  We expand it so</span>
                                   <span class="linecomment">;; this can be compiled also in Emacs &lt; 22 to work for Emacs 22.</span>
                                   (lambda (string predicate mode)
                                     (cond ((eq mode t)
                                            (or (all-completions string nonaliasfaces predicate)
                                                (all-completions string aliasfaces predicate)))
                                           ((eq mode nil)
                                            (or (try-completion string nonaliasfaces predicate)
                                                (try-completion string aliasfaces predicate)))
                                           (t
                                            (or (test-completion string nonaliasfaces predicate)
                                                (test-completion string aliasfaces predicate)))))
                                   nil t nil (if (boundp 'face-name-history)
                                                 'face-name-history
                                               'icicle-face-name-history)
                                   (and faces (mapconcat 'symbol-name faces "<span class="quote">,</span>"))))
                         (output  (cond ((or (equal input "<span class="quote"></span>") (equal input '("<span class="quote"></span>"))) <span class="linecomment">; Canonicalize.</span>
                                         faces)
                                        ((stringp input)
                                         (mapcar 'intern (split-string input "<span class="quote">, *</span>" t)))
                                        ((listp input)
                                         (mapcar 'intern input))
                                        (input))))
                    output))            <span class="linecomment">; Return the list of faces</span>
                 (t
                  (when (consp faces) (setq faces  (list (car faces))))
                  (let ((icicle-list-nth-parts-join-string  "<span class="quote">: </span>")
                        (icicle-list-join-string            "<span class="quote">: </span>")
                        (icicle-list-end-string             "<span class="quote"></span>")
                        (icicle-list-use-nth-parts          '(1))
                        (face-list                          (face-list))
                        (def                                (if faces
                                                                (mapconcat 'symbol-name faces "<span class="quote">,</span>")
                                                              string-describing-default))
                        face)
                    (put-text-property 0 1 'icicle-fancy-candidates t prompt)
                    (while (equal "<span class="quote"></span>" (setq face
                                           (icicle-transform-multi-completion
                                            (completing-read
                                             (if def
                                                 (format "<span class="quote">%s (default %s): </span>" prompt def)
                                               (format "<span class="quote">%s: </span>" prompt))
                                             (mapcar #'icicle-make-face-candidate face-list)
                                             nil (not (stringp icicle-WYSIWYG-Completions-flag))
                                             nil (if (boundp 'face-name-history)
                                                     'face-name-history
                                                   'icicle-face-name-history)
                                             def)))))
                    (let ((proxy  (car (member face icicle-proxy-candidates))))
                      (if proxy
                          (symbol-value (intern (substring proxy 1 (1- (length proxy)))))
                        (intern face))))))))))

(defun icicle-make-face-candidate (face)
  "<span class="quote">Return a completion candidate for FACE.
The value of option `icicle-WYSIWYG-Completions-flag' determines the
kind of candidate to use.
 If nil, then the face name is used (a string).

 If a string, then a multi-completion candidate is used, with the face
 name followed by a sample swatch using FACE on the string's text.

 If t, then the candidate is the face name itself, propertized with
FACE.</span>"
  (if (stringp icicle-WYSIWYG-Completions-flag)
      (let ((swatch  (copy-sequence icicle-WYSIWYG-Completions-flag)))
        (put-text-property 0 (length icicle-WYSIWYG-Completions-flag) 'face face swatch)
        (list (list (symbol-name face) swatch)))
    (let ((face-name  (copy-sequence (symbol-name face))))
      (when icicle-WYSIWYG-Completions-flag
        (put-text-property 0 (length face-name) 'face face face-name))
      (list face-name))))


<span class="linecomment">;; REPLACE ORIGINAL `face-valid-attribute-values' in `faces.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Show color names in *Completions* with the (background) colors they name.</span>
<span class="linecomment">;; This is really so that commands such as `modify-face' take advantage of colored candidates.</span>
<span class="linecomment">;; We don't bother to try the same thing for Emacs 20, but the fix (directly to `modify-face') is</span>
<span class="linecomment">;; similar and trivial.</span>
<span class="linecomment">;;</span>
(when (fboundp 'face-valid-attribute-values) <span class="linecomment">; Emacs 21+.</span>
  (or (fboundp 'old-face-valid-attribute-values)
      (fset 'old-face-valid-attribute-values (symbol-function 'face-valid-attribute-values)))

<span class="linecomment">;;;###autoload</span>
  (defun icicle-face-valid-attribute-values (attribute &optional frame)
    "<span class="quote">Return valid values for face attribute ATTRIBUTE.
The optional argument FRAME is used to determine available fonts
and colors.  If it is nil or not specified, the selected frame is
used.  Value is an alist of (NAME . VALUE) if ATTRIBUTE expects a value
out of a set of discrete values.  Value is `integerp' if ATTRIBUTE expects
an integer value.</span>"
    (let ((valid
           (case attribute
             (:family (if window-system
                          (mapcar #'(lambda (x) (cons (car x) (car x)))
                                  (if (fboundp 'font-family-list)
                                      (font-family-list)
                                    (x-font-family-list)))
                        <span class="linecomment">;; Only one font on TTYs.</span>
                        (list (cons "<span class="quote">default</span>" "<span class="quote">default</span>"))))
             ((:width :weight :slant :inverse-video)
              (mapcar #'(lambda (x) (cons (symbol-name x) x))
                      (internal-lisp-face-attribute-values attribute)))
             ((:underline :overline :strike-through :box)
              (if window-system
                  (nconc (mapcar #'(lambda (x) (cons (symbol-name x) x))
                                 (internal-lisp-face-attribute-values attribute))
                         (mapcar #'(lambda (c) (cons c c))
                                 (mapcar #'icicle-color-name-w-bg (x-defined-colors frame))))
                (mapcar #'(lambda (x) (cons (symbol-name x) x))
                        (internal-lisp-face-attribute-values attribute))))
             ((:foreground :background)
              (mapcar #'(lambda (c) (cons c c))
                      (mapcar #'icicle-color-name-w-bg (x-defined-colors frame))))
             ((:height) 'integerp)
             (:stipple (and (memq window-system '(x w32 mac))
                            (mapcar #'list (apply #'nconc (mapcar (lambda (dir)
                                                                    (and (file-readable-p dir)
                                                                         (file-directory-p dir)
                                                                         (directory-files dir)))
                                                                  x-bitmap-file-path)))))
             (:inherit (cons '("<span class="quote">none</span>" . nil) (mapcar #'(lambda (c) (cons (symbol-name c) c))
                                                     (face-list))))
             (t
              (error "<span class="quote">Internal error</span>")))))
      (if (and (listp valid) (not (memq attribute '(:inherit))))
          (nconc (list (cons "<span class="quote">unspecified</span>" 'unspecified)) valid)
        valid)))

  (defun icicle-color-name-w-bg (color-name)
    "<span class="quote">Return copy of string COLOR-NAME with its background of that color.
If `hexrgb.el' is not loaded, then just return COLOR-NAME.</span>"
    (if (featurep 'hexrgb)
        (let ((propertized-name  (copy-sequence color-name)))
          (put-text-property 0 (length propertized-name)
                             'face (cons 'background-color
                                         (hexrgb-color-name-to-hex color-name))
                             propertized-name)
          propertized-name)
      color-name)))


<span class="linecomment">;; REPLACE ORIGINAL `completing-read-multiple' stuff in `crm.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Essentially, we just inhibit Icicles features for Icicle mode.</span>
<span class="linecomment">;;</span>
(eval-after-load "<span class="quote">crm</span>"
  '(progn
    (when (fboundp 'crm-init-keymaps) (crm-init-keymaps)) <span class="linecomment">; Emacs 22, but not 23.</span>
    <span class="linecomment">;; Save vanilla CRM stuff as `old-' stuff.</span>
    (or (fboundp 'old-completing-read-multiple)
     (fset 'old-completing-read-multiple (symbol-function 'completing-read-multiple)))
    (defvar old-crm-local-completion-map crm-local-completion-map "<span class="quote">Original CRM completion map.</span>")
    (defvar old-crm-local-must-match-map crm-local-must-match-map "<span class="quote">Original CRM must-match map.</span>")

    <span class="linecomment">;; Define CRM stuff to use in Icicle mode.  Basically, just inhibit Icicles features.</span>
    (defun icicle-completing-read-multiple (prompt collection &optional predicate require-match
                                            initial-input hist def inherit-input-method)
      "<span class="quote">Read multiple strings in the minibuffer, with completion.
By using this functionality, a user may specify multiple strings at a
single prompt, optionally using completion.

Multiple strings are specified by separating each of the strings with
a prespecified separator character.  For example, if the separator
character is a comma, the strings 'alice', 'bob', and 'eve' would be
specified as 'alice,bob,eve'.

The default value for the separator character is the value of
`crm-default-separator' (comma).  The separator character may be
changed by modifying the value of `crm-separator'.

Contiguous strings of non-separator-characters are referred to as
'elements'.  In the aforementioned example, the elements are: 'alice',
'bob', and 'eve'.

Completion is available on a per-element basis.  For example, if the
contents of the minibuffer are 'alice,bob,eve' and point is between
'l' and 'i', pressing TAB operates on the element 'alice'.

The return value of this function is a list of the read strings.

See the documentation for `completing-read' for details on the
arguments: PROMPT, COLLECTION, PREDICATE, REQUIRE-MATCH,
INITIAL-INPUT, HIST, DEF, and INHERIT-INPUT-METHOD.</span>"
      (let ((icicle-highlight-input-completion-failure  nil))
        (old-completing-read-multiple prompt collection predicate require-match
                                      initial-input hist def inherit-input-method)))

    <span class="linecomment">;; Helper function - workaround because of a lack of multiple inheritance for keymaps.</span>
    (defun icicle-define-crm-completion-map (map)
      "<span class="quote">Make basic bindings for keymap MAP, a crm completion map.</span>"
      (set-keymap-parent map minibuffer-local-completion-map)
      (define-key map [remap minibuffer-complete] <span class="linecomment">; Emacs 22, 23.</span>
        (if (fboundp 'crm-complete) #'crm-complete #'crm-minibuffer-complete))
      (when (fboundp 'crm-complete-word)
        (define-key map [remap minibuffer-complete-word] #'crm-complete-word))
      (when (and (boundp 'icicle-word-completion-keys) (fboundp 'crm-complete-word))
        (dolist (key icicle-word-completion-keys) (define-key map key #'crm-complete-word)))
      (define-key map [remap minibuffer-completion-help] <span class="linecomment">; Emacs 22, 23.</span>
        (if (fboundp 'crm-completion-help) #'crm-completion-help #'crm-minibuffer-completion-help))
      (define-key map "<span class="quote">?</span>" #'crm-completion-help) <span class="linecomment">; Put back `?' as help (self-insert for Icicles).</span>
      (when (boundp 'icicle-prefix-complete-keys) <span class="linecomment">; Don't use Icicles completion.</span>
        (dolist (key icicle-prefix-complete-keys)
          (define-key map key           <span class="linecomment">; Emacs 22, 23.</span>
            (if (fboundp 'crm-complete) #'crm-complete #'crm-minibuffer-complete)))))

    (defvar icicle-crm-local-completion-map
      (let ((map  (make-sparse-keymap)))
        (icicle-define-crm-completion-map map)
        map)
      "<span class="quote">Local keymap for minibuffer multiple input with completion.
Analog of `minibuffer-local-completion-map'.</span>")

    (defvar icicle-crm-local-must-match-map
      (let ((map  (make-sparse-keymap)))
        (icicle-define-crm-completion-map map)
        (define-key map [remap minibuffer-complete-and-exit]
          (if (fboundp 'crm-complete-and-exit)
              #'crm-complete-and-exit
            #'crm-minibuffer-complete-and-exit))
        map)
      "<span class="quote">Local keymap for minibuffer multiple input with exact match completion.
Analog of `minibuffer-local-must-match-map' for crm.</span>")

    <span class="linecomment">;; Now, toggle Icicle mode, to take into account loading `crm.el' and redefining its stuff.</span>
    (when (fboundp 'icy-mode)
      (icy-mode) (icy-mode))))


<span class="linecomment">;; REPLACE ORIGINAL `read-shell-command' defined in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;; Uses Icicles completion.</span>
<span class="linecomment">;;</span>
(defun icicle-read-shell-command (prompt &optional initial-contents hist default-value
                                  inherit-input-method)
  "<span class="quote">Read a shell command using file-name completion.
Call `icicle-read-shell-command-completing', passing all arguments.</span>"
  (if (fboundp 'minibuffer-with-setup-hook)
      (minibuffer-with-setup-hook
       (lambda ()
         (set (make-local-variable 'minibuffer-default-add-function)
              'minibuffer-default-add-shell-commands))
       (icicle-read-shell-command-completing prompt initial-contents (or hist 'shell-command-history)
                                             default-value inherit-input-method))
    (icicle-read-shell-command-completing prompt initial-contents (or hist 'shell-command-history)
                                          default-value inherit-input-method)))


<span class="linecomment">;; REPLACE ORIGINAL `shell-command' defined in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;; Uses Icicles completion.</span>
<span class="linecomment">;; Not needed for Emacs 23+ - Icicles completion is automatic via `icicle-read-shell-command'.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'read-shell-command)   <span class="linecomment">; Emacs 23.</span>
  (or (fboundp 'old-dired-smart-shell-command)
(fset 'old-dired-smart-shell-command (symbol-function 'dired-smart-shell-command)))

(defun icicle-dired-smart-shell-command (command &optional output-buffer error-buffer)
  "<span class="quote">Like `icicle-shell-command', but in the current Virtual Dired directory.
Uses Icicles completion - see `icicle-read-shell-command-completing'.</span>"
  (interactive
   (list (icicle-read-shell-command "<span class="quote">Shell command: </span>" nil nil
                                    (cond (buffer-file-name (file-relative-name buffer-file-name))
                                          ((eq major-mode 'dired-mode) (dired-get-filename t t))))
         current-prefix-arg
         shell-command-default-error-buffer))
  (let ((default-directory (dired-default-directory)))
    (shell-command command output-buffer error-buffer))))


<span class="linecomment">;; REPLACE ORIGINAL `shell-command' defined in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;; Uses Icicles completion.</span>
<span class="linecomment">;; Not needed for Emacs 23+ - Icicles completion is automatic via `icicle-read-shell-command'.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'read-shell-command)   <span class="linecomment">; Emacs 23.</span>
  (or (fboundp 'old-shell-command)
(fset 'old-shell-command (symbol-function 'shell-command)))

(defun icicle-shell-command (command &optional output-buffer error-buffer)
  "<span class="quote">Execute string COMMAND in inferior shell; display output, if any.
Uses Icicles completion - see `icicle-read-shell-command-completing'.

With prefix argument, insert the COMMAND's output at point.

If COMMAND ends in ampersand, execute it asynchronously.
The output appears in the buffer `*Async Shell Command*'.
That buffer is in shell mode.

Otherwise, COMMAND is executed synchronously.  The output appears in
the buffer `*Shell Command Output*'.  If the output is short enough to
display in the echo area (which is determined by the variables
`resize-mini-windows' and `max-mini-window-height'), it is shown
there, but it is nonetheless available in buffer `*Shell Command
Output*' even though that buffer is not automatically displayed.

To specify a coding system for converting non-ASCII characters
in the shell command output, use \\[universal-coding-system-argument] \
before this command.

Noninteractive callers can specify coding systems by binding
`coding-system-for-read' and `coding-system-for-write'.

The optional second argument OUTPUT-BUFFER, if non-nil,
says to put the output in some other buffer.
If OUTPUT-BUFFER is a buffer or buffer name, put the output there.
If OUTPUT-BUFFER is not a buffer and not nil,
insert output in current buffer.  (This cannot be done asynchronously.)
In either case, the output is inserted after point (leaving mark after it).

If the command terminates without error, but generates output,
and you did not specify \"insert it in the current buffer\",
the output can be displayed in the echo area or in its buffer.
If the output is short enough to display in the echo area
\(determined by the variable `max-mini-window-height' if
`resize-mini-windows' is non-nil), it is shown there.
Otherwise,the buffer containing the output is displayed.

If there is output and an error, and you did not specify \"insert it
in the current buffer\", a message about the error goes at the end
of the output.

If there is no output, or if output is inserted in the current buffer,
then `*Shell Command Output*' is deleted.

If the optional third argument ERROR-BUFFER is non-nil, it is a buffer
or buffer name to which to direct the command's standard error output.
If it is nil, error output is mingled with regular output.
In an interactive call, the variable `shell-command-default-error-buffer'
specifies the value of ERROR-BUFFER.</span>"
  (interactive
   (list (icicle-read-shell-command "<span class="quote">Shell command: </span>" nil nil
                                    (and buffer-file-name (file-relative-name buffer-file-name)))
         current-prefix-arg
         shell-command-default-error-buffer))
  (old-shell-command command output-buffer error-buffer)))


<span class="linecomment">;; REPLACE ORIGINAL `shell-command-on-region' defined in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;; Uses Icicles completion.</span>
<span class="linecomment">;; Not needed for Emacs 23+ - Icicles completion is automatic via `icicle-read-shell-command'.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'read-shell-command)   <span class="linecomment">; Emacs 23.</span>
  (or (fboundp 'old-shell-command-on-region)
(fset 'old-shell-command-on-region (symbol-function 'shell-command-on-region)))

(defun icicle-shell-command-on-region (start end command
                                &optional output-buffer replace error-buffer display-error-buffer)
  "<span class="quote">Execute string COMMAND in inferior shell with region as input.
Uses Icicles completion - see `icicle-read-shell-command-completing'.

Normally, display any output in temp buffer `*Shell Command Output*';
Prefix arg means replace the region with it.  Return the exit code of
COMMAND.

To specify a coding system for converting non-ASCII characters
in the input and output to the shell command, use \\[universal-coding-system-argument]
before this command.  By default, the input (from the current buffer)
is encoded in the same coding system that will be used to save the file,
`buffer-file-coding-system'.  If the output is going to replace the region,
then it is decoded from that same coding system.

The noninteractive arguments are START, END, COMMAND,
OUTPUT-BUFFER, REPLACE, ERROR-BUFFER, and DISPLAY-ERROR-BUFFER.
Noninteractive callers can specify coding systems by binding
`coding-system-for-read' and `coding-system-for-write'.

If the command generates output, the output may be displayed
in the echo area or in a buffer.
If the output is short enough to display in the echo area
\(determined by the variable `max-mini-window-height' if
`resize-mini-windows' is non-nil), it is shown there.  Otherwise
it is displayed in the buffer `*Shell Command Output*'.  The output
is available in that buffer in both cases.

If there is output and an error, a message about the error
appears at the end of the output.

If there is no output, or if output is inserted in the current buffer,
then `*Shell Command Output*' is deleted.

If the optional fourth argument OUTPUT-BUFFER is non-nil,
that says to put the output in some other buffer.
If OUTPUT-BUFFER is a buffer or buffer name, put the output there.
If OUTPUT-BUFFER is not a buffer and not nil,
insert output in the current buffer.
In either case, the output is inserted after point (leaving mark after it).

If REPLACE, the optional fifth argument, is non-nil, that means insert
the output in place of text from START to END, putting point and mark
around it.

If optional sixth argument ERROR-BUFFER is non-nil, it is a buffer
or buffer name to which to direct the command's standard error output.
If it is nil, error output is mingled with regular output.
If DISPLAY-ERROR-BUFFER is non-nil, display the error buffer if there
were any errors.  (This is always t, interactively.)  This argument is
not available before Emacs 22.
In an interactive call, the variable `shell-command-default-error-buffer'
specifies the value of ERROR-BUFFER.</span>"
  (interactive (let (string)
		 (unless (mark) (error "<span class="quote">The mark is not set now, so there is no region</span>"))
		 <span class="linecomment">;; Do this before calling region-beginning and region-end, in case subprocess output</span>
		 <span class="linecomment">;; relocates them while we are in the minibuffer.</span>
		 (setq string (icicle-read-shell-command "<span class="quote">Shell command on region: </span>"))
		 <span class="linecomment">;; call-interactively recognizes region-beginning and region-end specially,</span>
                 <span class="linecomment">;; leaving them in the history.</span>
		 (list (region-beginning) (region-end) string current-prefix-arg current-prefix-arg
		       shell-command-default-error-buffer (= emacs-major-version 22))))
  (if (= emacs-major-version 22)
      (old-shell-command-on-region start end command output-buffer replace error-buffer
                                   display-error-buffer)
    (old-shell-command-on-region start end command output-buffer replace error-buffer))))


<span class="linecomment">;; REPLACE ORIGINAL `dired-read-shell-command' defined in `dired-aux.el'</span>
<span class="linecomment">;; and redefined in `dired-x.el', saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;; Uses Icicles completion.</span>
<span class="linecomment">;;</span>
(defun icicle-dired-read-shell-command (prompt arg files)
  "<span class="quote">Read a shell command for FILES using file-name completion.
Uses Icicles completion - see `icicle-read-shell-command-completing'.
ARG is passed to `dired-mark-prompt' as its first arg, for the prompt.
FILES are the files for which the shell command should be appropriate.</span>"
  (if (fboundp 'minibuffer-with-setup-hook)
      (minibuffer-with-setup-hook
       (lambda ()
         (set (make-local-variable 'minibuffer-default-add-function)
              'minibuffer-default-add-shell-commands))
       (dired-mark-pop-up  nil 'shell files 'icicle-dired-guess-shell-command
                           (format prompt (dired-mark-prompt arg files)) files))
    (dired-mark-pop-up  nil 'shell files 'icicle-dired-guess-shell-command
                        (format prompt (dired-mark-prompt arg files)) files)))


(defun icicle-dired-guess-shell-command (prompt files)
  "<span class="quote">Read a shell command for FILES using file-name completion.
Call `icicle-read-shell-command-completing', passing PROMPT and FILES.</span>"
  (icicle-read-shell-command-completing prompt nil nil nil nil files))

(defun icicle-read-shell-command-completing (prompt &optional initial-contents hist default-value
                                             inherit-input-method files)
  "<span class="quote">Read a shell command using file-name completion.
FILES name some files for which the command might be appropriate.
The other arguments are the same as those for `read-from-minibuffer',
except that READ and KEYMAP are missing, and HIST defaults to
`shell-command-history'.

Completion is lax, so you can use any shell command you want, not
just a completion candidate, and you can edit the completed input to
add options and arguments etc.

In addition to file-name candidates, the following are combined to
produce extra completion candidates (which are indicated using face
`icicle-extra-candidates' in buffer *Completions*):

* If you use Dired X, then the rules defined by user option
  `dired-guess-shell-alist-user' and variable
  `dired-guess-shell-alist-default' provide candidates appropriate for
  the marked files in Dired.

* Starting with Emacs 23, MIME-type associations provide candidates
  appropriate for the marked files.

* If option `icicle-guess-cmds-in-path-flag' is non-nil, executable
  files (or all files, if `shell-completion-execonly' is nil) in your
  search path provide candidates.

In addition, if `icicle-extra-candidates' is non-nil, its elements are
also included as extra candidates.

Help is available for individual candidates, using `C-M-RET',
`C-M-mouse-2', and so on.  For an extra candidate (that is, for a
shell command guessed to be appropriate), help is provided by the
`apropos' shell command (if available).  For a file name, help shows
the file's properties.</span>"
  (let* ((dired-guess-files                           (and files (fboundp 'dired-guess-default)
                                                           (dired-guess-default files)))
         (icicle-sort-function                        'icicle-extra-candidates-first-p)
         (completion-ignore-case                      (memq system-type '(ms-dos windows-nt cygwin)))
         (icicle-extra-candidates-dir-insert-p        nil)
         (icicle-point-position-in-candidate          'input-end)
         (icicle-candidate-help-fn                    (lambda (cand)
                                                        (if (member cand icicle-extra-candidates)
                                                            (shell-command
                                                             (concat "<span class="quote">apropos </span>" (shell-quote-argument
                                                                                 cand))
                                                             "<span class="quote">*Help*</span>")
                                                          (icicle-describe-file cand))))
         (minibuffer-local-completion-map
          (let ((map  (make-sparse-keymap)))
            (set-keymap-parent map minibuffer-local-completion-map)
            (define-key map [(control backspace)] 'icicle-up-directory)
            map))
         (minibuffer-local-must-match-map
          (let ((map  (make-sparse-keymap)))
            (set-keymap-parent map minibuffer-local-must-match-map)
            (define-key map [(control backspace)] 'icicle-up-directory)
            map))
         (icicle-extra-candidates                     icicle-extra-candidates)
         (icicle-must-match-regexp                    icicle-file-match-regexp)
         (icicle-must-not-match-regexp                icicle-file-no-match-regexp)
         (icicle-must-pass-predicate                  icicle-file-predicate)
         (icicle-transform-function                   'icicle-remove-dups-if-extras)
         (icicle-sort-function                        (or icicle-file-sort icicle-sort-function))
         (icicle-require-match-flag                   icicle-file-require-match-flag)
         (icicle-default-value          <span class="linecomment">; Let user get default via `M-n', but don't insert it.</span>
          (and (memq icicle-default-value '(t nil)) icicle-default-value)))
    (when (and dired-guess-files (atom dired-guess-files))
      (setq dired-guess-files  (list dired-guess-files)))
    <span class="linecomment">;; Add dired-guess guesses and mailcap guesses to `icicle-extra-candidates'.</span>
    (setq icicle-extra-candidates  (append dired-guess-files
                                           (and files (require 'mailcap nil t) <span class="linecomment">; Emacs 23.</span>
                                                (fboundp 'mailcap-file-default-commands)
                                                (mailcap-file-default-commands files))
                                           icicle-extra-candidates))
    (when icicle-guess-cmds-in-path-flag <span class="linecomment">; Add commands available from user's search path.</span>
      (setq icicle-extra-candidates  (append icicle-extra-candidates
                                             (or icicle-shell-command-candidates
                                                 (icicle-shell-command-candidates)))))
    (when icicle-extra-candidates
      (setq prompt (copy-sequence prompt))
      (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (icicle-read-file-name prompt nil default-value nil initial-contents)))
     
<span class="linecomment">;; Based more or less on `shell-dynamic-complete-as-command'.</span>
(defun icicle-shell-command-candidates ()
  "<span class="quote">Shell command candidates appropriate for current context.
The candidates are the executable files in your search path or, if
`shell-completion-execonly' is nil, all files in your search path.</span>"
  (require 'shell)                      <span class="linecomment">; `shell-completion-execonly'</span>
  (message "<span class="quote">Finding available commands...</span>")
  (let* ((filenondir         "<span class="quote"></span>")
         (path-dirs          (cdr (reverse exec-path)))
         (cwd                (file-name-as-directory (expand-file-name default-directory)))
         (ignored-extensions (and comint-completion-fignore
                                  (mapconcat (function (lambda (x) (concat (regexp-quote x) "<span class="quote">$</span>")))
                                             comint-completion-fignore "<span class="quote">\\|</span>")))
         (dir                "<span class="quote"></span>")
         (comps-in-dir       ())
         (file               "<span class="quote"></span>")
         (abs-file-name      "<span class="quote"></span>")
         (completions        ()))
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
    (setq icicle-shell-command-candidates  completions))) <span class="linecomment">; Cache it.</span>
 
<span class="linecomment">;;(@* "Icicles functions - completion display (not cycling)")</span>

<span class="linecomment">;;; Icicles functions - completion display (not cycling) -------------</span>

(defun icicle-display-candidates-in-Completions (&optional reverse-p no-display-p)
  "<span class="quote">Refresh the current set of completion candidates in *Completions*.
REVERSE-P non-nil means display the candidates in reverse order.
NO-DISPLAY-P non-nil means do not display the candidates; just
  recompute them.  If the value is `no-msg', then do not show a
  minibuffer message indicating that candidates were updated.</span>"
  <span class="linecomment">;;$$   ;; Pred is special if `minibuffer-completion-table' is a function.</span>
  <span class="linecomment">;;   (when (and (not (functionp minibuffer-completion-table))</span>
  <span class="linecomment">;;              (functionp minibuffer-completion-predicate))</span>
  <span class="linecomment">;;     (setq icicle-completion-candidates</span>
  <span class="linecomment">;;           (icicle-remove-if-not</span>
  <span class="linecomment">;;            (lambda (cand)</span>
  <span class="linecomment">;;              (funcall minibuffer-completion-predicate</span>
  <span class="linecomment">;;                       (if (arrayp minibuffer-completion-table) (intern cand) (list cand))))</span>
  <span class="linecomment">;;            icicle-completion-candidates)))</span>

  <span class="linecomment">;; $$$  (case icicle-incremental-completion-flag</span>
  <span class="linecomment">;;     ((t always) (setq icicle-incremental-completion-p  'always))</span>
  <span class="linecomment">;;     ((nil) (setq icicle-incremental-completion-p  nil)))</span>

  <span class="linecomment">;; Upgrade `icicle-incremental-completion-p' if we are redisplaying, so that completions will</span>
  <span class="linecomment">;; be updated by `icicle-call-then-update-Completions' when you edit.</span>
  (setq icicle-incremental-completion-p  icicle-incremental-completion-flag)
  (when (and (eq t icicle-incremental-completion-p) (get-buffer-window "<span class="quote">*Completions*</span>" 0))
    (setq icicle-incremental-completion-p  'always))

  (cond ((eq no-display-p 'no-msg))     <span class="linecomment">; No-op.</span>
        (no-display-p (icicle-msg-maybe-in-minibuffer (format "<span class="quote">Candidates updated (%s matching)</span>"
                                                              icicle-current-completion-mode)))
        ((null icicle-completion-candidates)
         (save-selected-window (icicle-remove-Completions-window))
         (icicle-msg-maybe-in-minibuffer
          (if (eq 'apropos icicle-current-completion-mode)
              (let ((typ  (car (rassq icicle-apropos-complete-match-fn
                                      icicle-apropos-match-fns-alist))))
                (concat "<span class="quote">No </span>" typ (and typ "<span class="quote"> </span>") "<span class="quote">completions</span>"))
            (if (and icicle-fuzzy-completion-flag (featurep 'fuzzy-match))
                "<span class="quote">No fuzzy completions</span>"
              "<span class="quote">No prefix completions</span>"))))
        (t
         (when (&gt; (length icicle-completion-candidates) icicle-incremental-completion-threshold)
           (message "<span class="quote">Displaying completion candidates...</span>"))
         <span class="linecomment">;; Display `*Completions*' now, so we can get its window's width.</span>
         <span class="linecomment">;; We don't wait for `with-output-to-temp-buffer' to display it, because displaying it</span>
         <span class="linecomment">;; might lead to splitting the display window, which would change its width.</span>
         <span class="linecomment">;; We need to know the width in order to calculate the proper candidate formatting.</span>
         (when (consp icicle-completion-candidates)
           (let ((fit-frame-inhibit-fitting-flag  t)
                 (comp-buf                        (get-buffer-create "<span class="quote">*Completions*</span>")))
             (unless (get-buffer-window comp-buf 'visible)
               (save-selected-window (display-buffer comp-buf t 0)))))
         (with-output-to-temp-buffer "<span class="quote">*Completions*</span>"

           <span class="linecomment">;; Each candidate in `icicle-completion-candidates' is a string, regardless of the original</span>
           <span class="linecomment">;; type of candidate used (e.g. symbol, string, alist candidate,...).  Here, provided</span>
           <span class="linecomment">;; `icicle-fancy-cands-internal-p' is non-nil, we transform these candidates, replacing</span>
           <span class="linecomment">;; each by a string that takes into account symbol properties `icicle-display-string' and</span>
           <span class="linecomment">;; `icicle-special-candidate'.</span>
           <span class="linecomment">;;</span>
           <span class="linecomment">;; Because `icicle-completion-candidates' is affected, changes to the candidate strings</span>
           <span class="linecomment">;; (e.g. propertizing) are also reflected in the completion return value chosen by the</span>
           <span class="linecomment">;; user.  It is not only the display in `*Completions*' that is affected.</span>
           <span class="linecomment">;;</span>
           <span class="linecomment">;; The symbol whose properties are used is the one in the current obarray that is named by</span>
           <span class="linecomment">;; the string candidate to be transformed.  If there is no such symbol, then no</span>
           <span class="linecomment">;; transformation occurs.  Unless `minibuffer-completion-table' is an obarray, the global</span>
           <span class="linecomment">;; obarray is used to get the symbol.</span>
           <span class="linecomment">;;</span>
           <span class="linecomment">;; 1. If the symbol has an `icicle-display-string' property, then that property value must</span>
           <span class="linecomment">;;    be a string (possibly propertized).  We replace the candidate by that string.</span>
           <span class="linecomment">;;</span>
           <span class="linecomment">;; 2. If the symbol has an `icicle-special-candidate' property, then we transfer the</span>
           <span class="linecomment">;;    property to the candidate string as a set of text properties.  (If the value is not</span>
           <span class="linecomment">;;    a plist, and `icicle-special-candidate-regexp' is nil, then just apply face</span>
           <span class="linecomment">;;    `icicle-special-candidate'.)  The effect is similar to using</span>
           <span class="linecomment">;;    `icicle-special-candidate-regexp', but the completion return value is also affected.</span>
           (when icicle-fancy-cands-internal-p
             (setq icicle-completion-candidates
                   (mapcar (lambda (cand)
                             (let* ((symb          (intern-soft
                                                    cand (and (arrayp minibuffer-completion-table)
                                                              minibuffer-completion-table)))
                                    (display-strg  (and symb
                                                        (stringp (get symb 'icicle-display-string))
                                                        (get symb 'icicle-display-string)))
                                    (new-cand      (or display-strg cand))
                                    (spec-prop     (and symb (get symb 'icicle-special-candidate))))
                               <span class="linecomment">;; Apply `icicle-special-candidate' property's value.</span>
                               <span class="linecomment">;; If the value is a plist, then apply the properties as text props.</span>
                               <span class="linecomment">;; Else (the value is t), apply face `icicle-special-candidate'.</span>
                               (when spec-prop
                                 (setq new-cand  (copy-sequence new-cand))
                                 (if (consp spec-prop)
                                     (add-text-properties 0 (length new-cand) spec-prop new-cand)
                                   (unless icicle-special-candidate-regexp
                                     (add-text-properties 0 (length new-cand)
                                                          '(face icicle-special-candidate)
                                                          new-cand))))
                               new-cand))
                           icicle-completion-candidates)))
           <span class="linecomment">;; The `condition-case' shouldn't be needed, but it prevents an "End of buffer"</span>
           <span class="linecomment">;; message from `display-completion-list' on Emacs 22.</span>
           (condition-case nil
               (display-completion-list
                (if reverse-p (reverse icicle-completion-candidates) icicle-completion-candidates))
             (error nil)))
         (save-excursion
           (save-window-excursion
             (set-buffer (get-buffer "<span class="quote">*Completions*</span>"))
             (let ((buffer-read-only  nil)
                   (eob               (point-max))
                   (case-fold-search  (if (and (icicle-file-name-input-p)
                                               (boundp 'read-file-name-completion-ignore-case))
                                          read-file-name-completion-ignore-case
                                        completion-ignore-case))
                   (dir               (and (icicle-file-name-input-p) icicle-last-input
                                           (file-name-directory icicle-last-input)))
                   (hist              (and (symbolp minibuffer-history-variable)
                                           (boundp minibuffer-history-variable)
                                           (symbol-value minibuffer-history-variable))))
               (goto-char (icicle-start-of-candidates-in-Completions))
               (while (not (eobp))
                 (let* ((beg    (point))
                        (end    (next-single-property-change beg 'mouse-face nil eob))
                        (next   (next-single-property-change end 'mouse-face nil eob))
                        (faces  ()))

                   <span class="linecomment">;; Highlight candidate specially if it is a proxy candidate.</span>
                   (let ((candidate  (icicle-current-completion-in-Completions)))
                     <span class="linecomment">;;$$$ (when dir (setq candidate  (expand-file-name candidate dir)))</span>
                     (when (member candidate icicle-proxy-candidates)
                       (setq faces  (cons 'icicle-proxy-candidate faces))
                       (if (not icicle-proxy-candidate-regexp)
                           (add-text-properties beg end (cons 'face (list faces)))
                         (save-match-data
                           (when (string-match icicle-proxy-candidate-regexp candidate)
                             (add-text-properties (+ beg (match-beginning 0)) (+ beg (match-end 0))
                                                  (cons 'face (list faces))))))))

                   <span class="linecomment">;; Highlight candidate specially if it is an extra candidate.</span>
                   (let ((candidate  (icicle-current-completion-in-Completions)))
                     <span class="linecomment">;;$$$ (when dir (setq candidate  (expand-file-name candidate dir)))</span>
                     (save-match-data
                       (when (member candidate icicle-extra-candidates)
                         (setq faces  (cons 'icicle-extra-candidate faces))
                         (add-text-properties beg end (cons 'face (list faces))))))

                   <span class="linecomment">;; Highlight candidate specially if it is a special candidate.</span>
                   (let ((candidate  (icicle-current-completion-in-Completions)))
                     <span class="linecomment">;;$$$ (when dir (setq candidate  (expand-file-name candidate dir)))</span>
                     (save-match-data
                       (when (and icicle-special-candidate-regexp
                                  (string-match icicle-special-candidate-regexp candidate))
                         (setq faces  (cons 'icicle-special-candidate faces))
                         (if (not icicle-special-candidate-regexp)
                             (add-text-properties beg end (cons 'face (list faces)))
                           (add-text-properties (+ beg (match-beginning 0)) (+ beg (match-end 0))
                                                (cons 'face (list faces)))))))

                   <span class="linecomment">;; Highlight candidate (`*-historical-candidate') if it has been used previously.</span>
                   (when icicle-highlight-historical-candidates-flag
                     (let ((candidate  (icicle-current-completion-in-Completions)))
                       (when dir (setq candidate  (expand-file-name candidate dir)))
                       (when (and (consp hist) (member candidate hist))
                         (add-text-properties
                          beg end
                          `(face ,(setq faces  (cons 'icicle-historical-candidate faces)))))))

                   <span class="linecomment">;; Highlight, inside the candidate, the expanded common match.</span>
                   (when (and (or icicle-expand-input-to-common-match-flag
                                  (eq icicle-current-completion-mode 'prefix))
                              icicle-current-input (not (string= "<span class="quote"></span>" icicle-current-input)))
                     (save-excursion
                       (save-restriction
                         (narrow-to-region beg end) <span class="linecomment">; Restrict to the completion candidate.</span>
                         (when (re-search-forward
                                (regexp-quote (icicle-minibuf-input-sans-dir icicle-current-input))
                                nil t)
                           (setq faces  (cons 'icicle-common-match-highlight-Completions faces))
                           (put-text-property (match-beginning 0) (point) 'face faces)))))

                   <span class="linecomment">;; Hide match for `icicle-current-input' (expanded common match, if available),</span>
                   <span class="linecomment">;; if `icicle-hide-common-match-in-Completions-flag' is non-nil.</span>
                   (save-excursion
                     (save-restriction
                       (narrow-to-region beg end) <span class="linecomment">; Restrict to the completion candidate.</span>
                       (put-text-property beg end 'display nil) <span class="linecomment">; Remove old invisible property.</span>
                       (when (and icicle-hide-common-match-in-Completions-flag
                                  icicle-current-input (not (string= "<span class="quote"></span>" icicle-current-input)))
                         (when (re-search-forward
                                (regexp-quote (icicle-minibuf-input-sans-dir icicle-current-input))
                                nil t)
                           (if (&gt; emacs-major-version 20)
                               (put-text-property (match-beginning 0) (point) 'display "<span class="quote">...</span>")
                             (put-text-property (match-beginning 0) (point) 'invisible t))))))

                   <span class="linecomment">;; Highlight, inside the candidate, what the input expression matches.</span>
                   (unless (and icicle-current-raw-input (string= "<span class="quote"></span>" icicle-current-raw-input)
                                icicle-apropos-complete-match-fn) <span class="linecomment">; Do nothing if no match fn.</span>
                     (save-excursion
                       (save-restriction
                         (narrow-to-region beg end) <span class="linecomment">; Restrict to the completion candidate.</span>
                         (let ((fn  (if (and (eq 'prefix icicle-current-completion-mode)
                                             (not icicle-fuzzy-completion-flag))
                                        'search-forward
                                      (case icicle-apropos-complete-match-fn
                                        (icicle-scatter-match
                                         (lambda (input bound noerror)
                                           (re-search-forward (icicle-scatter input) bound noerror)))
                                        (icicle-levenshtein-match
                                         (if (= icicle-levenshtein-distance 1)
                                             (lambda (input bound noerror)
                                               (re-search-forward
                                                (icicle-levenshtein-one-regexp input) bound noerror))
                                           're-search-forward))
                                        (otherwise 're-search-forward)))))
                           (when (funcall fn (icicle-minibuf-input-sans-dir icicle-current-raw-input)
                                          nil t)
                             (setq faces  (cons 'icicle-match-highlight-Completions faces))
                             (put-text-property (match-beginning 0) (point) 'face faces))))))

                   <span class="linecomment">;; Highlight candidate if it has been saved.</span>
                   (when icicle-saved-completion-candidates
                     (let ((candidate  (icicle-current-completion-in-Completions)))
                       (when (member candidate icicle-saved-completion-candidates)
                         (let ((ov  (make-overlay beg end (current-buffer))))
                           (push ov icicle-saved-candidate-overlays)
                           (overlay-put ov 'face 'icicle-saved-candidate)
                           (overlay-put ov 'priority '10)))))

                   <span class="linecomment">;; Treat `icicle-candidate-properties-alist'.</span>
                   <span class="linecomment">;; A `face' prop will unfortunately wipe out any `face' prop we just applied.</span>
                   (when icicle-candidate-properties-alist
                     (save-excursion
                       (save-restriction
                         (narrow-to-region beg end) <span class="linecomment">; Restrict to the completion candidate.</span>
                         (let* ((candidate  (buffer-substring (point-min) (point-max)))
                                (orig-pt    (point))
                                (start      0)
                                (end        0)
                                (partnum    1)
                                (join       (concat "<span class="quote">\\(</span>" icicle-list-join-string "<span class="quote">\\|$\\)</span>"))
                                (len        (length candidate))
                                notfirst)
                           (save-match-data
                             (while (and (string-match join candidate
                                                       (if (and notfirst (= end (match-beginning 0))
                                                                (&lt; end (length candidate)))
                                                           (1+ end)
                                                         end))
                                         (&lt; end len))
                               (setq notfirst  t
                                     end       (or (match-beginning 0) len))
                               (let* ((entry
                                       (assq partnum icicle-candidate-properties-alist))
                                      (properties              (cadr entry))
                                      (propertize-join-string  (car (cddr entry))))
                                 (when properties
                                   (add-text-properties
                                    (+ start orig-pt) (+ end orig-pt) properties))
                                 (when propertize-join-string
                                   (add-text-properties
                                    (+ end orig-pt) (+ end orig-pt (length icicle-list-join-string))
                                    properties)))
                               (setq partnum  (1+ partnum)
                                     start    (match-end 0))))))))
                   (goto-char next))))
             (set-buffer-modified-p nil)
             (setq buffer-read-only  t)))
         (with-current-buffer (get-buffer "<span class="quote">*Completions*</span>")
           (goto-char (icicle-start-of-candidates-in-Completions))
           (set-window-point (get-buffer-window "<span class="quote">*Completions*</span>" 0) (point)))
         (message nil))))               <span class="linecomment">; Clear out any "Looking for..."</span>


<span class="linecomment">;; REPLACE ORIGINAL `display-completion-list' (built-in function),</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Does not remove text properties from candidates when it displays them in *Completions*.</span>
<span class="linecomment">;; 2. Adjusts number of columns and their widths to window size.</span>
<span class="linecomment">;; 3. The optional second arg is ignored.  In vanilla Emacs &lt; 23, this is a string</span>
<span class="linecomment">;;    representing a common prefix, and faces `completions-first-difference' and</span>
<span class="linecomment">;;    `completions-common-part' are used on candidates.</span>
<span class="linecomment">;;</span>
(or (fboundp 'old-display-completion-list)
(fset 'old-display-completion-list (symbol-function 'display-completion-list)))

<span class="linecomment">;;;###autoload</span>
(defun icicle-display-completion-list (completions &optional ignored)
  "<span class="quote">Display the list of completions, COMPLETIONS, using `standard-output'.
Each element may be just a symbol or string or may be a list of two
strings to be printed as if concatenated.
If it is a list of two strings, the first is the actual completion
alternative, the second serves as annotation.
`standard-output' must be a buffer.
The actual completion alternatives, as inserted, are given the
`mouse-face' property of `highlight'.
At the end, this runs the normal hook `completion-setup-hook'.
It can find the completion buffer in `standard-output'.
The optional second arg is ignored.</span>"
  (if (not (bufferp standard-output))
      (let ((standard-output  (current-buffer))) (icicle-display-completion-list completions))
    (let ((mainbuf  (current-buffer)))  <span class="linecomment">; $$$$$$$$$ For Emacs 23 crap that puts base-size in last cdr.</span>
      (with-current-buffer standard-output
        (goto-char (point-max))
        (when icicle-show-Completions-help-flag (icicle-insert-Completions-help-string))
        (let ((cand-intro-string  (if completions
                                      "<span class="quote">Possible completions are:\n</span>"
                                    "<span class="quote">There are no possible completions of what you have typed.</span>")))
          (put-text-property 0 (length cand-intro-string) 'face 'icicle-Completions-instruction-1
                             cand-intro-string)
          (insert cand-intro-string))
        <span class="linecomment">;; $$$$$$$$ Emacs 23 nonsense.  Revisit this when Stefan finally removes that crud.</span>
        (when (boundp 'completion-all-completions-with-base-size)
          (let ((last  (last completions)))
            <span class="linecomment">;; Set base-size from the tail of the list.</span>
            (set (make-local-variable 'completion-base-size)
                 (or (cdr last) (and (minibufferp mainbuf) 0)))
            (setcdr last nil)))         <span class="linecomment">; Make completions a properly nil-terminated list.</span>
        (icicle-insert-candidates completions)))
    <span class="linecomment">;; In vanilla Emacs &lt; 23, the hook is run with `completion-common-substring' bound to</span>
    <span class="linecomment">;; what is here called IGNORED.</span>
    (run-hooks 'completion-setup-hook)
    nil))

(defun icicle-insert-candidates (candidates)
  "<span class="quote">Insert completion candidates from list CANDIDATES into the current buffer.</span>"
  (when (consp candidates)
    (let* ((max-cand-len  (apply #'max (mapcar (lambda (cand)
                                                 (if (consp cand)
                                                     (+ (length (car cand)) (length (cadr cand)))
                                                   (length cand)))
                                               candidates)))
           (comp-win      (get-buffer-window (current-buffer) 0))
           (wwidth
            (let ((spcl-frame-params  (special-display-p (buffer-name))))
              (cond ((and spcl-frame-params <span class="linecomment">; Special-buffer.  Use its default frame width.</span>
                          (or (and (consp spcl-frame-params)
                                   (cdr (assq 'width (cadr spcl-frame-params))))
                              (cdr (assq 'width special-display-frame-alist))
                              (cdr (assq 'width default-frame-alist)))))
                    (comp-win (1- (window-width comp-win))) <span class="linecomment">; Width picked by `display-buffer'.</span>
                    (t 40))))           <span class="linecomment">; Failsafe.</span>
           (columns       (max 1 (min (/ (* 100 wwidth)
                                         (* icicle-candidate-width-factor max-cand-len))
                                      (length candidates))))
           (colwidth      (/ wwidth columns))
           (column-nb     0)
           startpos endpos string)
      (dolist (cand candidates)
        (setq endpos  (point))
        (unless (bolp)
          (put-text-property (point) (point) 'mouse-face nil) <span class="linecomment">; Turn off `mouse-face'</span>
          (indent-to (* (max 1 column-nb) colwidth) icicle-inter-candidates-min-spaces)
          (when (&lt; wwidth (+ (max colwidth (if (consp cand)
                                               (+ (length (car cand)) (length (cadr cand)))
                                             (length cand)))
                             (current-column)))
            (save-excursion             <span class="linecomment">; This is like `fixup-whitespace', but only forward.</span>
              (delete-region (point) (progn (skip-chars-forward "<span class="quote"> \t</span>") (point)))
              (unless (or (looking-at "<span class="quote">^\\|\\s)</span>")
                          (save-excursion (forward-char -1) (looking-at "<span class="quote">$\\|\\s(\\|\\s'</span>")))
                (insert ?\ )))
            (insert "<span class="quote">\n</span>")
            (setq column-nb  columns)))  <span class="linecomment">; End of the row. Simulate being in farthest column.</span>
        (when (&lt; endpos (point)) (set-text-properties endpos (point) nil))
        <span class="linecomment">;; Convert candidate (but not annotation) to unibyte or to multibyte, if needed.</span>
        (setq string  (if (consp cand) (car cand) cand))
        (cond ((and (null enable-multibyte-characters) (multibyte-string-p string))
               (setq string  (string-make-unibyte string)))
              ((and enable-multibyte-characters (not (multibyte-string-p string)))
               (setq string  (string-make-multibyte string))))
        <span class="linecomment">;; Insert candidate (and annotation).  Mouse-face candidate, except for any newline as final</span>
        <span class="linecomment">;; char.  This is so that candidates are visually separate in *Completions*.  Instead,</span>
        <span class="linecomment">;; however, put property `icicle-keep-newline' on any final \n in the candidate, so</span>
        <span class="linecomment">;; `icicle-mouse-choose-completion' and `icicle-current-completion-in-Completions' can put</span>
        <span class="linecomment">;; the newline back as part of the candidate.</span>
        (cond ((atom cand)              <span class="linecomment">; No annotation.</span>
               (put-text-property (point) (progn (insert string)
                                                 (if (eq ?\n (char-before (point)))
                                                     (1- (point))
                                                   (point)))
                                  'mouse-face 'highlight)
               (when (eq ?\n (char-before (point)))
                 (put-text-property (1- (point)) (point) 'icicle-keep-newline t)))
              (t                        <span class="linecomment">; Candidate plus annotation.</span>
               (put-text-property (point) (progn (insert string)
                                                 (if (eq ?\n (char-before (point)))
                                                     (1- (point))
                                                   (point)))
                                  'mouse-face 'highlight)
               (when (eq ?\n (char-before (point)))
                 (put-text-property (1- (point)) (point) 'icicle-keep-newline t))
               (set-text-properties (point) (progn (insert (cadr cand)) (point)) nil)))
        (setq column-nb  (mod (1+ column-nb) columns))))))

(defun icicle-fit-completions-window ()
  "<span class="quote">Fit the window showing completions to its contents.
Useful in `temp-buffer-show-hook'.</span>"
  (when (and (eq major-mode 'completion-list-mode) (fboundp 'fit-window-to-buffer))
    (let ((win  (selected-window)))
      (unless (&lt; (window-width win) (frame-width)) <span class="linecomment">; Don't shrink if split horizontally.</span>
        (fit-window-to-buffer
         win
         <span class="linecomment">;; Don't let it take over the frame, so we don't completely lose any other window.</span>
         (min (- (frame-parameter (window-frame win) 'height) 8)
              (or (and (symbolp icicle-last-top-level-command)
                       (get icicle-last-top-level-command 'icicle-Completions-window-max-height))
                  icicle-Completions-window-max-height)))))))

(defun icicle-highlight-initial-whitespace (input)
  "<span class="quote">Highlight any initial whitespace in your input.
Only if `icicle-highlight-input-initial-whitespace-flag' is non-nil.
INPUT is the current user input, that is, the completion root.
This must be called in the minibuffer.</span>"
  (when (and icicle-highlight-input-initial-whitespace-flag (not (string= "<span class="quote"></span>" input)))
    (let ((case-fold-search  (if (and (icicle-file-name-input-p)
                                      (boundp 'read-file-name-completion-ignore-case))
                                 read-file-name-completion-ignore-case
                               completion-ignore-case)))
      (save-excursion
        (goto-char (icicle-minibuffer-prompt-end))
        (when (and (icicle-file-name-input-p) insert-default-directory)
          (search-forward (icicle-file-name-directory-w-default input) nil t)) <span class="linecomment">; Skip directory.</span>
        (save-excursion
          (save-restriction
            (narrow-to-region (point) (point-max)) <span class="linecomment">; Search within completion candidate.</span>
            (while (and (not (eobp)) (looking-at "<span class="quote">\\(\\s-\\|\n\\)+</span>"))
              (put-text-property (point) (1+ (point)) 'face 'icicle-whitespace-highlight)
              (forward-char 1))
            <span class="linecomment">;; Remove any previous whitespace highlighting that is no longer part of prefix.</span>
            (while (not (eobp))
              (when (eq (get-text-property (point) 'face) 'icicle-whitespace-highlight)
                (put-text-property (point) (1+ (point)) 'face nil))
              (forward-char 1))))))))

(defun icicle-minibuffer-prompt-end ()
  "<span class="quote">Buffer position of end of minibuffer prompt, or `point-min'.
Version of `minibuffer-prompt-end' that works for Emacs 20 and later.</span>"
  (if (fboundp 'minibuffer-prompt-end) (minibuffer-prompt-end) (point-min)))
 
<span class="linecomment">;;(@* "Icicles functions - prefix completion cycling")</span>

<span class="linecomment">;;; Icicles functions - prefix (and fuzzy) completion cycling --------------------</span>

(defun icicle-prefix-candidates (input)
  "<span class="quote">List of prefix or fuzzy completions for the current partial INPUT.
INPUT is a string.  Each candidate is a string.
Non-nil `icicle-fuzzy-completion-flag' means use fuzzy matching for
non-file-name completion.</span>"
  (setq icicle-candidate-nb  nil)
  (if (and icicle-fuzzy-completion-flag (featurep 'fuzzy-match))
      (condition-case nil
          (icicle-transform-candidates (append icicle-extra-candidates icicle-proxy-candidates
                                               (icicle-fuzzy-candidates input)))
        (quit (top-level)))             <span class="linecomment">; Let `C-g' stop it.</span>
    (let ((cands  (icicle-unsorted-prefix-candidates input)))
      (cond (icicle-abs-file-candidates (icicle-strip-ignored-files-and-sort cands))
            (icicle-sort-function (icicle-reversible-sort cands))
            (t cands)))))

(defun icicle-fuzzy-candidates (input)
  "<span class="quote">Return `FM-all-fuzzy-matches' (fuzzy matches) for INPUT.</span>"
  (let ((candidates  ()))
    <span class="linecomment">;; $$$$ Should treat other `minibuffer-completion-table' types also.</span>
    (cond ((vectorp minibuffer-completion-table)
           (mapatoms (lambda (symb) (when (or (null minibuffer-completion-predicate)
                                              (funcall minibuffer-completion-predicate symb))
                                      (push (symbol-name symb) candidates)))
                     minibuffer-completion-table))
          ((and (consp minibuffer-completion-table) (consp (car minibuffer-completion-table)))
           (dolist (cand minibuffer-completion-table)
             (when (or (null minibuffer-completion-predicate)
                       (funcall minibuffer-completion-predicate cand))
               (push (car cand) candidates)))))
    (setq candidates  (FM-all-fuzzy-matches input candidates))
    (when (consp candidates)
      (setq icicle-common-match-string  (icicle-expanded-common-match input candidates)))
    candidates))

(defun icicle-unsorted-prefix-candidates (input)
  "<span class="quote">Unsorted list of prefix completions for the current partial INPUT.
this also sets `icicle-common-match-string' to the expanded common
prefix over all candidates.</span>"
  (condition-case nil
      (let* ((candidates
              (if (and (fboundp 'completion-all-completions)
                       icicle-respect-completion-styles-p)
                  (icicle-completion-all-completions input minibuffer-completion-table
                                                     minibuffer-completion-predicate
                                                     (- (point) (field-beginning)))
                (all-completions input minibuffer-completion-table
                                 minibuffer-completion-predicate
                                 icicle-ignore-space-prefix-flag)))
             (icicle-extra-candidates
              (icicle-remove-if-not
               (lambda (cand)
                 (save-match-data
                   (string-match (concat "<span class="quote">^</span>" (regexp-quote input)) cand))) icicle-extra-candidates))
             (icicle-proxy-candidates
              (icicle-remove-if-not
               (lambda (cand)
                 (save-match-data
                   (string-match (concat "<span class="quote">^</span>" (regexp-quote input)) cand))) icicle-proxy-candidates))
             (filtered-candidates
              (icicle-transform-candidates
               (append icicle-extra-candidates icicle-proxy-candidates
                       (icicle-remove-if-not (lambda (cand)
                                               (let ((case-fold-search  completion-ignore-case))
                                                 (icicle-filter-wo-input cand)))
                                             candidates)))))
        (when (consp filtered-candidates)
          (let ((common-prefix
                 (if (and (fboundp 'completion-try-completion)
                          icicle-respect-completion-styles-p)
                     (icicle-completion-try-completion input minibuffer-completion-table
                                                       minibuffer-completion-predicate
                                                       (- (point) (field-beginning)))
                   (try-completion input minibuffer-completion-table
                                   minibuffer-completion-predicate))))
            (setq icicle-common-match-string  (if (eq t common-prefix) input common-prefix))))
        filtered-candidates)
    (quit (top-level))))                <span class="linecomment">; Let `C-g' stop it.</span>

(defun icicle-file-name-prefix-candidates (input)
  "<span class="quote">List of prefix completions for partial file name INPUT.
INPUT is a string.
Candidates can be directories.  Each candidate is a string.</span>"
  (setq icicle-candidate-nb  nil)
  (let ((default-directory  (icicle-file-name-directory-w-default input)))
    (icicle-strip-ignored-files-and-sort
     (icicle-unsorted-file-name-prefix-candidates (or (icicle-file-name-nondirectory input) "<span class="quote"></span>")))))


(defun icicle-unsorted-file-name-prefix-candidates (input)
  "<span class="quote">Unsorted list of prefix completions for the current file-name INPUT.
This also sets `icicle-common-match-string' to the expanded common
prefix over all candidates.</span>"
  (condition-case nil
      (let ((slashed-p  (and (&gt; (length input) 0) (eq ?/ (aref input 0)))))
        (when slashed-p (setq input  (substring input 1)))
        (let* ((candidates
                (if (and (fboundp 'completion-all-completions)
                         icicle-respect-completion-styles-p)
                    (icicle-completion-all-completions input minibuffer-completion-table
                                                       minibuffer-completion-predicate (length input))
                  (all-completions input minibuffer-completion-table
                                   (if slashed-p "<span class="quote">/</span>" default-directory)
                                   icicle-ignore-space-prefix-flag)))
               (icicle-extra-candidates
                (icicle-remove-if-not
                 (lambda (cand)
                   (save-match-data
                     (string-match (concat "<span class="quote">^</span>" (regexp-quote input)) cand))) icicle-extra-candidates))
               (icicle-proxy-candidates
                (icicle-remove-if-not
                 (lambda (cand)
                   (save-match-data
                     (string-match (concat "<span class="quote">^</span>" (regexp-quote input)) cand))) icicle-proxy-candidates))
               (filtered-candidates
                (icicle-transform-candidates
                 (append icicle-extra-candidates icicle-proxy-candidates
                         (icicle-remove-if-not
                          (lambda (cand)
                            (let ((case-fold-search
                                   (if (boundp 'read-file-name-completion-ignore-case)
                                       read-file-name-completion-ignore-case
                                     completion-ignore-case)))
                              (if (member cand '("<span class="quote">../</span>" "<span class="quote">./</span>"))
                                  (member input '("<span class="quote">..</span>" "<span class="quote">.</span>")) <span class="linecomment">; Prevent "" from matching "../"</span>
                                (and
<span class="linecomment">;;; $$$$$$ REMOVED - This was no good for PCM - e.g. input `ic-o' and candidates `icicles-opt.el[c]'.</span>
<span class="linecomment">;;;                  We don't do it for non-file-name completion, anyway, and it doesn't seem needed.</span>
<span class="linecomment">;;;                                  (save-match-data</span>
<span class="linecomment">;;;                                    (string-match (concat "^" (regexp-quote input)) cand))</span>
                                 (icicle-filter-wo-input cand)))))
                          candidates)))))
          (when (consp filtered-candidates)
            (let ((common-prefix
                   (if (and (fboundp 'completion-try-completion)
                            icicle-respect-completion-styles-p)
                       (icicle-completion-try-completion input minibuffer-completion-table
                                                         minibuffer-completion-predicate
                                                         (length input))
                     (try-completion input minibuffer-completion-table
                                     (if slashed-p "<span class="quote">/</span>" default-directory)))))
              <span class="linecomment">;; If prefix matches an empty directory, use that directory as the sole completion.</span>
              (when (and (stringp common-prefix)
                         (save-match-data (string-match "<span class="quote">/\\.$</span>" common-prefix)))
                (setq common-prefix  (substring common-prefix 0 (- (length common-prefix) 2))))
              (setq icicle-common-match-string  (if (eq t common-prefix) input common-prefix))))
          filtered-candidates))
    (quit (top-level))))                <span class="linecomment">; Let `C-g' stop it.</span>
 
<span class="linecomment">;;(@* "Icicles functions - apropos completion cycling")</span>

<span class="linecomment">;;; Icicles functions - apropos completion cycling -------------------</span>

(defun icicle-apropos-candidates (input)
  "<span class="quote">List of candidate apropos completions for the current partial INPUT.
INPUT is a string.  Each candidate is a string.</span>"
  (setq icicle-candidate-nb  nil)
  (let ((cands  (icicle-unsorted-apropos-candidates input)))
    (cond (icicle-abs-file-candidates (icicle-strip-ignored-files-and-sort cands))
          (icicle-sort-function (icicle-reversible-sort cands))
          (t cands))))

(defun icicle-unsorted-apropos-candidates (input)
  "<span class="quote">Unsorted list of apropos completions for the current partial INPUT.
When `icicle-expand-input-to-common-match-flag' is non-nil, this also
sets `icicle-common-match-string' to the expanded common match of
input over all candidates.</span>"
  (condition-case nil
      (progn
        (when icicle-regexp-quote-flag (setq input  (regexp-quote input)))
        (let* ((candidates
                (if (and (functionp minibuffer-completion-table)
                         (not icicle-apropos-complete-match-fn))
                    <span class="linecomment">;; Let the function do it all.</span>
                    (all-completions input minibuffer-completion-table
                                     minibuffer-completion-predicate
                                     icicle-ignore-space-prefix-flag)
                  (all-completions "<span class="quote"></span>" minibuffer-completion-table
                                   minibuffer-completion-predicate
                                   icicle-ignore-space-prefix-flag)))
               (icicle-extra-candidates
                (icicle-remove-if-not
                 (lambda (cand) (save-match-data (string-match input cand))) icicle-extra-candidates))
               (icicle-proxy-candidates
                (icicle-remove-if-not
                 (lambda (cand) (save-match-data (string-match input cand))) icicle-proxy-candidates))
               (filtered-candidates
                (icicle-transform-candidates
                 (append icicle-extra-candidates icicle-proxy-candidates
                         (icicle-remove-if-not
                          (lambda (cand)
                            (let ((case-fold-search  completion-ignore-case))
                              (and (icicle-filter-wo-input cand)
                                   (or (not icicle-apropos-complete-match-fn)
                                       (funcall icicle-apropos-complete-match-fn input cand)))))
                          candidates)))))
          (when (and icicle-expand-input-to-common-match-flag (consp filtered-candidates))
            (setq icicle-common-match-string  (icicle-expanded-common-match input
                                                                            filtered-candidates)))
          filtered-candidates))         <span class="linecomment">; Return candidates.</span>
    (quit (top-level))))                <span class="linecomment">; Let `C-g' stop it.</span>

(defun icicle-file-name-apropos-candidates (input)
  "<span class="quote">List of apropos completions for partial file-name INPUT.
INPUT is a string.
Candidates can be directories.  Each candidate is a string.</span>"
  (setq icicle-candidate-nb  nil)
  (let ((default-directory  (icicle-file-name-directory-w-default input)))
    (icicle-strip-ignored-files-and-sort
     (icicle-unsorted-file-name-apropos-candidates (or (icicle-file-name-nondirectory input) "<span class="quote"></span>")))))

(defun icicle-unsorted-file-name-apropos-candidates (input)
  "<span class="quote">Unsorted list of apropos completions for the partial file-name INPUT.
When `icicle-expand-input-to-common-match-flag' is non-nil, this also
sets `icicle-common-match-string' to the expanded common match of
input over all candidates.</span>"
  (condition-case nil
      (progn
        (when icicle-regexp-quote-flag (setq input  (regexp-quote input)))
        (let ((slashed-p  (and (&gt; (length input) 0) (eq ?/ (aref input 0)))))
          (when slashed-p (setq input  (substring input 1)))
          (let* ((candidates
                  <span class="linecomment">;; $$$$$ Should we remove string test for Emacs 23?</span>
                  (if (and (not (stringp minibuffer-completion-predicate))
                           (not icicle-apropos-complete-match-fn)
                           (functionp minibuffer-completion-table))
                      <span class="linecomment">;; Let the function do it all.</span>
                      (all-completions input minibuffer-completion-table
                                       (if slashed-p "<span class="quote">/</span>" default-directory)
                                       icicle-ignore-space-prefix-flag)
                    (all-completions "<span class="quote"></span>" minibuffer-completion-table
                                     (if slashed-p "<span class="quote">/</span>" default-directory)
                                     icicle-ignore-space-prefix-flag)))
                 (icicle-extra-candidates
                  (icicle-remove-if-not
                   (lambda (cand) (save-match-data (string-match input cand)))
                   icicle-extra-candidates))
                 (icicle-proxy-candidates
                  (icicle-remove-if-not
                   (lambda (cand) (save-match-data (string-match input cand)))
                   icicle-proxy-candidates))
                 (filtered-candidates
                  (icicle-transform-candidates
                   (append icicle-extra-candidates icicle-proxy-candidates
                           (icicle-remove-if-not
                            (lambda (cand)
                              (let ((case-fold-search
                                     (if (boundp 'read-file-name-completion-ignore-case)
                                         read-file-name-completion-ignore-case
                                       completion-ignore-case)))
                                (if (member cand '("<span class="quote">../</span>" "<span class="quote">./</span>"))
                                    (member input '("<span class="quote">..</span>" "<span class="quote">.</span>")) <span class="linecomment">; Prevent "" from matching "../"</span>
                                  (and (icicle-filter-wo-input cand)
                                       (or (not icicle-apropos-complete-match-fn)
                                           (funcall icicle-apropos-complete-match-fn input cand))))))
                            candidates)))))
            (when (and icicle-expand-input-to-common-match-flag (consp filtered-candidates))
              (setq icicle-common-match-string  (icicle-expanded-common-match input
                                                                              filtered-candidates)))
            filtered-candidates)))      <span class="linecomment">; Return candidates.</span>
    (quit (top-level))))                <span class="linecomment">; Let `C-g' stop it.</span>

(defun icicle-expanded-common-match (input candidates)
  "<span class="quote">Return the expanded common match for INPUT among all CANDIDATES.
This assumes that INPUT matches each string in list CANDIDATES.
Return nil if there is no common match.  This actually returns
`regexp-quote' applied to the expanded common match, so that special
characters in the match don't throw off regexp matching.

The expanded common match is typically, but not always, the longest
common match.  See the documentation, section `Expanded-Common-Match
Completion', for details.</span>"
  <span class="linecomment">;; Since `icicle-expanded-common-match-1' checks only the first match for a single candidate,</span>
  <span class="linecomment">;; we call it twice, once using the first candidate and once using the second.</span>
  <span class="linecomment">;; Typically, one of these tries will give us the longest common match.</span>
  (catch 'ecm-error
    (let ((first-try   (icicle-expanded-common-match-1 input candidates))
          (second-try  nil))
      (when (and first-try (cadr candidates))
        (setq second-try  (icicle-expanded-common-match-1
                           input (cons (cadr candidates) (cons (car candidates) (cddr candidates))))))
      (if (&gt; (length second-try) (length first-try)) second-try first-try))))

(defun icicle-expanded-common-match-1 (input candidates)
  "<span class="quote">Helper function for `icicle-expanded-common-match.</span>"
  <span class="linecomment">;; This does not always give a longest common match, because it looks only at the first match</span>
  <span class="linecomment">;; of INPUT with the first candidate.  What it returns is the longest match that is common to</span>
  <span class="linecomment">;; all CANDIDATES and also contains the first match in the first candidate.</span>
  (let ((case-fold-search  (if (and (icicle-file-name-input-p)
                                    (boundp 'read-file-name-completion-ignore-case))
                               read-file-name-completion-ignore-case
                             completion-ignore-case))
        (first  (car candidates)))
    (and icicle-apropos-complete-match-fn <span class="linecomment">; Return nil if no match function.</span>
         (save-match-data
           <span class="linecomment">;; Assume no common match in case of error - e.g. due to `string-match' with binary data</span>
           <span class="linecomment">;; in Emacs 20.  Do this throughout, whenever we call `icicle-apropos-complete-match-fn'.</span>
           (condition-case nil
               (funcall icicle-apropos-complete-match-fn input first)
             (error (throw 'ecm-error input)))
           (let* ((len-first       (length first))
                  (beg             0)
                  (end             len-first)
                  (orig-match-beg  (match-beginning 0))
                  (orig-match-end  (match-end 0))
                  (ecm             first) <span class="linecomment">; "ecm" for "expanded common match".</span>
                  (rest            (cdr candidates))
                  beg-ecm beg-next)
             (if (= orig-match-beg end)
                 (setq ecm  "<span class="quote"></span>")         <span class="linecomment">; INPUT was, for instance, "$" or "\\&gt;$; return "".</span>
               <span class="linecomment">;; Compare with the rest of the candidates, reducing as needed.</span>
               (while (and rest ecm)
                 (condition-case nil
                     (funcall icicle-apropos-complete-match-fn input (car rest))
                   (error (throw 'ecm-error input)))
                 (setq beg-next  (match-beginning 0))
                 <span class="linecomment">;; Remove any prefix that doesn't match some other candidate.</span>
                 (while (and (&lt; beg orig-match-beg)
                             (not (condition-case nil
                                      (funcall icicle-apropos-complete-match-fn
                                               (regexp-quote (substring ecm 0 (- orig-match-end beg)))
                                               (car rest))
                                    (error (throw 'ecm-error input))))
                             (progn (setq beg-ecm  (match-beginning 0))
                                    (&gt;= beg-ecm beg-next)))
                   <span class="linecomment">;; Take a character off of the left.</span>
                   (setq ecm  (substring ecm 1)
                         beg  (1+ beg)))
                 <span class="linecomment">;; Remove any suffix that doesn't match some other candidate.</span>
                 (while (and (&gt; end 0)
                             (not (condition-case nil
                                      (funcall icicle-apropos-complete-match-fn
                                               (regexp-quote ecm) (car rest))
                                    (error (throw 'ecm-error input)))))
                   <span class="linecomment">;; Take a character off of the right.</span>
                   (setq ecm  (substring ecm 0 (1- (length ecm)))
                         end  (1- end)))
                 (unless (and (condition-case nil
                                  (funcall icicle-apropos-complete-match-fn
                                           (regexp-quote ecm) (car rest))
                                (error (throw 'ecm-error input)))
                              (condition-case nil
                                  (funcall icicle-apropos-complete-match-fn input ecm)
                                (error (throw 'ecm-error input))))
                   (setq ecm  nil))     <span class="linecomment">; No possible expansion</span>
                 (pop rest))
               ecm))))))

(defun icicle-scatter-match (string completion)
  "<span class="quote">Returns non-nil if STRING scatter-matches COMPLETION.
This means that all of the characters in STRING are also in string
COMPLETION, in the same order, but perhaps scattered among other
characters.  For example, STRING = \"ure\" matches COMPLETION
\"curried\".</span>"
  (string-match (icicle-scatter string) completion))

(defun icicle-scatter (string)
  "<span class="quote">Returns a regexp that matches a scattered version of STRING.
The regexp will match any string that contains the characters in
STRING, in the same order, but possibly with other characters as well.
Returns, for example, \"a.*b.*c.*d\" for input string \"abcd\".</span>"
  (if (&gt; emacs-major-version 21)
      (mapconcat #'regexp-quote (split-string string "<span class="quote"></span>" t) "<span class="quote">.*</span>")
    (mapconcat #'regexp-quote (split-string string "<span class="quote"></span>") "<span class="quote">.*</span>")))

(defun icicle-levenshtein-strict-match (s1 s2)
  "<span class="quote">String S1 is within `icicle-levenshtein-distance' of string S2.
This means that S1 differs by at most `icicle-levenshtein-distance'
character deletions, insertions, or replacements from S2.  The string
lengths too must differ by at most `icicle-levenshtein-distance'.
You probably want to turn off incremental completion (`C-#') if you
use this match method; it is quite slow.
To use this match method, you must also have library `levenshtein.el'.</span>"
  (and (require 'levenshtein nil t)
       (&lt;= (levenshtein-distance s1 s2) icicle-levenshtein-distance)))

(defun icicle-levenshtein-match (s1 s2)
  "<span class="quote">String S1 is within `icicle-levenshtein-distance' of a substring of S2.
S1 and S2 are strings.  This means that S1 and some substring of S2
differ by at most `icicle-levenshtein-distance' character deletions,
insertions, or replacements.

You will probably want to turn off incremental completion (`C-#') if
you use this match method; it can be quite slow, especially with a
large value of `icicle-levenshtein-distance'.  To use this method with
a value other than 1, you must also have library `levenshtein.el'.</span>"
  (if (= icicle-levenshtein-distance 1)
      (icicle-levenshtein-one-match s1 s2)
    (unless (require 'levenshtein nil t) (error "<span class="quote">You need library `levenshtein.el' for this</span>"))
    (catch 'icicle-levenshtein-match
      (dolist (sub  (icicle-substrings-of-length s2 (length s1)))
        (when (&lt;= (levenshtein-distance s1 sub) icicle-levenshtein-distance)
          (throw 'icicle-levenshtein-match t)))
      nil)))

<span class="linecomment">;; This is much faster than testing with `levenshtein-distance' and a value of 1.</span>
(defun icicle-levenshtein-one-match (s1 s2)
  "<span class="quote">S1 is within a Levenshtein distance of one of some substring of S2.
That is, S1 with 0 or 1 char inserted, deleted or replaced is a
substring of S2.  S1 and S2 are strings.
You do not need library `levenshtein.el' to use this function.</span>"
  (string-match (icicle-levenshtein-one-regexp s1) s2))

(defun icicle-levenshtein-one-regexp (string)
  "<span class="quote">Return a regexp for strings that are 1 Levenshtein unit from STRING.</span>"
  (let ((indx    0)
        (regexp  "<span class="quote">\\(</span>"))
    (dotimes (indx  (length string))
      (setq regexp (concat regexp
                           (substring string 0 indx) "<span class="quote">.?</span>" (substring string (1+ indx)) "<span class="quote">\\|</span>"
                           (substring string 0 indx) "<span class="quote">.</span>"  (substring string indx)      "<span class="quote">\\|</span>")))
    (setq regexp (concat (substring regexp 0 -1) "<span class="quote">)</span>"))))

(defun icicle-substrings-of-length (string &optional len)
  "<span class="quote">Return a list of substrings of STRING that have length LEN.
If LEN is nil, treat it as the length of STRING.</span>"
  (unless len (setq len  (length string)))
  (if (zerop len)
      (list "<span class="quote"></span>")
    (let ((subs  ()))
      (dotimes (idx (- (length string) (1- len)))
        (push (substring string idx (+ idx len)) subs))
      (nreverse subs))))
 
<span class="linecomment">;;(@* "Icicles functions - common helper functions")</span>

<span class="linecomment">;;; Icicles functions - common helper functions ----------------------</span>

<span class="linecomment">;; Main cycling function - used by `icicle-next-prefix-candidate', `icicle-next-apropos-candidate'.</span>
(defun icicle-next-candidate (nth candidates-fn &optional regexp-p)
  "<span class="quote">Replace input by NTH next or previous completion for an input.
Default value of NTH is 1, meaning use the next completion.
Negative NTH means use a previous, not subsequent, completion.

CANDIDATES-FN is a function that returns the list of candidate
completions for its argument, the current partial input (a string).

Optional arg REGEXP-P non-nil means that CANDIDATES-FN uses regexp
matching. This is used to highlight the appropriate matching root.</span>"
  (let ((saved-last-input  icicle-last-input)) <span class="linecomment">; For call to `icicle-recompute-candidates'.</span>
    (unless (stringp icicle-last-completion-candidate)
      (setq icicle-last-completion-candidate  icicle-initial-value))
    (setq nth                   (or nth 1)
          icicle-current-input  (if (icicle-file-name-input-p)
                                    (abbreviate-file-name (icicle-input-from-minibuffer))
                                  (icicle-input-from-minibuffer))
          icicle-cycling-p      t)
    (unless (and (symbolp this-command) (get this-command 'icicle-apropos-cycling-command)
                 (or (and (symbolp last-command)
                          (get last-command 'icicle-apropos-cycling-command))
                     (memq last-command
                           '(icicle-candidate-action
                             icicle-remove-candidate icicle-mouse-remove-candidate
                             icicle-apropos-complete icicle-apropos-complete-no-display))))
      (setq icicle-common-match-string  nil)) <span class="linecomment">; Don't use old one, in `icicle-save-or-restore-input'.</span>
    (icicle-save-or-restore-input)
    (when (and (icicle-file-name-input-p) (icicle-file-directory-p icicle-current-input))
      (setq icicle-default-directory  icicle-current-input))
    (icicle-recompute-candidates nth candidates-fn saved-last-input)
    (icicle-save-or-restore-input)      <span class="linecomment">; Again, based on updated `icicle-common-match-string'.</span>
    (cond ((null icicle-completion-candidates)
           (save-selected-window (icicle-remove-Completions-window))
           (minibuffer-message "<span class="quote">  [No completion]</span>"))
          (t
           (icicle-clear-minibuffer)
           (let ((nb-cands  (length icicle-completion-candidates))
                 (unit      (if (wholenump nth) 1 -1))
                 next)
             <span class="linecomment">;; So `icomplete+' can append the number of other candidates to the minibuffer.</span>
             (when icicle-completion-candidates
               (setq icicle-nb-of-other-cycle-candidates  (1- nb-cands)))
             (icicle-increment-cand-nb+signal-end nth nb-cands)
             (setq next  (elt icicle-completion-candidates icicle-candidate-nb))
             (while (null next)         <span class="linecomment">; Skip null candidates.</span>
               (icicle-increment-cand-nb+signal-end unit nb-cands)
               (setq next  (elt icicle-completion-candidates icicle-candidate-nb)))

             <span class="linecomment">;; Reset last candidate.  Need a copy, because we change its text properties.</span>
             (setq icicle-last-completion-candidate  (copy-sequence next))

             <span class="linecomment">;; Highlight any initial whitespace (probably a user typo).</span>
             (let ((input  (if regexp-p icicle-current-raw-input icicle-current-input)))
               (icicle-highlight-initial-whitespace input))

             <span class="linecomment">;; Underline the root that was completed, in the minibuffer.</span>
             (let ((case-fold-search  (if (and (icicle-file-name-input-p)
                                               (boundp 'read-file-name-completion-ignore-case))
                                          read-file-name-completion-ignore-case
                                        completion-ignore-case))
                   (inp               (icicle-minibuf-input-sans-dir icicle-current-input))
                   indx)
               (unless regexp-p (setq inp  (regexp-quote inp)))
               (save-match-data
                 (setq indx  (string-match inp icicle-last-completion-candidate))
                 (when indx
                   (put-text-property indx (match-end 0) 'face 'icicle-match-highlight-minibuffer
                                      icicle-last-completion-candidate))))

             <span class="linecomment">;; Insert candidate in minibuffer.</span>
             (insert (if (and (icicle-file-name-input-p) insert-default-directory
                              (or (not (member icicle-last-completion-candidate
                                               icicle-extra-candidates))
                                  icicle-extra-candidates-dir-insert-p))
                         (icicle-file-name-directory-w-default icicle-current-input)
                       "<span class="quote"></span>")
                     icicle-last-completion-candidate)
             (icicle-place-cursor icicle-current-input)

             <span class="linecomment">;; Highlight current completion candidate, if *Completions* is displayed.</span>
             (when (get-buffer-window "<span class="quote">*Completions*</span>" 0)

               <span class="linecomment">;; Refresh *Completions*, updating it to reflect the current candidates.</span>
               (unless (or (and (symbolp this-command)
                                (get this-command 'icicle-apropos-cycling-command)
                                (or (and (symbolp last-command)
                                         (get last-command 'icicle-apropos-cycling-command))
                                    (memq last-command '(icicle-candidate-action
                                                         icicle-remove-candidate
                                                         icicle-mouse-remove-candidate))))
                           (and (symbolp this-command)
                                (get this-command 'icicle-prefix-cycling-command)
                                (or (and (symbolp last-command)
                                         (get last-command 'icicle-prefix-cycling-command))
                                    (memq last-command '(icicle-candidate-action
                                                         icicle-remove-candidate
                                                         icicle-mouse-remove-candidate)))))
                 (icicle-display-candidates-in-Completions))
               (save-selected-window
                 (select-window (get-buffer-window "<span class="quote">*Completions*</span>" 'visible))
                 (if (fboundp 'only-raise-frame) (only-raise-frame) (raise-frame)))
               (icicle-highlight-candidate-in-Completions)))))))

(defun icicle-recompute-candidates (nth candidates-fn saved-last-input)
  "<span class="quote">Recompute `icicle-completion-candidates', if needed.
If buffer *Completions* is already displayed, it is updated.
This does nothing, unless the user changed the minibuffer input or the
completion type has changed (from apropos to prefix or vice versa).
NTH &lt; 0 means candidate order is reversed in *Completions*.
Argument CANDIDATES-FN is a function that recomputes the candidates.
SAVED-LAST-INPUT is the last input, as in `icicle-last-input'.</span>"
  (unless (and icicle-last-completion-command
               (symbolp this-command)   <span class="linecomment">; Need symbol for `get', below.</span>
               (string= icicle-current-input saved-last-input) <span class="linecomment">; No change in user input.</span>
               <span class="linecomment">;; No change in completion type: apropos vs prefix.</span>
               (or (and (or (get icicle-last-completion-command 'icicle-apropos-completing-command)
                            (memq icicle-last-completion-command
                                  '(icicle-candidate-set-complement icicle-mouse-remove-candidate
                                    icicle-keep-only-past-inputs)))
                        (or (get this-command 'icicle-apropos-completing-command)
                            (get this-command 'icicle-apropos-cycling-command)))
                   (and (or (get icicle-last-completion-command 'icicle-prefix-completing-command)
                            (memq icicle-last-completion-command
                                  '(icicle-candidate-set-complement icicle-mouse-remove-candidate
                                    icicle-keep-only-past-inputs)))
                        (or (get this-command 'icicle-prefix-completing-command)
                            (get this-command 'icicle-prefix-cycling-command)))))
    <span class="linecomment">;; Set `icicle-last-completion-command', to record new completion type.</span>
    (cond ((and (symbolp this-command) (get this-command 'icicle-prefix-cycling-command))
           (setq icicle-last-completion-command  'icicle-prefix-complete))
          ((and (symbolp this-command) (get this-command 'icicle-apropos-cycling-command))
           (setq icicle-last-completion-command  'icicle-apropos-complete)))

    <span class="linecomment">;; Recompute and redisplay completion candidates.  Reset candidate number.</span>
    (setq icicle-completion-candidates
          (condition-case nil
              (funcall candidates-fn icicle-current-input)
            (error icicle-completion-candidates))) <span class="linecomment">; No change if completion error.</span>
    (when (get-buffer-window "<span class="quote">*Completions*</span>" 0) <span class="linecomment">; Update *Completions* display or remove it.</span>
      (if icicle-completion-candidates
          (icicle-display-candidates-in-Completions (not (wholenump nth)))
        (save-selected-window (icicle-remove-Completions-window))))))

(defun icicle-save-raw-input ()
  "<span class="quote">Save `icicle-current-raw-input' as the latest previous input.
It is saved to `icicle-previous-raw-file-name-inputs', if completing a
file name, or `icicle-previous-raw-non-file-name-inputs', otherwise.</span>"
  (let* ((prev-inputs-var  (if (icicle-file-name-input-p)
                               'icicle-previous-raw-file-name-inputs
                             'icicle-previous-raw-non-file-name-inputs))
         (prev-inputs      (symbol-value prev-inputs-var)))
    (unless (string= "<span class="quote"></span>" icicle-current-raw-input)
      (set prev-inputs-var (icicle-put-at-head prev-inputs-var icicle-current-raw-input)))
    (when (&gt; (length prev-inputs) icicle-completion-history-max-length)
      (setcdr (nthcdr (1- icicle-completion-history-max-length) prev-inputs) ()))))

(defun icicle-save-or-restore-input ()
  "<span class="quote">Save the current minibuffer input, or restore the last input.
If there is a previous input, and we are cycling, and the current
  input differs from the last cycling candidate (so the user has
  edited it), then restore the last input.  (Cycled completions
  don't count as input.)
Otherwise, save the current input for use by `C-l', and then compute
  the expanded common match.

There are several particular cases that modulate the behavior - see
the code.</span>"
  <span class="linecomment">;; By "cycling command" is meant here a command that cycles but does NOT also complete.</span>
  <span class="linecomment">;; `icicle-next-prefix-candidate' is such a command, but `icicle-prefix-complete' is not.</span>
  (cond
    <span class="linecomment">;; Restore last input, if there is some to restore and we are cycling.</span>
    ((and icicle-last-input icicle-cycling-p
<span class="linecomment">;;;           (symbolp this-command) (get this-command 'icicle-cycling-command)</span>
<span class="linecomment">;;;           (not (get this-command 'icicle-completing-command)) ; Don't count `TAB' and `S-TAB'.</span>
          icicle-last-completion-candidate
          <span class="linecomment">;; Current input = last completion candidate?</span>
          (string= (if (icicle-file-name-input-p)
                       (directory-file-name (icicle-remove-dots icicle-last-completion-candidate))
                     icicle-last-completion-candidate)
                   (if (icicle-file-name-input-p)
                       (if icicle-cycle-into-subdirs-flag
                           (icicle-file-name-nondirectory icicle-current-input)
                         (file-name-nondirectory
                          (directory-file-name (icicle-remove-dots icicle-current-input))))
                     icicle-current-input)))
     (setq icicle-current-input  icicle-last-input)) <span class="linecomment">; Return `icicle-current-input'.</span>
    (t
     (cond
       <span class="linecomment">;; Save the current input for `C-l', then update it to the expanded common match.</span>
       <span class="linecomment">;; Do NOT do this if:</span>
       <span class="linecomment">;;      the user doesn't want to use the expanded common match</span>
       <span class="linecomment">;;   or there is no common match string</span>
       <span class="linecomment">;;   or the last command was a cycling command</span>
       <span class="linecomment">;;   or the input and the completion mode have not changed</span>
       <span class="linecomment">;;      (so saved regexp will not be overwritten).</span>
       ((not (or (and (not icicle-expand-input-to-common-match-flag)
                      (eq icicle-current-completion-mode 'apropos))
                 (not icicle-common-match-string)
                 (and (symbolp last-command) (get last-command 'icicle-cycling-command)
                      (not (get last-command 'icicle-completing-command))) <span class="linecomment">; Not `TAB' or `S-TAB'.</span>
                 (and (equal icicle-last-input icicle-current-input)
                      (eq icicle-current-completion-mode
                          (if (get icicle-last-completion-command 'icicle-prefix-completing-command)
                              'prefix
                            'apropos)))))

        <span class="linecomment">;; Expand current input to expanded common match, after saving it for `C-l'.</span>
        (let ((common  (if (and (icicle-file-name-input-p) insert-default-directory)
                           (if (string= "<span class="quote"></span>" icicle-common-match-string)
                               (or (file-name-directory icicle-current-input) "<span class="quote"></span>")
                             (directory-file-name (icicle-abbreviate-or-expand-file-name
                                                   icicle-common-match-string
                                                   (file-name-directory icicle-current-input))))
                         icicle-common-match-string)))
            
          <span class="linecomment">;; Save current input for `C-l', then save common match as current input.</span>
          <span class="linecomment">;; Do NOT do anything if we're ignoring letter case and that is the only difference</span>
          <span class="linecomment">;; between the common match and the input (e.g. MS Windows file names).</span>
          (unless (and case-fold-search (string= (upcase icicle-current-input) (upcase common))
                       (not (string= icicle-current-input common)))

            <span class="linecomment">;; Save input for `C-l' if this is not `C-l' or `C-L'.</span>
            <span class="linecomment">;; Save it also if this is the first cycling command, or the first after completion.</span>
            (unless (or (memq this-command '(icicle-retrieve-previous-input
                                             icicle-retrieve-next-input))
                        (and icicle-cycling-p
                             (or icicle-candidate-nb <span class="linecomment">; Not the first cycling command.</span>
                                 (and (symbolp last-command)
                                      (get last-command 'icicle-completing-command)))))
              (setq icicle-current-raw-input  icicle-current-input)
              <span class="linecomment">;; Save it for `C-l', unless it is "".  Drop old entries when too big.</span>
              (icicle-save-raw-input))

            <span class="linecomment">;; Save expanded common match as current input, unless input is a directory.</span>
            (unless (and (icicle-file-name-input-p) (file-directory-p icicle-current-input))
              (setq icicle-current-input  common)))))

       <span class="linecomment">;; Save input for `C-l'.</span>
       <span class="linecomment">;; Do NOT do this if:</span>
       <span class="linecomment">;;      this command is `C-l' or `C-L'</span>
       <span class="linecomment">;;   or we are cycling or the last command was a cycling command</span>
       <span class="linecomment">;;   or this command is the same as last command.</span>
       ((not (or (memq this-command '(icicle-retrieve-previous-input icicle-retrieve-next-input))
                 icicle-cycling-p
                 (and (symbolp last-command) (get last-command 'icicle-cycling-command)
                      (not (get this-command 'icicle-completing-command)))
                 <span class="linecomment">;;$$$ (and (symbolp last-command) (get last-command 'icicle-completing-command))</span>
                 (eq last-command this-command)))
        (setq icicle-current-raw-input  icicle-current-input)
        <span class="linecomment">;; Save it for `C-l', unless it is "".  Drop old entries when too big.</span>
        (icicle-save-raw-input))
       <span class="linecomment">;; Forget last raw input, so it is not highlighted in *Completions*.</span>
       <span class="linecomment">;; Do NOT do this if we are cycling.</span>
       ((not icicle-cycling-p)
        (setq icicle-current-raw-input  "<span class="quote"></span>")))))
  (setq icicle-last-input  icicle-current-input)) <span class="linecomment">; Return `icicle-current-input'.</span>

(defun icicle-put-at-head (list-var element)
  "<span class="quote">Put ELEMENT at the front of the value of LIST-VAR.
If ELEMENT is already a member of the list, then it is moved to the
front.  Otherwise, it is added to the front.  Membership is tested
with `equal'.  The return value is the new value of LIST-VAR.
This is a destructive operation: the list structure is changed.</span>"
  (let* ((lis  (symbol-value list-var))
         (tl   (member element lis)))
    (cond ((null lis) (set list-var (list element)))
          <span class="linecomment">;;;((eq tl lis) (set list-var (cdr lis)))</span>
          ((not (eq tl lis))
           (when tl (setcdr (nthcdr (1- (- (length lis) (length tl))) lis) (cdr tl)))
           (set list-var (cons element lis)))))
  (symbol-value list-var))

(defun icicle-remove-dots (filename)
  "<span class="quote">Strip leading string through last ../ or ./ from FILENAME.</span>"
  (let ((newname  filename))
    (save-match-data
      (while (or (string-match "<span class="quote">\\.\\./</span>" newname)
                 (string-match "<span class="quote">\\./</span>" newname)
                 <span class="linecomment">;; Emacs 21+ `file-relative-name' returns ".." and "." (no slash) for "" first arg</span>
                 (string-match "<span class="quote">^\\.\\.$</span>" newname)
                 (string-match "<span class="quote">^\\.$</span>" newname))
        (setq newname  (substring newname (match-end 0)))))
    newname))

(defun icicle-increment-cand-nb+signal-end (incr max)
  "<span class="quote">Increment candidate number by INCR modulo MAX, and signal end of cycle.</span>"
  (if icicle-candidate-nb
      (setq icicle-candidate-nb  (+ incr icicle-candidate-nb))
    (setq icicle-candidate-nb  0))      <span class="linecomment">; Reset.</span>
  (setq icicle-candidate-nb  (mod icicle-candidate-nb max))
  (when (and (= 0 icicle-candidate-nb) (eq last-command this-command)) <span class="linecomment">; Signal end of cycle.</span>
    (let ((visible-bell  t)) (ding))))

(defun icicle-place-cursor (input)
  "<span class="quote">Position point and mark with respect to the minibuffer candidate.
Positions are `icicle-point-position-in-candidate' and
`icicle-mark-position-in-candidate', respectively.
INPUT is the current user input, that is, the completion root.</span>"
  (let ((case-fold-search  (if (and (icicle-file-name-input-p)
                                    (boundp 'read-file-name-completion-ignore-case))
                               read-file-name-completion-ignore-case
                             completion-ignore-case))
        input-start-position)
    (goto-char (icicle-minibuffer-prompt-end))
    (setq input-start-position  (point))
    (when (and (icicle-file-name-input-p) insert-default-directory)
      (search-forward (icicle-file-name-directory-w-default input) nil t)
      (setq input-start-position  (point))) <span class="linecomment">; Skip directory.</span>
    <span class="linecomment">;; Locate completion root within current completion candidate.</span>
    (when (or (memq icicle-point-position-in-candidate '(root-start root-end))
              (memq icicle-mark-position-in-candidate  '(root-start root-end)))
      (save-excursion
        (save-restriction
          (narrow-to-region (point) (point-max)) <span class="linecomment">; Search within the completion candidate.</span>
          (re-search-forward (icicle-minibuf-input-sans-dir input) nil t))))
    <span class="linecomment">;; Position point.</span>
    (case icicle-point-position-in-candidate
      (input-start (goto-char input-start-position))
      (input-end (goto-char (point-max)))
      (root-start (goto-char (max input-start-position (match-beginning 0))))
      (root-end (goto-char (max input-start-position (match-end 0)))))
    <span class="linecomment">;; Position mark.</span>
    (unless (eq icicle-point-position-in-candidate icicle-mark-position-in-candidate)
      (push-mark (case icicle-mark-position-in-candidate
                   (input-start input-start-position)
                   (input-end (point-max))
                   (root-start (max input-start-position (match-beginning 0)))
                   (root-end (max input-start-position (match-end 0))))
                 'nomsg
                 'activate-mark))))

(defun icicle-highlight-candidate-in-Completions ()
  "<span class="quote">Highlight the current candidate in *Completions*.</span>"
  (let ((compl-win  (get-buffer-window "<span class="quote">*Completions*</span>" 0))
        curr-cand-pos)
    (when compl-win
      (set-window-dedicated-p compl-win t)
      (save-window-excursion
        (select-window compl-win)
        (goto-char (icicle-start-of-candidates-in-Completions))
        (icicle-move-to-next-completion icicle-candidate-nb t)
        (set-buffer-modified-p nil)
        (setq curr-cand-pos  (point)))
      (set-window-point compl-win curr-cand-pos))))

(defun icicle-place-overlay (start end overlay face priority buffer &rest properties)
  "<span class="quote">Put OVERLAY with FACE and PRIORITY between START and END in BUFFER.
OVERLAY is a symbol whose value is the overlay.  If nil, the overlay
  is created.  If non-nil, it is simply moved.
PROPERTIES are additional overlay properties to add: pairs of a
property and a value.</span>"
  (if (symbol-value overlay)            <span class="linecomment">; Overlay exists, just move it.</span>
      (move-overlay (symbol-value overlay) start end buffer)
    (set overlay (make-overlay start end buffer))
    (overlay-put (symbol-value overlay) 'face face)
    (overlay-put (symbol-value overlay) 'priority priority)))

(defun icicle-strip-ignored-files-and-sort (candidates)
  "<span class="quote">Remove file names with ignored extensions, and \".\".  Sort CANDIDATES.
If `icicle-sort-function' is nil, then do not sort.</span>"
  (let* ((pred1           (lambda (cand) (or (save-match-data
                                               (string-match icicle-ignored-extensions-regexp cand))
                                             (string= "<span class="quote">./</span>" cand))))
         (pred2           (lambda (cand) (string= "<span class="quote">./</span>" cand)))
         (new-candidates  (icicle-remove-if (if icicle-ignored-extensions-regexp pred1 pred2)
                                            candidates)))
    <span class="linecomment">;; If the only candidates have ignored extensions, then use them.</span>
    (unless new-candidates (setq new-candidates  (icicle-remove-if pred2 candidates)))
    (if icicle-sort-function (icicle-reversible-sort new-candidates) new-candidates)))

(defun icicle-transform-candidates (candidates)
  "<span class="quote">Apply `icicle-transform-function' to CANDIDATES.
If `icicle-transform-function' is nil, return CANDIDATES.

Note that this transformation is applied before completion candidates
are made available to the user, in particular, before they are
displayed in *Completions*.  Its use is thus quite different from that
of `icicle-transform-sole-candidate'.</span>"
  (if icicle-transform-function (funcall icicle-transform-function candidates) candidates))

(defun icicle-transform-multi-completion (candidate)
  "<span class="quote">Transform display CANDIDATE according to `icicle-list-use-nth-parts'.
If CANDIDATE is not a multi-completion, do nothing.
Return the possibly transformed candidate.</span>"
  (if icicle-list-use-nth-parts
      (let ((parts  (split-string candidate icicle-list-join-string)))
        (icicle-join-nth-parts parts))
    candidate))

(defun icicle-join-nth-parts (parts)
  "<span class="quote">Join the elements in PARTS using `icicle-list-nth-parts-join-string'.</span>"
  (let* ((maxpart  (length parts))
         (indexes  icicle-list-use-nth-parts)
         (cand     "<span class="quote"></span>")
         (firstp   t)
         partnum)
    (while indexes
      (setq partnum  (car indexes))
      (unless firstp (setq cand  (concat cand icicle-list-nth-parts-join-string)))
      (setq firstp  nil)
      (unless (&gt; partnum maxpart) (setq cand  (concat cand (nth (1- partnum) parts))))
      (setq indexes  (cdr indexes)))
    cand))

(defun icicle-display-cand-from-full-cand (cand)
  "<span class="quote">Return the display candidate corresponding to full candidate CAND.</span>"
  (let ((parts  (car cand)))
    (if (atom parts)
        parts                           <span class="linecomment">; Not a multi-completion.</span>
      (if icicle-list-use-nth-parts
          (icicle-join-nth-parts parts) <span class="linecomment">; Join mult-completion parts per `icicle-list-use-nth-parts'.</span>
        <span class="linecomment">;; Multi-completion, but no joining specified.  Reconstitute the display candidate.</span>
        (concat (mapconcat #'identity parts icicle-list-join-string) icicle-list-end-string)))))

(defun icicle-file-name-directory-w-default (file)
  "<span class="quote">Like `file-name-directory', but return `default-directory', not nil.
Does not treat backslash as a directory separator, even on MS Windows.</span>"
  (let ((escaped-file  (subst-char-in-string ?\\ ?\a file)))
    (or (file-name-directory escaped-file) default-directory)))

(defun icicle-file-name-nondirectory (file)
  "<span class="quote">Like `file-name-nondirectory', but does not treat backslash specially.
That is, backslash is never treated as a directory separator.</span>"
  (let ((escaped-file  (subst-char-in-string ?\\ ?\a file)))
    (subst-char-in-string ?\a ?\\ (file-name-nondirectory escaped-file))))

<span class="linecomment">;; $$$$$</span>
<span class="linecomment">;; (defun icicle-file-name-input-p ()</span>
<span class="linecomment">;;   "Return non-nil if expected input is a file name.</span>
<span class="linecomment">;; This is used, instead of variable `minibuffer-completing-file-name',</span>
<span class="linecomment">;; because we sometimes complete against an explicit alist of file names,</span>
<span class="linecomment">;; even in the overall context of file-name input.  In that case, we do</span>
<span class="linecomment">;; not want to use file-name completion.  An example of this is</span>
<span class="linecomment">;; completing against a history list of file names, using</span>
<span class="linecomment">;; `icicle-history'."</span>
<span class="linecomment">;;   ;; Note that some Emacs 20 code uses this as the equivalent of</span>
<span class="linecomment">;;   ;; `minibuffer-completing-file-name':</span>
<span class="linecomment">;;   ;; (memq minibuffer-completion-table '(read-file-name-internal read-directory-name-internal))</span>
<span class="linecomment">;;   (and (symbolp minibuffer-completion-table) (stringp minibuffer-completion-predicate)))</span>

(defun icicle-file-name-input-p ()
  "<span class="quote">Return non-nil if expected input is a file name.</span>"
  minibuffer-completing-file-name)

(defun icicle-file-directory-p (file)
  "<span class="quote">Local, faster replacement for `file-directory-p'.
This does not do all of the file-handler processing that
`file-directory-p' does, so it is not a general replacement.</span>"
  (and (stringp file) (string= file (icicle-file-name-directory-w-default file))))

(defun icicle-minibuf-input ()
  "<span class="quote">Return the user minibuffer input as a string, without text-properties.</span>"
  (save-selected-window (select-window (minibuffer-window)) (icicle-input-from-minibuffer)))

<span class="linecomment">;;$$$$$ Do we need to double all $'s in output from `icicle-subst-envvar-in-file-name',</span>
<span class="linecomment">;;      before calling `substitute-in-file-name'?</span>
(defun icicle-input-from-minibuffer ()
  "<span class="quote">Return the user minibuffer input as a string, without text-properties.
The current buffer must be a minibuffer.</span>"
  (let ((input  (if (fboundp 'minibuffer-contents-no-properties)
                    (minibuffer-contents-no-properties) <span class="linecomment">; e.g. Emacs 22</span>
                  (buffer-substring-no-properties (point-min) (point-max))))) <span class="linecomment">; e.g. Emacs 20</span>
    (when (and (icicle-file-name-input-p)
               (not (string= "<span class="quote"></span>" input))) <span class="linecomment">; Do nothing if user deleted everything in minibuffer.</span>
      (let ((last-char  "<span class="quote"></span>"))
        (when (string= "<span class="quote">$</span>" (substring input (1- (length input)) (length input)))
          (setq last-char  "<span class="quote">$</span>"
                input      (substring input 0 (1- (length input)))))
        (setq input
              (save-match-data
                (concat (subst-char-in-string ?\a ?\\
                                              (condition-case nil
                                                  (substitute-in-file-name
                                                   (icicle-subst-envvar-in-file-name
                                                    (subst-char-in-string ?\\ ?\a input 'in-place)))
                                                (error input))
                                              'in-place)
                        last-char)))))
    input))

(defun icicle-minibuf-input-sans-dir (&optional input)
  "<span class="quote">Return the user input, except for a directory portion if reading a file.</span>"
  (unless input (setq input  (icicle-minibuf-input)))
  (if (icicle-file-name-input-p) (icicle-file-name-nondirectory input) input))

(defun icicle-subst-envvar-in-file-name (input)
  "<span class="quote">Substitute any environment vars in INPUT by their values.
Unlike `substitute-in-file-name', this does not make any other
changes, such as switching `\\' to `/' on MS Windows.</span>"
  (let ((pat1  "<span class="quote">[^$]\\([$]{\\([^$}]+\\)}\\)</span>") <span class="linecomment">; e.g. aaa${HOME}</span>
        (pat2  "<span class="quote">^[$]{\\([^$}]+\\)}</span>")          <span class="linecomment">; e.g. ${HOME}</span>
        (pat3  "<span class="quote">[^$]\\([$]\\([^$]+\\)\\)</span>")    <span class="linecomment">; e.g. aaa$HOME</span>
        (pat4  "<span class="quote">^[$]\\([^$]+\\)</span>"))            <span class="linecomment">; e.g. $HOME</span>
    (cond ((string-match pat1 input)
           (replace-regexp-in-string pat1 (or (getenv (match-string 2 input))
                                              (concat "<span class="quote">$</span>" (match-string 2 input)))
                                     input t t 1))
          ((string-match pat2 input)
           (replace-regexp-in-string pat2 (or (getenv (match-string 1 input))
                                              (concat "<span class="quote">$</span>" (match-string 1 input)))
                                     input t t))
          ((string-match pat3 input)
           (replace-regexp-in-string pat3 (or (getenv (match-string 2 input))
                                              (concat "<span class="quote">$</span>" (match-string 2 input)))
                                     input t t 1))
          ((string-match pat4 input)
           (replace-regexp-in-string pat4 (or (getenv (match-string 1 input))
                                              (concat "<span class="quote">$</span>" (match-string 1 input)))
                                     input t t))
          (t input))))

(defun icicle-filter-wo-input (candidate)
  "<span class="quote">Filter completion CANDIDATE using regexps and predicate.
This filtering is in addition to and prior to matching user input.
Users do not see any candidates filtered out here.
This filtering does not affect proxy candidates or extra candidates.</span>"
  (and (not (string= "<span class="quote"></span>" candidate))     <span class="linecomment">; Filter out empty strings.</span>
       (or (not icicle-must-match-regexp)
           (save-match-data (string-match icicle-must-match-regexp candidate)))
       (or (not icicle-must-not-match-regexp)
           (not (save-match-data (string-match icicle-must-not-match-regexp candidate))))
       (or (not icicle-must-pass-predicate)
           (funcall icicle-must-pass-predicate candidate))))

(defun icicle-complete-again-update (&optional no-display)
  "<span class="quote">Complete again and update completions list.
Update display too, if already shown and NO-DISPLAY is nil.</span>"
  (setq icicle-completion-candidates
        (condition-case nil
            (funcall (case icicle-last-completion-command
                       ((icicle-prefix-complete icicle-prefix-word-complete)
                        (if (icicle-file-name-input-p)
                            #'icicle-file-name-prefix-candidates
                          #'icicle-prefix-candidates))
                       (t
                        (if (icicle-file-name-input-p)
                            #'icicle-file-name-apropos-candidates
                          #'icicle-apropos-candidates)))
                     icicle-current-input)
          (error icicle-completion-candidates))) <span class="linecomment">; No change if completion error.</span>
  (when (and (get-buffer-window "<span class="quote">*Completions*</span>" 0) (not no-display))
    (icicle-display-candidates-in-Completions)))

(defun icicle-msg-maybe-in-minibuffer (format-string &rest args)
  "<span class="quote">Display FORMAT-STRING as a message.
If called with the minibuffer inactive, use `message'.
Otherwise, use `minibuffer-message'.</span>"
  (if (active-minibuffer-window)
      (save-selected-window
        (select-window (minibuffer-window))
        (minibuffer-message (apply #'format (concat "<span class="quote">  [</span>" format-string "<span class="quote">]</span>") args)))
    (apply #'message format-string args)))

(defun icicle-delete-count (elt elts count)
  "<span class="quote">Delete by side effect the first COUNT occurrences of ELT from list ELTS.
This is like `delete', but it deletes only the first COUNT `equal'
occurrences.</span>"
  (while (and elts (equal elt (car elts)) (&gt;= (setq count  (1- count)) 0))
    (setq elts  (cdr elts)))
  (let ((tail  elts)
        (nn    count))
    (if (cdr tail)
        (while (and (cdr tail) (&gt; nn 0))
          (when (equal elt (cadr tail))
            (setq nn  (1- nn))
            (setcdr tail (cddr tail)))
          (setq tail  (cdr tail)))
      (when (and (equal elt (car tail)) (&gt; count 0))
        (setq tail  (cdr tail)))))       <span class="linecomment">; Remove matching singleton.</span>
  elts)

(defun icicle-remove-if (pred xs)
  "<span class="quote">A copy of list XS with no elements that satisfy predicate PRED.</span>"
  (let ((result  ()))
    (dolist (x xs) (unless (funcall pred x) (push x result)))
    (nreverse result)))

(defun icicle-remove-if-not (pred xs)
  "<span class="quote">A copy of list XS with only elements that satisfy predicate PRED.</span>"
  (let ((result  ()))
    (dolist (x xs) (when (funcall pred x) (push x result)))
    (nreverse result)))

(defun icicle-frames-on (buffer &optional frame) <span class="linecomment">; From `frames-on' in `frame-fns.el'.</span>
  "<span class="quote">List of all live frames showing BUFFER (a buffer or its name).
The optional FRAME argument is as for function `get-buffer-window'.</span>"
  (filtered-frame-list (function (lambda (fr) (get-buffer-window buffer fr)))))

(defun icicle-candidate-set-1 (set-fn msg)
  "<span class="quote">Helper function for defining Icicle set commands.
SET-FN is the function to apply to the current and saved candidates.
MESSAGE is the confirmation message to display in the minibuffer.</span>"
  (setq icicle-completion-candidates
        (funcall set-fn icicle-completion-candidates icicle-saved-completion-candidates))
  (if (null icicle-completion-candidates)
      (save-selected-window (select-window (minibuffer-window)) (minibuffer-message "<span class="quote">  [EMPTY SET]</span>"))
    (icicle-maybe-sort-and-strip-candidates)
    (icicle-scroll-or-update-Completions msg)))

(defun icicle-maybe-sort-and-strip-candidates ()
  "<span class="quote">Sort `icicle-completion-candidates'.  Strip ignored file names too.</span>"
  (if (or (icicle-file-name-input-p) icicle-abs-file-candidates) <span class="linecomment">; File names: relative or absolute.</span>
      (setq icicle-completion-candidates
            (icicle-strip-ignored-files-and-sort icicle-completion-candidates))
    (when icicle-sort-function
      (setq icicle-completion-candidates  (icicle-reversible-sort icicle-completion-candidates)))))

(defun icicle-scroll-or-update-Completions (msg)
  "<span class="quote">Scroll *Completions* if this command was repeated; else update it.</span>"
  (if (get-buffer-window "<span class="quote">*Completions*</span>" 0)
      (if (eq last-command this-command)
          <span class="linecomment">;; User repeated the command.  Scroll window around.</span>
          (icicle-scroll-Completions)
        <span class="linecomment">;; User did something else (e.g. changed input).  Update the display.</span>
        (icicle-display-candidates-in-Completions)
        (save-selected-window (select-window (minibuffer-window)) (minibuffer-message msg)))
    <span class="linecomment">;; No window yet.  Show window.</span>
    (icicle-display-candidates-in-Completions)
    (save-selected-window (select-window (minibuffer-window)) (minibuffer-message msg))))

<span class="linecomment">;; $$ No longer used.</span>
(defun icicle-display-Completions ()
  "<span class="quote">Display *Completions* buffer.</span>"
  (let ((completions (all-completions "<span class="quote"></span>" minibuffer-completion-table minibuffer-completion-predicate
                                      icicle-ignore-space-prefix-flag)))
    (when (&gt; (length icicle-completion-candidates) icicle-incremental-completion-threshold)
      (message "<span class="quote">Displaying completion candidates...</span>"))
    (with-output-to-temp-buffer "<span class="quote">*Completions*</span>"
      (display-completion-list
       (if icicle-sort-function (icicle-reversible-sort completions) completions)))))

<span class="linecomment">;; From `cl-seq.el', function `union', without keyword treatment.</span>
<span class="linecomment">;; Same as `simple-set-union' in `misc-fns.el'.</span>
(defun icicle-set-union (list1 list2)
  "<span class="quote">Combine LIST1 and LIST2 using a set-union operation.
The result list contains all items that appear in either LIST1 or
LIST2.  This is a non-destructive function; it copies the data if
necessary.</span>"
  (cond ((null list1) list2)
        ((null list2) list1)
        ((equal list1 list2) list1)
        (t
         (or (&gt;= (length list1) (length list2))
             (setq list1  (prog1 list2 (setq list2  list1)))) <span class="linecomment">; Swap them.</span>
         (while list2
           (unless (member (car list2) list1)
               (setq list1  (cons (car list2) list1)))
           (setq list2  (cdr list2)))
         list1)))

<span class="linecomment">;; From `cl-seq.el', function `intersection', without keyword treatment.</span>
<span class="linecomment">;; Same as `simple-set-intersection' in `misc-fns.el'.</span>
(defun icicle-set-intersection (list1 list2)
  "<span class="quote">Set intersection of lists LIST1 and LIST2.
This is a non-destructive operation: it copies the data if necessary.</span>"
  (and list1 list2
       (if (equal list1 list2)
           list1
         (let ((result  ()))
           (unless (&gt;= (length list1) (length list2))
             (setq list1  (prog1 list2 (setq list2  list1)))) <span class="linecomment">; Swap them.</span>
           (while list2
             (when (member (car list2) list1)
               (setq result  (cons (car list2) result)))
             (setq list2  (cdr list2)))
           result))))

<span class="linecomment">;; From `cl-seq.el', function `set-difference', without keyword treatment.</span>
<span class="linecomment">;; Same as `simple-set-difference' in `misc-fns.el'.</span>
(defun icicle-set-difference (list1 list2)
  "<span class="quote">Combine LIST1 and LIST2 using a set-difference operation.
The result list contains all items that appear in LIST1 but not LIST2.
This is non-destructive; it makes a copy of the data if necessary, to
avoid corrupting the original LIST1 and LIST2.</span>"
  (if (or (null list1) (null list2)) list1
    (let ((result  ()))
      (while list1
        (unless (member (car list1) list2) (setq result  (cons (car list1) result)))
        (setq list1  (cdr list1)))
      result)))

(defun icicle-get-candidates-from-saved-set (set-name &optional dont-expand-filesets-p)
  "<span class="quote">Return the saved set of completion candidates named SET-NAME.
SET-NAME can be the name of either an Icicles saved completion set or,
 if `icicle-filesets-as-saved-completion-sets-flag', an Emacs fileset.
If optional arg DONT-EXPAND-FILESETS-P is non-nil, then don't expand
 fileset entries in a saved completion set.  Instead, return them as
string candidates.</span>"
  (let ((cache-file  (cdr (assoc set-name icicle-saved-completion-sets)))
        fst)
    (cond ((and (not cache-file)        <span class="linecomment">; Fileset - get explicit file list.</span>
                icicle-filesets-as-saved-completion-sets-flag (featurep 'filesets) filesets-data
                (setq fst  (filesets-get-fileset-from-name set-name)))
           (icicle-explicit-saved-completion-candidates (list fst)))
          ((not cache-file) (error "<span class="quote">No such saved set: `%s'</span>" set-name))
          ((not (icicle-file-readable-p cache-file))
           (error "<span class="quote">Cannot read cache file `%s'</span>" cache-file))
          (t                            <span class="linecomment">; Icicles saved completion set.</span>
           (let ((list-buf    (find-file-noselect cache-file 'nowarn))
                 (cands-read  ())
                 (candidates  ()))
             (message "<span class="quote">Retrieving saved candidates from `%s'...</span>" cache-file)
             (unwind-protect
                  (condition-case err
                      (when (listp (setq cands-read  (read list-buf)))
                        (message "<span class="quote">Set `%s' read from file `%s'</span>" set-name cache-file))
                    (error (error "<span class="quote">Could not read cache file.  %S</span>" (error-message-string err))))
               (icicle-kill-a-buffer list-buf))
             (unless cands-read (error "<span class="quote">No completion candidates in file `%s'</span>" cache-file))
             (dolist (cand  (nreverse cands-read)) <span class="linecomment">; Convert saved to displayable candidates.</span>
               (if (not (icicle-saved-fileset-p cand))
                   (push (icicle-displayable-cand-from-saved-set cand) candidates)
                 (condition-case err
                     (require 'filesets)
                   (error "<span class="quote">Set `%s' includes a fileset, but cannot load `fileset.el'</span>" set-name))
                 (filesets-init)
                 (if dont-expand-filesets-p
                     (push cand candidates)
                   (setq candidates
                         (append (mapcar #'icicle-displayable-cand-from-saved-set
                                         (icicle-get-candidates-from-saved-set (cadr cand)))
                                 candidates)))))
             candidates)))))

(defun icicle-explicit-saved-completion-candidates (&optional saved-set)
  "<span class="quote">Return the list of files represented by a saved completion set.
Any fileset entries in the saved set are expanded to an explicit list
of file names.
Optional arg SAVED-SET is the Icicles saved completion set to use.
 It can be the set itself or its name.
 If SAVED-SET is nil, use `icicle-saved-completion-candidates'.</span>"
  (unless saved-set (setq saved-set  icicle-saved-completion-candidates))
  (when (stringp saved-set) (setq saved-set  (icicle-get-candidates-from-saved-set saved-set)))
  (let ((files  ())
        (mode   nil))
    (dolist (entry  saved-set)
      (cond ((atom entry) (push entry files))
            ((and (featurep 'filesets)
                  (or (setq mode  (filesets-entry-mode entry)) <span class="linecomment">; ("my-fs" (:files "a" "b"))</span>
                      (setq entry  (cons "<span class="quote">dummy</span>" entry) <span class="linecomment">; (:files "a" "b")</span>
                            mode   (filesets-entry-mode entry))))
             (message "<span class="quote">Gathering file names...</span>")
             (dolist (file  (filesets-get-filelist entry mode)) (push file files)))
            (t (error "<span class="quote">Bad `icicle-saved-completion-candidates' entry: `%S'</span>" entry))))
    (nreverse files)))

(defun icicle-saved-fileset-p (entry)
  "<span class="quote">Return non-nil if ENTRY is a fileset entry in a saved completion set.
ENTRY is a list whose car is `:fileset' - it is not a fileset name.</span>"
  (and (consp entry) (eq (car entry) ':fileset)))

(defun icicle-displayable-cand-from-saved-set (cand)
  "<span class="quote">Return propertized display candidate for saved candidate CAND.</span>"
  (let ((icicle-whole-candidate-as-text-prop-p  t))
    (car (icicle-mctized-full-candidate (icicle-readable-to-markers cand)))))


<span class="linecomment">;; REPLACE ORIGINAL `filesets-get-filelist' in `filesets.el'.</span>
<span class="linecomment">;;  The original is bugged (I filed Emacs bug #976 on 2008-09-13).</span>
<span class="linecomment">;; For `:tree':</span>
<span class="linecomment">;;  * First get the tree from the ENTRY.</span>
<span class="linecomment">;;  * Return all matching files under the directory, including in subdirs up to</span>
<span class="linecomment">;;    `filesets-tree-max-level' for the entry.</span>
<span class="linecomment">;;</span>
(eval-after-load 'filesets
  '(defun filesets-get-filelist (entry &optional mode event)
    "<span class="quote">Get all files for fileset ENTRY.
Assume MODE (see `filesets-entry-mode'), if provided.</span>"
    (let* ((mode  (or mode (filesets-entry-mode entry)))
           (fl    (case mode
                    ((:files)   (filesets-entry-get-files entry))
                    ((:file)    (list (filesets-entry-get-file entry)))
                    ((:ingroup) (let ((entry  (expand-file-name
                                               (if (stringp entry)
                                                   entry
                                                 (filesets-entry-get-master entry)))))
                                  (cons entry (filesets-ingroup-cache-get entry))))
                    ((:tree)    (let* ((dirpatt  (filesets-entry-get-tree entry)) <span class="linecomment">; Added this line.</span>
                                       (dir      (nth 0 dirpatt)) <span class="linecomment">; Use DIRPATT, not ENTRY.</span>
                                       (patt     (nth 1 dirpatt)) <span class="linecomment">; Use DIRPATT, not ENTRY.</span>
                                       (depth    (or (filesets-entry-get-tree-max-level entry)
                                                     filesets-tree-max-level)))
                                  (icicle-filesets-files-under 0 depth entry dir patt
                                                               (and icicle-mode
                                                                    (icicle-file-name-input-p)))))
                    ((:pattern) (let ((dirpatt  (filesets-entry-get-pattern entry)))
                                  (if dirpatt
                                      (let ((dir   (filesets-entry-get-pattern--dir dirpatt))
                                            (patt  (filesets-entry-get-pattern--pattern dirpatt)))
                                        <span class="linecomment">;;(filesets-message 3 "Filesets: scanning %s" dirpatt)</span>
                                        (filesets-directory-files dir patt ':files t))
                                    <span class="linecomment">;; (message "Filesets: malformed entry: %s" entry)))))))</span>
                                    (filesets-error 'error "<span class="quote">Filesets: malformed entry: </span>" entry)))))))
      (filesets-filter-list fl (lambda (file) (not (filesets-filetype-property file event)))))))

(defun icicle-filesets-files-under (level depth entry dir patt &optional relativep)
  "<span class="quote">Files under DIR that match PATT.
LEVEL is the current level under DIR.
DEPTH is the maximal tree scanning depth for ENTRY.
ENTRY is a fileset.
DIR is a directory.
PATT is a regexp that included file names must match.
RELATIVEP non-nil means use relative file names.</span>"
  (and (or (= depth 0) (&lt; level depth))
       (let* ((dir         (file-name-as-directory dir))
              (files-here  (filesets-directory-files dir patt nil (not relativep)
                                                     (filesets-entry-get-filter-dirs-flag entry)))
              (subdirs     (filesets-filter-dir-names files-here)) <span class="linecomment">; Subdirectories at this level.</span>
              (files
               (filesets-filter-dir-names <span class="linecomment">; Remove directory names.</span>
                (apply #'append
                       files-here
                       (mapcar (lambda (subdir) <span class="linecomment">; Files below this level.</span>
                                 (let* ((subdir       (file-name-as-directory subdir))
                                        (full-subdir  (concat dir subdir)))
                                   (icicle-filesets-files-under
                                    (+ level 1) depth entry full-subdir patt)))
                               subdirs))
                t)))
         files)))

(defun icicle-readable-to-markers (cand)
  "<span class="quote">Convert (deserialize) Lisp-readable representation CAND of candidate.
A Lisp-readable candidate uses the following to represent a marker:
   (icicle-file-marker FILE-NAME   MARKER-POSITION)
or (icicle-marker      BUFFER-NAME MARKER-POSITION)</span>"
  (if (and (consp cand) (consp (cdr cand)) (consp (cddr cand)) (null (cdr (cddr cand)))
           (memq (car cand) '(icicle-file-marker icicle-marker)))
      (let ((file-or-buf  (cadr cand))
            (pos          (car (cddr cand)))
            mrker buf)
        (if (eq (car cand) 'icicle-file-marker)
            (let ((buf  (find-file-noselect file-or-buf)))
              (unless buf (error "<span class="quote">Cannot find file `%s'</span>" file-or-buf))
              (setq file-or-buf  buf))
          (unless (get-buffer file-or-buf) (error "<span class="quote">You must first visit buffer `%s'</span>" file-or-buf)))
        (set-marker (setq mrker  (make-marker)) pos (get-buffer file-or-buf))
        mrker)
    (if (consp cand)
        (cons (icicle-readable-to-markers (car cand)) (icicle-readable-to-markers (cdr cand)))
      cand)))

<span class="linecomment">;; Note that initial and trailing spaces will not be noticeable.  That's OK.</span>
(defun icicle-highlight-complete-input ()
  "<span class="quote">Highlight minibuffer input, showing that it is a sole completion.
Overlay `icicle-complete-input-overlay' is created with `match' face,
unless it exists.</span>"
  (let ((case-fold-search  (if (and (icicle-file-name-input-p)
                                    (boundp 'read-file-name-completion-ignore-case))
                               read-file-name-completion-ignore-case
                             completion-ignore-case))
        input-start-position)
    (save-excursion
      (goto-char (icicle-minibuffer-prompt-end))
      (setq input-start-position  (point))
      (when (and (icicle-file-name-input-p) insert-default-directory)
        (search-forward (icicle-file-name-directory-w-default (icicle-input-from-minibuffer)) nil t)
        (setq input-start-position  (point))) <span class="linecomment">; Skip directory.</span>
      (if icicle-complete-input-overlay <span class="linecomment">; Don't recreate if exists.</span>
          (move-overlay icicle-complete-input-overlay
                        input-start-position (point-max) (current-buffer))
        (setq icicle-complete-input-overlay  (make-overlay input-start-position (point-max)))
        (overlay-put icicle-complete-input-overlay 'face 'icicle-complete-input)))))

(defun icicle-call-then-update-Completions (fn &rest args)
  "<span class="quote">Call FN with ARGS, then update *Completions* with input matches.</span>"
  (save-match-data
    (apply fn args)
    <span class="linecomment">;;$$$ (let ((tramp-completion-mode  t))    ; Fool Tramp into thinking it is in completion mode.</span>
    (setq icicle-current-input   (icicle-input-from-minibuffer)
          icicle-input-fail-pos  nil)
    (when (overlayp icicle-complete-input-overlay) (delete-overlay icicle-complete-input-overlay))
    (icicle-highlight-initial-whitespace icicle-current-input)
    (if (&lt; (length icicle-current-input) icicle-Completions-display-min-input-chars)
        (save-selected-window (icicle-remove-Completions-window))
      <span class="linecomment">;; `icicle-highlight-input-noncompletion' return value saves call to `icicle-file-remote-p'.</span>
      (let ((remote-test  (icicle-highlight-input-noncompletion)))
        <span class="linecomment">;; If ALL of the following are true, then update *Completions* (complete again):</span>
        <span class="linecomment">;;   * incremental completion,</span>
        <span class="linecomment">;;   * `icicle-highlight-input-noncompletion' determined that it's a remote or local file</span>
        <span class="linecomment">;;        or we're not completing file names</span>
        <span class="linecomment">;;        or user said not to test for remote file names</span>
        <span class="linecomment">;;        or we check now and it's not a remote file,</span>
        <span class="linecomment">;;   * *Completions* is already displayed or `icicle-incremental-completion-p' is not t,</span>
        <span class="linecomment">;;   * there are not too many candidates or we have waited the full delay.</span>
        (when (and icicle-incremental-completion-p
                   (or (memq remote-test '(file-local-p file-remote-p))
                       (not (icicle-file-name-input-p))
                       (not icicle-test-for-remote-files-flag)
                       <span class="linecomment">;; Might still be remote if `icicle-highlight-input-completion-failure'</span>
                       <span class="linecomment">;; is `always' or `explicit-remote' - cannot tell from `remote-test'.</span>
                       (and (not (eq remote-test 'file-local-p)) <span class="linecomment">; We don't know if it's local.</span>
                            (not (icicle-file-remote-p icicle-current-input))))
                   (or (get-buffer-window "<span class="quote">*Completions*</span>" 0) <span class="linecomment">; Already displayed.</span>
                       <span class="linecomment">;; If value is, say, `always' or `display' then update anyway.</span>
                       (not (eq t icicle-incremental-completion-p)))
                   (let ((len  (length icicle-completion-candidates)))
                     (or (and (&gt; len 1) (&gt; icicle-incremental-completion-threshold len)) <span class="linecomment">; Not many</span>
                         (sit-for icicle-incremental-completion-delay)))) <span class="linecomment">; Wait, unless input.</span>
          (let ((icicle-edit-update-p  t))
            (funcall (or icicle-last-completion-command
                         (if (eq icicle-current-completion-mode 'prefix)
                             #'icicle-prefix-complete
                           #'icicle-apropos-complete)))
            (run-hooks 'icicle-update-input-hook)))))
    (setq mark-active  nil)))

(defun icicle-highlight-input-noncompletion ()
  "<span class="quote">Highlight the portion of the current input that does not complete.
See the doc strings of `icicle-highlight-input-completion-failure' and
`icicle-test-for-remote-files-flag' for information about when this
highlighting occurs.

If we know the input is a remote file name, return `file-remote-p'.
If we know it is a local file name, return `file-local-p'.
If part of the input matches candidates, return that matching part.
If no highlighting was attempted, return nil.</span>"
  (let ((input-start   (icicle-minibuffer-prompt-end))
        (input         (icicle-input-from-minibuffer))
        (file-local-p  nil))
    (cond
      <span class="linecomment">;; No input.</span>
      ((string= "<span class="quote"></span>" input) "<span class="quote"></span>")           <span class="linecomment">; Return string: highlighting attempted.</span>

      <span class="linecomment">;; One of these: pending input,</span>
      <span class="linecomment">;;               not highlighting,</span>
      <span class="linecomment">;;               highlighting `explicit-*' but not explicitly completing (TAB/S-TAB),</span>
      <span class="linecomment">;;               highlighting `implicit-*' but not incrementally completing,</span>
      <span class="linecomment">;;               highlighting `*-strict'   but not strict completion (and testing remote files)</span>
      <span class="linecomment">;;               there are more candidates than the threshold for highlighting.</span>
      ((or (input-pending-p)
           (not icicle-highlight-input-completion-failure)
           (and (not (get this-command 'icicle-completing-command))
                (memq icicle-highlight-input-completion-failure
                      '(explicit explicit-strict explicit-remote)))
           (and (not icicle-incremental-completion-flag)
                (memq icicle-highlight-input-completion-failure '(implicit implicit-strict)))
           (and (not (icicle-require-match-p))
                icicle-test-for-remote-files-flag <span class="linecomment">; nil flag ignores strict setting for highlighting </span>
                (memq icicle-highlight-input-completion-failure '(implicit-strict explicit-strict)))
           (let ((len  (length icicle-completion-candidates)))
             (and (&gt; len 1) (&gt; len icicle-highlight-input-completion-failure-threshold))))
       nil)                             <span class="linecomment">; Return nil: no highlighting attempted.</span>

      <span class="linecomment">;; Cursor is to the left of the last mismatch position.</span>
      ((and icicle-input-fail-pos (&lt; (point) icicle-input-fail-pos))
       (setq icicle-input-fail-pos  nil) <span class="linecomment">; Reset failure position.</span>
       <span class="linecomment">;; Remove vestigial highlighting on matched part (e.g. from another completion mode).</span>
       (when (&gt; (or icicle-input-fail-pos (point-max)) input-start)
         (remove-text-properties input-start (1- (or icicle-input-fail-pos (point-max)))
                                 '(face)))
       nil)                             <span class="linecomment">; Return nil: no highlighting attempted.</span>

      <span class="linecomment">;; Remote file-name input, user didn't say to skip testing for remote files,</span>
      <span class="linecomment">;; and highlighting is not `always' or `explicit-remote'.</span>
      ((and (icicle-file-name-input-p)
            (not (memq icicle-highlight-input-completion-failure '(always explicit-remote)))
            icicle-test-for-remote-files-flag
            (let ((remotep  (icicle-file-remote-p input)))
              (unless remotep (setq file-local-p  'file-local-p)) <span class="linecomment">; We know it's local, so save that.</span>
              remotep))
       <span class="linecomment">;; Do the same as for the previous, except return indication that we know it is a remote file.</span>
       (setq icicle-input-fail-pos  nil)
       (when (&gt; (or icicle-input-fail-pos (point-max)) input-start)
         (remove-text-properties input-start (+ input-start (length input)) '(face)))
       'file-remote-p)                  <span class="linecomment">; Return `file-remote-p': we know it is a remote file.</span>

      ((and icicle-highlight-input-completion-failure-delay
            (progn (message nil)        <span class="linecomment">; Clear any message, e.g. "Computing completion candidates..."</span>
                   (sit-for icicle-highlight-input-completion-failure-delay)))
       <span class="linecomment">;; First, a quick check through last two chars.</span>
       <span class="linecomment">;; If last succeeds, then done.</span>
       <span class="linecomment">;; If last fails and next-to-last succeeds, then done.</span>
       <span class="linecomment">;; Otherwise, highlight the others using a binary search.</span>
       (let ((matchp  (icicle-any-candidates-p input))) <span class="linecomment">; Entire input, through last char.</span>
         (unless matchp
           <span class="linecomment">;; Record failure position and highlight last char.</span>
           (setq icicle-input-fail-pos  (if icicle-input-fail-pos
                                            (min icicle-input-fail-pos (point-max))
                                          (point-max)))
           (put-text-property (1- icicle-input-fail-pos) (point-max)
                              'face (if (icicle-require-match-p)
                                        'icicle-input-completion-fail
                                      'icicle-input-completion-fail-lax))
           <span class="linecomment">;; See if next-to-last char gives a match.  Typical use case: mistyping a char at end.</span>
           (setq input  (substring input 0 (1- (length input))))
           (unless (string= "<span class="quote"></span>" input)
             (setq matchp  (icicle-any-candidates-p input))
             <span class="linecomment">;; If more than just the last char fails, highlight the others using binary search.</span>
             (unless matchp (icicle-highlight-input-noncompletion-rest)))))
       <span class="linecomment">;; Remove vestigial highlighting on matched part (e.g. from another completion mode).</span>
       (when (&gt; (or icicle-input-fail-pos (point-max)) input-start)
         (remove-text-properties
          input-start (1- (or icicle-input-fail-pos (point-max))) '(face)))
       <span class="linecomment">;; Highlighting attempted, so return non-nil.  If we know it's local, return `file-local-p'.</span>
       <span class="linecomment">;; If we don't know that, return the part of INPUT that matches.</span>
       (or file-local-p input))
      (t nil))))                        <span class="linecomment">; Return nil: no highlighting attempted.</span>

(defun icicle-highlight-input-noncompletion-rest ()
  "<span class="quote">Helper function for `icicle-highlight-input-noncompletion'.</span>"
  (let* ((input-start  (icicle-minibuffer-prompt-end))
         (pos          (1- icicle-input-fail-pos))
         (delta        pos)
         (last-pos     input-start)
         (matchp       nil)
         input)
    (while (and (&gt; pos input-start) (or (not matchp) (&lt; pos icicle-input-fail-pos))) <span class="linecomment">; Binary search.</span>
      (setq input   (buffer-substring input-start pos)
            delta   (max 1 (/ (abs (- pos last-pos)) 2))
            matchp  (icicle-any-candidates-p input))
      <span class="linecomment">;; $$$$$$ Emacs BUG (prefix completion): c:/foo/$$ does not highlight the `$$', because</span>
      <span class="linecomment">;; (try-completion "c:/foo/$" 'read-file-name-internal "c:/foo/") returns "c:/foo/$".</span>
      <span class="linecomment">;; (However, c:/foo/$ highlights the `$' correctly.)</span>
      (unless matchp (setq icicle-input-fail-pos  (min pos icicle-input-fail-pos)))
      (setq last-pos  pos
            pos       (if matchp (+ pos delta) (- pos delta))))
    (unless (or (&lt; pos input-start) (&gt; pos icicle-input-fail-pos))
      (put-text-property (1- icicle-input-fail-pos) (point-max)
                         'face (if (icicle-require-match-p)
                                   'icicle-input-completion-fail
                                 'icicle-input-completion-fail-lax)))
    input))                       <span class="linecomment">; Return part of INPUT that matches.</span>

(defun icicle-ms-windows-NET-USE (drive)
  "<span class="quote">Return result of calling MS Windows `NET USE' command on DRIVE.
DRIVE is a Windows drive name, such as `f:'.
A return value of zero means DRIVE is a mapped network drive.</span>"
  (if (and (fboundp 'hash-table-p) (hash-table-p icicle-ms-windows-drive-hash))
      (let ((lookup  (gethash drive icicle-ms-windows-drive-hash 'no-assoc)))
        (if (eq lookup 'no-assoc)
            (puthash drive (call-process shell-file-name nil nil nil shell-command-switch
                                         (concat "<span class="quote">NET USE </span>" drive)) icicle-ms-windows-drive-hash)
          lookup))
    <span class="linecomment">;; Don't bother to hash for Emacs 20, 21, unless `cl.el' happens to be loaded.</span>
    (call-process shell-file-name nil nil nil shell-command-switch (concat "<span class="quote">NET USE </span>" drive))))

<span class="linecomment">;; $$$$$ TRYING WITHOUT `save-match-data', but probably need it.</span>
(defun icicle-file-remote-p (file)
  "<span class="quote">Non-nil means FILE is likely to name a file on a remote system.
For MS Windows, this includes a file on a mapped network drive.
Otherwise, this uses `ffap-file-remote-p' and `file-remote-p' (if
defined).</span>"
  <span class="linecomment">;; $$$$  (save-match-data        ; $$$$$ IS THIS NEEDED?</span>
  (if (and (eq system-type 'windows-nt)
           (let ((case-fold-search  t)) (string-match "<span class="quote">\\`\\([a-z]:\\)</span>" file)))
      (eq 0 (condition-case nil
                (icicle-ms-windows-NET-USE (match-string 1 file))
              (error nil)))
    (or (and (fboundp 'ffap-file-remote-p) (ffap-file-remote-p file))
        (and (fboundp 'file-remote-p) (file-remote-p file)))))

<span class="linecomment">;;; $$$$$ Should these `*-any-*' fns call `icicle-transform-candidates'?  For now, no, to save time.</span>
(defun icicle-any-candidates-p (input)
  "<span class="quote">Return non-nil if there is any completion for INPUT, nil otherwise.</span>"
  (condition-case nil
      (funcall (case icicle-current-completion-mode
                 (apropos (if (icicle-file-name-input-p)
                              #'icicle-apropos-any-file-name-candidates-p
                            #'icicle-apropos-any-candidates-p))
                 (otherwise (if (icicle-file-name-input-p)
                                #'icicle-prefix-any-file-name-candidates-p
                              #'icicle-prefix-any-candidates-p)))
               input)
    (error nil)))

(defun icicle-prefix-any-candidates-p (input)
  "<span class="quote">Return non-nil if current partial INPUT has prefix completions.</span>"
  (let ((minibuffer-completion-table      minibuffer-completion-table)
        (minibuffer-completion-predicate  minibuffer-completion-predicate))
    (if (and (fboundp 'completion-try-completion)
             icicle-respect-completion-styles-p)
        (icicle-completion-try-completion input minibuffer-completion-table
                                          minibuffer-completion-predicate
                                          (- (point) (field-beginning)))
      (try-completion input minibuffer-completion-table minibuffer-completion-predicate))))

(defun icicle-prefix-any-file-name-candidates-p (input)
  "<span class="quote">Return non-nil if partial file-name INPUT has prefix completions.</span>"
  (let* ((minibuffer-completion-table      minibuffer-completion-table)
         (minibuffer-completion-predicate  minibuffer-completion-predicate)
         (slashed-p                        (and (&gt; (length input) 0) (eq ?/ (aref input 0)))))
    (when slashed-p (setq input  (substring input 1)))
    (if (and (fboundp 'completion-try-completion)
             icicle-respect-completion-styles-p)
        (icicle-completion-try-completion input minibuffer-completion-table
                                          minibuffer-completion-predicate
                                          (length input))
      (try-completion input minibuffer-completion-table (if slashed-p "<span class="quote">/</span>" default-directory)))))

(defun icicle-apropos-any-candidates-p (input)
  "<span class="quote">Return non-nil if current partial INPUT has apropos completions.</span>"
  (when icicle-regexp-quote-flag (setq input  (regexp-quote input)))
  (let* ((minibuffer-completion-table      minibuffer-completion-table)
         (minibuffer-completion-predicate  minibuffer-completion-predicate)
         (all (all-completions "<span class="quote"></span>" minibuffer-completion-table
                               minibuffer-completion-predicate
                               icicle-ignore-space-prefix-flag)))
    (catch 'icicle-apropos-any-candidates-p
      (dolist (cand all)
        (when (funcall icicle-apropos-complete-match-fn input cand)
          (throw 'icicle-apropos-any-candidates-p cand)))
      nil)))

(defun icicle-apropos-any-file-name-candidates-p (input)
  "<span class="quote">Return non-nil if partial file-name INPUT has apropos completions.</span>"
  (let* ((default-directory                (icicle-file-name-directory-w-default input))
         (minibuffer-completion-table      minibuffer-completion-table)
         (minibuffer-completion-predicate  minibuffer-completion-predicate))
    (setq input  (or (icicle-file-name-nondirectory input) "<span class="quote"></span>"))
    (condition-case nil
        (progn
          (when icicle-regexp-quote-flag (setq input  (regexp-quote input)))
          (let ((slashed-p  (and (&gt; (length input) 0) (eq ?/ (aref input 0)))))
            (when slashed-p (setq input  (substring input 1)))
            (let ((candidates (all-completions "<span class="quote"></span>" minibuffer-completion-table
                                               (if slashed-p "<span class="quote">/</span>" default-directory)
                                               icicle-ignore-space-prefix-flag)))
              (catch 'icicle-apropos-any-file-name-candidates-p
                (dolist (cand candidates)
                  (when (if (member cand '("<span class="quote">../</span>" "<span class="quote">./</span>"))
                            (member input '("<span class="quote">..</span>" "<span class="quote">.</span>")) <span class="linecomment">; Prevent "" from matching "../"</span>
                          (and (or (not icicle-apropos-complete-match-fn)
                                   (funcall icicle-apropos-complete-match-fn input cand))))
                    (throw 'icicle-apropos-any-file-name-candidates-p cand)))
                nil))))
      (quit (top-level)))))             <span class="linecomment">; Let `C-g' stop it.</span>

(defun icicle-clear-minibuffer ()
  "<span class="quote">Delete all user input in the minibuffer.
This must be called from the minibuffer.</span>"
  (if (fboundp 'delete-minibuffer-contents) (delete-minibuffer-contents) (erase-buffer)))

<span class="linecomment">;; Borrowed from `ps-print.el'</span>
(defun icicle-remove-duplicates (list)
  "<span class="quote">Copy of LIST with duplicate elements removed.  Tested with `equal'.</span>"
  (let ((tail  list)
        new)
    (while tail
      (unless (member (car tail) new) (push (car tail) new))
      (pop tail))
    (nreverse new)))

(defun icicle-remove-dups-if-extras (list)
  "<span class="quote">`icicle-remove-duplicates' if `icicle-extra-candidates' is non-nil.
If `icicle-extra-candidates' is nil, then return LIST.

Note: When you use this as the value of `icicle-transform-function',
be aware that during completion and before applying this function,
`icicle-extra-candidates' is redefined locally by removing its
candidates that don't match the current input.  So this function then
has the effect of removing any duplicates that match the input.  If
there are no such matching candidates, then LIST is returned.</span>"
  (if icicle-extra-candidates
      (let ((tail  list)
            new)
        (while tail
          (unless (member (car tail) new) (push (car tail) new))
          (pop tail))
        (nreverse new))
    list))

(defun icicle-file-readable-p (file)
  "<span class="quote">Return non-nil if FILE (a string) names a readable file.</span>"
  (and (not (string= "<span class="quote"></span>" file)) (file-readable-p file) (not (file-directory-p file))))

(defun icicle-file-writable-p (file)
  "<span class="quote">Return non-nil if FILE (a string) names a writable file.</span>"
  (and (not (string= "<span class="quote"></span>" file)) (file-writable-p file) (not (file-directory-p file))))

(defun icicle-files-within (file-list accum)
  "<span class="quote">List of all readable files in FILE-LIST.
Accessible directories in FILE-LIST are processed recursively to
include their files and the files in their subdirectories.  The list
of files is accumulated in ACCUM, which is used for recursive calls.</span>"
  (let ((res  accum))
    (while file-list
      (if (file-directory-p (car file-list))
          (when (file-accessible-directory-p (car file-list)) <span class="linecomment">; Skip inaccessible directories.</span>
            (setq res  (icicle-files-within (directory-files (car file-list) 'full icicle-re-no-dot)
                                            res)))
        (when (file-readable-p (car file-list)) (setq res  (cons (car file-list) res))))
      (pop file-list))
    res))

(defun icicle-delete-whitespace-from-string (string &optional from to)
  "<span class="quote">Remove whitespace from substring of STRING from FROM to TO.
If FROM is nil, then start at the beginning of STRING (FROM = 0).
If TO is nil, then end at the end of STRING (TO = length of STRING).
FROM and TO are zero-based indexes into STRING.
Character FROM is affected (possibly deleted).  Character TO is not.</span>"
  (setq from  (or from 0)
        to    (or to (length string)))
  (with-temp-buffer
    (insert string)
    (goto-char (+ from (point-min)))
    (let ((count  from)
          char)
      (while (and (not (eobp)) (&lt; count to))
        (setq char  (char-after))
        (if (memq char '(?\  ?\t ?\n)) (delete-char 1) (forward-char 1))
        (setq count  (1+ count)))
      (buffer-string))))

(defun icicle-barf-if-outside-minibuffer ()
  "<span class="quote">Raise an error if `this-command' is called outside the minibuffer.</span>"
  (unless (eq (current-buffer) (window-buffer (minibuffer-window)))
    (error "<span class="quote">Command `%s' must be called from the minibuffer</span>" this-command)))

(defun icicle-barf-if-outside-Completions ()
  "<span class="quote">Raise an error if `this-command' is called outside buffer *Completions*.</span>"
  (unless (eq (current-buffer) (get-buffer "<span class="quote">*Completions*</span>"))
    (error "<span class="quote">Command `%s' must be called from *Completions* buffer</span>" this-command)))

(defun icicle-barf-if-outside-Completions-and-minibuffer ()
  "<span class="quote">Error if `this-command' called outside *Completions* and minibuffer.</span>"
  (unless (or (eq (current-buffer) (window-buffer (minibuffer-window)))
              (eq (current-buffer) (get-buffer "<span class="quote">*Completions*</span>")))
    (error "<span class="quote">Command `%s' must be called from *Completions* buffer or the minibuffer</span>" this-command)))

(defun icicle-command-abbrev-save ()
  "<span class="quote">Save `icicle-command-abbrev-alist'.  Used on `kill-emacs-hook'.</span>"
  (condition-case err                   <span class="linecomment">; Don't raise an error, since it's on `kill-emacs-hook.</span>
      (let ((sav  (get 'icicle-command-abbrev-alist 'saved-value)))
        (unless
            (and (or (null sav)
                     (and (consp sav) (consp (car sav)) (consp (cdar sav)) (consp (car (cdar sav)))))
                 (equal icicle-command-abbrev-alist (car (cdar sav))))
          (funcall icicle-customize-save-variable-function
                   'icicle-command-abbrev-alist
                   icicle-command-abbrev-alist)))
    (error (message "<span class="quote">Cannot save new value of `icicle-command-abbrev-alist'</span>") (sleep-for 3))))

(defun icicle-expand-file-name (input dir)
  "<span class="quote">Expand file-name INPUT in directory DIR.
Similar to `expand-file-name', except:

 - If INPUT does not end in a slash, and DIR/INPUT is a directory,
   a trailing slash is added.

 - If INPUT ends in a slash, but DIR/INPUT is not a directory, then
   the trailing slash is removed.</span>"
  (let ((expanded-input  (directory-file-name (expand-file-name input dir))))
    <span class="linecomment">;; Add trailing slash if input is a directory.</span>
    (when (file-directory-p expanded-input)
      (setq expanded-input  (file-name-as-directory expanded-input)))
    expanded-input))

(defun icicle-start-of-candidates-in-Completions ()
  "<span class="quote">Return buffer position of the first candidate in *Completions*.</span>"
  (save-excursion
    (goto-char (point-min))
    (forward-line (if icicle-show-Completions-help-flag 2 1))
    (point)))

(defun icicle-key-description (keys &optional no-angles)
  "<span class="quote">`key-description', but non-nil NO-ANGLES means use no angle brackets.</span>"
  (let ((result  (key-description keys)))
    (when no-angles              <span class="linecomment">; Assume space separates angled keys.</span>
      (setq result  (replace-regexp-in-string "<span class="quote">&lt;\\([^&gt;]+\\)&gt;</span>" "<span class="quote">\\1</span>" result 'fixed-case)))
    result))

<span class="linecomment">;; $$ Not used.</span>
<span class="linecomment">;; (defun icicle-alist-delete-all (key alist &optional test)</span>
<span class="linecomment">;;     "Delete from ALIST all elements whose car is the same as KEY.</span>
<span class="linecomment">;; Optional arg TEST is the equality test to use.  If nil, `eq' is used.</span>
<span class="linecomment">;; Return the modified alist.</span>
<span class="linecomment">;; Elements of ALIST that are not conses are ignored."</span>
<span class="linecomment">;;     (setq test  (or test #'eq))</span>
<span class="linecomment">;;     (while (and (consp (car alist)) (funcall test (car (car alist)) key))</span>
<span class="linecomment">;;       (setq alist  (cdr alist)))</span>
<span class="linecomment">;;     (let ((tail  alist) tail-cdr)</span>
<span class="linecomment">;;       (while (setq tail-cdr  (cdr tail))</span>
<span class="linecomment">;;         (if (and (consp (car tail-cdr)) (funcall test (car (car tail-cdr)) key))</span>
<span class="linecomment">;;             (setcdr tail (cdr tail-cdr))</span>
<span class="linecomment">;;           (setq tail  tail-cdr))))</span>
<span class="linecomment">;;     alist)</span>

<span class="linecomment">;; Standard Emacs 21+ function, defined here for Emacs 20.</span>
(unless (fboundp 'assq-delete-all)
  (defun assq-delete-all (key alist)
    "<span class="quote">Delete from ALIST all elements whose car is `eq' to KEY.
Return the modified alist.
Elements of ALIST that are not conses are ignored.</span>"
    (while (and (consp (car alist)) (eq (car (car alist)) key)) (setq alist  (cdr alist)))
    (let ((tail  alist) tail-cdr)
      (while (setq tail-cdr  (cdr tail))
        (if (and (consp (car tail-cdr)) (eq (car (car tail-cdr)) key))
            (setcdr tail (cdr tail-cdr))
          (setq tail  tail-cdr))))
    alist))

(defun icicle-assoc-delete-all (key alist)
  "<span class="quote">Delete from ALIST all elements whose car is `equal' to KEY.
Return the modified alist.
Elements of ALIST that are not conses are ignored.</span>"
  (while (and (consp (car alist)) (equal (car (car alist)) key))
    (setq alist  (cdr alist)))
  (let ((tail  alist) tail-cdr)
    (while (setq tail-cdr  (cdr tail))
      (if (and (consp (car tail-cdr)) (equal (car (car tail-cdr)) key))
          (setcdr tail (cdr tail-cdr))
        (setq tail  tail-cdr))))
  alist)

(defun icicle-abbreviate-or-expand-file-name (filename &optional default-dir)
  "<span class="quote">`abbreviate-file-name' if `icicle-use-~-for-home-dir-flag' is non-nil.
`expand-file-name' if `icicle-use-~-for-home-dir-flag' is nil.</span>"
  (if icicle-use-~-for-home-dir-flag
      (abbreviate-file-name (expand-file-name filename default-dir))
    (expand-file-name filename default-dir)))

(defun icicle-reversible-sort (list)
  "<span class="quote">`sort' using `icicle-sort-function', or the reverse.
Sort LIST using `icicle-sort-function'.  Reverse the result if
`icicle-reverse-sort-p' is non-nil.</span>"
<span class="linecomment">;;$$ (when (and icicle-edit-update-p icicle-completion-candidates</span>
<span class="linecomment">;;              (&gt; (length icicle-completion-candidates) icicle-incremental-completion-threshold))</span>
<span class="linecomment">;;     (message "Sorting candidates..."))</span>
   (sort list (if icicle-reverse-sort-p
                 (lambda (a b) (not (funcall icicle-sort-function a b)))
               icicle-sort-function)))

(defun icicle-get-alist-candidate (string &optional no-error-p)
  "<span class="quote">Return full completion candidate that corresponds to displayed STRING.
STRING is the name of the candidate, as shown in *Completions*.
Non-nil optional argument NO-ERROR-P means display a message and
return nil instead of raising an error if STRING is ambiguous.

If `icicle-whole-candidate-as-text-prop-p' is non-nil, then the full
candidate might be available as text property `icicle-whole-candidate'
of STRING.  If so, then that is used.

Otherwise, the full candidate is obtained from
`icicle-candidates-alist'.  In this case:
 If the user cycled among candidates or used `mouse-2', then use the
   current candidate number, and ignore STRING.
 Otherwise:
   If only one candidate matches STRING, use that.
   Else respect NO-ERROR-P and tell user to use cycling or `mouse-2'.</span>"
  (or (and icicle-whole-candidate-as-text-prop-p
           (get-text-property 0 'icicle-whole-candidate string))
      (and icicle-candidates-alist
           (let ((cand-entries  (icicle-filter-alist icicle-candidates-alist
                                                     icicle-completion-candidates)))
             (if (wholenump icicle-candidate-nb) <span class="linecomment">; Cycled or used `mouse-2' to choose the candidate.</span>
                 (elt cand-entries (mod icicle-candidate-nb (length icicle-candidates-alist)))
               <span class="linecomment">;; If `icicle-completion-candidates' is nil, because user didn't use `TAB' or `S-TAB',</span>
               <span class="linecomment">;; then `icicle-candidates-alist' can contain non-matches.  So, we check for more than</span>
               <span class="linecomment">;; one match.  However, we can't just use `assoc', because candidates might be</span>
               <span class="linecomment">;; multi-completions (lists).</span>
               (let ((first-match  (icicle-first-matching-candidate string icicle-candidates-alist)))
                 (if (and first-match
                          (not (icicle-first-matching-candidate
                                string
                                (setq cand-entries  (delete first-match cand-entries)))))
                     first-match        <span class="linecomment">; Only one match, so use it.</span>
                   (let ((msg  "<span class="quote">Ambiguous choice. Cycle or use `mouse-2' to choose unique matching \
candidate.</span>"))
                     (unless no-error-p (error msg))
                     (icicle-msg-maybe-in-minibuffer msg)
                     nil))))))))        <span class="linecomment">; Return nil for ambiguous string if NO-ERROR-P.</span>

(defun icicle-filter-alist (alist filter-keys)
  "<span class="quote">Filter ALIST, keeping items whose cars match FILTER-KEYS, in order.
The original ALIST is not altered; a copy is filtered and returned.
If FILTER-KEYS is empty, then ALIST is returned, not a copy.</span>"
  (if filter-keys
      (icicle-remove-if-not
       (lambda (item)
         (member (if (consp (car item))
                     (concat (mapconcat #'identity (car item) icicle-list-join-string)
                             icicle-list-end-string)
                   (car item))
                 filter-keys))
       alist)
    alist))

<span class="linecomment">;;; $$$$$$$$$$$$$$$$$$</span>
<span class="linecomment">;;; (defun icicle-first-matching-candidate (cand candidates)</span>
<span class="linecomment">;;;   "Return the first element of alist CANDIDATES that matches CAND.</span>
<span class="linecomment">;;; If CANDIDATES is a normal list of completion candidates, then this is</span>
<span class="linecomment">;;; just `assoc'.</span>
<span class="linecomment">;;; If CANDIDATES contains multi-completions, then matching means matching</span>
<span class="linecomment">;;; the concatenated multi-completion parts, joined by</span>
<span class="linecomment">;;; `icicle-list-join-string'."</span>
<span class="linecomment">;;;   (cond ((null candidates) nil)</span>
<span class="linecomment">;;;         ((if (consp (caar candidates))  ; Multi-completion candidate</span>
<span class="linecomment">;;;              (save-match-data</span>
<span class="linecomment">;;;                (string-match cand (mapconcat #'identity (caar candidates)</span>
<span class="linecomment">;;;                                              icicle-list-join-string)))</span>
<span class="linecomment">;;;            (equal cand (caar candidates))) ; This case is just `assoc'.</span>
<span class="linecomment">;;;          (car candidates))</span>
<span class="linecomment">;;;         (t (icicle-first-matching-candidate cand (cdr candidates)))))</span>

(defun icicle-first-matching-candidate (cand candidates)
  "<span class="quote">Return the first element of alist CANDIDATES that matches CAND.
Return nil if there is no such element.
If CANDIDATES is a normal list of completion candidates, then this is
just `assoc'.
If CANDIDATES contains multi-completions, then matching means matching
the concatenated multi-completion parts, joined by
`icicle-list-join-string'.</span>"
  (let ((res  nil))
    (if (null candidates)
        (setq res  nil)
      (while (and candidates (not res))
        (when (or (and (consp (caar candidates)) <span class="linecomment">; Multi-completion candidate</span>
                       (save-match-data
                         (string-match (regexp-quote cand)
                                       (concat (mapconcat #'identity (caar candidates)
                                                          icicle-list-join-string)
                                               icicle-list-end-string))))
                  (equal cand (caar candidates)))
          (setq res  (car candidates)))
        (setq candidates  (cdr candidates))))
    res))

(defun icicle-completing-p ()
  "<span class="quote">Non-nil if reading minibuffer input with completion.
This caches the value returned in variable `icicle-completing-p'.
Use the function, not the variable, to test, if not sure to be in the
minibuffer.</span>"
  (setq icicle-completing-p             <span class="linecomment">; Cache the value.</span>
        (and (active-minibuffer-window)
             <span class="linecomment">;; $$$ (where-is-internal 'icicle-candidate-action nil 'first-only)</span>
             (let* ((loc-map  (current-local-map))
                    (parent   (keymap-parent loc-map))
                    (maps     (if (boundp 'minibuffer-local-filename-completion-map)
                                  (list minibuffer-local-completion-map
                                        minibuffer-local-must-match-map
                                        minibuffer-local-filename-completion-map
                                        minibuffer-local-filename-must-match-map)
                                (list minibuffer-local-completion-map
                                      minibuffer-local-must-match-map))))
               (or (and parent (member parent maps)) (member loc-map maps))))))

<span class="linecomment">;; This is just `substring-no-properties', defined also for Emacs &lt; 22.</span>
(defun icicle-substring-no-properties (string &optional from to)
  "<span class="quote">Return a substring of STRING, without text properties.
It starts at index FROM and ending before TO.
TO may be nil or omitted; then the substring runs to the end of STRING.
If FROM is nil or omitted, the substring starts at the beginning of STRING.
If FROM or TO is negative, it counts from the end.

With one argument, just copy STRING without its properties.</span>"
  (if (fboundp 'substring-no-properties)
      (substring-no-properties string from to) <span class="linecomment">; Emacs 22.</span>
    (let ((substrg  (copy-sequence (substring string (or from 0) to))))
      (set-text-properties 0 (length substrg) nil substrg)
      substrg)))

(defun icicle-highlight-lighter ()
  "<span class="quote">Highlight `Icy' mode-line indicator of Icicle mode.
Highlighting indicates the current completion status.</span>"
  (when icicle-highlight-lighter-flag
    (let ((strg  (if (if (and (icicle-file-name-input-p)
                              (boundp 'read-file-name-completion-ignore-case))
                         read-file-name-completion-ignore-case
                       completion-ignore-case)
                     "<span class="quote"> ICY</span>"
                   "<span class="quote"> Icy</span>"))
          (face  (cond ((and icicle-candidate-action-fn (icicle-require-match-p))
                        '(icicle-multi-command-completion icicle-mustmatch-completion))
                       (icicle-candidate-action-fn 'icicle-multi-command-completion)
                       ((icicle-require-match-p)
                        '(icicle-completion icicle-mustmatch-completion))
                       (t 'icicle-completion))))
      (when icicle-candidate-action-fn (setq strg  (concat strg "<span class="quote">+</span>")))
      (put-text-property 0 (length strg) 'face face strg)
      (setq minor-mode-alist  (delete '(icicle-mode "<span class="quote"> Icy</span>")  minor-mode-alist)
            minor-mode-alist  (delete '(icicle-mode "<span class="quote"> Icy+</span>") minor-mode-alist)
            minor-mode-alist  (delete '(icicle-mode "<span class="quote"> ICY</span>")  minor-mode-alist)
            minor-mode-alist  (delete '(icicle-mode "<span class="quote"> ICY+</span>") minor-mode-alist))
      (add-to-list 'minor-mode-alist `(icicle-mode ,strg)))
    (condition-case nil    <span class="linecomment">; Ignore errors from, e.g., killed buffers.</span>
        (if (fboundp 'redisplay) (redisplay t) (force-mode-line-update t))
      (error nil))))

(defun icicle-unhighlight-lighter ()
  "<span class="quote">Unhighlight `Icy' mode-line indicator of Icicle mode.</span>"
  (when icicle-highlight-lighter-flag
    (let ((strg  (if case-fold-search "<span class="quote"> ICY</span>" "<span class="quote"> Icy</span>")))
      (setq minor-mode-alist  (delete '(icicle-mode "<span class="quote"> Icy</span>")  minor-mode-alist)
            minor-mode-alist  (delete '(icicle-mode "<span class="quote"> Icy+</span>") minor-mode-alist)
            minor-mode-alist  (delete '(icicle-mode "<span class="quote"> ICY</span>")  minor-mode-alist)
            minor-mode-alist  (delete '(icicle-mode "<span class="quote"> ICY+</span>") minor-mode-alist))
      (add-to-list 'minor-mode-alist `(icicle-mode ,strg)))
    (if (fboundp 'redisplay)
        (redisplay t)
      (force-mode-line-update t))))

(defun icicle-ding ()
  "<span class="quote">Same as `ding', but respects `icicle-inhibit-ding-flag'.</span>"
  (unless icicle-inhibit-ding-flag (ding)))

(defun icicle-kill-a-buffer (buf &optional nomsg)
  "<span class="quote">Kill buffer BUF.
Optional arg NOMSG non-nil means don't display an error message.</span>"
  (save-selected-window
    (setq buf  (get-buffer buf))
    (if buf
        (condition-case err
            (if (not (buffer-live-p buf))
                (unless nomsg (message "<span class="quote">Buffer already deleted: `%s'</span>" buf))
              (if (fboundp 'kill-buffer-and-its-windows)
                  (kill-buffer-and-its-windows buf) <span class="linecomment">; Defined in `misc-cmds.el'.</span>
                (kill-buffer buf)))
          (error nil))
      (unless nomsg (message "<span class="quote">No such live buffer: `%s'</span>" buf)))))

(defun icicle-unpropertize (strg)
  "<span class="quote">Return a copy of string STRG with all text properties removed.
If STRG is not a string, just return it (raise no error).</span>"
  (when (stringp strg) (set-text-properties 0 (length strg) nil strg))
  strg)

(defun icicle-isearch-complete-past-string ()
  "<span class="quote">Set `isearch-string' to a past search string chosen by completion.</span>"
  (isearch-done 'nopush)
  (let ((icicle-whole-candidate-as-text-prop-p  nil)
        (completion-ignore-case                 case-fold-search)
        (enable-recursive-minibuffers           t))
    (setq isearch-string
          (completing-read "<span class="quote">Search string (completing): </span>"
                           (mapcar #'list (icicle-remove-duplicates
                                           (symbol-value 'regexp-search-ring)))
                           nil nil isearch-string 'regexp-search-ring))))

(defun icicle-completion-all-completions (string table pred point)
  "<span class="quote">Icicles version of `completion-all-completions'.
Removes the last cdr, which might hold the base size.</span>"
  (let ((res  (completion-all-completions string table pred point)))
    (when (consp res)
      (let ((last  (last res)))
        (when last (setcdr last nil))))
    res))

(defun icicle-completion-try-completion (string table pred point)
  "<span class="quote">Icicles version of `completion-try-completion'.
Removes the last cdr, which might hold the base size.</span>"
  (let ((res  (completion-try-completion string table pred point)))
    (when (consp res) (setq res (car res)))))

(defun icicle-require-match-p ()
  "<span class="quote">Non-nil means completion is strict.
Non-nil if current REQUIRE-MATCH arg to `completing-read' or
`read-file-name' really means require match (sheesh!).</span>"
  (if (&gt; emacs-major-version 22)
      (eq t icicle-require-match-p)
    icicle-require-match-p))
 
<span class="linecomment">;;(@* "Icicles functions - sort functions")</span>

<span class="linecomment">;;; Icicles functions - sort functions -------------------------------</span>

(defun icicle-historical-alphabetic-p (s1 s2)
  "<span class="quote">Non-nil means S1 is a past input and S2 is not or S1 &lt; S2 (alphabet).
Return non-nil if S1 is a previous input and either S2 is not or
S1 `icicle-case-string-less-p' S2.  S1 and S2 must be strings.

When used as a comparison function for completion candidates, this
makes candidates matching previous inputs available first (at the top
of buffer *Completions*).  Candidates are effectively in two groups,
each of which is sorted alphabetically separately: matching previous
inputs, followed by matching candidates that have not yet been used.</span>"
  <span class="linecomment">;; We could use `icicle-delete-duplicates' to shorten the history, but that takes time too.</span>
  <span class="linecomment">;; And, starting in Emacs 22, histories will not contain duplicates anyway.</span>
  (let ((hist  (and (symbolp minibuffer-history-variable)
                    (boundp minibuffer-history-variable)
                    (symbol-value minibuffer-history-variable)))
        (dir   (and (icicle-file-name-input-p)
                    (or (file-name-directory (or icicle-last-input icicle-current-input))
                        default-directory))))
    (if (not (consp hist))
        (icicle-case-string-less-p s1 s2)
      (when dir (setq s1  (expand-file-name s1 dir)
                      s2  (expand-file-name s2 dir)))
      (let ((s1-previous-p  (member s1 hist))
            (s2-previous-p  (member s2 hist)))
        (or (and (not s1-previous-p) (not s2-previous-p) (icicle-case-string-less-p s1 s2))
            (and s1-previous-p (not s2-previous-p))
            (and s1-previous-p s2-previous-p (icicle-case-string-less-p s1 s2)))))))

<span class="linecomment">;; $$ Alternative definition, but it doesn't seem any faster, and is slightly less clear.</span>
<span class="linecomment">;; (defun icicle-most-recent-first-p (s1 s2)</span>
<span class="linecomment">;;   "Non-nil means S1 was used more recently than S2.</span>
<span class="linecomment">;; Also:</span>
<span class="linecomment">;;  S1 &lt; S2 if S1 was used previously but S2 was not.</span>
<span class="linecomment">;;  S1 &lt; S2 if neither was used previously</span>
<span class="linecomment">;;   and S1 `icicle-case-string-less-p' S2."</span>
<span class="linecomment">;;   ;; We could use `icicle-delete-duplicates' to shorten the history, but that takes time too.</span>
<span class="linecomment">;;   ;; And, starting in Emacs 22, histories will not contain duplicates anyway.</span>
<span class="linecomment">;;   (let ((hist  (and (symbolp minibuffer-history-variable)</span>
<span class="linecomment">;;                     (symbol-value minibuffer-history-variable)))</span>
<span class="linecomment">;;         (dir   (and (icicle-file-name-input-p)</span>
<span class="linecomment">;;                     (or (file-name-directory (or icicle-last-input icicle-current-input))</span>
<span class="linecomment">;;                         default-directory)))</span>
<span class="linecomment">;;         (s1-in-hist nil)</span>
<span class="linecomment">;;         (s2-in-hist nil))</span>
<span class="linecomment">;;     (if (not (consp hist))</span>
<span class="linecomment">;;         (icicle-case-string-less-p s1 s2)</span>
<span class="linecomment">;;       (when dir (setq s1  (expand-file-name s1 dir)  s2  (expand-file-name s2 dir)))</span>
<span class="linecomment">;;       (while (and hist (not (setq s1-in-hist  (equal s1 (car hist)))))</span>
<span class="linecomment">;;         (when (setq s2-in-hist  (equal s2 (car hist))) (setq hist  nil))</span>
<span class="linecomment">;;         (setq hist  (cdr hist)))</span>
<span class="linecomment">;;       (or (and hist s1-in-hist) (and (not s2-in-hist) (icicle-case-string-less-p s1 s2))))))</span>

(defun icicle-most-recent-first-p (s1 s2)
  "<span class="quote">Non-nil means S1 was used more recently than S2.
Also:
 S1 &lt; S2 if S1 was used previously but S2 was not.
 S1 &lt; S2 if neither was used previously
  and S1 `icicle-case-string-less-p' S2.</span>"
  <span class="linecomment">;; We could use `icicle-delete-duplicates' to shorten the history, but that takes time too.</span>
  <span class="linecomment">;; And, starting in Emacs 22, histories do not contain duplicates anyway.</span>
  (let ((hist     (and (symbolp minibuffer-history-variable)
                       (boundp minibuffer-history-variable)
                       (symbol-value minibuffer-history-variable)))
        (dir      (and (icicle-file-name-input-p)
                       (or (file-name-directory (or icicle-last-input icicle-current-input))
                           default-directory)))
        (s1-tail  ())
        (s2-tail  ()))
    (if (not (consp hist))
        (icicle-case-string-less-p s1 s2)
      (when dir (setq s1  (expand-file-name s1 dir)
                      s2  (expand-file-name s2 dir)))
      (setq s1-tail  (member s1 hist)
            s2-tail  (member s2 hist))
      (cond ((and s1-tail s2-tail) (&gt;= (length s1-tail) (length s2-tail)))
            (s1-tail t)
            (s2-tail nil)
            (t (icicle-case-string-less-p s1 s2))))))


(put 'icicle-dirs-last-p 'icicle-file-name-sort-predicate t)
<span class="linecomment">;; This predicate is used for file-name completion.</span>
(defun icicle-dirs-last-p (s1 s2)
  "<span class="quote">Non-nil means S1 is a file and S2 a dir, or S1 &lt; S2 (alphabet).
This is especially useful when `icicle-cycle-into-subdirs-flag' is
non-nil.  Otherwise, cycling into subdirectories is depth-first, not
breadth-first.
If not doing file-name completion, then this is the same as
`icicle-case-string-less-p'.</span>"
  (if (icicle-file-name-input-p)
      (let ((s1-dir-p  (icicle-file-directory-p s1))
            (s2-dir-p  (icicle-file-directory-p s2)))
        (if (or (and s1-dir-p s2-dir-p) <span class="linecomment">; Both or neither are directories.</span>
                (not (or s1-dir-p s2-dir-p)))
            (icicle-case-string-less-p s1 s2)  <span class="linecomment">; Compare equals.</span>
          s2-dir-p))                 <span class="linecomment">; Files come before directories.</span>
    (icicle-case-string-less-p s1 s2)))


(put 'icicle-2nd-part-string-less-p 'icicle-multi-completion-sort-predicate t)
<span class="linecomment">;; This predicate is used for multi-completion.</span>
(defun icicle-2nd-part-string-less-p (s1 s2)
  "<span class="quote">`icicle-case-string-less-p' for second parts, then for first parts.
S1 and S2 are multi-completion strings.
Returns non-nil if either of these is true:

* The second parts of S1 and S2 are the equivalent and the first part
  of S1 comes before the first part of S2, alphabetically.

* The second part of S1 comes before the second part of S2,
  alphabetically.

Alphabetical comparison is done using `icicle-case-string-less-p'.</span>"
  (let* ((icicle-list-use-nth-parts  '(2))
         (s1-2nd                     (icicle-transform-multi-completion s1))
         (s2-2nd                     (icicle-transform-multi-completion s2)))
    (or (icicle-case-string-less-p s1-2nd s2-2nd)
        (and (string= s1-2nd s2-2nd)
             (let* ((icicle-list-use-nth-parts  '(1))
                    (s1-1st                     (icicle-transform-multi-completion s1))
                    (s2-1st                     (icicle-transform-multi-completion s2))))))))


(put 'icicle-last-modified-first-p 'icicle-file-name-sort-predicate t)
<span class="linecomment">;; This predicate is used for file-name completion.</span>
(defun icicle-last-modified-first-p (s1 s2)
  "<span class="quote">Non-nil means file S1 was last modified after S2.
If not doing file-name completion, then this is the same as
`icicle-case-string-less-p'.</span>"
  (if (icicle-file-name-input-p)
      (let ((mod-date1  (nth 5 (file-attributes s1)))
            (mod-date2  (nth 5 (file-attributes s2))))
        (or (&lt; (car mod-date2) (car mod-date1)) <span class="linecomment">; High-order bits.</span>
            (and (= (car mod-date2) (car mod-date1)) <span class="linecomment">; Low-order bits.</span>
                 (&lt; (cadr mod-date2) (cadr mod-date1)))))
    (icicle-case-string-less-p s1 s2)))


(put 'icicle-command-abbrev-used-more-p 'icicle-command-sort-predicate t)
<span class="linecomment">;; This predicate is used for command and abbreviation completion.</span>
(defun icicle-command-abbrev-used-more-p (s1 s2)
  "<span class="quote">Return non-nil if S1 was invoked more often than S2 via an abbrev.
S1 and S2 are strings naming commands.
If neither was invoked or both were invoked the same number of times,
then return non-nil if S1 is `string-lessp' S2.</span>"
  (let* ((alist-tails  (mapcar #'cdr icicle-command-abbrev-alist))
         (s1-entry     (assq (intern s1) alist-tails))
         (s2-entry     (assq (intern s2) alist-tails)))
    (if (and (not s1-entry) (not s2-entry))
        (string-lessp s1 s2)
      (let ((s1-rank  (elt s1-entry 1))
            (s2-rank  (elt s2-entry 1)))
        (cond ((and (not s1-rank) (not s2-rank)) (string-lessp s1 s2))
              ((and s1-rank s2-rank (eq s1-rank s2-rank)) (string-lessp s1 s2))
          (t (&gt;= (or s1-rank 0) (or s2-rank 0))))))))

(defun icicle-part-N-lessp (n s1 s2)
  "<span class="quote">`icicle-case-string-less-p' applied to the Nth parts of S1 and S2.
The strings each have at least N parts, separated by
`icicle-list-join-string'.  Parts other than the Nth are ignored.
Return non-nil if and only if the Nth part of S1 is less than the Nth
part of S2.  The Nth parts are compared lexicographically without
regard to letter case.  N is one-based, so a value of 1 means compare
the first parts.</span>"
  (unless (and (wholenump n) (&gt; n 0)) (error "<span class="quote">`icicle-part-N-lessp': N must be &gt; 0</span>"))
  (let ((case-fold-search  t)
        (part-N-s1         (elt (split-string s1 icicle-list-join-string) (1- n)))
        (part-N-s2         (elt (split-string s2 icicle-list-join-string) (1- n))))
    (and part-N-s1 part-N-s2            <span class="linecomment">; In case strings were not multipart.</span>
         (icicle-case-string-less-p part-N-s1 part-N-s2))))

(defun icicle-part-1-lessp (s1 s2)
  "<span class="quote">`icicle-part-N-lessp', with N = 1.</span>"
  (icicle-part-N-lessp 1 s1 s2))

(defun icicle-part-2-lessp (s1 s2)
  "<span class="quote">`icicle-part-N-lessp', with N = 2.</span>"
  (icicle-part-N-lessp 2 s1 s2))

(defun icicle-part-3-lessp (s1 s2)
  "<span class="quote">`icicle-part-N-lessp', with N = 3.</span>"
  (icicle-part-N-lessp 3 s1 s2))

(defun icicle-part-4-lessp (s1 s2)
  "<span class="quote">`icicle-part-N-lessp', with N = 4.</span>"
  (icicle-part-N-lessp 4 s1 s2))

(defun icicle-cdr-lessp (s1 s2)
  "<span class="quote">Non-nil means the cdr of S1's entry &lt; the cdr of S2's entry.
Entry here means the complete alist element candidate that corresponds
to the displayed candidate (string) S1 or S2.
Returns nil if comparing the cdrs using `&lt;' would raise an error.</span>"
  (condition-case nil
      (&lt; (cdr (icicle-get-alist-candidate s1)) (cdr (icicle-get-alist-candidate s2)))
    (error nil)))

(defun icicle-part-1-cdr-lessp (s1 s2)
  "<span class="quote">First part and cdr of S1 are less than those of S2.</span>"
  (or (icicle-part-1-lessp s1 s2)
      (and (not (icicle-part-1-lessp s2 s1))
           (icicle-cdr-lessp s1 s2))))

<span class="linecomment">;; This predicate is used for color completion.</span>
(defun icicle-color-red-lessp (s1 s2)
  "<span class="quote">Non-nil means the RGB in S1 has less red than in S2.
The strings are assumed to have at least two parts, with the parts
separated by `icicle-list-join-string' The RGB values are assumed to
be the second parts of the strings, and they are assumed to start with
`#'.</span>"
  (unless (featurep 'hexrgb) (error "<span class="quote">`icicle-color-red-lessp' requires library `hexrgb.el'</span>"))
  (let ((rgb1  (elt (split-string s1 icicle-list-join-string) 1))
        (rgb2  (elt (split-string s2 icicle-list-join-string) 1)))
    (and rgb1 rgb2 <span class="linecomment">; Just in case strings were not multipart.</span>
         (&lt; (hexrgb-red rgb1) (hexrgb-red rgb2)))))

<span class="linecomment">;; This predicate is used for color completion.</span>
(defun icicle-color-green-lessp (s1 s2)
  "<span class="quote">Non-nil means the RGB in S1 has less green than in S2.
The strings are assumed to have at least two parts, with the parts
separated by `icicle-list-join-string' The RGB values are assumed to
be the second parts of the strings, and they are assumed to start with
`#'.</span>"
  (unless (featurep 'hexrgb) (error "<span class="quote">`icicle-color-green-lessp' requires library `hexrgb.el'</span>"))
  (let ((rgb1  (elt (split-string s1 icicle-list-join-string) 1))
        (rgb2  (elt (split-string s2 icicle-list-join-string) 1)))
    (and rgb1 rgb2 <span class="linecomment">; Just in case strings were not multipart.</span>
         (&lt; (hexrgb-green rgb1) (hexrgb-green rgb2)))))

<span class="linecomment">;; This predicate is used for color completion.</span>
(defun icicle-color-blue-lessp (s1 s2)
  "<span class="quote">Non-nil means the RGB in S1 has less blue than in S2.
The strings are assumed to have at least two parts, with the parts
separated by `icicle-list-join-string' The RGB values are assumed to
be the second parts of the strings, and they are assumed to start with
`#'.</span>"
  (unless (featurep 'hexrgb) (error "<span class="quote">`icicle-color-blue-lessp' requires library `hexrgb.el'</span>"))
  (let ((rgb1  (elt (split-string s1 icicle-list-join-string) 1))
        (rgb2  (elt (split-string s2 icicle-list-join-string) 1)))
    (and rgb1 rgb2 <span class="linecomment">; Just in case strings were not multipart.</span>
         (&lt; (hexrgb-blue rgb1) (hexrgb-blue rgb2)))))

<span class="linecomment">;; This predicate is used for color completion.</span>
(defun icicle-color-hue-lessp (s1 s2)
  "<span class="quote">Non-nil means the RGB hue in S1 is less than that in S2.
The strings are assumed to have at least two parts, with the parts
separated by `icicle-list-join-string' The RGB values are assumed to
be the second parts of the strings, and they are assumed to start with
`#'.</span>"
  (unless (featurep 'hexrgb) (error "<span class="quote">`icicle-color-hue-lessp' requires library `hexrgb.el'</span>"))
  (let ((rgb1  (elt (split-string s1 icicle-list-join-string) 1))
        (rgb2  (elt (split-string s2 icicle-list-join-string) 1)))
    (and rgb1 rgb2 <span class="linecomment">; Just in case strings were not multipart.</span>
         (&lt; (hexrgb-hue rgb1) (hexrgb-hue rgb2)))))

<span class="linecomment">;; This predicate is used for color completion.</span>
(defun icicle-color-saturation-lessp (s1 s2)
  "<span class="quote">Non-nil means the RGB in S1 is less saturated than in S2.
The strings are assumed to have at least two parts, with the parts
separated by `icicle-list-join-string' The RGB values are assumed to
be the second parts of the strings, and they are assumed to start with
`#'.</span>"
  (unless (featurep 'hexrgb) (error "<span class="quote">`icicle-color-saturation-lessp' requires library `hexrgb.el'</span>"))
  (let ((rgb1  (elt (split-string s1 icicle-list-join-string) 1))
        (rgb2  (elt (split-string s2 icicle-list-join-string) 1)))
    (and rgb1 rgb2 <span class="linecomment">; Just in case strings were not multipart.</span>
         (&lt; (hexrgb-saturation rgb1) (hexrgb-saturation rgb2)))))

<span class="linecomment">;; This predicate is used for color completion.</span>
(defun icicle-color-value-lessp (s1 s2)
  "<span class="quote">Non-nil means the RGB value in S1 is darker than that in S2.
The strings are assumed to have at least two parts, with the parts
separated by `icicle-list-join-string' The RGB values are assumed to
be the second parts of the strings, and they are assumed to start with
`#'.</span>"
  (unless (featurep 'hexrgb) (error "<span class="quote">`icicle-color-value-lessp' requires library `hexrgb.el'</span>"))
  (let ((rgb1  (elt (split-string s1 icicle-list-join-string) 1))
        (rgb2  (elt (split-string s2 icicle-list-join-string) 1)))
    (and rgb1 rgb2 <span class="linecomment">; Just in case strings were not multipart.</span>
         (&lt; (hexrgb-value rgb1) (hexrgb-value rgb2)))))

<span class="linecomment">;; This predicate is used for key completion.</span>
(defun icicle-prefix-keys-first-p (s1 s2)
  "<span class="quote">Non-nil if S1 is a prefix key and S2 is not or S1 &lt; S2 (alphabet).
For this function, a prefix key is represented by a string that ends
in \"...\".

When used as a comparison function for completion candidates, this
makes prefix keys that match your input available first (at the top of
buffer *Completions*).  Candidates are effectively in two groups, each
of which is sorted alphabetically separately: prefix keys, followed by
non-prefix keys.  Letter case is ignored.

The special key representation \"..\" is less than all other keys,
including prefix keys.</span>"
  (let* ((prefix-string           "<span class="quote">  =  \\.\\.\\.$</span>")
         (parent-string           "<span class="quote">..</span>")
         (s1-prefix-p             (save-match-data (string-match prefix-string s1)))
         (s2-prefix-p             (save-match-data (string-match prefix-string s2)))
         (completion-ignore-case  t))
    (and (not (string= parent-string s2))
         (or (string= parent-string s1)
             (and (not s1-prefix-p) (not s2-prefix-p) (icicle-case-string-less-p s1 s2))
             (and s1-prefix-p (not s2-prefix-p))
             (and s1-prefix-p s2-prefix-p (icicle-case-string-less-p s1 s2))))))

<span class="linecomment">;; This predicate is used for key completion.</span>
(defun icicle-command-names-alphabetic-p (s1 s2)
  "<span class="quote">Non-nil if command name of S1 `icicle-case-string-less-p' that of S2.
When used as a comparison function for completion candidates, this
assumes that each candidate, S1 and S2, is composed of a key name
followed by \"  =  \", followed by the corresponding command name.</span>"
  (let ((icicle-list-join-string  "<span class="quote">  =  </span>")) <span class="linecomment">; Fake a multi-completion.  Candidate is key  =  cmd.</span>
    (icicle-part-2-lessp s1 s2)))

(defun icicle-special-candidates-first-p (s1 s2)
  "<span class="quote">Non-nil if S1 is special candidate and S2 is not or S1&lt;S2 (alphabet).
That is, S1 &lt; S2 if S1 is a special candidate and S2 is not or S1
`icicle-case-string-less-p' S2 and either both or neither are special
candidates.</span>"
  (let ((s1-special  (get (intern s1) 'icicle-special-candidate))
        (s2-special  (get (intern s2) 'icicle-special-candidate)))
    (when (or case-fold-search completion-ignore-case
              (and (icicle-file-name-input-p) (boundp 'read-file-name-completion-ignore-case)
                   read-file-name-completion-ignore-case))
      (setq s1  (upcase s1)
            s2  (upcase s2)))
    (or (and s1-special (not s2-special))
        (and s1-special s2-special (icicle-case-string-less-p s1 s2))
        (and (not s1-special) (not s2-special) (icicle-case-string-less-p s1 s2)))))

(defun icicle-extra-candidates-first-p (s1 s2)
  "<span class="quote">Non-nil if S1 is an extra candidate and S2 is not or S1&lt;S2 (alphabet).
That is, S1 &lt; S2 if S1 is an extra candidate and S2 is not or S1
`icicle-case-string-less-p' S2 and either both or neither are extra
candidates.  An extra candidate is one that is a member of
`icicle-extra-candidates'.</span>"
  (let ((s1-extra  (member s1 icicle-extra-candidates))
        (s2-extra  (member s2 icicle-extra-candidates)))
    (when (or case-fold-search completion-ignore-case
              (and (icicle-file-name-input-p) (boundp 'read-file-name-completion-ignore-case)
                   read-file-name-completion-ignore-case))
      (setq s1  (upcase s1)
            s2  (upcase s2)))
    (or (and s1-extra (not s2-extra))
        (and s1-extra s2-extra (icicle-case-string-less-p s1 s2))
        (and (not s1-extra) (not s2-extra) (icicle-case-string-less-p s1 s2)))))

(put 'icicle-proxy-candidate-first-p 'icicle-proxy-sort-predicate t)
<span class="linecomment">;; This predicate is used when there are proxy candidates.</span>
(defun icicle-proxy-candidate-first-p (s1 s2)
  "<span class="quote">Return non-nil if S1 is a proxy candidate and S2 is not.
Return nil if S2 is a proxy candidate and S1 is not.
Otherwise, return non-nil if S1 is `string-lessp' S2.</span>"
  (let ((s1-proxy-p  (or (member s1 icicle-proxy-candidates)
                         (and icicle-proxy-candidate-regexp
                              (save-match-data (string-match icicle-proxy-candidate-regexp s1)))))
        (s2-proxy-p  (or (member s2 icicle-proxy-candidates)
                         (and icicle-proxy-candidate-regexp
                              (save-match-data (string-match icicle-proxy-candidate-regexp s2))))))
    (or (and (not s1-proxy-p) (not s2-proxy-p) (icicle-case-string-less-p s1 s2))
        (and s1-proxy-p (not s2-proxy-p))
        (and s1-proxy-p s2-proxy-p (icicle-case-string-less-p s1 s2)))))


(defun icicle-case-insensitive-string-less-p (string1 string2)
  "<span class="quote">Like `string-lessp', but case is ignored, so `A' = `a' , and so on.</span>"
  (string-lessp (upcase string1) (upcase string2)))

(defun icicle-case-string-less-p (s1 s2)
  "<span class="quote">Like `string-lessp', but respects `completion-ignore-case'.</span>"
  (when (if icicle-completing-p         <span class="linecomment">; Use var, not fn, `icicle-completing-p', or else too slow.</span>
            (if (and (icicle-file-name-input-p)
                     (boundp 'read-file-name-completion-ignore-case))
                read-file-name-completion-ignore-case
              completion-ignore-case)
          case-fold-search)
    (setq s1  (upcase s1)
          s2  (upcase s2)))
  <span class="linecomment">;; $$(when completion-ignore-case (setq s1  (upcase s1)    s2  (upcase s2))) ; Alternative.</span>
  (string-lessp s1 s2))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-fn)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-fn.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icicles-fn.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-fn.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icicles-fn.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icicles-fn.el">Administration</a></span><span class="time"><br /> Last edited 2009-02-28 20:16 UTC by <a class="author" title="from inet-bc01-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icicles-fn.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
