{
  programs.starship = {
    enable = true;
    settings = {
      #for some reason $all added a newline to the format but this does not
      format = "╭╴$directory$git_status$git_branch$rust$python$c$java$kotlin$lua$battery\n╰─$character";

      character = {
        success_symbol = "[](bright-green)";
        error_symbol = "[](bright-red)";
      };

      username = {
        style_user = "white bold";
        style_root = "black bold";
        format = "[$user]($style) ";
        disabled = true; # disable in powershell
        show_always = false;
      };

      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        home_symbol = "drago";
        read_only_style = "197";
        read_only = "  ";
        format = "at [$path]($style)[$read_only]($read_only_style) ";
      };

      git_branch = {
        format = "on [$symbol$branch]($style) ";
        #truncation_length = 4;
        truncation_symbol = "…/";
        style = "bold green";
      };

      git_status = {
        format = ''[\($all_status$ahead_behind\)]($style) '';
        style = "bold green";
        conflicted = "🏳";
        up_to_date = " ";
        untracked = " ";
        #ahead = "⇡${count}";
        #diverged = "⇕⇡${ahead_count}⇣${behind_count}";
        #behind = "⇣${count}";
        stashed = " ";
        modified = " ";
        staged = ''✓'';
        renamed = "󰑕 ";
        deleted = " ";
      };

      python = {
        symbol = " ";
        python_binary = "python3";
      };

      rust = {
        format = ''via ["🦀" $version $toolchain](red bold)'';
      };

      c = {
        symbol = "C/C++ ";
        detect_extensions = ["c" "cpp" "cxx" "h" "hpp" "hxx"];
      };

      battery = {
        format = ''[$symbol$percentage]\n($style)'';
      };
    };
  };
}
