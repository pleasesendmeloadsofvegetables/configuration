(define-module (machines eocene file-systems)
  ;; GNU System
  #:use-module (gnu system file-systems)
  #:export (file-systems))

(define file-systems
  (cons* (file-system
           (mount-point "/")
           (device (uuid "ade1d8dc-a732-4233-aea6-02d8ba24613f"
                         'btrfs))
           (type "btrfs"))
         (file-system
           (mount-point "/boot/efi")
           (device (uuid "9E2A-66D9"
                         'fat32))
           (type "vfat")) %base-file-systems))
