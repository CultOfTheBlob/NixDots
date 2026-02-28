{pkgs, ...}: {
  stylix = {
    enable = true;

    autoEnable = false;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";

    image = ./assets/bootWallpaper.png;

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
      console.enable = true;
      grub.enable = true;
      grub.useWallpaper = true;
    };
  };
}
