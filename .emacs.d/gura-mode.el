;;; gura-mode.el --- Gura major mode


(progn
  (defvar gura-mode-map
	(let ((map (make-sparse-keymap)))
	  map)
	"Keymap for gura-mode.")

  (setq gura-font-lock-keywords
		`(
		  ;; function names for control sequence
		  (,(rx symbol-start
				(or
				 "if" "elsif" "else" "try" "catch"
				 "repeat" "while" "cross" "break" "continue" "return"
				 "module" "class" "import"
				 ) symbol-end)
		   (0 font-lock-keyword-face))
		  ;; constant variables
		  (,(rx symbol-start
				(or
				 "true" "false" "nil"
				 ) symbol-end)
		   (0 font-lock-constant-face))
		  ;; function name
		  (,(rx symbol-start (group (1+ word)) (0+ space) "(")
		   (1 font-lock-function-name-face))
		  ;; top-level assignment
		  (,(rx line-start (group (1+ word)) (0+ space) "=")
		   (1 font-lock-variable-name-face))))

  (setq gura-font-lock-syntactic-keywords
		`(
		  ("^\\(=\\)\\sw" (1 "< b"))
		  ))

  (define-derived-mode gura-mode fundamental-mode "Gura"
	"Major mode for editing Gura programming language."
	(let ((st gura-mode-syntax-table))
	  (modify-syntax-entry ?# "<" st)
	  (modify-syntax-entry ?\n ">" st)
	  (modify-syntax-entry ?' "\"" st)
	  (modify-syntax-entry ?_ "w" st)
	  (modify-syntax-entry ?$ "w" st)
	  (modify-syntax-entry ?/ ". 124b" st)
	  (modify-syntax-entry ?* ". 23" st))
	(set (make-local-variable 'font-lock-defaults)
		 '(gura-font-lock-keywords
		   nil nil nil nil
		   (font-lock-syntactic-keywords . gura-font-lock-syntactic-keywords)))))

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

(add-to-list 'auto-mode-alist '("\\.gura$" . gura-mode))
(add-to-list 'auto-mode-alist '("\\.guraw$" . gura-mode))

(provide 'gura-mode)
