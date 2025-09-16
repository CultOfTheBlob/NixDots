{
  # Enable the uinput module
  boot.kernelModules = ["uinput"];

  # Enable uinput
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = {};

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-id/usb-Keychron_Keychron_Link-if02-event-kbd"
          "/dev/input/by-id/usb-Keychron_Keychron_V6_Max-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
            caps a s d f j k l ; n p i o
          )

          (defvar
            tap-time 150
            hold-time 200
          )

          (defalias
            esc (tap-hold 1000 2000 esc caps)
            a (tap-hold $tap-time $hold-time a lsft)
            s (tap-hold $tap-time $hold-time s lalt)
            d (multi (tap-hold $tap-time $hold-time d lctl) (layer-while-held mod))
            f (tap-hold $tap-time $hold-time f lmet)
            j (tap-hold $tap-time $hold-time j lmet)
            k (multi (tap-hold $tap-time $hold-time k lctl) (layer-while-held mod))
            l (tap-hold $tap-time $hold-time l lalt)
            ; (tap-hold $tap-time $hold-time ; lsft)
          )

          (deflayer default
            @esc @a @s @d @f @j @k @l @; n p i o
          )

          (deflayer mod
            _ _ _ _ _ _ _ _ _ (unmod down) (unmod up) (unmod left) (unmod right)
          )
        '';
      };
    };
  };
}
