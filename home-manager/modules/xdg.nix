{pkgs, ...}: {
  xdg = {
    mimeApps = {
      enable = true;

      defaultApplications = {
        "inode/directory" = ["org.kde.dolphin.desktop"];

        "text/html" = ["zen.desktop"];
        "x-scheme-handler/http" = ["zen.desktop"];
        "x-scheme-handler/https" = ["zen.desktop"];
        "x-scheme-handler/about" = ["zen.desktop"];
        "x-scheme-handler/unknown" = ["zen.desktop"];

        "text/plain" = ["neovide.desktop"];
        "text/markdown" = ["neovide.desktop"];
        "application/json" = ["neovide.desktop"];

        "application/pdf" = ["org.kde.okular.desktop"];

        "image/png" = ["org.xfce.ristretto.desktop"];
        "image/jpeg" = ["org.xfce.ristretto.desktop"];
        "image/webp" = ["org.xfce.ristretto.desktop"];
        "image/gif" = ["org.xfce.ristretto.desktop"];
        "image/svg+xml" = ["org.xfce.ristretto.desktop"];

        "video/mp4" = ["mpv.desktop"];
        "video/x-matroska" = ["mpv.desktop"];
        "audio/mpeg" = ["mpv.desktop"];
      };
    };

    portal = {
      enable = true;

      extraPortals = [
        pkgs.kdePackages.xdg-desktop-portal-kde
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];

      config = {
        common = {
          default = ["gnome" "gtk"];
        };

        niri = {
          default = ["gnome" "gtk"];
          "org.freedesktop.impl.portal.FileChooser" = ["kde"];
        };
      };
    };
  };
}
