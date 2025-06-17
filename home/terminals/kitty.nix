{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 10000;
      confirm_os_window_close = 0;
    };
  };
}
