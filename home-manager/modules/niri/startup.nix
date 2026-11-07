{
  programs.niri.settings.spawn-at-startup = [
    { argv = [ "noctalia" ]; }
    {
      argv = [
        "steam"
        "-silent"
      ];
    }
  ];
}
