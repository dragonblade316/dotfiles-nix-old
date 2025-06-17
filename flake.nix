{
  description = "dragonblade316's configuration files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    hm = {
      url = "github:nix-community/home-manager/";
      # url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    sops-nix.url = "github:Mic92/sops-nix";

    stylix = {
      url = "github:danth/stylix";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rstreamdeck = {
      url = "github:dragonblade316/rstreamdeck";
    };

    rust-overlay.url = "github:oxalica/rust-overlay";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";

      #ima regret removing this later.
      # inputs.hyprland.follows = "";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: let
    system = "x86_64-linux";

    packages = import ./pkgs {inherit pkgs;};

    overlays = [inputs.rust-overlay.overlays.default inputs.rstreamdeck.overlays.default packages.overlay];
    pkgs = import inputs.nixpkgs {
      inherit system overlays;
      config.allowUnfree = true;
    };
  in {
    homeConfigurations = import ./home/profiles {inherit pkgs inputs system;};
    nixosConfigurations = import ./hosts {inherit inputs system pkgs;};
    packages.${system} = import ./pkgs {inherit pkgs;};
  };
}
