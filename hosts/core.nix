{
  pkgs,
  lib,
  ...
}:
# This folder just has some base configuration that I think its reasonable to expect any system I use to have.
# There are some packages in here but most are defined in ../home or in the hosts
{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  networking.networkmanager.enable = true;

  programs = {
    neovim.enable = true;
    fish.enable = true;
  };

  # Set your time zone.
  time.timeZone = lib.mkDefault "America/Boise";

  system.stateVersion = lib.mkDefault "23.11";

  nixpkgs.config.allowUnfree = true;

  users.users.dragonblade316 = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.fish;
    packages = with pkgs; [
      git
      # busybox
      # uutils-coreutils
      ripgrep

      gnumake
      gcc

      home-manager

      pamixer
      udiskie

      playerctl

      wireplumber
    ];
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  #not 100% sure why this is needed but themeing does not work without it so idk
  programs.dconf.enable = true;

  services.udisks2.enable = true;
  virtualisation.virtualbox.host.enable = true;

  #setting capslock to esc to use in neovim
  services.keyd.enable = true;
  services.keyd.keyboards = {
    default = {
      ids = ["*"];
      settings = {
        main = {
          capslock = "backspace";
          rightalt = "layer(rightalt)";
        };

        rightalt = {
          e = "esc";
        };
      };
    };
  };
}
