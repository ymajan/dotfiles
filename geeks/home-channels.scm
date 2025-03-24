;; User-level channels configuration
;; This file should be linked to ~/.config/guix/channels.scm

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
 %default-channels)
