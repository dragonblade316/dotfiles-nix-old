{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "dragonblade316";
    userEmail = "dragonblade316@yahoo.com";
    extraConfig = {
      credential.helper = "${
        pkgs.git.override {withLibsecret = true;}
      }/bin/git-credential-libsecret";
    };
  };

  #add github cli here
  # programs.gh = {
  # 	enable = true;
  # };

  #ngl I kinda hate that this works but the above does not. I should probably fix it but it does not matter now
  home.packages = with pkgs; [
    gh
  ];
}
