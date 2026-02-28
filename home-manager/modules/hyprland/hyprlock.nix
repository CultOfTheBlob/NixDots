{
  pkgs,
  config,
  user,
  ...
}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        ignore_empty_input = true;
      };

      background = [
        {
          path = "/home/${user}/.nix/home-manager/modules/assets/wallpaper.png";

          blur_size = 8;
          blur_passes = 2;
          noise = 0.01;
          contrast = 1.2;
          brightness = 0.6;
          vibrancy = 0.2;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          monitor = "DP-1";
          size = "300, 60";
          rounding = 20;
          outline_thickness = 2;
          dots_size = 0.40;
          dots_spacing = 0.25;
          dots_center = true;
          dots_rounding = 4;
          outer_color = "rgb(${config.colors.base0D})";
          inner_color = "rgb(${config.colors.base00})";
          font_color = "rgb(${config.colors.base0D})";
          fade_on_empty = true;
          placeholder_text = "<i>Password...</i>";
          position = "0, 80";
          halign = "center";
          valign = "bottom";
          shadow_passes = 1;
          shadow_color = "rgb(${config.colors.base01})";
        }
      ];

      label = [
        {
          monitor = "DP-1";
          text = "cmd[update:18000000] echo '<b> '$(date +'%A, %-d %B %Y')' </b>'";
          color = "rgb(${config.colors.base0D})";
          font_size = 34;
          font_family = "JetBrains Mono Nerd Font 10";
          position = "0, -100";
          halign = "center";
          valign = "center";
          shadow_passes = 1;
          shadow_color = "rgb(${config.colors.base01})";
        }
        {
          monitor = "DP-1";
          text = "cmd[update:1000] echo ''$(date +'%I')''";
          color = "rgb(${config.colors.base0D})";
          font_size = 150;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "-160, -250";
          halign = "center";
          valign = "center";
          shadow_passes = 1;
          shadow_color = "rgb(${config.colors.base01})";
        }
        {
          monitor = "DP-1";
          text = "cmd[update:1000] echo ''$(date +'%M')''";
          color = "rgb(${config.colors.base0D})";
          font_size = 150;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "160, -250";
          halign = "center";
          valign = "center";
          shadow_passes = 1;
          shadow_color = "rgb(${config.colors.base01})";
        }
        {
          monitor = "DP-1";
          text = "cmd[update:1000] echo ''$(date +'%S %p')''";
          color = "rgb(${config.colors.base0D})";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -330";
          halign = "center";
          valign = "center";
          shadow_passes = 1;
          shadow_color = "rgb(${config.colors.base01})";
        }

        {
          monitor = "DP-1";
          text = "This is exhilirating! Get excited!";
          color = "rgb(${config.colors.base0D})";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font Mono";
          position = "0, -45";
          halign = "center";
          valign = "top";
          shadow_passes = 1;
          shadow_color = "rgb(${config.colors.base0D})";
          shadow_size = 1;
          shadow_boost = 0.8;
        }
      ];

      shape = [
        {
          monitor = "DP-1";
          size = "1000, 40";
          color = "rgba(${config.colors.base00}50)";
          rounding = 20;
          border_size = 2;
          border_color = "rgb(${config.colors.base0D})";
          position = "0, -40";
          halign = "center";
          valign = "top";
          shadow_passes = 1;
          shadow_color = "rgb(${config.colors.base01})";
          zindex = -1;
        }
      ];
    };
  };
}
