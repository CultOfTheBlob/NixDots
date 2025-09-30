{pkgs, ...}: {
  home.pointerCursor = {
    enable = true;

    x11.enable = true;
    gtk.enable = true;
    dotIcons.enable = true;
    hyprcursor.enable = true;

    package = pkgs.graphite-cursors;
    name = "graphite-dark-nord";
    size = 16;
  };
}
