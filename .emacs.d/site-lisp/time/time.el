;;; http-cookies.el --- simple HTTP cookies implementation

;; Copyright (C) 2004, David Hansen

;; Author: David Hansen <david.hansen@physik.fu-berlin.de>
;; Maintainer: David Hansen <david.hansen@physik.fu-berlin.de>
;; Version: 1.0.0
;; Keywords: hypermedia

;; This file is not part of GNU Emacs.

;; This is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.


;;; Commentary:

;; Implementation of old netscape cookies (used by maybe all servers) and
;; version 1 cookies.
;;
;; See http://www.faqs.org/rfcs/rfc2109.html and
;; http://wp.netscape.com/newsref/std/cookie_spec.html

;;; Change log:

;;; TODO:

;;    - whitelist
;;    - blacklist
;;    - reading from file, saving to file
;;    - expire

;;; Code:

(require 'time-date)

(defconst http-cookies-version "1.0.0")

(defgroup http-emacs ()
  "Simple HTTP client implementation in elisp.")

(defcustom http-emacs-use-cookies nil
  "Use cookies in the http-emacs package. *EXPERIMENTAL*"
  :type 'boolean
  :group 'http-emacs)

(defcustom http-emacs-cookie-file "~/.emacs-cookies"
  "*File where to store the cookies."
  :type 'file
  :group 'http-emacs)

(defconst http-token-value-regexp
  "^[ \t]*\\(.*?\\)[ \t]*=[ \t]*\"?\\(.*?\\)\"?[ \t]*;?[ \t]*$"
  "Regexp to match a token=\"value\"; in a cookie.")

(defvar http-cookies-accept-functions
  '(http-cookie-check-path
    http-cookie-check-domain
    http-cookie-check-hostname)
  "*List of functions used to determine if we accept a cookie or not.
If one of these function returns nil the cookie will be rejected.  Each
function can access the free variables `cookie', `host' (from the url)
`path' (from the URL) and `url' to make its decision.")

(defvar http-cookies-host-hash
  (make-hash-table :test 'equal)
  "Hash to look up cookies by host name.")

(defvar http-cookies-domain-hash
  (make-hash-table :test 'equal)
  "Hash to look up cookies by domain.")



;; functions for parsing the header

(defun http-cookies-ns-to-rfc (line)
  "Make the header value LINE a bit more RFC compatible.
Make old netscape cookies a bit more RFC 2109 compatible by quoting
the \"expires\" value.  We need this to be able to properly split
the header value if there is more than one cookie."
  (let ((start 0))
    (while (string-match "expires[ \t]*=[ \t]*\\([^\";]+?\\)\\(;\\|$\\)"
                         line start)
      (setq start (match-end 0))
      (setq line (replace-match "\"\\1\"" t nil line 1)))
    line))

(defun http-cookies-find-char-in-string (char string &optional start)
  "Return the first position of CHAR in STRING.
If START is non-nil start at position START."
  (unless start
    (setq start 0))
  (let ((i start) (len (length string)) pos)
    (while (and (not pos) (< i len))
      (when (= (aref string i) char)
        (setq pos i))
      (setq i (1+ i)))
    pos))

(defun http-cookies-find-quoted-strings (header-value)
  "Return list of positions of quoted strings in HEADER_VALUE.
Return a list of pairs with the beginning and end of quoted strings
in a \"Set-cookie: \" header value."
  (let ((start 0) qstring-pos)
    (while (string-match "=[ \t]*\\(\".*?[^\\]\"\\)" header-value start)
      (add-to-list 'qstring-pos (cons (match-beginning 1) (1- (match-end 1))))
      (setq start (match-end 1)))
    qstring-pos))

(defun http-cookies-split-string (header-value sep-char)
  "Split the HEADER-VALUE at the character SEP-CHAR.
Ignores SEP-CHAR if it is in a quoted string.  Return a list of the
substrings."
  (let ((qstrings (http-cookies-find-quoted-strings header-value))
        (start 0) (beg 0) pos in-qstring strings)
    (while (setq pos (http-cookies-find-char-in-string
                      sep-char header-value start))
      (unless (= pos start)           ; ignore empty strings
        ;; check if pos is in a quoted string
        (dolist (qstring-pos qstrings)
          (unless in-qstring
            (when (and (> pos (car qstring-pos)) (< pos (cdr qstring-pos)))
              (setq in-qstring t))))
        (if in-qstring
            (setq in-qstring nil)
          (add-to-list 'strings (substring header-value beg pos))
          (setq beg (1+ pos))))
      (setq start (1+ pos)))
    ;; add the last token
    (add-to-list 'strings (substring header-value beg))
    strings))

(defun http-cookies-parse-cookie (string)
  "Parse one cookie.
Return an alist ((NAME . VALUE) (attr1 . value1) (attr2 . value2) ...)
or nil on error."
  (let (attrs error)
    (dolist (attr (http-cookies-split-string string ?\;))
      (if (string-match http-token-value-regexp attr)
          (add-to-list 'attrs (cons (match-string 1 attr)
                                    (match-string 2 attr)))
        ;; match the secure attribute
        (if (string-match "[ \t]*\\([a-zA-Z]+\\)[ \t]*"  attr)
            (add-to-list 'attrs (cons (match-string 1 attr) t))
          (setq error t)
          (message "Cannot parse cookie %s" string))))
    (unless error
      attrs)))

(defun http-cookies-set (url headers)
  "Set the cookies from the response to a request of URL.
Set HEADERS to the headers of the response."
  (let ((host (http-cookies-url-host url)) (path (http-cookies-url-path url))
        header-value cookie)
    ;; The server may send several "Set-Cookie:" headers.
    (dolist (line headers)
      (when (equal (car line) "set-cookie")
        (setq header-value (http-cookies-ns-to-rfc (cdr line)))
        ;; there may be several cookies separated by ","
        (dolist (raw-cookie (http-cookies-split-string header-value ?\,))
          (setq cookie (http-cookies-parse-cookie raw-cookie))
          ;; (message "%s" raw-cookie)
          (when (http-cookies-accept)
            ;; (message "accepted")
            (http-cookies-store host cookie)))))))



;; storing cookies

(defun http-cookies-name (cookie)
  "Return the name of the COOKIE."
  (car (car cookie)))

(defun http-cookies-path (cookie)
  "Return the value of the path attribute of the COOKIE."
  (let ((attr (or (assoc "path" cookie) (assoc "Path" cookie))))
    (when attr
      (cdr attr))))

(defun http-cookies-domain (cookie)
  "Return the value of the domain attribute of the COOKIE."
  (let ((attr (or (assoc "domain" cookie) (assoc "Domain" cookie))))
    (when attr
      (cdr attr))))

(defun http-cookies-expires (cookie)
  "Return the value of the expires attribute of the COOKIE."
  (let ((attr (assoc "expires" cookie)))
    (when attr
      (cdr attr))))

(defun http-cookies-max-age (cookie)
  "Return the value of the Max-Age attribute of the COOKIE."
  (let ((attr (assoc "Max-Age" cookie)))
    (when attr
      (cdr attr))))

(defun http-cookies-version (cookie)
  "Return the value of the version attribute of the COOKIE."
  (let ((version (assoc "Version" cookie)))
    (when version
      (if (equal version "1")
          t
        (message "Cookie version %s not supported." version)
        nil))))

(defun http-cookies-equal (c1 c2)
  "Return non nil if the given cookies are equal.
Old netscape cookies are equal if the name and path attributes are equal.
Version 1 cookies are equal if name path and domain are equal."
  (if (and (http-cookies-version c1) (http-cookies-version c2))
      ;; version 1 cookies
      (and (equal (http-cookies-name c1) (http-cookies-name c2))
           (equal (http-cookies-path c1) (http-cookies-path c2))
           (equal (http-cookies-domain c1) (http-cookies-domain c2)))
    ;; netscape cookies
    (and (equal (http-cookies-name c1) (http-cookies-name c2))
         (equal (http-cookies-path c1) (http-cookies-path c2)))))

(defun http-cookies-expired (expire-string)
  "Return non nil if EXPIRE-STRING is in the past."
  (> (time-to-seconds (time-since expire-string)) 0.0))

(defun http-cookies-remove (cookie key table)
  "Remove cookies \"equal\" to COOKIE from the list stored with KEY in TABLE."
  (let ((cookie-list (gethash key table)) new-list)
    (dolist (entry cookie-list)
      (unless (http-cookies-equal entry cookie)
        (add-to-list 'new-list entry)))
    (when cookie-list
      (remhash key table)
      (puthash key new-list table))))

(defun http-cookies-store (host cookie)
  "Store the given COOKIE from HOST in the hash tables.
Remove cookie from the tables if the given COOKIE expires in the past or
has an \"Max-Age\" of 0."
  (let ((domain (http-cookies-domain cookie))
        (max-age (http-cookies-max-age cookie))
        (expires (http-cookies-expires cookie))
        (cookie-list))
    ;; remove an possible "equal" old cookie
    (http-cookies-remove cookie host http-cookies-host-hash)
    (when domain
      (http-cookies-remove cookie domain http-cookies-domain-hash))
    ;; check if expires is in the past or Max-Age is zero
    (unless (or (and max-age (= (string-to-number max-age) 0))
                (and expires (http-cookies-expired expires)))
      ;; convert "Max-Age" to "expire"
      (when max-age
        ;; this value does not have to be in the "right" format
        ;; it's enough if `parse-time-string' can parse it
        (setq expires (format-time-string
                       "%Y-%m-%d %T %z"
                       (time-add (current-time) (seconds-to-time max-age))
                       t))
        (setcdr (assoc "Max-Age" cookie) expires)
        (setcar (assoc "Max-Age" cookie) "expires"))
      (setq cookie-list (gethash host http-cookies-host-hash))
      (add-to-list 'cookie-list cookie)
      (puthash host cookie-list http-cookies-host-hash)
      (when domain
        (setq cookie-list (gethash domain http-cookies-domain-hash))
        (add-to-list 'cookie-list cookie)
        (puthash domain cookie-list http-cookies-domain-hash)))))



;; building the header to send back the cookie

(defun http-cookies-cookie-to-string (cookie)
  "Return the cookie as a string to be used as a header value."
  (let* ((name (http-cookies-name cookie))
         (value (cdr (assoc name cookie)))
         (path (http-cookies-path cookie))
         (domain (http-cookies-domain cookie))
         (string))
    (if (http-cookies-version cookie)
        ;; version 1 cookie
        (progn
          (setq string (concat "$Version = \"1\"; " name " = \"" value "\""))
          (when path
            (setq string (concat string "; $Path = \"" path "\"")))
          (when domain
            (setq string (concat string "; $Domain = \"" domain "\""))))
      ;; netscape cookies
      (setq string (concat name "=" value)))))

(defun http-cookies-cookie-in-list (cookie list)
  "Return non-nil if a cookie \"equal\" to the given COOKIE is in LIST."
  (let ((in-list))
    (dolist (element list)
      (unless in-list
        (setq in-list (http-cookies-equal cookie element))))
    in-list))

(defun http-cookies-path-depth (cookie)
  "Return the number of dashes in the path attribute of the cookie."
  (let ((patch http-cookies-path cookie) (n 0) (start 0))
    (while (setq start (http-cookies-find-char-in-string ?\/ path start))
      (setq n (1+ n)))
    n))

(defun http-cookie-path-depth-less (c1 c2)
  "Return non nil if the path depth of cookie C1 is less than C2."
  (< (http-cookies-path-depth c1) (http-cookies-path-depth c2)))

(defun http-cookies-build-header (url)
  "Return a pair (\"Cookie\" . <header value>).
Use this to send back cookies to the given URL."
  (let ((host (http-cookies-url-host url)) (domain) (cookie-list) (string))
    (when (string-match "^[^.]+\\(\\..+\\)" host)
      (setq domain (match-string 1 host))
      (dolist (cookie (gethash host http-cookies-host-hash))
        (unless (http-cookies-expired (http-cookies-expires cookie))
          (add-to-list 'cookie-list cookie)))
      (dolist (cookie (gethash domain http-cookies-domain-hash))
        (unless (or (http-cookies-cookie-in-list cookie cookie-list)
                    (http-cookies-expired (http-cookies-expires cookie)))
          (add-to-list 'cookie-list cookie)))
      (setq cookie-list (sort cookie-list 'http-cookies-path-depth-less))
      (dolist (cookie cookie-list)
        (if string
            (setq string (concat string "; "
                                 (http-cookies-cookie-to-string cookie)))
          (setq string (http-cookies-cookie-to-string cookie)))))
    (cons "Cookie" string)))



;; extract parts of the url

(defun http-cookies-url-host (url)
  "Return the hostname of URL"
  (unless (string-match
           "http://\\([^/:]+\\)\\(:\\([0-9]+\\)\\)?/\\(.*/\\)?\\([^:]*\\)"
           url)
    (error "Cannot parse URL %s." url))
  (match-string 1 url))

(defun http-cookies-url-path (url)
  "Return the path of the URL."
  (unless (string-match
           "http://\\([^/:]+\\)\\(:\\([0-9]+\\)\\)?/\\(.*/\\)?\\([^:]*\\)"
           url)
    (error "Cannot parse URL %s." url))
  (concat "/" (or (match-string 4 url) "")))



;; functions to check the cookie (implementation of 4.3.2 of RFC 2109)

(defun http-cookies-accept ()
  "Return non nil if the cookie should be accepted.
The tests are based on the functions in `http-cookies-accept-functions'."
  (let ((accept t))
    (dolist (fun http-cookies-accept-functions)
      (when accept
        (setq accept (funcall fun))))
    accept))

(defun http-cookie-check-path ()
  "Return nil if the \"path\" attribute is not a prefix of th URL."
  (let ((cookie-path (cdr (assoc "path" cookie))))
    (if cookie-path
        (if (string-match (concat "^" cookie-path) path)
            t
          (message "Rejecting cookie: path attribute \"%s\" is not a prefix\
 of the URL %s." cookie-path url)
          nil)
      t)))

(defun http-cookie-check-domain ()
  "Return nil if the domain is bogus.
Return nil if the domain does not start with a \".\" or does not contain
an embedded dot."
  (let ((domain (cdr (assoc "domain" cookie))))
    (if domain
        (if (string-match "^\\.[^.]+\\.[^.]+" domain)
            t
          (message "Rejection cookie: domain \"%s\" does not start with a dot\
 or does not contain an embedded dot." domain)
          nil)
      t)))

(defun http-cookie-check-hostname ()
  "Return nil if the domain doesn't match the host.
Return nil if the domain attribute does not match the host name or the
host name without the domain attribute still contains one or more dots."
  ;; FIXME: hostname might be an IP address
  (let ((domain (cdr (assoc "domain" cookie))))
    (if (not domain)
        t
      (when (string-match (concat domain "$") host)
        (not (http-cookies-find-char-in-string
              ?\. (substring host 0 (match-beginning 0))))))))


(provide 'http-cookies)

;;; http-cookies.el ends here


;;; http-get.el --- simple HTTP GET

;; Copyright (C) 2002, 2003 Alex Schroeder

;; Author: Alex Schroeder <alex@gnu.org>
;;         Pierre Gaston <pierre@gaston-karlaouzou.com>
;;         David Hansen <david.hansen@physik.fu-berlin.de>
;; Maintainer: David Hansen <david.hansen@physik.fu-berlin.de>
;; Version: 1.0.15
;; Keywords: hypermedia
;; URL: http://www.emacswiki.org/cgi-bin/wiki.pl?HttpGet

;; This file is not part of GNU Emacs.

;; This is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.


;;; Commentary:

;; Use `http-get' to download an URL.

;;; Change log:

;; 1.0.15
;;   - made `http-parse-headers' RFC 2616 compatible (removing whitespaces,
;;     headers may spawn several line)
;;   - log message headers
;;   - made most variables buffer local with `make-variable-buffer-local'
;; 1.0.14
;;   - Removed attempt to fix bug in 1.0.12, not needed anymore since 1.0.13.
;; 1.0.13
;;   - The string is now not anymore decoded in the http-filter.
;;     You have to run `http-decode' yourself.
;; 1.0.12
;;   - Hopefully fixed the bug with inserting "half" multi byte chars.
;; 1.0.11
;;   - Added (setq string (string-make-unibyte string)) to http-filter
;;     this seems to solve problems with multi byte chars.
;;   - Fixed bug when building the headers.
;;   - Fixed indentation (please guys, read the coding conventions in the
;;     elisp manual)
;;   - Replaced string-bytes with length (string-bytes shouldn't be needed
;;     anymore as we force the string to be unibyte)
;; 1.0.10
;;   - Fix some codings problems again.
;; 1.0.9
;;   - Added better coding support.
;; 1.0.8
;;   - Rewrote the parser.
;;   - Correction to the http 1.0 usage.
;; 1.0.3
;;   - Move http-url-encode from http-post.el to http-get.el.
;;   - Add a param to http-get to specify the encoding of the params in the url.

;;; Code:

(require 'hexl)
(require 'http-cookies)

(defvar http-get-version "1.0.15")

;; Proxy
(defvar http-proxy-host nil
  "*If nil dont use proxy, else name of proxy server.")

(defvar http-proxy-port nil
  "*Port number of proxy server.  Default is 80.")

(defvar http-coding 'iso-8859-1
   "Default coding to be use when the string is inserted in the buffer.
This coding will be modified on Finding the content-type header")
(make-variable-buffer-local 'http-coding)

(defvar  http-filter-pre-insert-hook '(http-parser)
  "Hook run by the `http-filter'.
This is called whenever a chunk of input arrives, before it is
inserted into the buffer.  If you want to modify the string that gets
inserted, modify the variable `string' which is dynamically bound to
what will get inserted in the end.  The string will be inserted at
the `process-mark', which you can get by calling \(process-mark proc).
`proc' is dynamically bound to the process, and the current buffer
is the very buffer where the string will be inserted.")

(defvar http-filter-post-insert-hook  nil
  "Hook run by the `http-filter'.
This is called whenever a chunk of input arrives, after it has been
inserted, but before the `process-mark' has moved.  Therefore, the new
text lies between the `process-mark' and point.  You can get the values
of the `process-mark' by calling (process-mark proc).  Please take care
to leave point at the right place, eg.  by wrapping your code in a
`save-excursion'.")

(defun http-filter (proc string)
  "Filter function for HTTP buffers.
See `http-filter-pre-insert-hook' and `http-filter-post-insert-hook'
for places where you can do your own stuff such as HTML rendering.
Argument PROC is the process that is filtered.
Argument STRING is the string outputted by the process."
  ;; emacs seems to screw this sometimes
  (when (fboundp 'string-make-unibyte)
    (setq string (string-make-unibyte string)))
  (with-current-buffer (process-buffer proc)
    (let ((moving (= (point) (process-mark proc))))
      (save-excursion
  " Insert the text, advancing the process marker."
  (goto-char (process-mark proc))
  (run-hooks 'http-filter-pre-insert-hook)
        ;; Note: the string is inserted binary in a unibyte buffer
        (insert string)
  (run-hooks 'http-filter-post-insert-hook)
  (set-marker (process-mark proc) (point)))
      (if moving (goto-char (process-mark proc))))))

(defvar http-status-code nil
  "The status code returned for the current buffer.
This is set by the function `http-headers'.")
(make-variable-buffer-local 'http-status-code)

(defvar http-reason-phrase nil
  "The reason phrase returned for the `http-status-code'.
This is set by the function `http-headers'.")
(make-variable-buffer-local 'http-reason-phrase)

(defvar http-headers nil
  "An alist of the headers that have been parsed and removed from the buffer.
The headers are stored as an alist.
This is set by the function `http-headers'.")
(make-variable-buffer-local 'http-headers)

(defvar http-parser-state 'status-line
  "Parser status.")
(make-variable-buffer-local 'http-parser-state)

(defvar http-unchunk-chunk-size  0
  "Size of the current unfinished chunk.")
(make-variable-buffer-local 'http-unchunk-chunk-size)

(defvar http-not-yet-parsed  ""
  "Received bytes that have not yet been parsed.")
(make-variable-buffer-local 'http-not-yet-parsed)

(defvar http-host ""
  "The host to which we have sent the request.")
(make-variable-buffer-local 'http-host)

(defvar http-url ""
  "The requested URL.")
(make-variable-buffer-local 'http-url)

(defun http-parser ()
  "Simple parser for http message.
Parse the status line, headers and chunk."
  (let ((parsed-string (concat http-not-yet-parsed string)) content-type)
    (setq string "")
    (setq http-not-yet-parsed "")
    (while (> (length parsed-string) 0)
      (cond

       ((eq http-parser-state 'status-line)
  ;; parsing status line
  (if (string-match "HTTP/[0-9.]+ \\([0-9]+\\) \\(.*\\)\r\n"
                          parsed-string)
      (progn
              (setq http-status-code
                    (string-to-number (match-string 1 parsed-string)))
              (setq http-reason-phrase (match-string 2 parsed-string))
              (setq http-parser-state 'header)
              (setq parsed-string (substring parsed-string (match-end 0))))
    ;; status line not found
          (setq http-not-yet-parsed parsed-string)
          (setq parsed-string "")))

       ((eq http-parser-state 'header)
  ;; parsing headers
  (if (string-match "\r\n\r\n" parsed-string)
      (let ((end-headers (match-end 0)))
        (setq http-headers
                    (http-parse-headers
                     (substring parsed-string 0 (match-beginning 0))))
        (if (string= "chunked"
         (cdr (assoc "transfer-encoding" http-headers)))
      (setq http-parser-state 'chunked)
    (setq http-parser-state 'dump))
        (when (and
         (setq content-type
         (cdr (assoc "content-type" http-headers)))
         (string-match "charset=\\(.*\\)" content-type))
    (setq http-coding
                      (intern-soft (downcase (match-string 1 content-type)))))
        (setq parsed-string (substring parsed-string end-headers))
              ;; set cookies
              (when http-emacs-use-cookies
                  (http-cookies-set http-url http-headers)))
    ;; we don't have all the headers yet
    (setq http-not-yet-parsed parsed-string)
    (setq parsed-string "")))

       ((eq http-parser-state 'chunked)
  ;; parsing chunked content
        (if (> (length parsed-string) http-unchunk-chunk-size)
      (progn
        (setq string (concat string
                                   (substring parsed-string 0
                                              http-unchunk-chunk-size)))
        (setq parsed-string
                    (substring parsed-string http-unchunk-chunk-size))
        (setq http-unchunk-chunk-size 0)

        (if (string-match  "\\([0-9a-f]+\\)[^\r^\b]*\\(\r\n\\)"
                                 parsed-string)
      (if (> (setq http-unchunk-chunk-size
                               (hexl-hex-string-to-integer
                                (match-string 1 parsed-string)))
       0)
          (setq parsed-string
                            (substring parsed-string (match-end 2)))
        ;; chunk 0 found we just burry it
        (setq parsed-string "")
        (setq http-parser-state 'trailer))
                ;; we don't have the next chunk-size yet
    (setq http-not-yet-parsed parsed-string)
    (setq parsed-string "")))
    ;; the current chunk is not finished yet
    (setq string  (concat string parsed-string))
    (setq http-unchunk-chunk-size
                (- http-unchunk-chunk-size (length parsed-string)))
          (setq parsed-string "")))

       ((eq http-parser-state 'trailer)
        ;; parsing trailer
        (setq  parsed-string ""))

       ((eq http-parser-state 'dump)
   (setq  string parsed-string)
   (setq  parsed-string ""))))))


(defun http-parse-headers (header-string)
  "Parse the header string.
Argument HEADER-STRING A string containing a header list."
  ;; headers may spawn several line if the nth, n>1, line starts with
  ;; at least one whitespace
  (setq header-string (replace-regexp-in-string "\r\n[ \t]+" " "
                                                header-string))
  (let ((lines-list (split-string header-string "\r\n")))
    (mapcar (lambda (line)
        (if (string-match ":[ \t]+\\(.*?\\)[ \t]*$" line)
                    (cons (downcase (substring line 0 (match-beginning 0)))
                          (match-string 1 line))
    line))
            lines-list)))


;; URL encoding for parameters
(defun http-url-encode (str content-type)
  "URL encode STR using CONTENT-TYPE as the coding system."
  (apply 'concat
   (mapcar (lambda (c)
       (if (or (and (>= c ?a) (<= c ?z))
         (and (>= c ?A) (<= c ?Z))
         (and (>= c ?0) (<= c ?9)))
           (string c)
         (format "%%%02x" c)))
     (encode-coding-string str content-type))))


(defun http-decode-buffer ()
  "Decode buffer according to the buffer local variable `http-coding'."
  (when (and
   (fboundp 'set-buffer-multibyte)
   (fboundp 'multibyte-string-p))
    (when (multibyte-string-p (decode-coding-string "test" http-coding))
      (set-buffer-multibyte t)))
  (decode-coding-region (point-min) (point-max) http-coding))

;; Debugging
(defvar http-log-function 'ignore
  "Function to call for log messages.")

(defun http-log (str)
  "Log STR using `http-log-function'.
The default value just ignores STR."
  (funcall http-log-function str))


(defun http-get-debug (url &optional headers version)
  "Debug the call to `http-get'."
  (interactive "sURL: ")
  (let* ((http-log-function (lambda (str)
            (save-excursion
        ;; dynamic binding -- buf from http-get is used
        (set-buffer buf)
        (insert str))))
   proc)
    (when (get-buffer "*Debug HTTP-GET*")
      (kill-buffer "*Debug HTTP-GET*"))
    (setq proc (http-get url headers nil version))
    (set (make-local-variable 'http-filter-pre-insert-hook) nil)
    (set (make-local-variable 'http-filter-post-insert-hook) nil)
    (rename-buffer "*Debug HTTP-GET*")))


;; The main function

;;;###autoload
(defun http-get (url &optional headers sentinel version bufname content-type)
  "Get URL in a buffer, and return the process.
You can get the buffer associated with this process using
`process-buffer'.

The optional HEADERS are an alist where each element has the form
\(NAME . VALUE).  Both must be strings and will be passed along with
the request.

With optional argument SENTINEL, the buffer is not shown.  It is the
responsibility of the sentinel to show it, if appropriate.  A sentinel
function takes two arguments, process and message.  It is called when
the process is killed, for example.  This is useful when specifying a
non-persistent connection.  By default, connections are persistent.
Add \(\"Connection\" . \"close\") to HEADERS in order to specify a
non-persistent connection.  Usually you do not need to specify a
sentinel, and `ignore' is used instead, to prevent a message being
printed when the connection is closed.

If you want to filter the content as it arrives, bind
`http-filter-pre-insert-hook' and `http-filter-post-insert-hook'.

The optional argument VERSION specifies the HTTP version to use.  It
defaults to version 1.0, such that the connection is automatically
closed when the entire document has been downloaded.  This will then
call SENTINEL, if provided.  If no sentinel is provided, `ignore' will
be used in order to prevent a message in the buffer when the process
is killed.

CONTENT-TYPE is a coding system to use for the encoding of the url
param value.  Its upper case print name will be used for the server.
Possible values are `iso-8859-1' or `euc-jp' and others.

The coding system of the process is set to `binary', because we need to
distinguish between \\r and \\n.  To correctly decode the text later,
use `decode-coding-region' and get the coding system to use from
`http-headers'."
  (interactive "sURL: ")
  (setq version (or version 1.0))
  (let* (host dir file port proc buf command start-line (message-headers "") )
    (unless (string-match
       "http://\\([^/:]+\\)\\(:\\([0-9]+\\)\\)?/\\(.*/\\)?\\([^:]*\\)"
             url)
      (error "Cannot parse URL %s." url))
    (unless bufname
      (setq bufname (format "*HTTP GET %s *" url)))

    (setq host (match-string 1 url)
    port (or (and (setq port (match-string 3 url))
                        (string-to-int port)) 80)
    dir (or (match-string 4 url) "")
    file (or (match-string 5 url) "")
    buf (get-buffer-create bufname)
    proc (open-network-stream
                (concat "HTTP GET " url) buf
                (if http-proxy-host http-proxy-host host)
                (if http-proxy-port http-proxy-port port) ))
    (if sentinel
  (set-buffer buf)
      (switch-to-buffer buf))
    (erase-buffer)
    (kill-all-local-variables)
    (with-current-buffer buf
      (setq http-host host)
      (setq http-url url))
    (if content-type
  (setq file
        (replace-regexp-in-string
         "=[^&]+"
         (lambda (param)
     (concat "="
       (http-url-encode (substring param 1) content-type)))
         file)))
    (setq start-line
    (concat (format "GET %s%s%s HTTP/%.1f\r\n"
                          (if http-proxy-host
                              (concat "http://" host "/") "/") dir file version)
      (format "Host: %s\r\n" host)))
    (when http-emacs-use-cookies
      (let ((cookie (http-cookies-build-header url)))
        (when cookie (add-to-list 'headers cookie))))
    (when headers
      (setq message-headers (mapconcat (lambda (pair)
           (concat (car pair) ": " (cdr pair)))
               headers
               "\r\n")))
    ;; mapconcat doesn't append the \r\n for the final line
    (setq command (format "%s%s\r\n\r\n" start-line message-headers))
    (http-log (format "Connecting to %s %d\nCommand:\n%s\n" host port command))
    (http-log message-headers)
    (set-process-sentinel proc (or sentinel 'ignore))
    (set-process-coding-system proc 'binary 'binary) ; we need \r\n
    ;; we need this to be able to correctly decode the buffer with
    ;; decode-coding-region later
    (when (fboundp 'set-buffer-multibyte)
      (with-current-buffer buf (set-buffer-multibyte nil)))
    (set-process-filter proc 'http-filter)
    (set-marker (process-mark proc) (point-max))
    (process-send-string proc command)

    proc))


;; needed for xemacs.  c&p from gnu emacs cvs sources
(unless (fboundp 'replace-regexp-in-string)
  (defun replace-regexp-in-string (regexp rep string &optional
                                          fixedcase literal subexp start)
    (let ((l (length string))
          (start (or start 0))
          matches str mb me)
      (save-match-data
        (while (and (< start l) (string-match regexp string start))
          (setq mb (match-beginning 0)
                me (match-end 0))
          (when (= me mb) (setq me (min l (1+ mb))))
          (string-match regexp (setq str (substring string mb me)))
          (setq matches
                (cons (replace-match (if (stringp rep)
                                         rep
                                       (funcall rep (match-string 0 str)))
                                     fixedcase literal str subexp)
                      (cons (substring string start mb)
                            matches)))
          (setq start me))
        (setq matches (cons (substring string start l) matches))
        (apply #'concat (nreverse matches))))))

(provide 'http-get)


;;; http-get.el ends here

;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

;;; http-post.el --- simple HTTP POST

;; Copyright (C) 2002, 2003  Alex Schroeder

;; Author: Alex Schroeder <alex@gnu.org>
;; Maintainer: David Hansen <david.hansen@physik.fu-berlin.de>
;; Version: 1.0.5
;; Keywords: hypermedia
;; URL: http://www.emacswiki.org/cgi-bin/wiki.pl?HttpPost

;; This file is not part of GNU Emacs.

;; This is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; Use `http-post' to post to a URL.

;;; Change Log:

;; 1.0.5
;;   - Added experimental cookies support.
;; 1.0.4
;;   - Fixed bug in `http-post' that ignored the headers argument.
;; 1.0.3
;;   - Minor fix.
;; 1.0.1
;;   - Moved http-url-encode to http-get.

;;; Code:

(require 'http-get)
(require 'http-cookies)

(defvar http-post-version "1.0.5")


;; The main function

(defun http-post (url parameters content-type &optional headers sentinel
                      version verbose bufname)
  "Post to a URL in a buffer using HTTP 1.1, and return the process.
You can get the buffer associated with this process using
`process-buffer'.



PARAMETERS is an alist of parameters to use.  Each element has the
form \(NAME . VALUE).  These usually correspond to successful controls
on HTML forms.

CONTENT-TYPE is a coding system to use.  Its upper case print name
will be used for the server.  Possible values are `iso-8859-1' or
`euc-jp' and others.

The optional HEADERS are an alist where each element has the form
\(NAME . VALUE).  Both must be strings and will be passed along with
the request.  The reason CONTENT-TYPE is not just passed along as one
of the headers is that part of the Content-Type value is fixed and
cannot be changed: The basic encoding is implemented using
`html-url-encode' and is called application/x-www-form-urlencoded.

With optional argument SENTINEL, the buffer is not shown.  It is the
responsibility of the sentinel to show it, if appropriate.  A sentinel
function takes two arguments, process and message.  It is called when
the process is killed, for example.  This is useful when specifying a
non-persistent connection.  By default, connections are persistent.
Add \(\"Connection\" . \"close\") to HEADERS in order to specify a
non-persistent connection.  Usually you do not need to specify a
sentinel, and `ignore' is used instead, to prevent a message being
printed when the connection is closed.

If you want to filter the content as it arrives, bind
`http-filter-pre-insert-hook' and `http-filter-post-insert-hook'.

The optional argument VERSION specifies the HTTP version to use.  It
defaults to version 1.0, such that the connection is automatically
closed when the entire document has been downloaded.

If the optional argument VERBOSE is non-nil, a message will show the
command sent to the server.

The coding system of the process is set to `binary', because we need to
distinguish between \\r and \\n.  To correctly decode the text later,
use `decode-coding-region' and get the coding system to use from
`http-headers'."
  (interactive)
  (setq version (or version 1.0))
  (let* (host dir file port proc buf header body content-length)
    (unless (string-match
       "http://\\([^/:]+\\)\\(:\\([0-9]+\\)\\)?/\\(.*/\\)?\\([^:]*\\)"
       url)
      (error "Cannot parse URL %s" url))
    (unless bufname (setq bufname
        (format "*HTTP POST %s *" url)))
    (setq host (match-string 1 url)
    port (or (and (setq port (match-string 3 url))
                        (string-to-int port)) 80)
    dir  (or (match-string 4 url) "")
    file (or (match-string 5 url) "")
    buf (get-buffer-create bufname)
    proc (open-network-stream
                (concat "HTTP POST " url)
                buf (if http-proxy-host http-proxy-host host)
                (if http-proxy-port http-proxy-port port)))
    (set-process-sentinel proc (or sentinel 'ignore))
    (set-process-coding-system proc 'binary 'binary) ; we need \r\n
    (set-process-filter proc 'http-filter)
    (set-marker (process-mark proc) (point-min) buf)
    (if sentinel
  (set-buffer buf)
      (switch-to-buffer buf))
    (erase-buffer)
    (kill-all-local-variables)

    (with-current-buffer buf
      (setq http-host host)
      (setq http-url url))

    (let (result)
      (dolist (param parameters)
  (setq result (cons (concat (car param) "="
           (http-url-encode (cdr param)
                content-type))
         result)))
      (setq body (mapconcat 'identity result "&")))

    (setq header
    (concat (format "POST %s%s%s HTTP/%.1f\r\n"
                          (if http-proxy-host
                              (concat "http://" host "/")
                            "/") dir file version)
      (format "Host: %s\r\n" host)
      "Content-Type: application/x-www-form-urlencoded"
      (format "; charset=%s\r\n"
        (upcase (symbol-name content-type)))
      (format "Content-Length: %d\r\n" (length body))))

    (when http-emacs-use-cookies
      (let ((cookie (http-cookies-build-header url)))
        (when cookie (add-to-list 'headers cookie))))
    (if headers
        (setq header (concat header
                             (mapconcat (lambda (pair)
                                          (concat (car pair) ": " (cdr pair)))
                                        headers
                                        "\r\n")
                             "\r\n\r\n"))
      (setq header (concat header "\r\n")))
    (when verbose
      ;;(when t
      (message "%s" (concat header body "\n\n")))
    (process-send-string proc (concat header body "\r\n"))
    proc))

(provide 'http-post)

;;; http-post.el ends here


(defun post-to-qa ()
  "Post to QA in Time"
  (interactive)
  (http-post "http://qa-profiles.time.timeinc.net/profile/likes.json" (list (cons "add_document_domain" "true")
                                                                            (cons "resource\[category\]" "article") (cons "resource\[content_id\]" "1972070") (cons "resource\[name\]" "Has%20a%20Democrat%20Got%20a%20Chance%20of%20Becoming%20Governor%20of%20Texas%3F")
                                                                            (cons "resource\[url\]" "http%3A%2F%2Fcp.timeinc.net%3A8080%2Ftime%2Fcommunity%2Fpolitics%2Farticle%2F0%2C32700%2C1972070%2C00.html")
                                                                            (cons "section_name" "politics")) `iso-8859-1 ))
(defun post-to-dev ()
  "Post to QA in Time"
  (interactive)
  (http-post "http://dev-profiles.peopleenespanol.timeinc.net/profile/likes.json" (list (cons "add_document_domain" "true")
                                                                            (cons "resource\[category\]" "article") (cons "resource\[content_id\]" "1988710")
                                                                            (cons "resource\[name\]" "Una+Miss+Universo+que+rompe+clich%E9s")
                                                                            (cons "resource\[url\]" "http%3A%2F%2Fcp.timeinc.net%3A8080%2Fpespanol%2Farticles%2F0%2C22490%2C1988710%2C00.html")
                                                                            (cons "section_name" "Likes")) `iso-8859-1 ))
(defun post-to-local ()
  "Post to QA in Time"
  (interactive)
  (http-post "http://localhost:3000/profile/ratings.json" (list (cons "add_document_domain" "true")
                                                                            (cons "resource\[content_id\]" "sdfasdfasdf")
                                                                            (cons "rating\[review\]" "Una+Miss+Universo+que+rompe+clich%E9s")
                                                                            (cons "rating\[score\]" "5.0")
                                                                            (cons "resource\[url\]" "http%3A%2F%2Fcp.timeinc.net%3A8080%2Fpespanol%2Farticles%2F0%2C22490%2C1988710%2C00.html")
                                                                            (cons "section_name" "section 2")) `iso-8859-1 ))

(provide 'post-to-qa)

(defun get-from-qa ()
  "Get from QA in Time"
  (interactive)
  (http-get "http://qa-profiles.time.timeinc.net/popular.json?span=day&score=likes&type=article&callback=jsonp1270061690757&_=1270061695154"))

(defun get-from-dev ()
  "Get from DEV in Time"
  (interactive)
  (http-get "http://dev-profiles.time.timeinc.net/popular.json?span=day&score=likes&type=article&callback=jsonp1270061690757&_=1270061695154"))

(defun get-from-local ()
  "Get from LOCALHOST"
  (interactive)
  (http-get "http://localhost:3000/questionspopular.json?span=month&score=comments&type=article&callback=jsonp1270061690757&_=1270061695154"))


