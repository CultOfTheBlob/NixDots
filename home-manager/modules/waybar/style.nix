{config, ...}: {
  programs.waybar = {
    style =
      /*
      css
      */
      ''
        * {
          font-family: "JetBrainsMono Nerd Font Propo";
          font-weight: bold;
          min-height: 0;
          font-size: 97%;
          font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        }

        window#waybar {
          transition-property: background-color;
          transition-duration: 0.5s;
          background: transparent;
          border-radius: 10px;
          border: 2px solid #${config.colors.base0D};
          padding-top: 4px;
          padding-bottom: 4px;
          padding-right: 8px;
          padding-left: 8px;
          background: #${config.colors.base00};
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        window#waybar.empty,
        window#waybar.empty #window {
            background-color: transparent;
            padding: 0px;
            border: 0px;
        }

        #taskbar button,
        #workspaces button {
          color: #${config.colors.base03};
          box-shadow: none;
          text-shadow: none;
            padding: 0px;
            border-radius: 9px;
            padding-left: 4px;
            padding-right: 4px;
            animation: gradient_f 20s ease-in infinite;
            transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.682);
        }

        #taskbar button:hover,
        #workspaces button:hover {
          border-radius: 10px;
          color: #${config.colors.base0E};
          background-color: #${config.colors.base03};
          padding-left: 2px;
            padding-right: 2px;
            animation: gradient_f 20s ease-in infinite;
            transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
        }

        #workspaces button.persistent {
          color: #${config.colors.base04};
          border-radius: 10px;
        }

        #taskbar button.active,
        #workspaces button.active {
          color: #${config.colors.base0D};
            border-radius: 10px;
            padding-left: 8px;
            padding-right: 8px;
            animation: gradient_f 20s ease-in infinite;
            transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
        }

        #workspaces button.urgent {
          color: #${config.colors.base0F};
          border-radius: 0px;
        }

        #battery,
        #bluetooth,
        #clock,
        #cpu,
        #disk,
        #memory,
        #mpris,
        #network,
        #pulseaudio,
        #pulseaudio-slider,
        #taskbar button,
        #taskbar,
        #temperature,
        #tray,
        #window,
        #workspaces,
        #custom-menu,
        #custom-power,
        #cava,
        #custom-bluetui,
        #custom-drop-term {
          padding-top: 4px;
          padding-bottom: 4px;
          padding-right: 6px;
          padding-left: 6px;
        }

        #custom-bluetui {
          color: #${config.colors.base09};
        }

        #custom-drop-term {
          color: #${config.colors.base09};
        }

        #battery {
          color: #${config.colors.base0A};
        }

        @keyframes blink {
          to {
            color: #${config.colors.base03};
          }
        }

        #battery.critical:not(.charging) {
          margin-top: 4px;
          margin-bottom: 4px;
          background-color: #${config.colors.base0F};
          border-radius: 4;
          color: #${config.colors.base0A};
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
          box-shadow: inset 0 -3px transparent;
        }

        #clock {
          color: #${config.colors.base0D};
        }

        #cpu {
          color: #${config.colors.base0A};
        }

        #memory {
          color: #${config.colors.base0A};
        }

        #disk {
          color: #${config.colors.base0A};
        }

        #temperature {
          color: #${config.colors.base0A};
        }

        #temperature.critical {
          margin-top: 4px;
          margin-bottom: 4px;
          border-radius: 4;
          background-color: #${config.colors.base0F};
        }

        #tray > .passive {
          -gtk-icon-effect: dim;
        }
        #tray > .needs-attention {
          -gtk-icon-effect: highlight;
        }

        #cava {
          color: #${config.colors.base0E};
        }

        #custom-menu {
          color: #${config.colors.base0D};
        }

        #custom-power {
          color: #${config.colors.base0F};
        }

        #pulseaudio {
          color: #${config.colors.base0E};
        }

        #pulseaudio.bluetooth {
          color: #${config.colors.base0D};
        }
        #pulseaudio.muted {
          color: #${config.colors.base0F};
        }

        #window {
          color: #${config.colors.base0B};
        }

        #mpris {
          color:#${config.colors.base0E};
        }

        #network {
          color: #${config.colors.base0B};
        }
        #network.disconnected,
        #network.disabled {
          color: #${config.colors.base02};
        }
        #pulseaudio-slider slider {
          min-width: 0px;
          min-height: 0px;
          opacity: 0;
          background-image: none;
          border: none;
          box-shadow: none;
        }

        #pulseaudio-slider trough {
          min-width: 80px;
          min-height: 5px;
          border-radius: 5px;
        }

        #pulseaudio-slider highlight {
          min-height: 10px;
          border-radius: 5px;
        }

        #backlight-slider slider {
          min-width: 0px;
          min-height: 0px;
          opacity: 0;
          background-image: none;
          border: none;
          box-shadow: none;
        }
      '';
  };
}
