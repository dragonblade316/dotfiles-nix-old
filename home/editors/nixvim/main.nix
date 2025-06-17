{
  programs.nixvim.plugins = {
    better-escape = {
      enable = true;
    };

    nvim-autopairs = {
      enable = true;
    };

    treesitter = {
      enable = true;
    };

    auto-save = {
      enable = true;
      enableAutoSave = true;
    };
  };
}
