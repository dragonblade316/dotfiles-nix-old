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
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  #
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  networking.hostName = "thomeserver"; # Define your hostname.

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22 9000 9001 3000 3001 9993 9393];
    allowedUDPPorts = [22 9000 3000 9993 9393];
  };

  services.udisks2.enable = true;

  fileSystems."/mnt/laptop" = {
    device = "/dev/sdc3";
    fsType = "ntfs";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
    ];
  };

  users.users.kim = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };

  # users.users.public = {
  # 	#not a security concern bc I dont have port forwarding. screw you Idaho internet (also the user cant do much either way)
  # 	password = "password";
  #samba for file sharing
  services.samba.enable = true;
  services.samba.openFirewall = true;
  services.samba.shares = {
    public = {
      path = "/srv/public";
      "read only" = false;
      browseable = "yes";
      "guest ok" = "no";
      comment = "networkwide file sharing";
    };
    laptop = {
      path = "/mnt/laptop";
      "read only" = true;
      browseable = "yes";
      "guest ok" = "yes";
      comment = "networkwide file sharing";
    };
  };

  virtualisation.docker = {
    enable = true;
  };

  services.zerotierone = {
    enable = true;
    port = 9393;
    joinNetworks = [
      "71ece4c16734cd90" #orion network
      "60ee7c034a0e57ba" #mainnet
    ];
  };

  services.openssh.enable = true;
}
