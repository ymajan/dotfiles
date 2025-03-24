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
    ;; chromium with widevine
    (name 'guix-chromium)
    (url "https://gitlab.com/mbakke/guix-chromium.git")
    (branch "master"))

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
    ;; binary packages (e.g., flatpak packages)
    (name 'bin-guix)
    (url "https://github.com/ieugen/bin-guix")
    (branch "main")
    ;; Enable signature verification: TBA
    )

   (channel
    ;; experimental: wakatime?!
    (name 'rosenthal)
    (url "https://codeberg.org/hako/rosenthal.git")
    (branch "trunk")
    (introduction
     (make-channel-introduction
      "7677db76330121a901604dfbad19077893865f35"
      (openpgp-fingerprint "13E7 6CD6 E649 C28C 3385 4DF5 5E5A A665 6149 17F7"))))

   (channel
    ;; extra packages (mostly for WSL2)
    (name 'giuliano108-guix-packages)
    (url "https://github.com/giuliano108/guix-packages"))

   (channel
    ;; Rust binary toolchain channel for Guix
    (name 'rustup)
    (url "https://github.com/declantsien/guix-rustup")
    (introduction
     (make-channel-introduction
      "325d3e2859d482c16da21eb07f2c6ff9c6c72a80"
      (openpgp-fingerprint "F695 F39E C625 E081 33B5 759F 0FC6 8703 75EF E2F5"))))

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
      (simple-service 'extended-env-vars-service
                      home-environment-variables-service-type
                      `(("PATH" . "/home/ymajan/.config/emacs/bin:/home/ymajan/.local/bin:$PATH")
                        ("SHELL" . ,(file-append zsh "/bin/zsh"))
                        ("XDG_DATA_DIRS" . "/var/lib/flatpak/exports/share:/home/ymajan/.local/share/flatpak/exports/share:$XDG_DATA_DIRS")))

      ;; Add a service to configure channels
      (service home-channels-service-type
               home-channels)

      (service home-files-service-type
               `((".guile" ,%default-dotguile)
                 (".Xdefaults" ,%default-xdefaults)
                 (".authinfo.gpg" ,(local-file "/home/ymajan/count_fig/dots/authinfo.gpg"))))

      (service home-xdg-configuration-files-service-type
               `(("gdb/gdbinit" ,%default-gdbinit)
                 ("nano/nanorc" ,%default-nanorc)))

      (service home-zsh-service-type
               (home-zsh-configuration
                (environment-variables
                 `(("DOOMDIR" . "/home/ymajan/count_fig/dots/doom/") ;; we could also copy the files over, but changes aren't reflexive
                   )))))

     %base-home-services))))
