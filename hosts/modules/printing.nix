{
  services.printing = {
    enable = true;
    openFirewall = true;
    listenAddresses = ["*:631"];
    allowFrom = ["all"];
    browsing = true;
    defaultShared = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };
}
