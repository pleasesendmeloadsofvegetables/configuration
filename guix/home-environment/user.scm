(define-module (home-environment
                 user)
  #:use-module (home-environment
                 services channels-config)
  #:use-module (packages hy3)
  ;; GNU Services
  #:use-module (gnu services)
  ;; GNU Home
  #:use-module (gnu home)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services dotfiles)
  #:use-module (gnu home services sound)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services shepherd)
  ;; GNU Packages
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages linux)
  ;; Non-GNU Packages
  #:use-module (nongnu packages nvidia)
  #:use-module (nongnu packages mozilla)
  #:use-module (nongnu packages game-client)
  ;; Saayix
  #:use-module (saayix packages text-editors)
  #:use-module (saayix packages lsp))

(home-environment
  (packages (map replace-mesa
                 (list firefox
                       git
                       curl
                       hyprland
                       hyprcursor
                       hy3
                       kitty
                       steam-nvidia
                       helix
                       guile-lsp-server)))
  (services
   (list (service home-channels-config-service-type)
         (service home-bash-service-type)

         (service home-dbus-service-type)

         (service home-pipewire-service-type
                  (home-pipewire-configuration (wireplumber
                                                wireplumber-minimal)))

         (service home-shepherd-service-type)

         (service home-dotfiles-service-type
                  (home-dotfiles-configuration (directories '("./dots"))
                                               (layout 'stow))))))
