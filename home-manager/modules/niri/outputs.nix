{
  programs.niri.settings.outputs = {
    "DP-1" = {
      enable = true;
      focus-at-startup = true;

      mode = {
        width = 3440;
        height = 1440;
        refresh = 165.0;
      };

      position = {
        x = 1440;
        y = 630;
      };

      transform = {
        rotation = 0;
      };
    };

    "DP-2" = {
      enable = true;

      mode = {
        width = 2560;
        height = 1440;
        refresh = 165.0;
      };

      position = {
        x = 0;
        y = 0;
      };

      transform = {
        rotation = 270;
      };
    };
  };
}
