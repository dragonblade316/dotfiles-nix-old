{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    #  extentions = with pkgs.vscode-extensions; [
    #    rust-lang.rust-analyzer
    # vscodevim.vim
    # yzhang.markdown-all-in-one
    #  ];
  };
}
