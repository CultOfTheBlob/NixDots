{config, ...}: let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;

    font = "JetBrainsMono Nerd Font";
    location = "center";
    terminal = "kitty";

    extraConfig = {
      display-drun = "Applications:";
      display-window = "Windows:";
      display-ssh = "Connect:";

      drun-display-format = "{icon} {name}";
    };

    modes = [
      "drun"
      "window"
      "ssh"
    ];

    theme = with config.colors; {
      "*" = {
        spacing = 5;
        border = 0;
      };

      "window" = {
        padding = 10;
        border = 2;
        border-radius = 8;
        background-color = mkLiteral "#${base00}";
        border-color = mkLiteral "#${base0D}";
      };

      "mainbox" = {
        padding = 5;
        background-color = mkLiteral "#${base00}";
      };

      "inputbar" = {
        padding = 10;
        border = 0;
        border-radius = 8;
        background-color = mkLiteral "#${base00}";
        text-color = mkLiteral "#${base04}";
        children = [
          "prompt"
          "entry"
        ];
      };

      "entry" = {
        placeholder = "Search...";
        background-color = mkLiteral "#${base00}";
        placeholder-color = mkLiteral "#${base04}";
        text-color = mkLiteral "#${base04}";
        cursor = "text";
      };

      "listview" = {
        padding = 10;
        spacing = 4;
        scrollbar = true;
        background-color = mkLiteral "#${base00}";
      };

      "element" = {
        padding = 2;
        cursor = "pointer";
        border = 0;
        border-radius = 4;
      };

      "element normal.normal" = {
        background-color = mkLiteral "#${base00}";
        text-color = mkLiteral "#${base04}";
      };

      "element selected.normal" = {
        background-color = mkLiteral "#${base0D}";
        text-color = mkLiteral "#${base0E}";
      };

      "element alternate.normal" = {
        background-color = mkLiteral "#${base00}";
        text-color = mkLiteral "#${base04}";
      };

      "element normal.active" = {
        background-color = mkLiteral "#${base0E}";
        text-color = mkLiteral "#${base0E}";
      };

      "element selected.active" = {
        background-color = mkLiteral "#${base0E}";
        text-color = mkLiteral "#${base0E}";
      };

      "element alternate.active" = {
        background-color = mkLiteral "#${base0E}";
        text-color = mkLiteral "#${base0E}";
      };

      "element-text" = {
        background-color = mkLiteral "#${base00}";
        text-color = mkLiteral "inherit";
      };

      "element-icon" = {
        size = mkLiteral "1.5em";
        margin = mkLiteral "0.25em";
        background-color = mkLiteral "#${base00}";
        text-color = "inherit";
      };

      "scrollbar" = {
        background-color = mkLiteral "#${base00}";
        handle-color = mkLiteral "#${base01}";
        handle-width = 8;
        width = 4;
        border = 0;
      };

      "prompt" = {
        background-color = mkLiteral "#${base00}";
        text-color = mkLiteral "#${base0A}";
      };

      "textbox-prompt-colon" = {
        str = ":";
        margin = mkLiteral "0 0.3em 0 0";
        text-color = mkLiteral "inherit";
      };
    };
  };
}
