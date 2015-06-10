(global-set-key "\C-h" 'duplicate-start-of-line-or-region)
(global-set-key "\C-]" 'enlarge-window-horizontally)
(global-set-key [(f3)] 'revert-buffer-noask)
(global-set-key "\C-x\C-d" (quote insert-debug))
;;(global-set-key (kbd "C-i") 'indent-region)
(global-set-key "\C-xi" 'indent-region)
(global-set-key "\C-j" 'goto-line)
;;(global-set-key "\C-i" 'find-tag)
(global-set-key "\C-x\/" 'comment-or-uncomment-region)
(global-set-key (kbd "C-+") 'sacha/increase-font-size)
(global-set-key (kbd "C--") 'sacha/decrease-font-size)
(global-set-key "\C-xg" 'my-grep-at-point)
(global-set-key "\M-n" 'move-line-or-region-down)
(global-set-key "\M-p" 'move-line-or-region-up)
(global-set-key [(f11)] 'toggle-shell)
(global-set-key [(f12)] 'ns-toggle-fullscreen)

(global-set-key [(control t)] 'xsteve-ido-choose-from-recentf)
   ;;;;;;;;; reclaim recentf keybinding from Dired mode ;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'dired-mode-hook
          (lambda()
            (define-key dired-mode-map (kbd "C-t") 'xsteve-ido-choose-from-recentf)))

;;;;C-x k is a command I use often, but C-x C-k (an easy mistake) is
;;;;bound to nothing!
;;;;Set C-x C-k to same thing as C-x k.
(global-set-key "\C-x\C-k" 'kill-this-buffer)
;;(global-set-key "\C-x\C-r" 'toggle-recentf-initial-input)

(global-set-key "\C-x f" 'find-file)
;; use ctrl x + ctrl m to invoke meta key
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-c\m" 'execute-extended-command)
(global-set-key "\C-x\m" 'execute-extended-command)
(global-set-key "\C-c\C-q" 'replace-string)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)
;; (global-set-key [f9] 'gud-step)
;; (global-set-key [f10] 'gud-next)
(global-set-key [f6]  'start-kbd-macro)
(global-set-key [f7]  'end-kbd-macro)
(global-set-key [f8]  'call-last-kbd-macro)
;;(global-set-key "\C-c\C-d" 'rdebug)
(global-set-key "\C-cc" 'mode-compile)
(global-set-key "\C-xn" 'rename-buffer)
(global-set-key "\C-x9" 'swap-windows)
(global-set-key "\C-ck" 'mode-compile-kill)
(global-set-key "\C-xf" 'grep-find)
(global-set-key [?\C-;] 'bubble-buffer-next)
(global-set-key [(control \')] 'bubble-buffer-previous)
(global-set-key [(meta f12)] 'recentf-open-files)
(global-set-key "\C-cs" 'shell)
(setq confirm-nonexistent-file-or-buffer nil)
(global-set-key "\C-u" 'winner-undo)
(global-set-key "\C-o" 'winner-redo)

;;;;;;;;; reclaim winner mode keybinding from Grep mode ;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'grep-mode-hook
          (lambda()
            (define-key grep-mode-map (kbd "C-i") 'winner-redo)))


(global-set-key [(control x) (control c)]
                (function
                 (lambda () (interactive)
                         (cond ((y-or-n-p "Quit? ")
                                (save-buffers-kill-emacs))))))


