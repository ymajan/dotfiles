(use-modules
  (gnu)
  (gnu services)
  (gnu services base)
  (gnu services desktop)
  (gnu services pm)
  (gnu services cups)
  (gnu services networking)
  (gnu services dbus)
  (gnu packages shells)
  (nongnu packages linux)
  (nongnu system linux-initrd)
)

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (kernel-arguments (list 
                     "cdc_ncm.enable_iad=1"
                     "qmi_wwan.enable_qmi_sync_ops=1"))
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "geekpad")

  ;; The list of user accounts ('root' is implicit).
  (users
   (cons*
    (user-account
     (name "ymajan")
     (comment "jaynam")
     (group "users")
     (home-directory "/home/ymajan")
     (shell (file-append zsh "/bin/zsh"))
     (supplementary-groups '("wheel" "netdev" "audio" "video" "input" "lp" "scanner")))
    %base-user-accounts))

  ;; Packages installed system-wide.
  (packages
   (append
    (map specification->package '("gnome-tweaks"
				  "gnome-shell-extensions"
				  "gnome-system-monitor"
				  "gnome-default-applications"
				  "network-manager-applet"
				  "modem-manager"
				  "network-manager"
				  "seahorse" ;; gnome password manager
				  "pinentry-gnome3" ;; graphical password entry
				  "gnupg"
				  "zsh"
    			          "openssh"
    			          "git"
				  "gitg"
				  "direnv"
               	                  "ripgrep"
               	                  "findutils"
               	                  "fd"
    			          "firefox-esr-wayland"
				  "ungoogled-chromium-wayland"
               	                  "emacs-pgtk-xwidgets"))
    %base-packages))

  ;; System services.
  (services
   (append
    %desktop-services
    (list
     (service cups-service-type)
     (service gnome-desktop-service-type)
     (service bluetooth-service-type)
     ;; (service modem-manager-service-type) TODO - setup sim card
     (service tlp-service-type
              (tlp-configuration
               (sched-powersave-on-bat? #t)
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
               (pcie-aspm-on-bat "default"))))))

  (bootloader
   (bootloader-configuration
    (bootloader grub-efi-bootloader)
    (targets (list "/boot/efi"))
    (keyboard-layout keyboard-layout)))

  ;; File systems to be mounted. UUIDs can be obtained by running 'blkid'.
  (file-systems
   (cons*
    (file-system
     (mount-point "/")
     (device (uuid "5e1534e9-633c-4899-bedc-2576d8743295" 'ext4))
     (type "ext4"))
    (file-system
     (mount-point "/boot/efi")
     (device (uuid "E01A-B142" 'fat32))
     (type "vfat"))
    %base-file-systems)))

