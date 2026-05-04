{config, ...}: {
  programs.niri.settings.layout = with config.colors; {
    border = {
      enable = true;

      width = 2;
      active = {
        gradient = {
          from = "#${base0D}";
          to = "#${base07}";
          angle = 45;
          relative-to = "window";
        };
      };
      inactive = {
        gradient = {
          from = "#${base01}";
          to = "#${base02}";
          angle = 45;
          relative-to = "window";
        };
      };

      urgent = {
        gradient = {
          from = "#${base08}";
          to = "#${base09}";
          angle = 45;
          relative-to = "window";
        };
      };
    };

    focus-ring.enable = false;

    shadow = {
      enable = true;

      color = "#${base00}60";

      offset = {
        x = 4;
        y = 4;
      };

      softness = 32;
      spread = 4;
    };

    background-color = "transparent";

    always-center-single-column = true;
    center-focused-column = "on-overflow";
    default-column-width.proportion = 1.0;

    gaps = 4;

    struts = {
      bottom = 6;
      left = 6;
      right = 6;
      top = 6;
    };
  };
}
