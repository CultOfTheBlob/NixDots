{pkgs, ...}: {
  services.hardware.openrgb = {
    enable = true;

    package = pkgs.openrgb-with-all-plugins;

    motherboard = "amd";
  };

  systemd.services.openrgb-resume = {
    description = "Reapply OpenRGB settings on resume";
    wantedBy = [
      "graphical.target"
      "suspend.target"
      "hibernate.target"
      "hybrid-sleep.target"
    ];

    after = [
      "graphical.target"
      "suspend.target"
      "hibernate.target"
      "hybrid-sleep.target"
    ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c 'sleep 3; ${pkgs.openrgb-with-all-plugins}/bin/openrgb --mode static --color 0169FB'";
    };
  };
}
