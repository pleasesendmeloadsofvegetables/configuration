(define-module (home-environments kamel user)
  ;; GNU Home
  #:use-module (gnu home)
  #:use-module (gnu home services shells)
  ;; GNU Packages
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages curl)
  ;; Non-GNU Packages
  #:use-module (nongnu packages nvidia)
  #:use-module (nongnu packages mozilla))

(home-environment
  (packages (map replace-mesa
                 (list firefox git curl))
    ))
