{
  inputs,
  system,
  pkgs,
  ...
}:
with inputs; let
  inherit (nixpkgs.lib) nixosSystem;
in {
  main = nixosSystem {
    inherit system;
    modules = [
      ./main
      ./modules/desktop.nix
      ./modules/distrobox.nix
      ./modules/polkit.nix
      ./modules/printing.nix
      ./core.nix
    ];
  };

  framework = nixosSystem {
    inherit system;
    modules = [
      ./framework
      ./modules/desktop.nix
      ./modules/distrobox.nix
      ./modules/polkit.nix
      ./modules/printing.nix
      ./core.nix
    ];
  };

  homeserver = nixosSystem {
    inherit system;
    modules = [
      ./homeserver
      ./core.nix
    ];
  };

  halcyon = nixosSystem {
    inherit system;
    modules = [
      ./halcyon
      ./core.nix
      inputs.nixos-hardware.nixosModules.asus-zephyrus-ga503
    ];
  };

  wsl = nixosSystem {
    inherit system;
    modules = [
      ./wsl
      ./core.nix
      inputs.nixos-wsl
    ];
  };
}
