{pkgs, ...}: {
  xdg = {
    portal = {
      enable = true;

      xdgOpenUsePortal = true;

      config = {
        niri = {
          default = ["gnome"];
          "org.freedesktop.impl.portal.fileChooser" = ["kde"];
        };
      };

      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];

      configPackages = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };
  };
}
