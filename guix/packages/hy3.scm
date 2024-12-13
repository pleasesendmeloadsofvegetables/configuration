
(define-module (packages hy3)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix gexp)

  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages cmake)

  #:export (hy3))

(define-public hy3
  (package
    (name "hy3")
    (version "0.45.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/outfoxxed/hy3.git")
             (commit (string-append "hl" version))))
       (sha256
        (base32 "01h0a3plvs1na9b1miqdkx0l622mk542slagydajqka7sh9fwwvg"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:cmake cmake-3.30
      #:tests? #f
      #:configure-flags #~(list "DCMAKE_BUILD_TYPE=Release")))
    (native-inputs (list pkg-config gcc-13))
    (inputs (list aquamarine
                  cairo
                  hyprland
                  hyprlang
                  hyprutils
                  libinput-minimal
                  libxkbcommon
                  libdrm
                  mesa
                  pango
                  pixman
                  hyprland
                  wayland))
    (license license:gpl3)
    (home-page "https://github.com/outfoxxed/hy3")
    (synopsis "i3 / sway like layout for hyprland.")
    (description "Hyprland plugin for an i3 / sway like manual tiling layout")))

