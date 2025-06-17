{
  stdenv,
  lib,
  fetchurl,
  fetchFromGitHub,
  autoPatchelfHook,
  glib,
  libGL,
  blas,
  libxcb,
  xcbutilkeysyms,
  xcbutilrenderutil,
  libxkbcommon,
  libkrb5,
  xcbutilwm,
  xcbutil,
  xcbutilimage,
  freetype,
  fontconfig,
  dbus,
  qtbase,
  wrapQtAppsHook,
  libsForQt5,
  readline,
  libffi_3_3,
  libnsl,
  db,
  libtirpc,
  libxcrypt-legacy,
  gdbm,
  libtool,
}:
stdenv.mkDerivation rec {
  pname = "cascadeur";
  version = "2023.1.1";

  src = fetchurl {
    #! no version in the url so updating will reqire a change here
    url = "https://cdn.cascadeur.com/builds/linux/63/cascadeur-linux.tgz";
    sha256 = "sha256-+RGgdWU2UKEv7UGQf9LRQFmc28ifxNCDmYg4g4oWKdg=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    wrapQtAppsHook
  ];

  buildInputs = [
    glib
    libGL
    blas
    libxcb
    xcbutilkeysyms
    xcbutilrenderutil
    libxkbcommon
    libkrb5
    xcbutilwm
    xcbutilwm
    xcbutilimage
    freetype
    fontconfig
    dbus
    qtbase
    libsForQt5.qt5.qtbase
    libsForQt5.qt3d
    libsForQt5.qt5.qtgamepad
    libsForQt5.qt5.qtxmlpatterns
    libsForQt5.qt5.qtremoteobjects
    readline
    libffi_3_3
    db
    libxcrypt-legacy
    libtirpc
    gdbm
    (libnsl.overrideAttrs {
      version = "1.2.0";
      src = fetchFromGitHub {
        owner = "thkukuk";
        repo = "libnsl";
        rev = "v1.2.0";
        sha256 = "sha256-C+mPG0nWiNleHctQLAbMR00PKxMJVqRlUtED+BjEH7I=";
      };
    })
  ];

  sourceRoot = ".";

  # preBuild = ''
  #    addAutoPatchelfSearchPath ./cascadeur-linux/lib/
  # 	addAutoPatchelfSearchPath	./cascadeur-linux/csc-lib/
  #  '';

  #ngl I have no clue what permisions 755 stands for but it was in the tutorial.
  installPhase = ''
    mkdir "$out/"
    cp -R ./cascadeur-linux $out/bin

    # cp -R ./cascadeur-linux/lib $out/lib

    runHook postInstall
  '';

  # postFixup = ''
  # 	wrapProgram $out/bin/cascadeur \
  # 		--set LD_LIBRARY_PATH $out/lib
  # '';

  meta = with lib; {
    homepage = "https://www.cascadeur.com/";
    description = "AI assisted animation";
    license = licenses.unfree;
    platforms = platforms.linux;
  };
}
