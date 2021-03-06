(setq doom-theme 'doom-nord)

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18)
      doom-unicode-font (font-spec :family "Font Awesome 5 Free Solid" :size 22)
      doom-big-font (font-spec :family "FiraCode Nerd Font" :size 24))

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(setq +doom-dashboard-menu-sections
      '(("Reload last session"
         :icon (all-the-icons-material "refresh" :face 'doom-dashboard-menu-title)
         :when (cond ((require 'persp-mode nil t)
                      (file-exists-p (expand-file-name persp-auto-save-fname persp-save-dir)))
                     ((require 'desktop nil t)
                      (file-exists-p (desktop-full-file-name))))
         :face (:inherit (doom-dashboard-menu-title bold))
         :action doom/quickload-session)
        ("Open org-roam Daily"
         :icon (all-the-icons-material "squirrel" :face 'doom-dashboard-menu-title)
         :when (fboundp 'org-roam-dailies-find-today)
         :action org-roam-dailies-today)
        ("Open org-agenda"
         :icon (all-the-icons-material "view_agenda" :face 'doom-dashboard-menu-title)
         :when (fboundp 'org-agenda)
         :action org-agenda)
        ("Recently opened files"
         :icon (all-the-icons-material "history" :face 'doom-dashboard-menu-title)
         :action recentf-open-files)
        ("Open project"
         :icon (all-the-icons-material "code" :face 'doom-dashboard-menu-title)
         :action projectile-switch-project)
        ("Jump to bookmark"
         :icon (all-the-icons-material "bookmark" :face 'doom-dashboard-menu-title)
         :action bookmark-jump)
        ("Open documentation"
         :icon (all-the-icons-material "book" :face 'doom-dashboard-menu-title)
         :action doom/help)))

(evil-put-command-property 'evil-yank-line :motion 'evil-line)
(setq evil-want-change-word-to-end nil)

(defcustom evil-custom-textobj-entire-key "d"
  "Key for evil-inner-entire"
  :type 'string
  :group 'evil-custom-textobj)

(defcustom evil-custom-textobj-in-line-key "l"
  "Keys for evil-inner-line"
  :type 'string
  :group 'evil-custom-textobj)

(defcustom evil-custom-textobj-around-line-key "l"
  "Keys for evil-around-line"
  :type 'string
  :group 'evil-custom-textobj)

(defun evil-line-range (count beg end type &optional inclusive)
  (if inclusive
      (evil-range (line-beginning-position) (line-end-position))
    (let ((start (save-excursion
                   (back-to-indentation)
                   (point)))
          (end (save-excursion
                 (goto-char (line-end-position))
                 (skip-syntax-backward " " (line-beginning-position))
                 (point))))
      (evil-range start end))))

(evil-define-text-object evil-custom-entire-buffer (count &optional beg end type)
  "Select entire buffer"
  (evil-range (point-min) (point-max)))

(evil-define-text-object evil-custom-around-line (count &optional beg end type)
  "Select range between a character by which the command is followed."
  (evil-line-range count beg end type t))
(evil-define-text-object evil-custom-inner-line (count &optional beg end type)
  "Select inner range between a character by which the command is followed."
  (evil-line-range count beg end type))

(define-key evil-outer-text-objects-map evil-custom-textobj-entire-key 'evil-custom-entire-buffer)
(define-key evil-inner-text-objects-map evil-custom-textobj-entire-key 'evil-custom-entire-buffer)
(define-key evil-outer-text-objects-map evil-custom-textobj-in-line-key 'evil-custom-around-line)
(define-key evil-inner-text-objects-map evil-custom-textobj-around-line-key 'evil-custom-inner-line)

(setq evil-split-window-bottom t)
(setq evil-vsplit-window-right t)

(setq doom-modeline-modal-icon nil)
(setq evil-echo-state nil)
(setq evil-normal-state-tag   (propertize "[Normal]" 'face '((:background "green" :foreground "black")))
      evil-emacs-state-tag    (propertize "[Emacs]" 'face '((:background "orange" :foreground "black")))
      evil-insert-state-tag   (propertize "[Insert]" 'face '((:background "red") :foreground "white"))
      evil-motion-state-tag   (propertize "[Motion]" 'face '((:background "blue") :foreground "white"))
      evil-visual-state-tag   (propertize "[Visual]" 'face '((:background "grey80" :foreground "black")))
      evil-operator-state-tag (propertize "[Operator]" 'face '((:background "purple"))))

(custom-set-variables
 '(git-gutter:update-interval 2))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Documents/org-roam"))
  :config
  (org-roam-db-autosync-mode))

(define-key evil-normal-state-map ",F" 'org-roam-node-find)
(define-key evil-normal-state-map ",ri" 'org-roam-node-insert)
(define-key evil-normal-state-map ",rt" 'org-roam-buffer-toggle)
(define-key evil-normal-state-map ",rc" 'org-roam-capture)
