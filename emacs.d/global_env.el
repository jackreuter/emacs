(setenv "PATH" (concat (getenv "PATH") "/usr/local/oracle/instantclient_10_2:/opt/local/bin:/usr/local/git/bin"))
(setenv "ORACLE_HOME" "/usr/local/oracle/instantclient_10_2")
(setenv "TNS_ADMIN" "/usr/local/oracle/network/admin")
(setenv "SQLPATH" "/usr/local/oracle/instantclient_10_2")
(setenv "DYLD_LIBRARY_PATH" "/usr/local/oracle/instantclient_10_2")

(push "/usr/local/git/bin" exec-path)
(push "/usr/local/oracle/instantclient_10_2" exec-path)
