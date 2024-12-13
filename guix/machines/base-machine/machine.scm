(define-module (machines base-machine machine)
  #:use-module ((machines base-machine users)
                #:prefix user:)
  ;; GNU Bootloader
  #:use-module (gnu bootloader)
  #:use-module (gnu bootloader grub)
  ;; GNU System
  #:use-module (gnu system)
  #:use-module (gnu system accounts)
  #:use-module (gnu system file-systems)
  #:use-module (gnu system keyboard)
  #:use-module (gnu system shadow)
  ;; Non-GNU
  #:use-module (nongnu packages linux)
  #:export (base-machine))

(define base-machine
  (operating-system
    (host-name "base-machine")
    (timezone "America/Los_Angeles")
    (locale "en_US.utf8")
    (keyboard-layout (keyboard-layout "us"))

    (kernel linux)

    (file-systems '())

    (bootloader (bootloader-configuration
                  (bootloader grub-efi-removable-bootloader)
                  (targets (list "/boot/efi"))
                  (keyboard-layout keyboard-layout)))

    (users (cons* user:kamel %base-user-accounts))))
