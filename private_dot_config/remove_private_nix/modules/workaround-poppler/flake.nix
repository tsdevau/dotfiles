{
  description = "Custom overlay for poppler + poppler-data from GitLab";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.popplerFix ];
        };
      in
      {
        packages.default = pkgs.poppler;
      }
    )
    // {
      overlays.popplerFix = final: prev: {
        poppler =
          final.stdenv.mkDerivation rec {
            pname = "poppler";
            version = "25.06.0";

            src = final.fetchurl {
              url = "https://poppler.freedesktop.org/poppler-${version}.tar.xz";
              sha256 = "sha256-gZlTLTiYT6tG29ACDsnEDyDpKOM+m0zGBDVyYDqCHYM=";
            };

            nativeBuildInputs = with final; [
              cmake
              ninja
              pkg-config
              python3
            ];

            buildInputs = with final; [
              boost
              cairo
              curl
              expat
              fontconfig
              freetype
              glib
              lcms
              libjpeg
              libtiff
              nss
              openjpeg
              zlib
            ];

            cmakeFlags = [
              "-DBUILD_CPP_TESTS=OFF"
              "-DBUILD_GTK_TESTS=OFF"
              "-DBUILD_MANUAL_TESTS=OFF"
              "-DBUILD_QT5_TESTS=OFF"
              "-DBUILD_QT6_TESTS=OFF"
              "-DENABLE_BOOST=ON"
              "-DENABLE_CPP=ON"
              "-DENABLE_DCTDECODER=libjpeg"
              "-DENABLE_GLIB=ON"
              "-DENABLE_GOBJECT_INTROSPECTION=OFF"
              "-DENABLE_GPGME=OFF"
              "-DENABLE_GTK_DOC=OFF"
              "-DENABLE_LCMS=ON"
              "-DENABLE_LIBCURL=ON"
              "-DENABLE_LIBOPENJPEG=openjpeg2"
              "-DENABLE_LIBTIFF=ON"
              "-DENABLE_NSS3=ON"
              "-DENABLE_PGP_SIGNATURES=OFF"
              "-DENABLE_QT5=OFF"
              "-DENABLE_QT6=OFF"
              "-DENABLE_UNSTABLE_API_ABI_HEADERS=ON"
              "-DENABLE_UTILS=ON"
              "-DENABLE_XPDF_HEADERS=ON"
              "-DENABLE_ZLIB_UNCOMPRESS=OFF"
            ];

            doCheck = false;

            meta = with final.lib; {
              description = "PDF rendering library";
              homepage = "https://gitlab.freedesktop.org/poppler/poppler";
              license = licenses.gpl2Plus;
              platforms = [ "aarch64-darwin" ];
              teams = [ ];
              maintainers = [ ];
            };
          }
          // {
            override = args: prev.poppler.override args;
          };

        poppler-data =
          final.stdenv.mkDerivation {
            pname = "poppler-data";
            version = "0.4.12";

            src = final.fetchurl {
              url = "https://poppler.freedesktop.org/poppler-data-0.4.12.tar.gz";
              sha256 = "sha256-J3C68l6YyUXeXDLVzFr8pJmW1VD72qjJQF7vCUv3kMw=";
            };

            installPhase = ''
              runHook preInstall
              mkdir -p $out/share/poppler
              cp -r . $out/share/poppler/
              runHook postInstall
            '';

            meta = with final.lib; {
              description = "Encoding data for poppler";
              homepage = "https://gitlab.freedesktop.org/poppler/poppler-data";
              license = licenses.gpl2Plus;
              platforms = [ "aarch64-darwin" ];
              teams = [ ];
              maintainers = [ ];
            };
          }
          // {
            override = args: prev.poppler.override args;
          };
      };
    };
}
