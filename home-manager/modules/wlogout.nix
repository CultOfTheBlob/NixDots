{
  config,
  user,
  ...
}: let
  assets = "/home/${user}/.nix/home-manager/modules/assets/wlogout/";
in {
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "Lock";
        action = "pidof hyprlock || hyprlock -q";
        text = "";
        keybind = "l";
      }
      {
        label = "Reboot";
        action = "systemctl reboot";
        text = "";
        keybind = "l";
      }
      {
        label = "Shutdown";
        action = "systemctl poweroff";
        text = "";
        keybind = "l";
      }
      {
        label = "Logout";
        action = "loginctl kill-session $XDG_SESSION_ID";
        text = "";
        keybind = "l";
      }
      {
        label = "Suspend";
        action = "systemctl hybrid-sleep";
        text = "";
        keybind = "l";
      }
      {
        label = "Hibernate";
        action = "systemctl hibernate";
        text = "";
        keybind = "l";
      }
    ];

    style =
      /*
      css
      */
      ''
        * {
          font-family: JetBrains Mono, Symbols Nerd Font;
          font-size: 24px;
          transition-duration: 0.7s;
        }

        window {
          background-color: #${config.colors.base00};
        }

        button {
          background-color: #${config.colors.base00};
          border-style: solid;
          border-radius: 25px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 15%;
          margin: 15px;
        }

        button:focus,
        button:active,
        button:hover {
          background-color: #${config.colors.base05};
          background-size: 20%;
        }

        #Shutdown {
            background-image: image(url("${assets}/shutdown.png"));
        }

        #Logout {
            background-image: image(url("${assets}/logout.png"));

        }

        #Reboot {
            background-image: image(url("${assets}/restart.png"));
        }

        #Lock {
            background-image: image(url("${assets}/lock.png"));
        }

        #Hibernate {
            background-image: image(url("${assets}/hibernate.png"));
        }

        #Suspend {
            background-image: image(url("${assets}/suspend.png"));
        }
      '';
  };
}
