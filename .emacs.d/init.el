(add-to-list 'load-path "~/gura/editor/emacs")

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
		  '((width . 90) (height . 50) (top . 0) (left . 0)))
    (set-face-attribute 'default nil
						:family "Menlo"
						:height 120)
    (set-fontset-font nil 'japanese-jisx0208
					  (font-spec :family "Hiragino Kaku Gothic ProN"))
    (setq face-font-rescale-alist
		  '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2))))
  (when (eq system-type 'gnu/linux)
	(setq default-frame-alist
		  '((width . 90) (height . 45) (top . 0) (left . 0) (font . "monospace-11")))))

(global-set-key (kbd "C-m")     'newline-and-indent)
(global-set-key (kbd "C-x C-p") 'scroll-down)
(global-set-key (kbd "C-x C-n") 'scroll-up)
(global-set-key (kbd "C-x C-j") 'goto-line)
(global-set-key (kbd "C-x C-k") 'shell)
(global-set-key (kbd "C-x C-l") 'compile)
(global-set-key (kbd "C-x C-y") 'foo)
(global-set-key (kbd "C-x M-e") 'eval-buffer)
(global-set-key (kbd "M--")     'whitespace-mode)

(setq-default tab-width 4)

(setq c-default-style "k&r")

(add-hook
 'c-mode-common-hook
 '(lambda ()
	(progn
	  (setq tab-width 4)
	  (setq c-basic-offset 4))))

(require 'gura-mode nil t)
