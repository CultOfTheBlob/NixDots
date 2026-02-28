{
  hardware = {
    graphics = {
      enable = true;

      enable32Bit = true;
    };

    i2c.enable = true;

    xpadneo.enable = true;
  };

  services.xserver.videoDrivers = ["amdgpu"];
}
