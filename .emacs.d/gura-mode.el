;;; gura-mode.el --- Gura major mode

(defvar gura-mode-map
  (let ((map (make-sparse-keymap)))
	map)
  "Keymap for `gura-mode'.")

(defvar gura-mode-syntax-table
  (let ((st (make-syntax-table)))
	(modify-syntax-entry ?# "<" st)
	(modify-syntax-entry ?\n ">" st)
	st)
  "Syntax table for `gura-mode'.")

(defconst gura-mode-keywords-regexp
  (regexp-opt '("if" "while")))

(defvar gura-font-lock-keywords
  cpp-font-lock-keywords)

(define-derived-mode gura-mode prog-mode "Gura"
  "Major mode for editing Gura programming language."
  ;;(set-syntax-table gura-mode-syntax-table)
  (set (make-local-variable 'font-lock-defaults) '(gura-font-lock-keywords))
  (set (make-local-variable 'indent-line-function) 'gura-indent-line)
  )

(defun gura-indent-line ()
  "Indent current line of Gura code."
  (interactive)
  (let* ((savep (point))
	 (indent (condition-case nil
		     (save-excursion
		       (forward-line 0)
		       (skip-chars-forward " \t")
		       (if (>= (point) savep) (setq savep nil))
		       (max (asm-calculate-indentation) 0))
		   (error 0))))
    (if savep
	(save-excursion (indent-line-to indent))
      (indent-line-to indent))))

(defun asm-calculate-indentation ()
  (or
   ;; Flush labels to the left margin.
   (and (looking-at "\\(\\sw\\|\\s_\\)+:") 0)
   ;; Same thing for `;;;' comments.
   (and (looking-at "\\s<\\s<\\s<") 0)
   ;; Simple `;' comments go to the comment-column.
   (and (looking-at "\\s<\\(\\S<\\|\\'\\)") comment-column)
   ;; The rest goes at the first tab stop.
   (or (car tab-stop-list) tab-width)))

;;  (let ((savep (> (current-column) (current-indentation)))
;;		(indent (condition-case nil (max (sample-calculate-indentation) 0)
;;				  (error 0))))
;;	(if savep
;;		(save-excursion (indent-line-to indent))
;;	  (indent-line-to indent))))

(provide 'gura-mode)
