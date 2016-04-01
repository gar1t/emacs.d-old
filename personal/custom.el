(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (erlang geiser json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters company smex ido-ubiquitous flx-ido zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smartparens smart-mode-line operate-on-number move-text magit projectile ov imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl easy-kill diminish diff-hl discover-my-major dash browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-hl-line-mode -1)
(setq prelude-guru nil)

(defun change-whitespace-line-column (column)
  "Sets the `whitespace-line-column` to column in this buffer."
  (make-local-variable 'whitespace-line-count)
  (setq-local whitespace-line-column column)
  (whitespace-mode 0)
  (whitespace-mode 1))
(add-hook 'html-mode-hook (lambda () (change-whitespace-line-column 999)))

(set-default 'truncate-lines t)

(defun compilation-exit-autoclose (status code msg)
  (when (and (eq status 'exit) (zerop code))
    (bury-buffer)
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))
  (cons msg code))
(setq compilation-exit-message-function 'compilation-exit-autoclose)

(setq prelude-tips nil)
