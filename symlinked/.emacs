(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-operandi-tinted))
 '(custom-safe-themes
   '("4b026ac68a1aa4d1a91879b64f54c2490b4ecad8b64de5b1865bca0addd053d9" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "3e374bb5eb46eb59dbd92578cae54b16de138bc2e8a31a2451bf6fdb0f3fd81b" "19a2c0b92a6aa1580f1be2deb7b8a8e3a4857b6c6ccf522d00547878837267e7" "71acf47cc8cd4158e52ef63a9f8c4d128aa33d6772a0106b5a72757486047e08" "30b323c73d2b24c3eff96802f0085fbfef3c6d2aad03ddfb5f615b658b2d5bfa" "64204b9e3ad01000654d5524d2904fc8fa28aafc168f48660897ddfe36a2bfd5" "8e08bb8da358e2cf92e10e4bac47b025ccbcf4c70788cdbd67dc4ed11f786194" "cc0ea29f3e80c5c622cea5fd83686dd36963a9abcde5b21dfe6cee653b67d72f" "5a409d7844bfbc12bf6e6cf7a6a6cb9f79945a82dee315ed1778632b5686b6ec" "6ed8a3705a4296955010ecfcf808f02ac0d52985373e07c63f7fe5bc85206bb4" "ccb2ff53e9794d059ff941fabcf265b67c8418da664db8c4d6a3d656962b7135" "ed6e47baf355da248c4de8953058234b82c8f838fc85f570f9fe1700e47b9426" "7021d655cda2ed5476960e166350d6cf9ee8af874216a26bc5457591222bb330" "f7b6b207d7a6318ea5d33ca2dea51483350d0c26beb986f008d63258b9c112ab" "46ae6660834278f41a1c074b817bb316f2da0196513b59a83a2a49b846a9921f" "2d09bd884d697b48b380b48117ccaebd8e99fe1cb242e31675dcec5724c603f6" "9b64a681308383067359cf06bfa6a1bc4fa75c5b68182e4d6ba4d1816277d70e" "65a1a112abd99456167df57ce2cfff42ed137c4f9146e75b2ae9812499689c3a" "2ef84b2c7ad4810912a095993ca8bdf386e1fd7f97842b57aac62dddb2bba211" "3454885b915a176dce4b53e35053b7ee0aa9362fb9e934057ac44b6842a97453" "82f0f47ac811eeb45fbcfc5fee48989e4d0bca11f74653b838c29fab9a20aee7" "69f7e8101867cfac410e88140f8c51b4433b93680901bb0b52014144366a08c8" "21e3d55141186651571241c2ba3c665979d1e886f53b2e52411e9e96659132d4" "fa49766f2acb82e0097e7512ae4a1d6f4af4d6f4655a48170d0a00bcb7183970" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" default))
 '(package-selected-packages '(spacemacs-theme modus-themes ef-themes gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata LGC Nerd Font Mono" :foundry "PfEd" :slant normal :weight regular :height 151 :width normal))))
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:slant italic :weight bold))))
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
;;(add-hook 'server-visit-hook 'recentf-save-list)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/everforest-theme")

;; sentences end with single space
(setq sentence-end-double-space nil)

(setq-default tab-width 4)





