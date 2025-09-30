{user, ...}: let
  assets = "/home/${user}/.nix/home-manager/modules/assets/wlogout/";
in {
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "Lock";
        action = "pidof hyprlock || hyprlock -q";
        text = "";
        keybind = "enter";
      }
      {
        label = "Reboot";
        action = "systemctl reboot";
        text = "";
        keybind = "r";
      }
      {
        label = "Shutdown";
        action = "systemctl poweroff";
        text = "";
        keybind = "p";
      }
      {
        label = "Logout";
        action = "uwsm stop -r hyprland-uwsm";
        text = "";
        keybind = "l";
      }
      {
        label = "Suspend";
        action = "systemctl hybrid-sleep";
        text = "";
        keybind = "s";
      }
      {
        label = "Hibernate";
        action = "systemctl hibernate";
        text = "";
        keybind = "h";
      }
    ];

    style =
      /*
      css
      */
      ''
        * {
          font-family: JetBrainsMono Nerd Font Mono;
          font-size: 24px;
          transition-duration: 0.7s;
        }

        window {
          background-color: rgba(46, 52, 64, 0.5);
        }

        button {
          border-radius: 20px;
          margin: 10px;
          color: @inverse_surface;
          border-color: @inverse_surface;
          background-color: rgba(59, 66, 82, 0.5);
          outline-style: none;
          border-style: solid;
          border-width: 0px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 20%;
          box-shadow: 0 0 12px 2px rgba(59, 66, 82, 0.6);
          text-shadow: none;
          animation: gradient_f 20s ease-in infinite;
          transition: box-shadow 0.75s ease;
        }

        button:hover,
        button:focus {
          background-color: rgb(129, 161, 193);
          background-size: 30%;
          box-shadow: 0 0 12px 2px rgba(129, 161, 193, 0.6);
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.75s cubic-bezier(.55,0.0,.28,1.682);
        }

        button span {
          font-size: 1.2em;
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
