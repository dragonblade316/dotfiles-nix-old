{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
    };

    cmp-nvim-lsp = {
      enable = true;
    };

    cmp-treesitter = {
      enable = true;
    };

    cmp-tabnine = {
      enable = true;
    };

    cmp-buffer = {
      enable = true;
    };

    cmp-dap = {
      enable = true;
    };
  };
}
