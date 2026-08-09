{pkgs, ...}: {
  xdg = {
    menus.enable = true;
    mime.enable = true;

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

  environment.etc."xdg/menus/applications.menu".text =
    builtins.readFile
    "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
}
