;;; gura-mode.el --- Gura major mode

(makunbound 'gura-mode-map)
;;(makunbound 'gura-mode-syntax-table)
;;(makunbound 'gura-font-lock-keywords)
;;(makunbound 'gura-imenu-generic-expression)
;;(makunbound 'gura-outline-regexp)

(defun gura-brace-close ()
  (interactive)
  (insert "}")
  (gura-indent-line))

(defun gura-paren-close ()
  (interactive)
  (insert ")")
  (gura-indent-line))

(defun gura-bracket-close ()
  (interactive)
  (insert "]")
  (gura-indent-line))

(defvar gura-mode-map
  (let ((map (make-sparse-keymap)))
	(define-key map "}"		'gura-brace-close)
	(define-key map ")"		'gura-paren-close)
	(define-key map "]"		'gura-bracket-close)
	map)
  "Keymap for `gura-mode'.")

(defvar gura-mode-syntax-table
  (let ((st (make-syntax-table)))
	(modify-syntax-entry ?' "\"" st)
	(modify-syntax-entry ?_ "w" st)
	(modify-syntax-entry ?$ "w" st)
	;; comment syntax
	(modify-syntax-entry ?# "<" st)
	(modify-syntax-entry ?/ ". 124" st)
	(modify-syntax-entry ?* ". 23b" st)
	(modify-syntax-entry ?\n ">" st)
	st)
  "Syntax table for `gura-mode'.")

(defvar gura-font-lock-keywords
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
	;; symbol name
	(,(rx "`" (1+ word))
	 (0 font-lock-variable-name-face))
	;; function name
	(,(rx symbol-start (group (1+ word)) (0+ space) "(")
	 (1 font-lock-function-name-face))
	;; top-level assignment
	(,(rx line-start (group (1+ word)) (0+ space) "=")
	 (1 font-lock-variable-name-face)))
  "Keyword highlighting specification for `gura-mode'.")

(defvar gura-imenu-generic-expression
  )

(defvar gura-outline-regexp
  )

(define-derived-mode gura-mode prog-mode "Gura"
  "Major mode for editing Gura programming language."
  (set-syntax-table gura-mode-syntax-table)
  (use-local-map (nconc (make-sparse-keymap) gura-mode-map))
  (set (make-local-variable 'indent-line-function) 'gura-indent-line)
  (set (make-local-variable 'font-lock-defaults)
	   '(gura-font-lock-keywords nil nil nil nil)))

(defun gura-indent-line ()
  "Indent current line of Gura code."
  (interactive)
  (let ((savep (> (current-column) (current-indentation)))
		(indent (condition-case nil (max (gura-calculate-indentation) 0)
				  (error 0))))
	(if savep
		(save-excursion (indent-line-to indent))
	  (indent-line-to indent))))

(defun gura-calculate-indentation ()
  "Return the column to which the current line should be indented."
  (setq indent-offset 0)
  (save-excursion
	(forward-line -1)
	(while (looking-at ".*\\\\\\s-*$")
	  (setq indent-offset default-tab-width)
	  (forward-line -1)))
  (let* ((line-cur (line-number-at-pos))
		 (syntax (syntax-ppss)) (pos-block-start (nth 1 syntax)))
	(if pos-block-start
		(save-excursion
		  (goto-char pos-block-start)
		  (if (= line-cur (line-number-at-pos))
			  (+ (current-indentation) indent-offset)
			(+ (current-indentation) default-tab-width indent-offset)))
	  0)))

(defun foo ()
  (interactive)
  (message "%s" (gura-calculate-indentation)))

(defun foo2 ()
  (interactive)
  (message "%s" (char-before)))


(add-to-list 'auto-mode-alist '("\\.gura$" . gura-mode))
(add-to-list 'auto-mode-alist '("\\.guraw$" . gura-mode))

(provide 'gura-mode)
