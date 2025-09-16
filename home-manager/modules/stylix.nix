{
  pkgs,
  user,
  ...
}: {
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    image = ./assets/stylixWallpaper.png;

    override = {
      base0D = "7aa2f7";
    };

    cursor = {
      package = pkgs.graphite-cursors;
      name = "graphite-dark";
      size = 16;
    };

    iconTheme = {
      enable = true;
      package = pkgs.fluent-icon-theme;
      dark = "Fluent-dark";
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "Dejavu Serif";
      };
    };

    targets = {
      qt.enable = true;
      nvf.enable = false;
      wofi.enable = false;
      hyprlock.enable = false;
      waybar.enable = false;

      firefox = {
        profileNames = [user];
      };
    };
  };
}
