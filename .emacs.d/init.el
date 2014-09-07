(setq default-frame-alist
      (append (list '(top . 0) '(left . 0)
                    '(width . 90) '(height . 42)
               )
              default-frame-alist))

(if window-system
  (progn
    (scroll-bar-mode nil)
    (tool-bar-mode nil)
    (menu-bar-mode nil)
    )
  nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#ffffff" :foreground "#000000"))))
 '(cursor ((((class color) (background dark)) (:background "#000000")) (((class color) (background light)) (:background "#ffffff")) (t nil))))

(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-x\C-a" 'beginning-of-buffer)
(global-set-key "\C-x\C-e" 'end-of-buffer)
(global-set-key "\C-x\C-p" 'scroll-down)
(global-set-key "\C-x\C-n" 'scroll-up)
(global-set-key "\C-x\C-l" 'compile)
(global-set-key "\C-x\C-j" 'goto-line)

(setq-default tab-width 4)

(setq c-default-style "k&r")

(add-hook 'c-mode-common-hook
	  '(lambda ()
             (progn
			   (setq tab-width 4)
               (setq c-basic-offset 4))))

(setq auto-mode-alist
      (append '(("\\.gura$" . c++-mode)
				("\\.guraw$" . c++-mode)
                ) auto-mode-alist))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
