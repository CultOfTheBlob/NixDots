{
  programs.devenv = {
    enable = true;

    enableNushellIntegration = true;

    settings = {
      version = 1;

      shell = {
        prompt_prefix = false;
      };

      tui = {
        viewport = "inline";
        theme = {
          preset = "none";
          palette = {
            nord0 = "#2E3440";
            nord1 = "#3B4252";
            nord2 = "#434C5E";
            nord3 = "#4C566A";
            nord4 = "#D8DEE9";
            nord5 = "#E5E9F0";
            nord6 = "#ECEFF4";
            nord7 = "#8FBCBB";
            nord8 = "#88C0D0";
            nord9 = "#81A1C1";
            nord10 = "#5E81AC";
            nord11 = "#BF616A";
            nord12 = "#D08770";
            nord13 = "#EBCB8B";
            nord14 = "#A3BE8C";
            nord15 = "#B48EAD";
          };
          styles = {
            statusline = {
              foreground = "nord4";
              background = "nord0";
            };
            "statusline.separator" = {
              foreground = "nord3";
            };
            "statusline.project" = {
              foreground = "nord8";
              modifiers = [ "bold" ];
            };
            "statusline.profiles" = {
              foreground = "nord14";
              modifiers = [ "bold" ];
            };
            "statusline.summary" = {
              foreground = "nord7";
            };
            "statusline.elapsed" = {
              foreground = "nord3";
            };
            "statusline.key_hints" = {
              foreground = "nord13";
            };
          };
        };
        statusline = {
          enabled = false;
        };
        keybindings = {
          sequence_timeout_ms = 750;
          logs = {
            top = [ "g g" ];
            bottom = [ "g e" ];
          };
        };
        behavior = {
          mouse = true;
          follow_logs = true;
          hide_stopped_processes = false;
          log_preview_lines = 12;
          log_history_lines = 10000;
        };
      };
    };
  };
}
