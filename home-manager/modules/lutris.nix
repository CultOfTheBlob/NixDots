{pkgs, ...}: {
  programs.lutris = {
    enable = false;

    steamPackage = pkgs.steam;

    extraPackages = with pkgs; [
      winetricks
    ];

    protonPackages = [
      pkgs.proton-ge-bin
    ];

    winePackages = [
      pkgs.wineWow64Packages.full
    ];
  };
}
