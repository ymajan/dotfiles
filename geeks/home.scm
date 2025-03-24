;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile. This is "symbolic": it only
;; specifies package names. To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(define-module (guix-home-modules)
  ;; GNU basics
  #:use-module (gnu services)
  #:use-module (gnu system shadow)
  #:use-module (guix gexp)
  #:use-module (guix channels)
  ;; GNU Home
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services guix)
  #:use-module (gnu home services shells)
  ;; Packages
  #:use-module (gnu packages)
  #:use-module (gnu packages shells)
  #:use-module (nongnu packages mozilla))

(define home-config
  (home-environment
   ;; Specify the packages to appear in your Home profile.
   (packages (specifications->packages
              (list "zsh"
                    "rbw"
                    "vscodium"
                    "conda"
                    "python"
                    "python-ta-lib"
                    "ta-lib"
                    "gcc-toolchain"
                    "linux-libre-headers"
                    "texlive-scheme-basic"   ;; anki
                    "texlive-dvipng"         ;; anki
                    "texlive-dvisvgm"        ;; anki - also basic one
                    "flatpak"
                    "nextcloud-client"
                    "google-chrome-stable"
                    "r-mathpix")))
   ;; Configure the Home services.
   (services
    (append
     (list
      ;; Channel configuration moved to separate file: home-channels.scm
      ;; which should be symlinked to ~/.config/guix/channels.scm
      
      (simple-service 'extended-env-vars-service
                      home-environment-variables-service-type
                      `(("PATH" . "$HOME/.config/emacs/bin:$HOME/.local/bin:$PATH")
                        ("SHELL" . ,(file-append zsh "/bin/zsh"))
                        ("XDG_DATA_DIRS" . "/var/lib/flatpak/exports/share:/home/ymajan/.local/share/flatpak/exports/share:$XDG_DATA_DIRS")))
      
      (service home-files-service-type
               `((".guile" ,%default-dotguile)
                 (".Xdefaults" ,%default-xdefaults)
                 (".authinfo.gpg" ,(local-file "/home/ymajan/count_fig/dots/authinfo.gpg"))))
      
      (service home-xdg-configuration-files-service-type
               `(("gdb/gdbinit" ,%default-gdbinit)
                 ("nano/nanorc" ,%default-nanorc)
                 ("guix/channels.scm" ,(local-file "/home/ymajan/count_fig/geeks/home-channels.scm"))))
      
      (service home-zsh-service-type
               (home-zsh-configuration
                (environment-variables
                 `(("DOOMDIR" . "$HOME/count_fig/dots/doom/") ;; we could also copy the files over, but changes aren't reflexive
                   )))))

     %base-home-services))))
     
home-config
