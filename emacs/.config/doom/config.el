;;; config.el -*- lexical-binding: t; -*-

(setq user-full-name "Brandon Nguyen"
      user-mail-address "gnuyent@protonmail.com")

(setq undo-limit 80000000           ; raise undo-limit to 80Mb
      auto-save-default t           ; automatically save
      truncate-string-ellipsis "…") ; show unicode ellipsis instead
(display-time-mode 1)               ; show time in mode-line

(if (equal "Battery status not available"
           (battery))
    (display-battery-mode 1)        ; show battery on laptop
  (setq password-cache-expiry nil)) ; no battery = desktop

;; (defun wsl-browse-url-xdg-open (url &optional ignored)
;;  (interactive (browse-url-interactive-arg "URL: "))
;;  (shell-command-to-string (concat "explorer.exe " url)))
;; (advice-add #'browse-url-xdg-open :override #'wsl-browse-url-xdg-open)
(when (and (eq system-type 'gnu/linux)
           (string-match
            "Linux.*Microsoft.*Linux"
            (shell-command-to-string "uname -a")))
  (setq
   browse-url-generic-program  "explorer.exe"
   browse-url-browser-function #'browse-url-generic))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq-default custom-file (expand-file-name ".custom.el" doom-private-dir))
(when (file-exists-p custom-file)
  (load custom-file))

(map! :map general-override-mode-map
      :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right)

(map! :after evil-org-agenda
      :map evil-org-agenda-mode-map
      :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right)

(map! :map general-override-mode-map
      :n "DEL" #'evil-switch-to-windows-last-buffer)

(map! :map general-override-mode-map
      :n "C-p" #'+ivy/projectile-find-file)

(map! :map general-override-mode-map
      :n "C-f" #'+ivy/project-search-from-cwd)

(undefine-key! "C-q") ; previously insert next typed character
(map! :map evil-motion-state-map
      "C-q" 'evil-visual-block)

(setq doom-font (font-spec :family "Iosevka NF" :size 20)
      doom-variable-pitch-font (font-spec :family "Iosevka NF" :size 20))

(setq doom-theme 'doom-tomorrow-night)

(defvar fancy-splash-image-template
  (expand-file-name "misc/splash-images/emacs-e-template.svg" doom-private-dir)
  "Default template svg used for the splash image, with substitutions from ")

(defvar fancy-splash-sizes
  `((:height 300 :min-height 50 :padding (0 . 2))
    (:height 250 :min-height 42 :padding (2 . 4))
    (:height 200 :min-height 35 :padding (3 . 3))
    (:height 150 :min-height 28 :padding (3 . 3))
    (:height 100 :min-height 20 :padding (2 . 2))
    (:height 75  :min-height 15 :padding (2 . 1))
    (:height 50  :min-height 10 :padding (1 . 0))
    (:height 1   :min-height 0  :padding (0 . 0)))
  "list of plists with the following properties
  :height the height of the image
  :min-height minimum `frame-height' for image
  :padding `+doom-dashboard-banner-padding' (top . bottom) to apply
  :template non-default template file
  :file file to use instead of template")

(defvar fancy-splash-template-colours
  '(("$colour1" . keywords) ("$colour2" . type) ("$colour3" . base5) ("$colour4" . base8))
  "list of colour-replacement alists of the form (\"$placeholder\" . 'theme-colour) which applied the template")

(unless (file-exists-p (expand-file-name "theme-splashes" doom-cache-dir))
  (make-directory (expand-file-name "theme-splashes" doom-cache-dir) t))

(defun fancy-splash-filename (theme-name height)
  (expand-file-name (concat (file-name-as-directory "theme-splashes")
                            theme-name
                            "-" (number-to-string height) ".svg")
                    doom-cache-dir))

(defun fancy-splash-clear-cache ()
  "Delete all cached fancy splash images"
  (interactive)
  (delete-directory (expand-file-name "theme-splashes" doom-cache-dir) t)
  (message "Cache cleared!"))

(defun fancy-splash-generate-image (template height)
  "Read TEMPLATE and create an image if HEIGHT with colour substitutions as
   described by `fancy-splash-template-colours' for the current theme"
  (with-temp-buffer
    (insert-file-contents template)
    (re-search-forward "$height" nil t)
    (replace-match (number-to-string height) nil nil)
    (dolist (substitution fancy-splash-template-colours)
      (goto-char (point-min))
      (while (re-search-forward (car substitution) nil t)
        (replace-match (doom-color (cdr substitution)) nil nil)))
    (write-region nil nil
                  (fancy-splash-filename (symbol-name doom-theme) height) nil nil)))

(defun fancy-splash-generate-images ()
  "Perform `fancy-splash-generate-image' in bulk"
  (dolist (size fancy-splash-sizes)
    (unless (plist-get size :file)
      (fancy-splash-generate-image (or (plist-get size :template)
                                       fancy-splash-image-template)
                                   (plist-get size :height)))))

(defun ensure-theme-splash-images-exist (&optional height)
  (unless (file-exists-p (fancy-splash-filename
                          (symbol-name doom-theme)
                          (or height
                              (plist-get (car fancy-splash-sizes) :height))))
    (fancy-splash-generate-images)))

(defun get-appropriate-splash ()
  (let ((height (frame-height)))
    (cl-some (lambda (size) (when (>= height (plist-get size :min-height)) size))
             fancy-splash-sizes)))

(setq fancy-splash-last-size nil)
(setq fancy-splash-last-theme nil)
(defun set-appropriate-splash (&rest _)
  (let ((appropriate-image (get-appropriate-splash)))
    (unless (and (equal appropriate-image fancy-splash-last-size)
                 (equal doom-theme fancy-splash-last-theme)))
    (unless (plist-get appropriate-image :file)
      (ensure-theme-splash-images-exist (plist-get appropriate-image :height)))
    (setq fancy-splash-image
          (or (plist-get appropriate-image :file)
              (fancy-splash-filename (symbol-name doom-theme) (plist-get appropriate-image :height))))
    (setq +doom-dashboard-banner-padding (plist-get appropriate-image :padding))
    (setq fancy-splash-last-size appropriate-image)
    (setq fancy-splash-last-theme doom-theme)
    (+doom-dashboard-reload)))

(add-hook 'window-size-change-functions #'set-appropriate-splash)
(add-hook 'doom-load-theme-hook #'set-appropriate-splash)

(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(add-hook! '+doom-dashboard-mode-hook (hide-mode-line-mode 1) (hl-line-mode -1))
(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))

(setq org-directory "~/winhome/Sync/org/")

(setq display-line-numbers-type 'relative)

(setq company-idle-delay 0)

(setq elfeed-search-filter "@2-days-ago +unread")

(add-hook! 'elfeed-search-mode-hook 'elfeed-update)

(require 'ivy-posframe)
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
(ivy-posframe-mode 1)

(after! doom-modeline
  (setq doom-modeline-bar-width 1)
  (setq doom-modeline-height 35)
  (setq doom-modeline-modal-icon nil)
  (setq doom-modeline-percent-position nil)
  (setq all-the-icons-scale-factor 0.8))
  ;; (set-face-attribute 'mode-line nil :family "Iosevka NF" :height 1.0)
  ;; (set-face-attribute 'mode-line-inactive nil :family "Iosevka NF" :height 1.0))

(after! persp-mode
  (defun display-workspaces-in-minibuffer ()
    (with-current-buffer " *Minibuf-0*"
      (erase-buffer)
      (insert (+workspace--tabline))))
  (run-with-idle-timer 1 t #'display-workspaces-in-minibuffer)
  (+workspace/display))

(setq projectile-project-search-path '("~/Projects"))

(after! treemacs
  (treemacs-filewatch-mode t)
  (setq treemacs-position 'right
        treemacs-silent-filewatch t
        treemacs-silent-refresh t))

(defun lsp-treemacs-symbols-toggle ()
  "Toggle the lsp-treemacs-symbols buffer."
  (interactive)
  (if (get-buffer "*LSP Symbols List*")
      (kill-buffer "*LSP Symbols List*")
    (progn (lsp-treemacs-symbols)
           (other-window -1))))

(map! :leader
      "o s" 'lsp-treemacs-symbols-toggle)
