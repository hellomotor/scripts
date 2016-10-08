(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-next-selection-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(fset 'yes-or-no-p 'y-or-n-p)

(global-font-lock-mode t)
(transient-mark-mode t)
(show-paren-mode t)
(if window-system
    (tool-bar-mode 0))
(setq-default indent-tabs-mode nil)
(setq lazy-lock-defer-on-scrolling t)
(setq font-lock-maximum-decoration t)
(setq-default make-backup-files nil)

(global-set-key [f1] (lambda() (interactive) (manual-entry (current-word))))
(global-set-key [f2] 'set-mark-command)
(global-set-key [f3] 'replace-string)
(global-set-key [f4] 'backward-word)
(global-set-key [f5] 'gdb)
(global-set-key [f7] 'compile)
(global-set-key [f8] 'indent-region)
(global-set-key [home] 'beginnig-of-buffer)
(global-set-key [end] 'end-of-buffer)

(global-set-key "\C-xm" 'set-mark-command)
(global-set-key "\C-xl" 'goto-line)


;; C++ and C mode...
(defun my-c++-mode-hook ()
  (setq tab-width 4)
  (c-set-style "ellemtel")
  (setq c++-auto-hungry-initial-state 'none)
  (setq c++-tab-always-indent t)
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c++-empty-arglist-indent 4))

(defun my-c-mode-hook ()
  (setq tab-width 4)
  (c-set-style "ellemtel")
  (setq c-auto-hungry-initial-state 'none)
  (setq c-tab-always-indent t)
;; BSD-ish indentation style
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c-brace-offset -4)
  (setq c-argdecl-indent 0)
  (setq c-label-offset -4))

(add-hook 'c++-mode-common-hook 'my-c++-mode-hook)
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

(show-paren-mode t)
(setq show-paren-style 'parentheses)
(setq inhibit-startup-message t)
(mouse-avoidance-mode 'animate)
(setq frame-title-format "emacs@%b")
(global-font-lock-mode t)
(transient-mark-mode t)

(setq visible-bell t)
(setq default-directory "~/git_repo")
(setq compile-command "make")
(display-time-mode t)
(column-number-mode t)

;;´úÂëÕÛµþ¹¦ÄÜ
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(which-func-mode t)

(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forward to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
             char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
(define-key global-map(kbd "C-c f") 'wy-go-to-char)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-gzip-setup (quote cons))
 '(ecb-options-version "2.32")
 '(ecb-tar-setup (quote cons))
 '(ecb-wget-setup (quote cons))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(setq indent-tabs-mode nil)

(put 'scroll-left 'disabled nil)

(defun mark-current-line ()
  (interactive)
  (beginning-of-line)
  (setq beg (point))
  (push-mark beg)
  (end-of-line)
  (push-mark (point) nil t)
  (goto-char beg))

(defun yank-current-line ()
  (interactive)
  (setq orig (point))
  (beginning-of-line)
  (setq beg (point))
  (push-mark beg)
  (end-of-line)
  (push-mark (point) nil t)
  (kill-region beg (point))
  (yank)
  (goto-char orig))

(defun comment-current-line ()
  (interactive)
  (setq cur-pos (point))
  (beginning-of-line)
  (setq beg (point))
  (push-mark beg)
  (end-of-line)
  (setq end (point))
  (push-mark end nil t)
  (comment-region beg end)
  (goto-char cur-pos))

(defun uncomment-current-line ()
  (interactive)
  (setq cur-pos (point))
  (beginning-of-line)
  (setq beg (point))
  (push-mark beg)
  (end-of-line)
  (setq end (point))
  (push-mark end nil t)
  (uncomment-region beg end)
  (goto-char cur-pos))

(global-set-key "\C-cm" 'comment-current-line)
(global-set-key "\C-cu" 'uncomment-current-line)
(global-set-key "\C-cl" 'mark-current-line)
(global-set-key "\C-cy" 'yank-current-line)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
