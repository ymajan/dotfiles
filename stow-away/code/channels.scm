;; channels.scm
(cons*
 (channel
   (name 'nonguix)
   (url "https://gitlab.com/nonguix/nonguix")
   (introduction
     (make-channel-introduction
       "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
       (openpgp-fingerprint
         "2A39 3FFF 68F4 EF7A 3D29 12AF 6F51 20A0 22FB B2D5"))))

 (channel                          ; FOSS science packages
   (name 'guix-science)
   (url "https://codeberg.org/guix-science/guix-science.git")
   (introduction
     (make-channel-introduction
       "b1fe5aaff3ab48e798a4cce02f0212bc91f423dc"
       (openpgp-fingerprint
         "CA4F 8CF4 37D7 478F DA05 5FD4 4213 7701 1A37 8446"))))

 (channel                          ; non‑free science extras
   (name 'guix-science-nonfree)
   (url "https://codeberg.org/guix-science/guix-science-nonfree.git")
   (introduction
     (make-channel-introduction
       "58661b110325fd5d9b40e6f0177cc486a615817e"
       (openpgp-fingerprint
         "CA4F 8CF4 37D7 478F DA05 5FD4 4213 7701 1A37 8446"))))

 %default-channels)                ; keep official Guix last

