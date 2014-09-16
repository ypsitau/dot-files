(defun gura-mode ()
  "Gura Mode"
  (interactive)
  (kill-all-local-variables)
  (setq mode-name "Gura")
  (setq major-mode 'gura-mode)
  (run-hooks 'gura-mode-hook))

(provide 'gura-mode)
