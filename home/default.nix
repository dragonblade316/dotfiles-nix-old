{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "dragonblade316";
    homeDirectory = "/home/dragonblade316/";
    stateVersion = "24.05";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  # options = {
  # 	laptop_mode = pkgs.lib.mkOption {
  # 		default = false;
  # 		type = with pkgs.lib.types; bool;
  # 		description = "certains things may change when using a laptop. this will handle that stuff";
  # 	};
  # };
}
