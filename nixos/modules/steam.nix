{pkgs, ...}: {
  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;

    gamescopeSession = {
      enable = true;

      args = [
        "--prefer-output DP-1"
        "--adaptive-sync"
        "--output-width 3440"
        "--output-height 1440"
        "--nested-refresh 180"
        "--mouse-sensitivity 2"
      ];
    };

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
