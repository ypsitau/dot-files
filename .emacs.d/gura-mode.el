;;; gura-mode.el --- Gura major mode

(defvar gura-mode-map
  (let ((map (make-sparse-keymap)))
	map)
  "Keymap for `gura-mode'.")

(progn
  (setq gura-font-lock-defaults
	`(
	  (,(rx symbol-start (or
						  "if" "elsif" "else" "try" "catch"
						  "repeat" "while" "cross" "break" "continue" "return"
						  "module" "class" "import"
						  ) symbol-end) . font-lock-keyword-face)
	  (,(rx symbol-start (or
						  "true" "false" "nil"
						  ) symbol-end) . font-lock-constant-face)))
	

  gura-font-lock-defaults
  (define-derived-mode gura-mode prog-mode "Gura"
	"Major mode for editing Gura programming language."
	(modify-syntax-entry ?_ "w" gura-mode-syntax-table)
	(modify-syntax-entry ?/ ". 124b" gura-mode-syntax-table)
	(modify-syntax-entry ?* ". 23" gura-mode-syntax-table)
	(modify-syntax-entry ?\n "> b" gura-mode-syntax-table)
	(set (make-local-variable 'font-lock-defaults) '(gura-font-lock-defaults))))

(defun gura-indent-line ()
  "Indent current line of Gura code."
  (interactive)
  (beginning-of-line)
  (if (bobp)
	  (indent-line-to 0)
	(let ((not-indented t) cur-indent)
	  (if (looking-at "^[ \t]*END_")
		  (progn
			(save-excursion
			  (forward-line -1)
			  (setq cur-indent (- (current-indentation) default-tab-width)))
			(if (< cur-indent 0)
				(setq cur-indent 0)))
		(save-excursion
		  (while not-indented
			(forward-line -1)
			(if (looking-at "^[ \t]*END_")
				(progn
				  (setq cur-indent (current-indentation))
				  (setq not-indented nil))
			  (if (looking-at "^[ \t]*\\(PARTICIPANT\\|MODEL\\|APPLICATION\\|WORKFLOW\\|ACTIVITY\\|DATA\\|TOOL_LIST\\|TRANSITION\\)")
				  (progn
					(setq cur-indent (+ (current-indentation) default-tab-width))
					(setq not-indented nil))
				(if (bobp)
					(setq not-indented nil)))))))
	  (if cur-indent
		  (indent-line-to cur-indent)
		(indent-line-to 0)))))

(provide 'gura-mode)
