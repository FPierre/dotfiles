(setq make-backup-files nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode nil)
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
