(require 'whitespace)
(setq whitespace-style '(face trailing))

(when window-system
  (scroll-bar-mode nil)
  (tool-bar-mode nil)
  (menu-bar-mode 0)
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(scroll-bar-mode nil)
   '(tool-bar-mode nil))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:background "#ffffff" :foreground "#000000"))))
   '(cursor ((((class color) (background dark)) (:background "#000000"))
			 (((class color) (background light)) (:background "#ffffff")) (t nil))))
  (when (eq system-type 'darwin)
	(setq default-frame-alist
		  '((width . 120) (height . 50) (top . 0) (left . 0)))
    (set-face-attribute 'default nil
						:family "Menlo"
						:height 120)
    (set-fontset-font nil 'japanese-jisx0208
					  (font-spec :family "Hiragino Kaku Gothic ProN"))
    (setq face-font-rescale-alist
		  '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2))))
  (when (eq system-type 'gnu/linux)
	(setq default-frame-alist
		  '((width . 120) (height . 56) (top . 0) (left . 0) (font . "TakaoGothic-10")))))

(setq Buffer-menu-name-width 40)

(global-set-key (kbd "C-m")     'newline-and-indent)
(global-set-key (kbd "C-x C-p") 'scroll-down)
(global-set-key (kbd "C-x C-n") 'scroll-up)
(global-set-key (kbd "C-x C-j") 'goto-line)
(global-set-key (kbd "C-x C-k") 'shell)
(global-set-key (kbd "C-x C-l") 'compile)
(global-set-key (kbd "C-x C-y") 'foo)
(global-set-key (kbd "C-x M-e") 'eval-buffer)
(global-set-key (kbd "M--")     'whitespace-mode)
(global-set-key (kbd "<f5>")    'revert-buffer-noconfirm)

(defun revert-buffer-noconfirm ()
  (interactive)
  (revert-buffer nil t))

(setq-default tab-width 4)

(setq column-number-mode t)
(setq c-default-style "k&r")

(setenv "GURAPATH" "gnuc")
(setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/bin" ":" "~/bin" ":" "~/tools/clang/bin"))
(setq exec-path (append exec-path '("/usr/local/bin" "~/bin" "~/tools/clang/bin")))

(add-to-list 'load-path "~/gura/editor/emacs")
;;(require 'gura-mode nil t)

;(autoload 'octave-mode "octave-mode" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(setq auto-mode-alist
      (cons '("\\.inc$" . asm-mode) auto-mode-alist))

;(setq auto-mode-alist
;      (cons '("\\.md$" . html-mode) auto-mode-alist))

(add-hook
 'c-mode-common-hook
 '(lambda ()
    (progn
      (setq tab-width 4)
      (c-set-offset 'innamespace 0)	;; no indent in namespace brackets
      (setq c-basic-offset 4))))

(add-hook
 'asm-mode-hook
 (lambda()
   (setq tab-width 8)))

(add-hook
 'octave-mode-hook
 (lambda ()
   (abbrev-mode 1)
   (auto-fill-mode 1)
   (if (eq window-system 'x)
       (font-lock-mode 1))))

(add-to-list 'load-path "~/.emacs.d/site-lisp")

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;(add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))
;(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.
(setq emmet-self-closing-tag-style " /") ;; default "/"
