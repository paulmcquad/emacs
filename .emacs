(require 'package)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/elpa/")
(defalias 'perl-mode 'cperl-mode)
;start package.el with emac

;Smart line-wrapping with wrap-prefix
(require 'adaptive-wrap)
;start Auto Completion for GNU Emacs
(require 'auto-complete)
;An auto-complete source for C/C++ header files
(require 'auto-complete-config)
(ac-config-default)

;Modular text completion framework
(require 'company)
;Concurrent utility functions for emacs lisp
(require 'concurrent)
;Table component for Emacs Lisp
(require 'ctable)
;Simple asynchronous functions for emacs lisp
(require 'deferred)
;Emacs Python Development Environment
(require 'elpy)
;A RPC stack for the Emacs Lisp
(require 'epc)
;Graphically indicate the fill column
(require 'fill-column-indicator)
;Find files in a project quickly
(require 'find-file-in-project)
;Quickly find files in a git, mercurial or other repository
(require 'find-file-in-repository)
;Fuzzy Matching
(require 'fuzzy)
;Minor modes for highlighting indentation
(require 'highlight-indentation)
;Convert buffer text and decorations to HTML.
(require 'htmlize)
;imenu tag selection a la ido
(require 'idomenu)
;Edit multiple regions in the same way simultaneously
(require 'iedit)
;Serve buffers live over HTTP
(require 'impatient-mode)
;Run a Ruby process in a buffer
(require 'inf-ruby)
;Python auto-completion for Emacs
(require 'jedi)
;Add legalese to your program files
(require 'legalese)
;A tree plugin like NerdTree for Vim
(require 'neotree)
;Easy Python test running in Emacs
(require 'nose)
;Outline-based notes management and organizer
(require 'org)
;Visual Popup User Interface
(require 'popup)
;virtualenv API for Emacs Lisp
(require 'python-environment)
;Python virtual environment interface
(require 'pyvenv)
;Colorize color names in buffers
(require 'rainbow-mode)
;Code navigation, documentation lookup and completion for Ruby
(require 'robe)
;pure elisp HTTP server
(require 'simple-httpd)
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
