;; emacs24 package system
;; from: http://ergoemacs.org/emacs/emacs_package_system.html
(add-to-list 'load-path "~/.emacs.d/lisp")
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
)

;; load theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'lush t)

;; load jedi - python autocomplete
;; https://github.com/tkf/emacs-jedi/issues/37
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; don't show splash screen at startup
(setq inhibit-startup-message t)

;; don't show any message in *scratch* buffer
(setq initial-scratch-message "")

;; autopair braces, paranthesis
(require 'autopair)
(autopair-global-mode t)

;; line number config - http://stackoverflow.com/a/8470136/1044366
(global-linum-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "ba5fcd1eea87f1f05618e9de3dd7c2712511f3dc9f30151bef7ceb862887ea1a" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "d9046dcd38624dbe0eb84605e77d165e24fdfca3a40c3b13f504728bab0bf99d" default)))
 '(linum-format (quote dynamic)))
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
           (count-lines (point-min) (point-max)))))
   (linum-format (concat "%" (number-to-string w) "d ")))
    ad-do-it))

;; show column number
(setq column-number-mode t)

;; use spaces only
(setq indent-tabs-mode nil)

;; standard indent size
(setq standard-indent 4)

;; enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                 (interactive)
                 (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                 (interactive)
                 (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
  )

;; don't litter
(setq make-backup-files nil)

;; remove trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
