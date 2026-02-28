{pkgs, ...}: {
  programs.mpv = {
    enable = true;

    package = pkgs.mpv.override {
      scripts = with pkgs.mpvScripts; [
        uosc
        sponsorblock
        thumbfast
      ];
    };
  };
}
