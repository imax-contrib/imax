(defun modules-load-modules ()
  (interactive)
  (add-to-list 'load-path (concat user-emacs-directory "/modules")))
(defun modules-setup-modules ()
  (interactive)
  (modules-load-modules)
  (dolist (module negev-modules)
    (require (intern (concat "modules/" (symbol-name module))))
          (funcall
	   (intern (concat "module-" (symbol-name module) "-setup"))
	   )
	  (negev-message (concat "Module " (symbol-name module) " has been loaded into negev")
	  )
  ))
(provide 'core/modules)
