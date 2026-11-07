{ pkgs, ... }: {
  hardware = {
    graphics = {
      enable = true;

      enable32Bit = true;

      extraPackages = with pkgs; [
        mesa.opencl
      ];
    };

    i2c.enable = true;

    xpadneo.enable = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
