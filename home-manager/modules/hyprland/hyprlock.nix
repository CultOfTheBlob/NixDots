{
  config,
  user,
  ...
}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        grace = 1;
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
          size = "300, 60";
          rounding = 20;
          outline_thickness = 3;
          dots_size = 0.33;
          dots_spacing = 0.25;
          dots_center = true;
          dots_rounding = 4;
          outer_color = "rgb(${config.colors.base09})";
          inner_color = "rgb(${config.colors.base00})";
          font_color = "rgb(${config.colors.base09})";
          fade_on_empty = true;
          placeholder_text = "<i>Password...</i>";

          position = "0, 80";
          halign = "center";
          valign = "bottom";
        }
      ];

      label = [
        # Date
        {
          text = "cmd[update:18000000] echo '<b> '$(date +'%A, %-d %B %Y')' </b>'";
          color = "rgb(${config.colors.base09})";
          font_size = 34;
          font_family = "JetBrains Mono Nerd Font 10";
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
        # Hour-Time
        {
          text = "cmd[update:1000] echo ''$(date +'%I')''";
          color = "rgb(${config.colors.base09})";
          font_size = 150;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "-160, -250";
          halign = "center";
          valign = "center";
        }
        # Minute-Time
        {
          text = "cmd[update:1000] echo ''$(date +'%M')''";
          color = "rgb(${config.colors.base09})";
          font_size = 150;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "160, -250";
          halign = "center";
          valign = "center";
        }
        # Seconds-Time
        {
          text = "cmd[update:1000] echo ''$(date +'%S %p')''";
          color = "rgb(${config.colors.base09})";
          font_size = 20;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -330";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
