{pkgs, ...}: {
  programs.nixvim.plugins.dap = {
    enable = true;
    signs = {
      dapBreakpoint = {
        text = "●";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "●";
        texthl = "DapBreakpointCondition";
      };
      dapLogPoint = {
        text = "◆";
        texthl = "DapLogPoint";
      };
    };
    extensions = {
      dap-python = {
        enable = true;
      };
      dap-ui = {
        enable = true;
        floating.mappings = {
          close = ["<ESC>" "q"];
        };
      };
      dap-virtual-text = {
        enable = true;
      };
    };
    configurations = {
      java = [
        {
          type = "java";
          request = "launch";
          name = "Debug (Attach) - Remote";
          hostName = "127.0.0.1";
          port = 5005;
        }
      ];

      #will be useful later
      c = [
        {
          type = "gdb";
          request = "launch";
          name = "qemu";
          MIMode = "gdb";
          miDebuggerServerAddress = "localhost:1234";
          miDebuggerPath = "${pkgs.gdb}/bin/gdb";
          hostName = "127.0.0.1";
          port = 1234;
        }
      ];
    };

    adapters = {
      executables = {
        # lldb = {
        # 	command = "${pkgs.lldb_18}/bin/lldb-vscode";
        # };
        gdb = {
          command = "${pkgs.vscode-extensions.ms-vscode.cpptools}/share/vscode/extensions/ms-vscode.cpptools/debugAdapters/bin/OpenDebugAD7";
        };
      };
    };
  };
}
