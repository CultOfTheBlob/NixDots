{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        inhibit_sleep = 3;
      };

      listener = [
        {
          timeout = 600;
          on-timeout = ''
            kitty +kitten panel --edge=center --layer=overlay --focus-policy=exclusive --output-name=DP-1 -- drift --scene orrery --theme nord
          '';
          on-resume = "pkill -f 'drift'";
        }
        {
          timeout = 600;
          on-timeout = ''
            kitty +kitten panel --edge=center --layer=overlay --focus-policy=exclusive --output-name=DP-2 -- drift --scene rain --theme nord
          '';
          on-resume = "pkill -f 'drift'";
        }
        {
          timeout = 600;
          on-timeout = "hyprctl keyword cursor:inactive_timeout 1";
          on-resume = "hyprctl keyword cursor:inactive_timeout 0";
        }
        {
          timeout = 1200;
          on-timeout = "systemctl hybrid-sleep";
        }
      ];
    };
  };
}
