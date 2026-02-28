{
  networking.networkmanager.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
}
