{
  programs.nixvim.extraConfigLuaPre = ''vim.g.mapleader = " "'';

  programs.nixvim.keymaps = [
    {
      action = "<cmd>NvimTreeToggle<cr>";
      key = "<leader>e";
    }

    {
      action = "<cmd>TroubleToggle<cr>";
      key = "<leader>r";
    }

    {
      action = "<cmd>Telescope live_grep<cr>";
      key = "<leader>/";
    }

    {
      action = "<cmd>Telescope find_files<cr>";
      key = "<leader>f";
    }

    {
      action = "<cmd>lua require('dap').continue() <cr>";
      key = "<leader>l";
    }

    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Toggle Breakpoint";
      };
    }

    {
      mode = "n";
      key = "<leader>di";
      action = "<cmd>lua require('dap').step_into()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Step Into";
      };
    }

    {
      mode = "n";
      key = "<leader>do";
      action = "<cmd>lua require('dap').step_out()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Step Out";
      };
    }

    {
      mode = "n";
      key = "<leader>dr";
      action = "<cmd>lua function() require('dap').repl.open()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Repl";
      };
    }
  ];
}
