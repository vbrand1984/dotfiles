(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango))
 '(package-selected-packages '(spacemacs-theme modus-themes ef-themes gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "JB" :slant normal :weight medium :height 143 :width normal))))
 '(bold ((t (:weight extra-bold))))
 '(bold-italic ((t (:slant italic :weight extra-bold))))
 '(italic ((t (:slant oblique)))))

(global-visual-line-mode t)
(set-language-environment "Russian")
(prefer-coding-system 'utf-8)

;; list of recent files
;; https://stackoverflow.com/questions/50417/how-do-i-get-list-of-recent-files-in-gnu-emacs
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; See: https://emacs.stackexchange.com/a/58363
(add-hook 'find-file-hook 'recentf-save-list)
(add-hook 'server-visit-hook 'recentf-save-list)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/everforest-theme")

;; sentences end with single space
(setq sentence-end-double-space nil)

(setq-default tab-width 4)





