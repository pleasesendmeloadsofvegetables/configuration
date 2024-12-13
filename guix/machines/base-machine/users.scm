(define-module (machines base-machine users)
  ;; GNU System
  #:use-module (gnu system accounts)
  #:export (kamel))

(define kamel
  (user-account
    (name "kamel")
    (group "users")
    (home-directory "/home/kamel")
    (supplementary-groups '("wheel" "netdev" "audio" "video"))))
