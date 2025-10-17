;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules 
  (gnu) 
  (gnu packages shells)
  (gnu packages cups)
  (nongnu packages linux) 
  (nongnu system linux-initrd))
(use-service-modules base desktop networking ssh pm cups dbus authentication)

(operating-system
  (kernel linux)
  (kernel-arguments (list 
                     "cdc_ncm.enable_iad=1"
                     "qmi_wwan.enable_qmi_sync_ops=1"))
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "geekpad")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "ymajan")
                  (comment "Jaynam Shah")
                  (group "users")
                  (home-directory "/home/ymajan")
                  (shell (file-append zsh "/bin/zsh"))
                  (supplementary-groups '("wheel" "netdev" "audio" "video" "input" "lp" "scanner")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (list (specification->package "zsh")
  			  (specification->package "python")
                          (specification->package "git")
                          (specification->package "gnupg")
                          (specification->package "openssh")
                          ;; emacs
                          (specification->package "ripgrep")
                          (specification->package "fd")
                          ;; printing
                          (specification->package "cups-filters")
                          (specification->package "foomatic-filters")
                          (specification->package "ghostscript")
                          (specification->package "hplip-minimal")
                          ;; desktop
                          (specification->package "seahorse")
			  (specification->package "vscodium")
                          (specification->package "firefox")
                          (specification->package "google-chrome-stable")
                          ;;(specification->package "emacs-pgtk-xwidgets")
                          (specification->package "emacs-pgtk")
                          (specification->package "pinentry-gnome3")
                          (specification->package "pinentry-qt"))
                    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (append (list (service gnome-desktop-service-type)
		 (service plasma-desktop-service-type)
                 ;; To configure OpenSSH, pass an 'openssh-configuration'
                 ;; record as a second argument to 'service' below.
                 (service openssh-service-type)
                 (service tor-service-type)
                 (service bluetooth-service-type)
                 (service cups-service-type
                   (cups-configuration
                     (web-interface? #t)          ; enable http://localhost:631
                     (extensions (list cups-filters hplip-minimal foomatic-filters))))
                     
                 ;; (service modem-manager-service-type) TODO - setup sim card
                 (service tlp-service-type (tlp-configuration (sched-powersave-on-bat? #t)
               						      (cpu-scaling-governor-on-ac (list "performance"))
             				 		      (cpu-scaling-governor-on-bat (list "powersave"))
               						      (energy-perf-policy-on-ac "performance")
               				 		      (energy-perf-policy-on-bat "balance_power")
               						      (radeon-power-profile-on-ac "high")
               						      (radeon-power-profile-on-bat "low")
               					  	      (radeon-dpm-state-on-ac "performance")
               				   		      (radeon-dpm-state-on-bat "battery")
               				   		      (radeon-dpm-perf-level-on-ac "high")
             			   	   		      (radeon-dpm-perf-level-on-bat "low")
              				   		      (pcie-aspm-on-ac "performance")
              				   		      (pcie-aspm-on-bat "default"))))
           ;; This is the default list of services we
           ;; are appending to.
           %desktop-services))
  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "f5ed09fc-ddee-488d-a601-ef71a35f9e1d")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/home")
                         (device (uuid
                                  "dd5cbb81-37f9-4af9-a66a-5d9d493fe5e7"
                                  'btrfs))
                         (type "btrfs"))
                       (file-system
                         (mount-point "/")
                         (device (uuid
                                  "d87404c7-6e45-4325-8bf0-ef20822bcc19"
                                  'btrfs))
                         (type "btrfs"))
                       (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "C10E-6A9E"
                                       'fat32))
                         (type "vfat")) %base-file-systems)))
