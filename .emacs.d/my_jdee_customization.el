(defun walk-classpath-xml (f e) 
  (if (listp e)
      (if  (eq (car e) 'classpathentry)
          (let ((entry (cadr e)))
            (funcall f (cdr (assoc 'kind entry)) (cdr (assoc 'path entry)) (assoc 'excluding entry) (cdr (assoc 'sourcepath entry))))
        (mapc (lambda (x) (walk-classpath-xml f x)) e))))


(defun jde-load-project-values-from-eclipse-config-file (cp)
  ;; "Read jde project values from eclipse .classpath config file"
  ;; (interactive "s")
  (setq absolute-directory (string-replace ".classpath" "" cp))
  (setq cp (xml-parse-file cp))

  (let (src-path class-path)
    (walk-classpath-xml (lambda (type path excluding sourcepath)
                          (setq path (if (file-name-absolute-p path)
                                         path
                                       (concat "./" path)))
                          (if sourcepath
                              (setq sourcepath (if (file-name-absolute-p sourcepath)
                                                   sourcepath
                                                 (concat "./" sourcepath))))
                               
                          (if (not excluding)
                              (cond 
                               ((equal type "src")
                                (setq src-path (cons path src-path)))
                               ((and (equal type "var") sourcepath)
                                (progn
                                  (setq src-path (cons sourcepath src-path))
                                  (setq class-path (cons path class-path))))
                               ((or (or (equal type "lib") (equal type "output")))
                                (setq class-path (cons path class-path)))
                               )))
                        cp)
    (setq class-path (mapcar (lambda (x) (string-replace "./M2_REPO/" "/home/han/.m2/repository/" x)) class-path))
    (setq class-path (mapcar (lambda (x) (string-replace "./" absolute-directory x)) class-path))
    (setq src-path (mapcar (lambda (x) (string-replace "./M2_REPO/" "/home/han/.m2/repository/" x)) src-path))
    (setq src-path (mapcar (lambda (x) (string-replace "./" absolute-directory x)) src-path))
    (setq class-path (cons "/usr/lib/jvm/java-6-sun" class-path))
    (setq class-path (cons "/usr/share/java" class-path))
    (setq class-path (cons "." class-path))
    (setq src-path (cons "." src-path))
    (print class-path)
    (setq jde-global-classpath class-path)
    (setq jde-sourcepath src-path)))

;;(jde-load-project-values-from-eclipse-config-file "/home/han/work/time/tsap/tsap-affiliate-download/.classpath")
