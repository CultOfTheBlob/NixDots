{pkgs, ...}: {
  xdg = {
    menus.enable = true;
    mime.enable = true;
  };

  environment.etc."xdg/menus/applications.menu".text =
    builtins.readFile
    "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
}
