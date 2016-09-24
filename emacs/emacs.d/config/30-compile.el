
(require 'smart-compile)

(setq smart-compile-alist '(
			    (emacs-lisp-mode    . (emacs-lisp-byte-compile))
			    (html-mode          . (browse-url-of-buffer))
			    (nxhtml-mode        . (browse-url-of-buffer))
			    (html-helper-mode   . (browse-url-of-buffer))
			    (octave-mode        . (run-octave))
			    ("\\.c\\'"          . "clang  -std=c11 %f -o %n.out -Wall")
			    ("\\.comp.cpp\\'"   . "clang++ -std=c++14 %f -o %n.out -Wall")
			    ("\\.[Cc]+[Pp]*\\'" . "clang++ -std=c++14 %f -o %n.out -Wall")
			    ("\\.java\\'"       . "javac %f")
			    ("\\.php\\'"        . "php -l %f")
			    ;;("\\.f90\\'"        . "gfortran %f -o %n")
			    ;;("\\.[Ff]\\'"       . "gfortran %f -o %n")
			    ;;("\\.cron\\(tab\\)?\\'" . "crontab %f")
			    ;;("\\.tex\\'"        . (tex-file))
			    ;;("\\.texi\\'"       . "makeinfo %f")
			    ;;("\\.mp\\'"         . "mptopdf %f")
			    ("\\.pl\\'"         . "perl -cw %f")
			    ("\\.rb\\'"         . "ruby -cw %f")
			    ("\\.hs\\'"         . "ghc %f -o %n.out")
			    ))

(global-set-key (kbd "C-x C-x") 'smart-compile)

