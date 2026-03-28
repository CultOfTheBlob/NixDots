{
  pkgs,
  config,
  ...
}: {
  gtk = {
    enable = true;

    gtk4.theme = config.gtk.theme;

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
