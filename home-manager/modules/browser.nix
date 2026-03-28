{
  inputs,
  pkgs,
  system,
  user,
  ...
}: {
  programs.floorp = {
    enable = true;

    package = pkgs.floorp-bin;

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
            uiCustomization = {
              horizontalTabsBackup = {
                currentVersion = 23;
                dirtyAreaCache = [
                  "nav-bar"
                  "TabsToolbar"
                  "vertical-tabs"
                  "nora-statusbar"
                  "PersonalToolbar"
                  "unified-extensions-area"
                  "toolbar-menubar"
                ];
                newElementCount = 0;
                placements = {
                  PersonalToolbar = [
                    "import-button"
                    "personal-bookmarks"
                  ];
                  TabsToolbar = [
                    "firefox-view-button"
                    "tabbrowser-tabs"
                    "new-tab-button"
                    "alltabs-button"
                  ];
                  nav-bar = [
                    "unified-extensions-button"
                    "undo-closed-tab"
                    "urlbar-container"
                    "vertical-spacer"
                    "forward-button"
                    "back-button"
                    "ublock0_raymondhill_net-browser-action"
                    "78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action"
                    "sidebar-button"
                    "workspaces-toolbar-button"
                  ];
                  nora-statusbar = [
                    "screenshot-button"
                    "fullscreen-button"
                    "status-text"
                  ];
                  toolbar-menubar = ["menubar-items"];
                  unified-extensions-area = [];
                  vertical-tabs = [];
                  widget-overflow-fixed-list = [];
                };
                seen = [
                  "undo-closed-tab"
                  "developer-button"
                  "workspaces-toolbar-button"
                  "screenshot-button"
                  "78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action"
                  "ublock0_raymondhill_net-browser-action"
                ];
              };
              horizontalTabstrip = [
                "tabbrowser-tabs"
                "alltabs-button"
              ];
              navBarWhenVerticalTabs = [
                "alltabs-button"
                "unified-extensions-button"
                "undo-closed-tab"
                "urlbar-container"
                "vertical-spacer"
                "forward-button"
                "back-button"
                "ublock0_raymondhill_net-browser-action"
                "78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action"
                "sidebar-button"
                "workspaces-toolbar-button"
              ];
            };
          };
        };
      };
    };
  };
}
