{
  programs.noctalia = {
    enable = true;

    settings = {
      audio = {
        enable_overdrive = true;
      };
      backdrop = {
        blur_intensity = 0.0;
        tint_intensity = 0.0;
      };
      bar = {
        default = {
          border_width = 1.0;
          end = [
            "notifications"
            "tray"
            "spacer-20"
            "audio_visualizer"
            "media"
            "spacer-20"
            "caffeine"
            "clipboard"
            "spacer-20"
            "bluetooth"
            "network"
            "spacer-20"
            "input_volume"
            "volume"
            "spacer-20"
            "session"
          ];
          font_family = "DejaVu Sans";
          start = [
            "workspaces"
            "spacer-20"
            "ram"
            "cpu"
            "network_rx"
            "network_tx"
          ];
          dead_zone = {
            actions = {
              middle = "panel-toggle control-center";
              right = "none";
            };
          };
          monitor = {
            DP-1 = {
              capsule = true;
              capsule_thickness = 0.72;
              contact_shadow = true;
              margin_ends = 40;
              padding = 16;
              widget_spacing = 10;
            };
            DP-2 = {
              enabled = false;
            };
          };
        };
      };
      bluetooth = {
        connect_when_enabled = true;
        connection_notifications = true;
      };
      control_center = {
        hidden_tabs = [
          "media"
          "audio"
          "monitor"
          "system"
          "power"
          "network"
          "bluetooth"
          "weather"
          "calendar"
          "notifications"
          "screen-time"
        ];
        shortcuts = [ ];
        show_session_button = false;
        show_shortcut_labels = false;
        sidebar = "none";
        sidebar_section = "none";
      };
      desktop_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [ ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget = {
        };
      };
      dock = {
        background_opacity = 1.0;
      };
      idle = {
        behavior_order = [
          "Screensaver DP-1"
          "Screensaver DP-2"
        ];
        pre_action_fade_seconds = 0;
        behavior = {
          "Screensaver DP-1" = {
            action = "command";
            command = "kitty +kitten panel --edge=center --layer=overlay --focus-policy=exclusive --output-name=DP-1 -- drift --scene orrery --theme nord";
            enabled = true;
            resume_command = "pkill -f 'drift'";
            timeout = 600.0;
          };
          "Screensaver DP-2" = {
            action = "command";
            command = "kitty +kitten panel --edge=center --layer=overlay --focus-policy=exclusive --output-name=DP-2 -- drift --scene rain --theme nord";
            enabled = true;
            resume_command = "pkill -f 'drift'";
            timeout = 600.0;
          };
        };
      };
      lockscreen = {
        monitors = [ "DP-1" ];
        transition = [ "pixel" ];
        transition_duration = 500;
      };
      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;
        widget_order = [
          "lockscreen-widget-0000000000000002"
          "lockscreen-login-box@DP-1"
          "lockscreen-login-box@DP-2"
        ];
        grid = {
          cell_size = 8;
          major_interval = 4;
          visible = true;
        };
        widget = {
          "lockscreen-login-box@DP-1" = {
            box_height = 196.0;
            box_width = 720.0;
            cx = 1720.0;
            cy = 1321.0;
            output = "DP-1";
            placement_height = 1440.0;
            placement_width = 3440.0;
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_container";
              background_opacity = 0.88;
              background_radius = 12.0;
              center_password_text = false;
              input_opacity = 1.0;
              input_radius = 6.0;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = true;
              show_password_reveal = true;
              show_session_buttons = true;
              show_unlock_hint = true;
              show_weather = true;
            };
          };
          "lockscreen-login-box@DP-2" = {
            box_height = 196.0;
            box_width = 720.0;
            cx = 720.0;
            cy = 1440.0;
            output = "DP-2";
            placement_height = 1440.0;
            placement_width = 2560.0;
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_container";
              background_opacity = 0.88;
              background_radius = 12.0;
              center_password_text = false;
              input_opacity = 1.0;
              input_radius = 6.0;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = true;
              show_password_reveal = true;
              show_session_buttons = true;
              show_unlock_hint = true;
              show_weather = true;
            };
          };
          lockscreen-widget-0000000000000002 = {
            box_height = 1408.0;
            box_width = 3392.0;
            cx = 1720.0;
            cy = 720.0;
            output = "DP-1";
            placement_height = 1440.0;
            placement_width = 3440.0;
            rotation = 0.0;
            type = "fancy_audio_visualizer";
            settings = {
              background = false;
              bloom_intensity = 0.2;
              visualization_mode = "wave_rings";
            };
          };
        };
      };
      notification = {
        background_opacity = 1.0;
        monitors = [ "DP-1" ];
        position = "bottom_right";
      };
      osd = {
        background_opacity = 1.0;
        monitors = [ "DP-1" ];
        position = "bottom_right";
        position_vertical = "bottom_right";
      };
      shell = {
        avatar_path = "/home/blob/Pictures/hot-fred.png";
        corner_radius_scale = 1.5;
        font_family = "DejaVu Sans";
        password_style = "random";
        polkit_agent = true;
        show_close_buttons = false;
        launcher = {
          categories = false;
          default_view = "all";
          fetch_exchange_rates = false;
          layout = "simple";
          show_navigation_labels = false;
          show_session_button = false;
          show_settings_button = false;
          panels = {
            ignored = [
              "control-center"
              "launcher"
              "polkit"
              "session"
              "setup-wizard"
              "tray-drawer"
              "wallpaper"
              "clipboard"
              "test"
            ];
          };
          providers = {
            panels = {
              global = false;
            };
            session = {
              prefix = "sesh";
            };
          };
        };
        panel = {
          clipboard_placement = "attached";
          clipboard_position = "auto";
          launcher_categories = false;
          launcher_placement = "attached";
          open_near_click_control_center = true;
          polkit_placement = "attached";
          transparency_mode = "soft";
        };
        screenshot = {
          directory = "/home/blob/Pictures/Screenshots";
        };
        session = {
          actions = [
            {
              action = "lock";
              countdown_seconds = 0.0;
              enabled = true;
              shortcut = "l";
              variant = "default";
            }
            {
              action = "command";
              command = "systemctl hibernate";
              countdown_seconds = 2.0;
              enabled = true;
              glyph = "hibernate";
              label = "Hibernate";
              shortcut = "h";
              variant = "default";
            }
            {
              action = "lock_and_suspend";
              countdown_seconds = 2.0;
              enabled = true;
              label = "Suspend";
              shortcut = "s";
              variant = "default";
            }
            {
              action = "reboot";
              countdown_seconds = 2.0;
              enabled = true;
              shortcut = "r";
              variant = "default";
            }
            {
              action = "shutdown";
              countdown_seconds = 2.0;
              enabled = true;
              label = "Poweroff";
              shortcut = "p";
              variant = "destructive";
            }
            {
              action = "logout";
              countdown_seconds = 2.0;
              enabled = true;
              label = "Logout";
              shortcut = "l";
              variant = "default";
            }
          ];
        };
      };
      theme = {
        builtin = "Nord";
        custom_palette = "stylix";
        mode = "dark";
        source = "custom";
        templates = {
          enable_builtin_templates = false;
        };
      };
      wallpaper = {
        directory = "/home/blob/Pictures/Wallpapers";
        directory_dark = "/home/blob/Pictures/Wallpapers";
        directory_light = "/home/blob/Pictures/Wallpapers";
        fill_color = "on_primary";
        transition = [ "pixel" ];
        transition_on_startup = true;
        default = {
          path = "/nix/store/58m60l5if48sb93kb5gn81x7rv2jpvbn-wallpaper-dp1.png";
        };
      };
      widget = {
        audio_visualizer = {
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        bluetooth = {
          show_label = true;
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        caffeine = {
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        clipboard = {
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        clock = {
          format = "{:%d/%m/%y - %H:%M:%S}";
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        cpu = {
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        input_volume = {
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        launcher = {
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        media = {
          hide_artist = true;
          rotate_album_art = true;
          show_progress = true;
          show_tooltip = false;
          title_scroll = "on_hover";
          actions = {
            middle = "none";
          };
        };
        network = {
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        network_rx = {
          show_tooltip = false;
          visualization = "graph";
          actions = {
            middle = "none";
          };
        };
        network_tx = {
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        notifications = {
          hide_when_no_unread = true;
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        ram = {
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        session = {
          icon_color = "error";
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        spacer-20 = {
          capsule = false;
          type = "spacer";
        };
        sysmon = {
          show_tooltip = false;
          stat = "disk_free";
          actions = {
            middle = "none";
          };
        };
        tray = {
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        volume = {
          show_tooltip = false;
          actions = {
            middle = "none";
          };
        };
        workspaces = {
          focused_output_only = true;
          labels_only_when_occupied = true;
          show_all_outputs = true;
          show_tooltip = false;
          style = "focus_hint";
          actions = {
            middle = "none";
          };
        };
      };
    };
  };
}
