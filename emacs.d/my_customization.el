;;;;;;;;;;;;;;; multi-term customization ;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/multi-term/")
(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)

(setq multi-term-program "/bin/bash")   ;; use bash
;; (setq multi-term-program "/bin/zsh") ;; or use zsh...

;; only needed if you use autopair
(add-hook 'term-mode-hook
  #'(lambda () (setq autopair-dont-activate t)))


(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one
;;;;;;;;;;;;;;; multi-term customization ;;;;;;;;;;;;;;;;;;;;

;; (defcustom recentf-initial-input "ucs"
;;   "Maximum number of items of the recent list that will be saved.
;; A nil value means to save the whole list.
;; See the command `recentf-save-list'."
;;   :group 'recentf
;;   :type 'integer)

(defun view-url ()
  "Open a new buffer containing the contents of URL."
  (interactive)
  (let* ((default (thing-at-point-url-at-point))
         (url (read-from-minibuffer "URL: " default)))
    (switch-to-buffer (url-retrieve-synchronously url))
    (rename-buffer url t)
    ;; TODO: switch to nxml/nxhtml mode
    (cond ((search-forward "<?xml" nil t) (xml-mode))
          ((search-forward "<html" nil t) (html-mode)))))



;;;Bind M-F11 to a function that uses ido on the recently opened files
;;; shamelessly borrowed from http://www.xsteve.at/prg/emacs/power-user-tips.html
  (defun xsteve-ido-choose-from-recentf ()
    "Use ido to select a recently opened file from the `recentf-list'"
    (interactive)
    (let ((home (expand-file-name (getenv "HOME"))))
      (find-file
       (ido-completing-read "Recentf open: "
                            (mapcar (lambda (path)
                                      (replace-regexp-in-string home "~" path))
                                    recentf-list)
                            nil t))))

  (defun process_recentf_list (list)
    (let ((list '()))
      (dolist (element recentf-list)
        (dolist (excluded '("ucs" "ka"))
          (if (not (= element excluded))
            (push element list))))list))


  (defun toggle-recentf-initial-input ()
    (interactive)
    (let* ((current-initial-input recentf-initial-input)
           (found nil)
           (new-initial-input)
           )
      (dolist (element '("ucs" "sender" "ka" "profile"))
        (if found
          (setq new-initial-input element))

        (if (= current-initial-input element)
          (setq found t)))

      (message "new initial input change from %s to %s" current-initial-input new-initial-input)
      (setq recentf-initial-input new-initial-input)
    ))


  (defun xsteve-insert-date (dayincr)
    "Inserts a date-stamp at point - Format: \"DD-MM-YYYY (wd)\""
    (interactive "p")
    (if (null current-prefix-arg) (setq dayincr 0))
    (let* ((base 65536.0)
           (nowlist (current-time))
           (datenum (+ (*  (nth 0 nowlist) base) (nth 1 nowlist)
                       (* dayincr 60.0 60.0 24.0)))
           (s (current-time-string
               (list (truncate( / datenum base)) (truncate(mod datenum base)))))
           (date))
      (if (equal current-prefix-arg '(4))
          (progn
            (let ((bound (line-beginning-position))
                  (datenum)
                  (datestring))
              (goto-char (min (point-max) (+ (point) 10)))
              (re-search-backward "[0-9][0-9]\\.[0-9][0-9]\\.[0-9][0-9][0-9][0-9]" bound)
              (setq datestring (buffer-substring (point) (+ (point) 10)))
              (setq datenum (calendar-absolute-from-gregorian
                             (list
                              (string-to-number (substring datestring 3 5))
                              (string-to-number (substring datestring 0 2))
                              (string-to-number (substring datestring 6 10)))))
              (setq dayincr (string-to-number (read-string "Increment by days: " "7")))
              (delete-region (point) (+ 10 (point)))
              (setq date (calendar-gregorian-from-absolute (+ datenum dayincr)) datestring)))
        (setq date (list (length (member (substring s 4 7)
                                         '("Dec" "Nov" "Oct" "Sep" "Aug" "Jul"
                                           "Jun" "May" "Apr" "Mar" "Feb" "Jan")))
                         (string-to-number (substring s 8 10))
                         (string-to-number (substring s 20 24)))))
      ;;(cdr (assoc (substring s 0 3)
      ;;            '(("Son" . "So")("Mon" . "Mo")("Tue" . "Di")
      ;;              ("Wed" . "Mi")("Thu" . "Do")("Fri" . "Fr")
      ;;              ("Sat" ."Sa")))))))

      (insert (format "%02d.%02d.%04d" (nth 1 date) (nth 0 date) (nth 2 date)))))
                                        ;(message "%s" date)))Editing a setting changes only the text in this buffer.
                                        ;(xsteve-insert-date 0)

                                        ;taken from vhdl-mode
  (defun xsteve-remove-trailing-spaces ()
    "Remove trailing spaces in the whole buffer."
    (interactive)
    (save-match-data
      (save-excursion
        (let ((remove-count 0))
          (goto-char (point-min))
          (while (re-search-forward "[ \t]+$" (point-max) t)
            (setq remove-count (+ remove-count 1))
            (replace-match "" nil nil))
          (message (format "%d Trailing spaces removed from buffer." remove-count))))))

                                        ;02.02.2000
  (defun xsteve-remove-control-M ()
    "Remove ^M at end of line in the whole buffer."
    (interactive)
    (save-match-data
      (save-excursion
        (let ((remove-count 0))
          (goto-char (point-min))
          (while (re-search-forward "
$" (point-max) t)
            (setq remove-count (+ remove-count 1))
            (replace-match "" nil nil))
          (message (format "%d ^M removed from buffer." remove-count))))))

                                        ;24.07.2000
  (defun xsteve-untabify-buffer (prefix)
    "Untabify the whole buffer. Calls untabify for the whole buffer. If called with
prefix argument: use prefix argument as tabwidth"
    (interactive "p")
    (let ((tab-width (or current-prefix-arg tab-width)))
      (untabify (point-min) (point-max)))
    (message "Untabified buffer."))

  (defun xsteve-exchange-slash-and-backslash ()
    "Exchanges / with \ and in the current line or in the region when a region-mark is active."
    (interactive)
    (save-match-data
      (save-excursion
        (let ((replace-count 0)
              (eol-pos (if mark-active (region-end) (progn (end-of-line) (point))))
              (bol-pos (if mark-active (region-beginning) (progn (beginning-of-line) (point)))))
          (goto-char bol-pos)
          (while (re-search-forward "/\\|\\\\" eol-pos t)
            (setq replace-count (+ replace-count 1))
            (cond ((string-equal (match-string 0) "/") (replace-match "\\\\" nil nil))
                  ((string-equal (match-string 0) "\\") (replace-match "/" nil nil)))
            (message (format "%d changes made." replace-count)))))))

  (defun xsteve-copy-line (&optional append)
    "Copies the actual line to the kill ring.
if the optional argument append eq t then append the line to the kill ring."
    (interactive)
    (save-excursion
      (let (start end)
        (beginning-of-line)
        (setq start (point))
        (forward-line 1)
        (setq end (point))
        (if append
            (progn
              (append-next-kill)
              (message "appended line: %s" (buffer-substring start end)))
          (message "%s" (concat "copied: " (buffer-substring start end))))
        (copy-region-as-kill start end)))
    (next-line 1))

;;; Copyright (C) 1997, 1998 Thien-Thi Nguyen
  (defun another-line ()
    "Copy line, preserving cursor column, and increment any numbers found.
This should probably be generalized in the future."
    (interactive)
    (let* ((col (current-column))
           (bol (progn (beginning-of-line) (point)))
           (eol (progn (end-of-line) (point)))
           (line (buffer-substring bol eol)))
      (beginning-of-line)
      (beginning-of-line)
      (insert line "\n")
      (move-to-column col)))

  (defun xsteve-get-symbol-at-point (&optional msg-prompt prompt-always no-regexp-quote)
    (interactive)
    ;;(message "xsteve-get-symbol-at-point %s %s" isearch-mode isearch-string)
    (let* ((region-string
            (if mark-active
                (buffer-substring-no-properties (region-beginning) (region-end))
              nil))
           (symbol (cond
                    (isearch-mode
                     isearch-string)
                    (mark-active
                     (progn
                       (setq region-string (if no-regexp-quote region-string (regexp-quote region-string)))))
                    (t (thing-at-point 'symbol)))))
      (when (or prompt-always
                (not symbol))
        (when msg-prompt
          (setq symbol (read-string msg-prompt  symbol))))
      (when symbol (substring-no-properties symbol))))

                                        ;07.03.2000
  (defun xsteve-resize-other-window ()
    (interactive)
    (save-excursion
      (other-window 1)
      (resize-temp-buffer-window)
      (other-window -1)))

  (defun move-line (n)
    "Move the current line up or down by N lines."
    (interactive "p")
    (let ((col (current-column))
          start
          end)
      (beginning-of-line)
      (setq start (point))
      (end-of-line)
      (forward-char)
      (setq end (point))
      (let ((line-text (delete-and-extract-region start end)))
        (forward-line n)
        (insert line-text)
        ;; restore point to original column in moved line
        (forward-line -1)
        (move-to-column col))))


  (defun move-line-or-region-up (n)
    (interactive "p")
    (if mark-active
        (move-text-up (if (null n) 1 n))
      (move-line-up (if (null n) 1 n))))

  (defun move-line-or-region-down (n)
    (interactive "p")
    (if mark-active
        (move-text-down (if (null n) 1 n))
      (move-line-down (if (null n) 1 n))))

  (defun move-line-up (n)
    "Move the current line up by N lines."
    (interactive "p")
    (move-line (if (null n) -1 (- n))))

  (defun move-line-down (n)
    "Move the current line down by N lines."
    (interactive "p")
    (move-line (if (null n) 1 n)))

  (defun move-text-internal (arg)
    (cond
     ((and mark-active transient-mark-mode)
      (if (> (point) (mark))
          (exchange-point-and-mark))
      (let ((column (current-column))
            (text (delete-and-extract-region (point) (mark))))
        (forward-line arg)
        (move-to-column column t)
        (set-mark (point))
        (insert text)
        (exchange-point-and-mark)
        (setq deactivate-mark nil)))
     (t
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1)))))

  (defun move-text-down (arg)
    "Move region (transient-mark-mode active) or current line
  arg lines down."
    (interactive "*p")
    (move-text-internal arg))

  (defun move-text-up (arg)
    "Move region (transient-mark-mode active) or current line
  arg lines up."
    (interactive "*p")
    (move-text-internal (- arg)))

  (global-set-key [\M-\S-up] 'move-text-up)
  (global-set-key [\M-\S-down] 'move-text-down)

  (global-hl-line-mode 1)

(defun my-grep-at-point ()
  "grep the whole directory for something defaults to term at cursor position"
  (interactive)
  (setq default (thing-at-point 'symbol))

  (setq needle (or (read-string (concat "grep for <" default "> ")) default))
  (setq needle (if (equal needle "") default needle))
  (grep (concat "egrep -s -i -R -n " needle " * /dev/null")))

(defun sacha/increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))


(defun sacha/decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                (face-attribute 'default :height)))))

(defun insert-debug (s)
  (interactive "insert debug statement for variable : ")
  (insert (concat "\C-jrequire 'rubygems';require 'ruby-debug';debugger;")))

(defun print_variable (s)
  (interactive "sInsert debug statement for variable : ")
  (insert (concat "\C-jputs \"" s " = #{" s "}\"")))

(defun grep-project (s)
  (interactive "sSearch project for: ")
  (grep-find (concat "find /mnt/hanfoot/projects/tmdj -type f -not -name \"*.svn-base\" -and -not -name \"*.svn\" -and -not -name \"*.tmp\" -and -not -name \"*.log\" -print0 | xargs -0 -e grep -n -s -F \"" s "\"")))

(defun duplicate-start-of-line-or-region ()
  (interactive)
  (if mark-active
      (duplicate-region)
    (another-line)))

;; this is bugger so it is no longer used, use another-line instead
(defun duplicate-start-of-line ()
  (let ((text (buffer-substring (point)
                                (beginning-of-thing 'line))))
    (forward-line)
    (push-mark)
    (insert text)
    (open-line 1)))

(defun duplicate-region ()
  (let* ((end (region-end))
         (text (buffer-substring (region-beginning)
                                 end)))
    (goto-char end)
    (insert text)
    (push-mark end)
    (setq deactivate-mark nil)
    (exchange-point-and-mark)))

(defun revert-buffer-noask()
  (interactive)
  (revert-buffer nil t))
(setq column-number-mode t)

(setq-default
 frame-title-format
 (list '((buffer-file-name " %f" (dired-directory
                                  dired-directory
                                  (revert-buffer-function " %b"
                                                          ("%b - Dir:  " default-directory)))))))

(defun ascii-table (&optional extended)
  "Print the ascii table (up to char 127).
Given an optional argument, print up to char 255."
  (interactive "P")
  (defvar col)
  (defvar limit)
  (setq limit 255)
  (if (null extended)
      (setq limit 127))
  (setq col (/ (+ 1 limit) 4))
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to %d. (00 is NULL character)\n\n" limit))
  (insert " DEC OCT HEX CHAR\t\t DEC OCT HEX CHAR\t\t DEC OCT HEX CHAR\t\t DEC OCT HEX CHAR\n")
  (insert " ----------------\t\t ----------------\t\t ----------------\t\t ----------------\n")
  (let ((i 0) (right 0) (tab-width 4))
    (while (< i col)
      (setq col2 (+ i col))
      (setq col3 (+ i (* col 2)))
      (setq col4 (+ i (* col 3)))
                                        ; special condition to insert a <TAB> instead of an actual tab
      (cond
       ((= i 9)
        (insert (format "%4d%4o%4x  <TAB>\t\t%4d%4o%4x%4c\t\t%4d%4o%4x%4c\t\t%4d%4o%4x%4c\n"
                        i i i  col2 col2 col2 col2 col3 col3 col3 col3 col4 col4 col4 col4)))
                                        ; special conditon to insert a <LF> instead of an actual line feed
       ((= i 10)
        (insert (format "%4d%4o%4x  <LF>\t\t%4d%4o%4x%4c\t\t%4d%4o%4x%4c\t\t%4d%4o%4x%4c\n"
                        i i i  col2 col2 col2 col2 col3 col3 col3 col3 col4 col4 col4 col4)))
       (t
                                        ; insert the actual character
        (insert (format "%4d%4o%4x%4c>\t\t%4d%4o%4x%4c\t\t%4d%4o%4x%4c\t\t%4d%4o%4x%4c\n"
                        i i i i col2 col2 col2 col2 col3 col3 col3 col3 col4 col4 col4 col4))))
      (setq i (+ i 1))
      )
    )
  (beginning-of-buffer)
  (local-set-key "q" (quote bury-buffer)))

(defun remove-hidden-zero-width-char ()
  (interactive)
  (mark-whole-buffer)
  (replace-string "&#8203;" "")
  (replace-string "&#160;" "")
  (replace-string "&#169;" "©")
  (replace-string "&#8217;" "'"))


;;; First version; has bugs!

(defun count-words-region (beginning end)

  "Print number of words in the region.
     Words are defined as at least one word-constituent
     character followed by at least one character that
     is not a word-constituent.  The buffer's syntax
     table determines which characters these are."
  (interactive "r")
  (message "Counting words in region ... ")
  
     ;;; 1. Set up appropriate conditions.
  (save-excursion
    (goto-char beginning)
    (let ((count 0))
      
     ;;; 2. Run the while loop.
      (while (< (point) end)
        (re-search-forward "\\w+\\W*")
        (setq count (1+ count)))
      
     ;;; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))

;; usage:
;; use C-RET to start the rectangle-selection
;; to move a bunch of lines to right, highlight a column, and just keep pressing SPC
(defun activate-cua-mode ()
  (interactive)
  (setq cua-enable-cua-keys nil)
  (setq cua-highlight-region-shift-only t) ;; no transient mark mode
  (setq cua-toggle-set-mark nil) ;; original set-mark behavior, i.e. no transient-mark-mode
  (cua-mode))

(defun practice-buffer ()
  (interactive)
  (save-excursion
    (move-toother-buffer)
  ))

(defun my-end-of-buffer ()
  (interactive)
  (push-mark)
  (goto-char (point-max)))

;; my-copy-to-buffer takes an buffer as an argument, creates it if it doesn't
;; exist, it then copy the content in the 'current-buffer' to the new-buffer
;; in entirety
;; it will barf if the new-buffer is a read-only bufferjer

(defun my-copy-to-buffer (buffer &optional start end)
  (interactive "BCopy To buffer:\n")
  (let ((oldbuf (current-buffer))
        (start (point-min))
        (end (point-max)))
    (with-current-buffer (get-buffer-create buffer)
      (barf-if-buffer-read-only)
      (erase-buffer)
      (save-excursion
        (insert-buffer-substring oldbuf start end)))))

(defun count-number-of-words ()
  "print stats on current buffer"
  (interactive)
  (goto-char (point-min))
  (let ((i 0))
    (save-excursion
      (while (not (eobp))
        (unless (looking-at "[ \t\r\n]")
          (incf i))
        (forward-char))
      (message "number of chars = %i" (/ i 5))
      )))

;; toggle the dedicateness of the current window
(defun toggle-dedicatize-window ()
  "Makes this window strongly dedicate"
  (interactive)
  (if (not (window-dedicated-p))
    (set-window-dedicated-p (selected-window) t)
    (set-window-dedicated-p (selected-window) nil)))

(global-set-key "\C-c\C-d" 'toggle-dedicatize-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; To transform
;; :meta_keywords => [meta_lambda, :occasions]
;; into
;; :meta_keywords => {:occasions => meta_lambda }
;; use this regex \(.* => \)\[\(.*\), \(.*\)\]
;; and replace with \1 {\3 => \2}
;; remember to escape the [ with \[
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; to save a window-configuration to register
;; use Ctrl-x r w <alpha/numeric>
;; to jump back to that configuration
;; use Ctrl-x r j <alpha/numeric>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-x r s <alpha/numeric>
;; Copy region into register r (copy-to-register).
;; C-x r i <alpha/numeric>
;; Insert text from register r (insert-register).
;; M-x append-to-register <RET> r
;; Append region to text in register r.
;; M-x prepend-to-register <RET> r
;; Prepend region to text in register r.
;; M-x copy-rectangle-to-register
;; Ctrl-x r r
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; I am changing Ruby into a compiled language
;; I am writing a new version of Emacs in Ruby
;; I am writing a Ruby interpreter for Chrome
;; I am making User Content Submission tool a Java project
;; I am demoting lambda to second class objects in Ruby!
;; I am changing Ruby to -Pass by value-
;; I am writing an embedded Javascript interpreter in Ruby!
;; I am proving NP = P
;; I am designing table relationships in MongoDB
;; I am coming up with an algorithm that will do sorting in order N
;; I am finding the largest Prime number!
;; I am proving that 7 is the only true prime number!
;; I am proving you can't find a prime number larger than 1000 billion
;; I am proving that you can't linearly separate a set of 4 items on a 2 dimensional plane
;; I am finding the global maximum for the productivity function of the IT department
;; I am looking for the nullspace of n linear equations with n-1 unknown
;; I am proving that B-tree is just the same as binary tree
;; I am proving that Heap is much better than a Queue
;; I am proving that the set of even number is a finite set by induction!
;; I am trying to find an even prime number bigger than 2
;; I am solving the solution to The Riemann zeta function

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The following example has four clauses, which test for the cases where the value of x is a number, string, buffer and symbol, respectively:
;;           (cond ((numberp x) x)
;;                 ((stringp x) x)
;;                 ((bufferp x)
;;                  (setq temporary-hack x) ; multiple body-forms
;;                  (buffer-name x))        ; in one clause
;;                 ((symbolp x) (symbol-value x)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (let ((x (current-buffer)))
;;   (cond ((numberp x) x)
;;                 ((stringp x) x)
;;                 ((bufferp x)
;;                  (setq temporary-hack x) ; multiple body-forms
;;                  (buffer-name x))        ; in one clause
;;                 ((symbolp x) (symbol-value x))))

;;  (setq needles-per-cluster
;;                 '((2 "Austrian Pine" "Red Pine")
;;                   (3 "Pitch Pine")
;;                   (5 "White Pine")))

;;           (cdr (assoc 3 needles-per-cluster))
;;                ⇒ ("Pitch Pine")
;;           (cdr (assoc 2 needles-per-cluster))
;;                ⇒ ("Austrian Pine" "Red Pine")

;;  (assq 'pine trees)
;;                ⇒ (pine . cones)
;; On the other hand, assq is not usually useful in alists where the keys may not be symbols:

;;           (setq leaves
;;                 '(("simple leaves" . oak)
;;                   ("compound leaves" . horsechestnut)))

;;           (assq "simple leaves" leaves)
;;                ⇒ nil
;;           (assoc "simple leaves" leaves)
;;                ⇒ ("simple leaves" . oak)

;; This function stores object as the new cdr of cons, replacing its previous cdr. In other words, it changes the cdr slot of cons to refer to object. It returns the value object.

;; Here is an example of replacing the cdr of a list with a different list. All but the first element of the list are removed in favor of a different sequence of elements. The first element is unchanged, because it resides in the car of the list, and is not reached via the cdr.

;;      (setq x '(1 2 3))
;;           ⇒ (1 2 3)
;;      (setcdr x '(4))
;;           ⇒ (4)
;;      x
;;           ⇒ (1 4)



;; (setq trees '((1 . 2)))
;; (car (assoc '1 trees))

;; (eval-after-load "shell"
;;  '(define-key shell-mode-map "\M-#" 'shells-dynamic-spell))


(defun replace-html-char-in-region (start end)
  (interactive "r")
  (save-excursion
    (narrow-to-region start end)
    (goto-char (point-min))m
    (while (search-forward "&" nil t)
      (replace-match "&amp;" nil t)))
  (widen))

(defun word-definition-lookup ()
  "Look up the word under cursor in a browser."
 (interactive)
 (browse-url
  (concat "http://www.answers.com/main/ntquery?s="
          (thing-at-point 'symbol))))

(defun alist-test ()
  (interactive)
  (let ((s "this is a test"))
    (message (car (list (current-frame-configuration) (point-marker))))))

(defun test-2 ()
  (interactive)
  (message (thing-at-point 'symbol)))

(defun to-unix-eol (fpath)
  "Change file's line ending to unix convention."
  (let (mybuffer)
    (setq mybuffer (find-file fpath))
    (set-buffer-file-coding-system 'unix) ; or 'mac or 'dos
;; do this or that
    (save-excursion
      (point-min)
      (while (re-search-forward "{.*}" nil t) (replace-match  "han" nil t))
      (save-buffer)
      (kill-buffer mybuffer)
     )
  ))

;; (save-excursion
;; (mapcar 'to-unix-eol
;;  (list
;; "/Users/han/work/time/trash/css_diff/fed_comments.css"
;; "/Users/han/work/time/trash/css_diff/fed_menus.css"
;; ;; ...
;;   )
;; ))

;;
(defun dired-2unix-marked-files ()
  "Change to unix line ending for marked (or next arg) files."
  (interactive)
  (mapcar 'to-unix-eol (dired-get-marked-files))
)

;; Macros
(fset 'goto-shell
   [?\C-x ?r ?w ?h ?\C-x ?m ?s ?h ?e ?l ?l return ?\C-x ?1])

(fset 'goto-server
   [?\C-x ?b ?s ?e ?r ?v ?e ?r ?* return ?\C-x ?1])


(fset 'goto-register-h
   "\C-xrjh")

(fset 'goto-register-m
   "\C-xrjm")

(fset 'save-window-config-to-register-m
   "\C-xrwm")

(fset 'save-window-config-to-register-h
   "\C-xrwh")

(defun toggle-shell ()
  (interactive)
  (if (string-match (buffer-name (current-buffer)) "*shell*")
    (execute-kbd-macro (symbol-function 'goto-register-h))
    (execute-kbd-macro (symbol-function 'goto-shell))))

(defun toggle-server ()
  (interactive)
  (if (string-match (buffer-name (current-buffer)) "*server*")
    (execute-kbd-macro (symbol-function 'goto-register-h))
    (progn
      (execute-kbd-macro(symbol-function 'save-window-config-to-register-h))
      (execute-kbd-macro (symbol-function 'goto-server)))))

(defun toggle-maximize ()
  (interactive)
  (if (string-match (buffer-name (current-buffer)) "*shell*")
    (execute-kbd-macro (symbol-function 'goto-register-m))
    (progn
      (execute-kbd-macro (symbol-function 'save-window-config-to-register-m))
      (delete-other-windows))))

;; (next-window)
;;(car (current-window-configuration))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;practice functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defun delete-current-file ()
  "Delete the file associated with the current buffer.
Delete the current buffer too."
  (interactive)
  (let (currentFile)
    (setq currentFile (buffer-file-name))
    (when (yes-or-no-p (concat "Delete file: " currentFile))
      (kill-buffer (current-buffer))
      (delete-file currentFile)
      (message (concat "Deleted file: " currentFile)) ) ) )

(defun my-transpose-word (start end)
  (interactive "r")
  (save-excursion
    (narrow start end)
    (search-forward ","  nil t)
    ))


(defun pivotal-generate-standard-crud-stories (project-id)
  (interactive "p")
  ;;  (message (shell-command-to-string (quote "curl -u han_qiu\@timeinc.com\:nonenone -X GET https:\/\/www.pivotaltracker.com\/services\/v3\/tokens\/active")))
  (let* ((xml (shell-command-to-string (quote "curl -u han_qiu@timeinc.com:nonenone -X GET https://www.pivotaltracker.com/services/v3/tokens/active")))
         (root (with-temp-buffer
                 (insert xml)
                 (xml-parse-region (point-min) (point-max))))
         (post (car root))
         (guid (car (cddr (car (xml-get-children post 'guid))))))

    (let* ((xml2 (shell-command-to-string (format "curl -H \"X-TrackerToken: %s\" -X POST -H \"Content-type: application/xml\" -d \"<story><story_type>feature</story_type><name>entries index page needs to restrict the view of some data, consistent with the entry show page, based on the role of user</name><requested_by>Han Qiu</requested_by><estimate>2</estimate></story>\" http://www.pivotaltracker.com/services/v3/projects/238865/stories" guid)))
           (root2 (with-temp-buffer
                    (insert xml2)
                    (xml-parse-region (point-min) (point-max))))
           (post2 (car root2))
           (membership (xml-get-children post2 'memberships)))
      (with-temp-file "/tmp/han_temp1.txt"
        (insert membership)
        )))
  )

(defun pivotal-generate-stories (story-description)
  (let* ((xml (shell-command-to-string (quote "curl -u devilhan@gmail.com:nonenone -X GET https://www.pivotaltracker.com/services/v3/tokens/active")))
         (root (with-temp-buffer
                 (insert xml)
                 (xml-parse-region (point-min) (point-max))))
         (post (car root))
         (guid (car (cddr (car (xml-get-children post 'guid))))))

    (let* ((xml2 (shell-command-to-string (format "curl -H \"X-TrackerToken: %s\" -X POST -H \"Content-type: application/xml\" -d \"<story><story_type>feature</story_type><name>%s</name><requested_by>Mid9Commander</requested_by><estimate>1</estimate></story>\" http://www.pivotaltracker.com/services/v3/projects/231983/stories" guid story-description))))
      (with-temp-file "/tmp/han_temp1.txt"
        (insert xml2))
      )))

(defun pivotal-ucs-generate-stories (story-description)
  (let* ((xml (shell-command-to-string (quote "curl -u han_qiu@timeinc.com:nonenone -X GET https://www.pivotaltracker.com/services/v3/tokens/active")))
         (root (with-temp-buffer
                 (insert xml)
                 (xml-parse-region (point-min) (point-max))))
         (post (car root))
         (guid (car (cddr (car (xml-get-children post 'guid))))))

    (let* ((xml2 (shell-command-to-string (format "curl -H \"X-TrackerToken: %s\" -X POST -H \"Content-type: application/xml\" -d \"<story><story_type>feature</story_type><name>%s</name><requested_by>Han Qiu</requested_by><estimate>1</estimate></story>\" http://www.pivotaltracker.com/services/v3/projects/238865/stories" guid story-description))))
      (with-temp-file "/tmp/han_temp1.txt"
        (insert xml2))
      )))

(defun pivotal-rs-generate-stories (story-description)
  (let* ((xml (shell-command-to-string (quote "curl -u han_qiu@timeinc.com:nonenone -X GET https://www.pivotaltracker.com/services/v3/tokens/active")))
         (root (with-temp-buffer
                 (insert xml)
                 (xml-parse-region (point-min) (point-max))))
         (post (car root))
         (guid (car (cddr (car (xml-get-children post 'guid))))))

    (let* ((xml2 (shell-command-to-string (format "curl -H \"X-TrackerToken: %s\" -X POST -H \"Content-type: application/xml\" -d \"<story><story_type>feature</story_type><name>%s</name><requested_by>Han Qiu</requested_by><estimate>1</estimate></story>\" http://www.pivotaltracker.com/services/v3/projects/433131/stories" guid story-description))))
      (with-temp-file "/tmp/han_temp1.txt"
        (insert xml2))
      )))

(defun pivotal-pdp-generate-stories (story-description)
  (let* ((xml (shell-command-to-string (quote "curl -u han_qiu@timeinc.com:nonenone -X GET https://www.pivotaltracker.com/services/v3/tokens/active")))
         (root (with-temp-buffer
                 (insert xml)
                 (xml-parse-region (point-min) (point-max))))
         (post (car root))
         (guid (car (cddr (car (xml-get-children post 'guid))))))

    (let* ((xml2 (shell-command-to-string (format "curl -H \"X-TrackerToken: %s\" -X POST -H \"Content-type: application/xml\" -d \"<story><story_type>feature</story_type><name>%s</name><requested_by>Han Qiu</requested_by><estimate>1</estimate></story>\" http://www.pivotaltracker.com/services/v3/projects/433131/stories" guid story-description))))
      (with-temp-file "/tmp/han_temp1.txt"
        (insert xml2))
      )))

(defun generate-ucs-story ()
  (interactive)
  (save-excursion
    (mapcar 'pivotal-pdp-generate-stories
            (list
             "Add fields to slides"
             "make high medium low as radio box"
             "add UI hints to publish application when main galleries order have changed"
             "Navigation tree to not display a long list"
             "Chang dirty to something that can't be used in bed"
             "Make template globally visible so that it can be used across brand, application"
             ))))

(defun to_s (ary)
  (print (car ary)))

(mapcar 'to_s (list '("a", "b") '("c", "d")))



;; "display campaign name and category name in the heading of entries index view"
;; "all 4 status should be linked to index view in stats view with proper filter, at the same time, remove recent activity on stats view"
;; "new status per Jim -> 'new', 'pending review', 'approved', 'rejected'"
;; "display last person that perform approved, rejected on entries index page"
;; "alternate row color, I feel that this is not necessary once we polish the UI more so that the row are more spaced out"
;; "icons for the respective statuses"
;; "change date format to MMMDDYY HHMM(am|pm) in the entire app"
;; "move tags to the top of the entires index page, this might have to be a tag cloud kind of thing"
;; "having a link for all entries for a campaign"
;; "resolve category name change, this needs to be discussed over as we might be able to leverage the array in mongodb to store chains of changes for category name, so that we don't have to do join"
;; "mock data for pictures"
;; "make username, last name having higher priority in search"
;; "syntax for searching that specifiy only certain field in entry index page"
;; "handle moving/copying entries to different categories(UI + backend change), initial feeling is that we should"
;; "add another role that is able to create campaign but not able to view Personal Identity Information (PII)"
;; "endless scrolling, we need to look at this and see what is the effort involved as well as how to make this work"

;; (mapcar 'pivotal-generate-stories
;;   (list
;;      "ability to accomodate comma in category, this means the UI will most likely be a button user can click on to add categories"
;;      "entries index page needs to restrict the view of some data, consistent with the entry show page, based on the role of user"
;;       ))


(defun open-file-at-point ()
  (interactive)
  (let* ((thing (thing-at-point 'filename))
         (absolute-path (concat (pwd) thing)))
    (while (string-match "Directory " absolute-path)
      (setq absolute-path (replace-match "" t t absolute-path)))
    (switch-to-buffer (find-file absolute-path))))

(defun generate-sender-story ()
  (interactive)
  (save-excursion
    (mapcar 'pivotal-generate-stories
            (list
             "ability to accomodate comma in category, this means the UI will most likely be a button user can click on to add categories"
             "entries index page needs to restrict the view of some data, consistent with the entry show page, based on the role of user"
             ))))

;; (let ((xxx (make-hash-table)))
;;   (puthash 'test [1 2 3] xxx)
;;   (arrayp (gethash 'test xxx))
;;   )

;; (print "alsdfjkasf")
;; (save-excursion
;;   (let ((buffer (with-current-buffer (get-buffer "trash_testing"))))
;;                   (goto-char (point-min))
;;                   (read-string buffer)))

;; (read (current-buffer))

;;         (let* ((res-file (expand-file-name ".emacs"))
;;                      (res
;;                       (with-temp-buffer
;;                         (when (file-readable-p res-file)
;;                           (insert-file-contents res-file)
;;                           (read (current-buffer))))))
;;           (with-temp-file "/tmp/han_temp1.txt"
;;             (insert res)))




;; (msg (car (xml-get-children post 'msg)))
;; (text (car (xml-node-children msg))))
                                        ;  (message "post: %s, message '%s'" post))
;; ((home (expand-file-name (getenv "HOME"))))


;; (let* ((xml "<post time=\"20050716234509\" id=\"010101\">
;;              <login>Test</login>
;;              <msg>Here is the message</msg>
;;              <info>My UA</info>
;;            </post>")
;;      (root (with-temp-buffer
;;        (insert xml)
;;        (xml-parse-region (point-min) (point-max))))
;;      (post (car root))
;;      (attrs (xml-node-attributes post))
;;      (time (cdr (assq 'time attrs)))
;;      (msg (car (xml-get-children post 'msg)))
;;      (text (car (xml-node-children msg))))
;; (message "time: %s, message '%s'" time text))









;; curl -H "X-TrackerToken: 319133e7b2cf3ee06cb38e9b4b76e56a" -X POST -H "Content-type: application/xml" -d "<story><story_type>feature</story_type><name>entries index page needs to restrict the view of some data, consistent with the entry show page, based on the role of user</name><requested_by>Han Qiu</requested_by><estimate>2</estimate></story>" http://www.pivotaltracker.com/services/v3/projects/238865/stories

;; todo
;; omniture, done the right way
;; ingredientocean.com
;; recipeocean.com
;; totalingredients.com

;; Overwrite flymake-display-warning so that no annoying dialog box is
;; used.
(defun flymake-display-warning (warning)
  "Display a warning to the user, using lwarn"
  ())

(defun rop ()
  (interactive)
  (find-file "~/.emacs.d/misc-files/ruby_operator_precedence.png"))

(defun clear-shell ()
  (interactive)
  (let ((old-max comint-buffer-maximum-size))
    (setq comint-buffer-maximum-size 0)
    (comint-truncate-buffer)
    (setq comint-buffer-maximum-size old-max)))

(defun lookup-word-definition ()
  "Look up the current word's definition in a browser. If a region is active (a phrase), lookup that phrase."
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active) (buffer-substring-no-properties (region-beginning) (region-end)) (thing-at-point 'symbol))
          )
    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat "http://www.answers.com/main/ntquery?s=" myword)) (browse-url myurl) ;; (w3m-browse-url myurl) ;; if you have w3m and w3 installed ;; (shell-command (concat "open -a opera " myurl)) ;; use diff browser in OSX

    ))
(global-set-key [(f6)] 'lookup-word-definition)

;;; Some more customization for JDEE
(defun my-jde-mode-hook ()
  "Hook for running Java file..."
  (message "Loading my-java-hook...")
  (define-key c-mode-base-map "\C-ca" 'jde-javadoc-generate-javadoc-template)
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)  
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'statement-case-open 0)
  (c-set-offset 'case-label '+)
  (fset 'my-javadoc-code
        [?< ?c ?o ?d ?e ?>?< ?/ ?c ?o ?d ?e ?> left left left left left left left])
  (define-key c-mode-base-map "\C-cx" 'my-javadoc-code)
  (abbrev-mode t)
  (setq c-comment-continuation-stars "* "
        tab-width 2
        indent-tabs-mode nil
        tempo-interactive t
        c-basic-offset 2)
  (message "my-jde-mode-hook function executed")
  )
(add-hook 'jde-mode-hook 'my-jde-mode-hook)



(defun string-replace (from to string &optional re)
  "Replace all occurrences of FROM with TO in STRING.
All argumenscts are strings.
When optional fourth argument is non-nil, treat the from as a regular expression."
  (let ((pos 0)
        (res "")
        (from (if re from (regexp-quote from))))
    (while (< pos (length string))
      (if (setq beg (string-match from string pos))
          (progn
            (setq res (concat res
                              (substring string pos (match-beginning 0))
                              to))
            (setq pos (match-end 0)))
        (progn
          (setq res (concat res (substring string pos (length string))))
          (setq pos (length string)))))
    res))

(fset 'count-column
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("^A^@^F^E^Xmocc^?^?^?coun ma  ^M^Q  ^M" 0 "%d")) arg)))

(add-hook 'dired-mode-hook (lambda() (set-face-foreground 'dired-directory "yellow" )))
(set-face-foreground 'font-lock-function-name-face "yellow")

;; someday might want to rotate windows if more than 2 of them
(defun swap-windows ()
 "If you have 2 windows, it swaps them."
 (interactive) (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
 (t
 (let* ((w1 (first (window-list)))
	 (w2 (second (window-list)))
	 (b1 (window-buffer w1))
	 (b2 (window-buffer w2))
	 (s1 (window-start w1))
	 (s2 (window-start w2)))
 (set-window-buffer w1 b2)
 (set-window-buffer w2 b1)
 (set-window-start w1 s2)
 (set-window-start w2 s1)))))

;;
;; Never understood why Emacs doesn't have this function.
;;
(defun rename-file-and-buffer (new-name)
 "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
 (let ((name (buffer-name))
	(filename (buffer-file-name)))
 (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
 (if (get-buffer new-name)
	 (message "A buffer named '%s' already exists!" new-name)
	(progn 	 (rename-file name new-name 1) 	 (rename-buffer new-name) 	 (set-visited-file-name new-name) 	 (set-buffer-modified-p nil))))))
;;
;; Never understood why Emacs doesn't have this function, either.
;;
(defun move-buffer-file (dir)
 "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
 (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	 (if (string-match dir "\\(?:/\\|\\\\)$")
	 (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))

 (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
 (progn 	(copy-file filename newname 1) 	(delete-file filename) 	(set-visited-file-name newname) 	(set-buffer-modified-p nil) 	t))))


