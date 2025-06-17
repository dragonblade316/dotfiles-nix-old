{
  config,
  pkgs,
  lib,
  self,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "dragonblade316"; # Define your hostname.

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [53317 631];
    allowedUDPPorts = [53317 631];
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.defaultSession = "hyprland";

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  services.printing = {
    listenAddresses = ["*:631"];
    allowFrom = ["all"];
    browsing = true;
    defaultShared = true;
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };

  services.udev.packages = [pkgs.mixxx];

  #<nvidia>
  # Make sure opengl is enabled
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # NVIDIA drivers are unfree.
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
    ];

  # Tell Xorg to use the nvidia driver
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is needed for most wayland compositors
    modesetting.enable = true;

    # Use the open source version of the kernel module
    # Only available on driver 515.43.04+
    # The default is true but I'm changing it to false so reverse prime sync works
    open = true;

    # Enable the nvidia settings menu
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.production;
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.nvidia.prime = {
    #reverseSync.enable = true;
    sync.enable = true;
    offload = {
      enable = false;
      enableOffloadCmd = false;
    };

    amdgpuBusId = "PCI:6:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  #</nvidia>

  programs.hyprland = {
    # or wayland.windowManager.hyprland
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = true;
  };

  services.blueman.enable = true;

  services.flatpak.enable = true;
}
