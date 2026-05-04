{
  inputs,
  system,
  user,
  ...
}: {
  programs.zen-browser = {
    enable = true;

    policies = {
      DefaultDownloadDirectory = "/home/${user}/Downloads/";

      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisableSystemAddonUpdate = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = false;
        Fingerprinting = true;
        EmailTracking = false;
      };
    };

    profiles = {
      ${user} = {
        id = 0;
        isDefault = true;

        bookmarks = {
          force = true;

          settings = [
            {
              name = "monkeytype";
              tags = ["monkeytype"];
              keyword = "type";
              url = "https://monkeytype.com";
            }
            {
              name = "noogle";
              tags = ["nix"];
              keyword = "noogle";
              url = "https://noogle.dev";
            }
          ];
        };

        extensions = {
          packages = with inputs.firefox-addons.packages.${system}; [
            proton-pass
            ublock-origin
            kristofferhagen-nord-theme
            darkreader
          ];
        };

        search = {
          force = true;

          default = "ddg";
        };

        settings = {
          browser = {
            ai = {
              control = {
                default = "blocked";
                linkPreviewKeyPoints = "blocked";
                pdfjsAltText = "blocked";
                sidebarChatbot = "blocked";
                smartTabGroups = "blocked";
                translations = "blocked";
              };
            };
            ctrlTab = {sortByRecentlyUsed = true;};
            ml = {chat = {enabled = false;};};
            startup = {
              couldRestoreSession = {count = 2;};
              page = 3;
            };
            tabs = {allow_transparent_browser = false;};
            toolbars = {bookmarks = {visibility = "never";};};
          };
        };
      };
    };
  };
}
