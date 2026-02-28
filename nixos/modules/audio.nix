{
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse = {
      enable = true;
    };

    jack = {
      enable = true;
    };

    extraConfig.pipewire."10-defaults" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.allowed-rates" = [48000 44100];
      };
    };
  };
}
