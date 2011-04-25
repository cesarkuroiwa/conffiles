; by Du!!@24/Aug/2006
(set-background-color "black")
(set-foreground-color "white")
(setq inhibit-startup-message t)

; don't want that dummy tool bar/menu bar
(tool-bar-mode 0)
(menu-bar-mode 0)

; Emacs Tips & Tricks
; http://geosoft.no/dasdfasevelopment/emacs.html
; http://www-db.stanford.edu/~manku/dotemacs.html
; http://www.emacswiki.org/cgi-bin/wiki/DotEmacsChallenge
;(setq default-frame-alist(append(list '(width . 81)
;				      '(height . 40)
;				      '(font . "7x14")
;				      )
;				default-frame-alist))

; approach #2: also slow
(set-default-font "7x14")
(setq truncate-partial-width-windows nil)
; approach #3: also slow
;(defun font-fixed-14 ()
;	(interactive)
;	(set-default-font "-misc-fixed-medium-r-normal--14-110-100-100-c-70-iso8859-1"))
;(defun font-default () (interactive) (font-fixed-14))
;(font-default)


(global-set-key [kp-subtract] 'undo) ; [Undo]

(global-set-key "\C-cl" 'goto-line) ; [Ctrl]-[C] [L]

; Moving cursor down at bottom scrolls only a single line, not half page
(setq scroll-step 1)

; turns beep off
(setq visible-bell 1)

; put scroll bars on the right
(set-scroll-bar-mode 'right)

; include current buffer name in the title bar
(setq frame-title-format (list "%b :: "
			       (getenv "USER")
			       "@"
			       (getenv "HOST")
			       (getenv "HOSTNAME") ))

; syntax highlighting
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

; tabs e acentos
(setq tab-width 2)
;(setq  tab-width 2
 ;      c-basic-offset 2
 ;      default-tab-width 2)

;(setq-default indent-tabs-mode nil)
;(standard-display-european t)

; se quisesse setar modos para diferentes tipos de arquivos...
;(setq auto-mode-alist (cons '("mutt\\.*" . iso-accents-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.txt*" . iso-accents-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.html*" . iso-accents-mode) auto-mode-alist))

; show column number
(column-number-mode t)

; só para facilitar
(global-set-key [S-up] '(lambda() (interactive) (scroll-up 1)))
(global-set-key [S-down] '(lambda() (interactive) (scroll-down 1)))
(global-set-key [home] 'beginning-of-line)
(global-set-key [S-home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-line)
(global-set-key [S-end] 'end-of-buffer)
(global-set-key [f11] 'iso-accents-mode)
(global-set-key [f12] 'kill-this-buffer)

; para fazer com que as teclas backspace e delete funcionem como devem e nao 
; da mesma maneira (delete funcionava como backspace)
(global-unset-key [backspace])
(global-set-key [backspace] 'delete-backward-char)
(global-unset-key [delete])
(global-set-key [delete] 'delete-char)

; save current buffer and exit
(defun save-exit ()
  "Save current buffer and exit Emacs if all other buffers were already saved."
  (interactive)
  (basic-save-buffer)
  (save-buffers-kill-emacs))
(global-set-key "\C-q" 'save-exit)

(global-set-key "\C-cu" 'uncomment-region)

; shift-f1 much better than 'C-x e'
(global-set-key [(shift f1)] 'call-last-kbd-macro)

; sample custom macros (by Du!!@03/Oct/2001)
(fset 'c-comment-remove-line "\C-a/* REMOVE: \C-e*/\C-a\C-n")
(global-set-key "\C-cm" 'c-comment-remove-line)

(fset 'empurra-direita "        \C-a\C-n")
(global-set-key [(shift f2)] 'empurra-direita)

; not-so-useful functions, more interesting as examples
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))

(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%a %b %e, %Y %l:%M %p")))
; Thu May  9, 2002  1:35 PM

(defun dos-unix ()
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\r" nil t) (replace-match "")))

(defun unix-dos ()
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\n" nil t) (replace-match "\r\n")))

; Mouse wheel scroll
; http://koala.ilog.fr/colas/mouse-wheel-scroll/#gnuemacs
; Ctrl + scroll: 5 linhas
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [C-mouse-4] 'down-slightly)
(global-set-key [C-mouse-5] 'up-slightly)

; Shift + scroll: 1 linha
(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

; Meta + scroll: 1 pagina
(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [M-mouse-4] 'down-a-lot)
(global-set-key [M-mouse-5] 'up-a-lot)

; scroll: meia-pagina
(defun scroll-up-half ()
  "Scroll up half a page."
  (interactive)
  (scroll-up (/ (window-height) 2))
)
(defun scroll-down-half ()
  "Scroll down half a page."
  (interactive)
  (scroll-down (/ (window-height) 2))
)
(global-set-key [(mouse-5)] 'scroll-up-half)
(global-set-key [(mouse-4)] 'scroll-down-half)

;; Python e XML syntax highlighting
;; requires installation of editors/nxml-emacs21
(setq load-path
      (append load-path
              '("/usr/local/share/emacs/21.3/site-lisp/nxml/")))
;(load "rng-auto.el")
;(autoload 'python-mode "python-mode")
(add-to-list 'auto-mode-alist '("\\.xml" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xsd" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.wsdl" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.py" . python-mode))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
  ;; '(ps-landscape-mode t)
 '(ps-paper-type (quote a4)))

; by Du!!@9/Aug/2006
; http://applications.linux.com/article.pl?sid=06/08/04/225209&from=rss
(setq inhibit-startup-message t)

; by Du!!@9/Oct/2006
; based on http://jspwiki.org/wiki/InsertingGettersAndSettersInEmacs
(defun cpp-newfield (type field class)
  (interactive "Mtype: \nMfield: \nMclass: ")

  (insert (concat "private:\n"
		  "  " type " _" field ";\n\n"

		  "public:\n"
		  "  " type " get_" field "();\n"
		  "  void set_" field "(" type " " field ");\n"
		  ))

  (end-of-buffer)

  (insert (concat "\n\n"
		  type " " class "::get_" field "()\n"
		  "{\n"
		  "  return _" field ";\n"
		  "}\n\n"

		  "void " class "::set_" field "(" type " " field ")\n"
		  "{\n"
		  "  _" field " = " field ";\n"
		  "}\n"
		  ))
)

; by Du!!@25/Oct/2006 - Java indentation
; http://www.delorie.com/gnu/docs/emacs/emacs_280.html
(setq c-default-style '((java-mode . "gnu") (other . "gnu")))

; Associate c-mode with the .js extension
(setq auto-mode-alist (append '(("\\.js$" . c-mode)) auto-mode-alist))

(defun my-pystuff ()
  (setq tab-width 2
        py-indent-offset 2
        ;indent-tabs-mode t
        py-smart-indentation nil))

(add-hook 'python-mode-hook 'my-pystuff)

(setq
 load-path (cons (expand-file-name "~/.emacs.d") load-path))

; Correct use of tabs and spaces on indentation
;(require 'smarttabs)

;(defun indent-buffer ()
;  (interactive)
;  (delete-trailing-whitespace)
;  (indent-region (point-min) (point-max) nil)
;  ;(untabify (point-min) (point-max))
;	)
;(global-set-key [f5]          'indent-buffer)

; Mark 79 columns
(add-hook 'c++-mode-hook
	  '(lambda ()
	     (interactive) (column-marker-2 79)))
(add-hook 'html-mode-hook
	  '(lambda ()
	     (interactive) (column-marker-2 79)))
(add-hook 'python-mode-hook
	  '(lambda ()
	     (interactive) (column-marker-2 79)))
(require 'column-marker)

(defun indent-buffer ()
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  ;(untabify (point-min) (point-max))
        )
(global-set-key [f5]          'indent-buffer)

;========== http://www.emacswiki.org/emacs/SmartTabs
    (setq-default tab-width 2) ; or any other preferred value
    (setq cua-auto-tabify-rectangles nil)

    (defadvice align (around smart-tabs activate)
      (let ((indent-tabs-mode nil)) ad-do-it))

    (defadvice align-regexp (around smart-tabs activate)
      (let ((indent-tabs-mode nil)) ad-do-it))

    (defadvice indent-relative (around smart-tabs activate)
      (let ((indent-tabs-mode nil)) ad-do-it))

    (defadvice indent-according-to-mode (around smart-tabs activate)
      (let ((indent-tabs-mode indent-tabs-mode))
        (if (memq indent-line-function
                  '(indent-relative
                    indent-relative-maybe))
            (setq indent-tabs-mode nil))
        ad-do-it))

    (defmacro smart-tabs-advice (function offset)
      (defvaralias offset 'tab-width)
      `(defadvice ,function (around smart-tabs activate)
         (cond
          (indent-tabs-mode
           (save-excursion
             (beginning-of-line)
             (while (looking-at "\t*\\( +\\)\t+")
               (replace-match "" nil nil nil 1)))
           (setq tab-width tab-width)
           (let ((tab-width fill-column)
                 (,offset fill-column))
             ad-do-it))
          (t
           ad-do-it))))

    (smart-tabs-advice c-indent-line c-basic-offset)
    (smart-tabs-advice c-indent-region c-basic-offset)
;==========
