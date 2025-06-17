{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    pkgs.rust-bin.stable.latest.default
    rust-analyzer

    ccls
    libclang

    nixos-shell

    python3
    nodePackages_latest.pyright

    jdt-language-server
    kotlin-language-server
    #nix-index
  ];
}
