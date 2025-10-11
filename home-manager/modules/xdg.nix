{pkgs, ...}: {
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
      configPackages = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
  };
}
