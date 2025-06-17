{
  imports = [
    ./main.nix
    ./cmp.nix
    ./styling.nix
    ./keymaps.nix
    ./dap.nix
  ];

  programs.nixvim = {
    enable = true;

    globalOpts = {
      number = true;

      tabstop = 2;
      shiftwidth = 2;
      signcolumn = "yes";
      # softtabstop = 0;
      # expandtab = true;
      # smarttab = true;
      #
      clipboard = "unnamedplus";
    };

    plugins = {
      dashboard = {
        enable = true;
      };

      trouble = {
        enable = true;
      };

      # #tree
      nvim-tree = {
        enable = true;
      };

      lsp = {
        enable = true;
        servers = {
          # Python
          pyright.enable = true;

          # Markdown
          marksman.enable = true;

          # Nix
          nil_ls.enable = true;

          # Docker
          dockerls.enable = true;

          # Bash
          bashls.enable = true;

          # C/C++
          clangd.enable = true;

          # Lua
          lua-ls = {
            enable = true;
            settings.telemetry.enable = false;
          };

          # Rust
          rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
        };
      };

      telescope = {
        enable = true;
      };
    };
  };
}
