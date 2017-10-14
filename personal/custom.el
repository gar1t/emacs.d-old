(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-projectile helm with-editor yaml-mode markdown-mode protobuf-mode erlang geiser json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters smex ido-ubiquitous flx-ido zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smart-mode-line operate-on-number move-text magit projectile ov imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl easy-kill diminish diff-hl discover-my-major dash browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun change-whitespace-line-column (column)
  "Sets the `whitespace-line-column` to column in this buffer."
  (make-local-variable 'whitespace-line-count)
  (setq-local whitespace-line-column column)
  (whitespace-mode 0)
  (whitespace-mode 1))

(add-hook 'web-mode-hook (lambda () (change-whitespace-line-column 999)))
(add-hook 'html-mode-hook (lambda () (change-whitespace-line-column 999)))
(add-hook 'js-mode-hook (lambda () (change-whitespace-line-column 120)))
(add-hook 'erlang-mode-hook (lambda () (change-whitespace-line-column 80)))

(set-default 'truncate-lines t)

(defun compilation-exit-autoclose (status code msg)
  (when (and (eq status 'exit) (zerop code))
    (bury-buffer)
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))
  (cons msg code))
(setq compilation-exit-message-function 'compilation-exit-autoclose)

(defun disable-smartparens ()
  (smartparens-mode 0)
  )
(add-hook 'js-mode-hook 'disable-smartparens)
(add-hook 'makefile-mode-hook 'disable-smartparens)
(add-hook 'python-mode-hook 'disable-smartparens)
(add-hook 'css-mode-hook 'disable-smartparens)
(add-hook 'web-mode-hook 'disable-smartparens)
(add-hook 'sh-mode-hook 'disable-smartparens)
(add-hook 'erlang-mode-hook 'disable-smartparens)
(add-hook 'ruby-mode-hook 'disable-smartparens)

(setq prelude-tips nil)
(setq prelude-guru nil)
(setq prelude-flyspell nil)
(setq prelude-ido nil)
(global-flycheck-mode -1)
(global-hl-line-mode -1)

(setq
 nxml-child-indent 2
 nxml-attribute-indent 2
 nxml-slash-auto-complete-flag nil
 web-mode-markup-indent-offset 2)

(setq css-indent-offset 4) ;; Ugh! NOT WORKING!!!

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

(defun disable-company ()
  (company-mode 0)
  )
(add-hook 'gfm-mode-hook 'disable-company)
(add-hook 'erlang-mode-hook 'disable-company)
(add-hook 'python-mode-hook 'disable-company)
(add-hook 'yaml-mode-hook 'disable-company)
(add-hook 'rst-mode-hook 'disable-company)
(add-hook 'web-mode-hook 'disable-company)

(add-to-list 'auto-mode-alist '("BUILD\\'" . python-mode))
(add-to-list 'auto-mode-alist '("WORKSPACE\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.bzl\\'" . python-mode))

(add-to-list 'auto-mode-alist '("MODEL\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("MODELS\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("PACKAGE\\'" . yaml-mode))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
