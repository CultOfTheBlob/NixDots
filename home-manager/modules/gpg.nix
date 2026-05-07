{pkgs, ...}: {
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;

    enableSshSupport = false;
    pinentry.package = pkgs.pinentry-curses;
  };
}
