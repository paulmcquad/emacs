;start package.el with emacs
(require 'package)
(package-initialize)
;start auto-complete with emacs
(require 'auto-complete)
;do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
;start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (cyberpunk)))
 '(custom-safe-themes
   (quote
    ("b1d339e425e5c037135ce43fd3811f1180f7ed491b1d549b289e32141e7a8185" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Load GUI "Emacs-Lisp"
(load "preview-latex.el" nil t t)

;; I always run a shell in Emacs. Always always.
(shell)
;;; end .emacs
;let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
; gcc -xc++ -E -v -

; now lets call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)
