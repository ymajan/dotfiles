;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile. This is "symbolic": it only
;; specifies package names. To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu services)
             (gnu system shadow)
             (guix gexp)
             (guix channels)
             (gnu home)
             (gnu home services)
             (gnu home services guix)
             (gnu home services shells)
             (gnu packages)
             (gnu packages shells)
             (nongnu packages mozilla))

;; Define channels configuration to be used by the home-environment
(define home-channels
  (list
   (channel
    ;; nonguix channels for more optimized packages
    (name 'nonguix)
    (url "https://gitlab.com/nonguix/nonguix")
    ;; Enable signature verification for nonguix:
    (introduction
     (make-channel-introduction
      "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
      (openpgp-fingerprint "2A39 3FFF 68F4 EF7A 3D29 12AF 6F51 20A0 22FB B2D5"))))

   (channel
    ;; science packages (FOSS)
    (name 'guix-science)
    (url "https://codeberg.org/guix-science/guix-science.git")
    (introduction
     (make-channel-introduction
      "b1fe5aaff3ab48e798a4cce02f0212bc91f423dc"
      (openpgp-fingerprint "CA4F 8CF4 37D7 478F DA05 5FD4 4213 7701 1A37 8446"))))

   (channel
    ;; science packages (non-free)
    (name 'guix-science-nonfree)
    (url "https://codeberg.org/guix-science/guix-science-nonfree.git")
    (introduction
     (make-channel-introduction
      "58661b110325fd5d9b40e6f0177cc486a615817e"
      (openpgp-fingerprint "CA4F 8CF4 37D7 478F DA05 5FD4 4213 7701 1A37 8446"))))

   (channel
    ;; guix crypto stuff
    (name 'crypto)  ; short name for nicer guix pull output
    (url "https://codeberg.org/attila.lendvai/guix-crypto.git")
    (branch "main")
    (introduction
     (make-channel-introduction
      "a6a78768c2f9d0f0e659b0788001e37e23dc26e4"
      (openpgp-fingerprint "69DA 8D74 F179 7AD6 7806 EE06 FEFA 9FE5 5CF6 E3CD"))))

   (channel
    ;; all R packages
    (name 'guix-cran)
    (url "https://github.com/guix-science/guix-cran.git"))

   ;; Include default Guix channels
   %default-channels))

(home-environment
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
                  "google-chrome-stable")))
  (services
    (append
      (list
        (simple-service 'extended-env-vars-service
                      home-environment-variables-service-type
                      `(("PATH" . "$HOME/.config/emacs/bin:$HOME/.local/bin:$PATH")
                        ("SHELL" . ,(file-append zsh "/bin/zsh"))
                        ("XDG_DATA_DIRS" . "/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS")))

      ;; Add a service to configure channels
      (service home-channels-service-type
               home-channels)

      ;; Use local-file with relative paths where possible
      (service home-files-service-type
               `((".guile" ,%default-dotguile)
                 (".Xdefaults" ,%default-xdefaults)))

      (service home-xdg-configuration-files-service-type
               `(("gdb/gdbinit" ,%default-gdbinit)
                 ("nano/nanorc" ,%default-nanorc)))

      (service home-zsh-service-type
               (home-zsh-configuration
                (environment-variables
                 `(("DOOMDIR" . "$HOME/count_fig/dots/doom/"))))))

    %base-home-services)))
