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

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.crashDump.enable = true;

  # Enable all sysrq functions (useful to recover from some issues):
  boot.kernel.sysctl."kernel.sysrq" = 1; # NixOS default: 16 (only the sync command)
  # Documentation: https://www.kernel.org/doc/html/latest/admin-guide/sysrq.html

  networking.hostName = "halcyon"; # Define your hostname.

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22 9000 9001 3000 25565];
    allowedUDPPorts = [22 9000 3000 9993 25565];
  };

  services.logind.lidSwitchExternalPower = "ignore";

  #just in case I want to use this for cuda stuff
  hardware.nvidia = {
    # Modesetting is needed for most wayland compositors
    # modesetting.enable = true;

    # Use the open source version of the kernel module
    # Only available on driver 515.43.04+

    # open = true;
    #just going to try this to see if it fixes an issue
    open = false;

    # Enable the nvidia settings menu
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    # package = config.boot.kernelPackages.nvidiaPackages.production;
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # hardware.nvidia.prime = {
  #    #reverseSync.enable = true;
  #    sync.enable = true;
  #    offload = {
  #      enable = false;
  #      enableOffloadCmd = false;
  #    };
  #
  #    amdgpuBusId = "PCI:6:0:0";
  #    nvidiaBusId = "PCI:1:0:0";
  #  };
  #

  services.openssh.enable = true;
  virtualisation.docker.enable = true;
  # virtualisation.docker.enableNvidia = true;

  environment.systemPackages = [
    pkgs.openjdk8-bootstrap
  ];

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.headless = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.host.enableWebService = true;

  services.zerotierone = {
    enable = true;
    joinNetworks = [
      "71ece4c16734cd90" #orion network
      "60ee7c034a0e57ba" #mainnet
    ];
  };
}
