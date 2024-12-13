(define-module (machines eocene machine)
  #:use-module (machines base-machine machine)
  #:use-module (machines eocene file-systems)
  ;; GNU System
  #:use-module (gnu system)
  #:use-module (gnu system keyboard)
  ;; GNU Bootloader
  #:use-module (gnu bootloader)
  #:use-module (gnu bootloader grub)
  ;; GNU Packages
  #:use-module (gnu packages)
  ;; GNU Services
  #:use-module (gnu services)
  #:use-module (gnu services desktop)
  ;; Non-GNU
  #:use-module (nongnu packages linux)
  #:use-module (nongnu packages nvidia)
  #:use-module (nongnu services nvidia)
  #:use-module (nongnu system linux-initrd))

(operating-system
    (inherit base-machine)
    (host-name "eocene")

    (initrd microcode-initrd)
    (firmware (list linux-firmware))

    (kernel-arguments (list "nvidia_drm.modeset=1" "nvidia_drm.fbdev=1"
                            "modprobe.blacklist=nouveau"))

    (file-systems file-systems)

    (packages (append (map replace-mesa
                           (list (specification->package "i3-wm")
                                 (specification->package "i3status")
                                 (specification->package "dmenu")
                                 (specification->package "st")
                                 (specification->package "nss-certs")))
                      %base-packages))

    (services
     (append (list (service nvidia-service-type)) %desktop-services)))
