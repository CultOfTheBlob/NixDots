{pkgs, ...}: {
  gtk = {
    enable = true;

    colorScheme = "dark";

    theme = {
      package = pkgs.nordic;
      name = "Nordic-bluish-accent";
    };

    iconTheme = {
      package = pkgs.nordzy-icon-theme;
      name = "Nordzy-dark";
    };
  };
}
