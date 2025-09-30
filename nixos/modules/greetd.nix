{pkgs, ...}: {
  services.greetd = {
    enable = false;
  };

  programs.regreet = {
    enable = false;

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    cursorTheme = {
      package = pkgs.graphite-cursors;
      name = "graphite-dark-nord";
    };
  };
}
