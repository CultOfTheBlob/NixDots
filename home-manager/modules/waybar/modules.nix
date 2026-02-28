{pkgs, ...}: {
  programs.waybar = {
    settings = {
      mainBar = {
        "clock" = {
          interval = 1;
          format = "{:%I:%M:%S %p | %a❮%d❯, %b❮%m❯, %Y}";
          on-click = "pypr toggle clock";
          on-click-right = "pypr toggle cal";
          tooltip = false;
        };

        "cpu" = {
          format = "{usage}%󰍛";
          interval = 1;
          min-length = 5;
          on-click = "pypr toggle proc";
        };

        "memory" = {
          interval = 10;
          format = "{percentage}%󰾆";
          on-click = "pypr toggle mem";
          tooltip = true;
          tooltip-format = "{used:0.1f}GB/{total:0.1f}G";
        };

        "disk" = {
          interval = 30;
          path = "/";
          on-click = "pypr toggle mem";
          format = "{percentage_used}%󰋊";
          tooltip = true;
          tooltip-format = "{used} used out of {total} on {path} ({percentage_used}%)";
        };

        "temperature" = {
          interval = 10;
          tooltip = true;
          on-click = "pypr toggle cpu";
          hwmon-path = [
            "/sys/class/hwmon/hwmon1/temp1_input"
            "/sys/clasas/thermal/thermal_zone0/temp"
          ];
          critical-threshold = 82;
          format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = [
            "󰈸"
          ];
        };

        "tray" = {
          icon-size = 20;
          spacing = 4;
        };

        "mpris" = {
          interval = 10;
          format = "{player_icon}";
          format-paused = "{status_icon}<i>{dynamic}</i>";
          on-click-middle = "playerctl play-pause";
          on-click = "playerctl previous";
          on-click-right = "playerctl next";
          scroll-step = 5.0;
          on-scroll-up = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
          smooth-scrolling-threshold = 1;
          player-icons = {
            chromium = "";
            default = "";
            firefox = "";
            kdeconnect = "";
            mopidy = "";
            mpv = "󰐹";
            spotify = "";
            vlc = "󰕼";
          };
          status-icons = {
            paused = "󰐎";
            playing = "";
            stopped = "";
          };
          max-length = 30;
        };

        "cava" = {
          framerate = 30;
          autosens = 1;
          sensitivity = 1;
          bars = 16;
          stb = "low";
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          method = "pulse";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          noise_reduction = 0.77;
          input_delay = 2;
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          actions = {
            on-click-right = "mode";
          };
        };

        "network#speed" = {
          interval = 1;
          format = "{ifname}";
          on-click = "pypr toggle net";
          format-wifi = "{icon}{bandwidthUpBytes} {bandwidthDownBytes}";
          format-ethernet = "󰌘{bandwidthUpBytes} {bandwidthDownBytes}";
          format-disconnected = "󰌙";
          tooltip-format = "{ipaddr}";
          format-linked = "󰈁{ifname} (No IP)";
          tooltip-format-wifi = "{essid} {icon} {signalStrength}%";
          tooltip-format-ethernet = "{ifname}󰌘";
          tooltip-format-disconnected = "󰌙disconnected";
          min-length = 24;
          max-length = 24;
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
        };

        "pulseaudio" = {
          format = "{icon}{volume}%";
          format-bluetoot = "{icon}󰂰{volume}%";
          format-muted = "󰖁";
          format-icons = {
            eadphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              "󰕾"
              ""
            ];
            ignored-sinks = [
              "easy effects sink"
            ];
          };
          scroll-step = 5.0;
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-right = "${pkgs.pavucontrol}/bin/pavucontrol -t 3";
          on-scroll-up = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
          tooltip-format = "{icon} {desc} | {volume}%";
          smooth-scrolling-threshold = 1;
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "{volume}%";
          format-source-muted = "";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          on-click-right = "pavucontrol -t 4";
          on-scroll-up = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SOURCE@ 5%+";
          on-scroll-down = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SOURCE@ 5%-";
          tooltip-format = "{source_desc} | {source_volume}%";
          scroll-step = 5;
        };

        "custom/menu" = {
          format = "";
          on-click = "pkill rofi || rofi -show drun -show-icons";
          tooltip = true;
          tooltip-format = "left click: rofi menu";
        };

        "custom/power" = {
          format = "⏻";
          on-click = "pkill wlogout || wlogout --buttons-per-row 6 --primary-monitor DP-1";
          tooltip = true;
          tooltip-format = "left click: logout menu";
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          sort-by-number = true;
          show-special = false;
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          format = "{icon} {windows}";
          format-window-separator = " ";
          window-rewrite-default = "";
          window-rewrite = {
            "title<.*picture-in-picture.*>" = "";
            "class<floorp>" = "";
            "class<Element>" = "󰵅";
            "class<org.prismlauncher.PrismLauncher>" = "󰍳";
            "class<org.godotengine.*>" = "";
            "class<kitty>" = "";
            "title<nv>" = "󰅩";
            "class<blender>" = "";
            "class<[ss]potify>" = "";
            "class<org.kde.dolphin>" = "󰝰";
            "title<yazi>" = "";
            "title<Yazi: .*>" = "";
            "class<discord|[ww]ebcord|vesktop|legcord>" = "";
            "class<mpv>" = "";
            "class<obsidian>" = "";
            "class<com.obsproject.studio>" = "";
            "class<steam>" = "󰓓";
          };
        };

        "group/mobo_drawer" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            children-class = "cpu";
            transition-left-to-right = true;
          };
          modules = [
            "cpu"
            "memory"
            "disk"
            "temperature"
          ];
        };

        "custom/separator#dot-line" = {
          format = "";
          interval = "once";
          tooltip = false;
        };

        "custom/separator#blank" = {
          format = "";
          interval = "once";
          tooltip = false;
        };
      };
    };
  };
}
