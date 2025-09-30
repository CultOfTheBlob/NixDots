{
  pkgs,
  user,
  ...
}: {
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";

    image = ./assets/wallpaper.png;

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
        name = "DejaVu Serif";
      };
    };

    targets = {
      gtk.enable = false;
      nvf.enable = false;
      rofi.enable = false;
      hyprlock.enable = false;
      waybar.enable = false;

      firefox = {profileNames = [user];};
      floorp = {profileNames = [user];};
    };
  };
}
