;;; iuscheme.el --- Scheme support, Indiana Univeristy style
;;;
;;; by Chris Haynes <chaynes@indiana.edu>, edited by ehilsdal
;;;
;;; Bugs: comint support, return at end

(require 'cmuscheme)

;; -------- Key redefinitions ----

;; ---- CMU likes RET to go to the beginning of the line, and LFD to
;;  to a return and an indent. We like it the other way around.
;;  Also, C-c C-i (or C-c TAB) indents the current definition.

(add-hook 'scheme-mode-hook
    (function
     (lambda ()
       (define-key scheme-mode-map "\C-c\C-i" 'scheme-indent-definition)
       (define-key scheme-mode-map "\n" 'newline)
       (define-key scheme-mode-map "\r" 'newline-and-indent))))

;; ---- Similarly, when running a scheme process both RET and LFD
;;  should indent.

(add-hook 'inferior-scheme-mode-hook
    (function
     (lambda ()
       (define-key inferior-scheme-mode-map "\n" 'newline-and-indent)
       (define-key inferior-scheme-mode-map "\r"
         'scheme-send-and-indent))))

;; -------- Helper functions ----

(defun scheme-send-and-indent ()
  "Do the comint-send-input thing, but then indent the line properly.
This is just the composition of comint-send-input and scheme-indent-line."
  (interactive)
  (comint-send-input)
  (scheme-indent-line))

(defun scheme-indent-definition ()
  "Fix indentation of the current definition."
  (interactive)
  (save-excursion
    (beginning-of-defun)
    (scheme-indent-sexp)))

;; -------- New indentation ----

;; calculate-scheme-indent overwrites the version in cmuscheme.el, and
;; works better for CPS'ed code.

(defun calculate-scheme-indent (&optional parse-start)
  "Return appropriate indentation for current line as scheme code.
In usual case returns an integer: the column to indent to.
Can instead return a list, whose car is the column to indent to.
This means that following lines at the same level of indentation
should not necessarily be indented the same way.
The second element of the list is the buffer position
of the start of the containing expression."
  (save-excursion
    (beginning-of-line)
    (let ((indent-point (point)) (state '(0)) paren-depth desired-indent
    (retry t) last-sexp containing-sexp)
      (if parse-start
    (goto-char parse-start)
  (beginning-of-defun))
      ;; Find outermost containing sexp
      (while (< (point) indent-point)
  (setq state (parse-partial-sexp (point) indent-point 0)))
      ;; Find innermost containing sexp
      (while (and retry (setq paren-depth (car state)) (> paren-depth 0))
  (setq retry nil)
  (setq last-sexp (nth 2 state))
  (setq containing-sexp (car (cdr state)))
  ;; Position following last unclosed open.
  (goto-char (1+ containing-sexp))
  ;; Is there a complete sexp since then?
  (if (and last-sexp (> last-sexp (point)))
      ;; Yes, but is there a containing sexp after that?
      (let ((peek (parse-partial-sexp last-sexp indent-point 0)))
        (if (setq retry (car (cdr peek))) (setq state peek))))
  (if (not retry)
      ;; Innermost containing sexp found
      (progn
        (goto-char (1+ containing-sexp))
        (if (not last-sexp)
      ;; indent-point immediately follows open paren.
      ;; Don't call hook.
      (setq desired-indent (current-column))
    ;; Move to first sexp after containing open paren
    (parse-partial-sexp (point) last-sexp 0 t)
    (cond
     ((looking-at "\\s(")
      ;; Looking at a list.  Don't call hook.
      (if (not (> (save-excursion (forward-line 1) (point))
            last-sexp))
          (progn (goto-char last-sexp)
           (beginning-of-line)
           (parse-partial-sexp (point) last-sexp 0 t)))
      ;; Indent under the list or under the first sexp on the
      ;; same line as last-sexp.  Note that first thing on that
      ;; line has to be complete sexp since we are inside the
      ;; innermost containing sexp.
      (backward-prefix-chars)
      (setq desired-indent (current-column)))
     ((save-excursion (forward-char -1) (looking-at "\\[")))
      ;; Containing sexp is bracketed, so don't do anything
      ;; now, which will give 2 space indent later.
     ((> (save-excursion (forward-line 1) (point))
         last-sexp)
      ;; Last sexp is on same line as containing sexp.
      ;; It's almost certainly a function call.
      (parse-partial-sexp (point) last-sexp 0 t)
      (if (and (/= (point) last-sexp)
         (scheme-indent-hookedp))
          (progn (forward-sexp 1)
           (backward-prefix-chars))
        (backward-prefix-chars)))
                 (t
      ;; Indent beneath first sexp on same line as last-sexp.
      ;; Again, it's almost certainly a function call.
      (goto-char last-sexp)
      (beginning-of-line)
      (parse-partial-sexp (point) last-sexp 0 t)
      (backward-prefix-chars)
      (setq desired-indent (current-column))))))))
      ;; Point is at the point to indent under unless we are inside a string.
      ;; Call indentation hook except when overriden by scheme-indent-offset
      ;; or if the desired indentation has already been computed.
      (cond ((= paren-depth 0) (setq desired-indent (current-column)))
      ((car (nthcdr 3 state))
       ;; Inside a string, don't change indentation.
       (goto-char indent-point)
       (skip-chars-forward " \t")
       (setq desired-indent (current-column)))
      ((and (integerp scheme-indent-offset) containing-sexp)
       ;; Indent by constant offset
       (goto-char containing-sexp)
       (setq desired-indent (+ scheme-indent-offset (current-column))))
      ((not desired-indent)
       ;; Use default indentation if not computed yet
       (setq desired-indent (+ (- scheme-standard-indent 1)
             (current-column)))))
      desired-indent)))

(defun scheme-indent-hookedp ()
  "True if point is at beginnning of special form with
   scheme-indent-hook property."
  (save-excursion
    (let ((name (buffer-substring (point)
          (progn (forward-sexp 1) (point)))))
      (get (intern-soft (downcase name)) 'scheme-indent-hook))))

;; ---- The following keywords should be indented evenly after the
;;      keyword (i.e, no cps allowances).

(put 'if 'scheme-indent-hook t)
(put 'set! 'scheme-indent-hook t)
(put 'cond 'scheme-indent-hook t)
(put 'and 'scheme-indent-hook t)
(put 'or 'scheme-indent-hook t)

(defvar scheme-max-indent 2 "*Maximum additional indentation for scheme-mode")
(defvar scheme-standard-indent 2 "*Standard indentation for scheme-mode")

(provide 'iuscheme)

