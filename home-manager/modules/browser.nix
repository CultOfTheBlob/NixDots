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
          ];
        };

        extensions = {
          packages = with inputs.firefox-addons.packages.${system}; [
            proton-pass
            ublock-origin
            kristofferhagen-nord-theme
          ];
        };

        search = {
          force = true;

          default = "ddg";
        };

        settings = {
          browser = {
            startup.page = 3;
            startup.couldRestoreSession.count = 2;
            ctrlTab.sortByRecentlyUsed = true;
            ml.chat.enabled = false;
            tabs.allow_transparent_browser = false;
          };

          toolkit.legacyUserProfileCustomizations.stylesheets = true;
          svg.context-properties.content.enabled = true;

          widget.transparent-windows = true;

          "widget.windows.mica" = true;
          "widget.windows.mica.extra" = true;
          "widget.windows.mica.popups" = 2;
          "widget.windows.mica.toplevel-backdrop" = 2;
          "widget.macos.titlebar-blend-mode.behind-window" = true;

          font.name = {
            monospace.x-western = "JetBrainsMono Nerd Font Mono";
            sans-serif.x-western = "DejaVu Sans";
            serif.x-western = "DejaVu Serif";
          };

          sidebar = {
            verticalTabs = true;
            animation.enabled = true;
            main.tools = ["history" "bookmarks"];
          };

          browser.toolbars.bookmarks.visibility = "never";

          browser.uiCustomization.horizontalTabsBackup = {
            placements = {
              widget-overflow-fixed-list = [];
              unified-extensions-area = [];
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
              toolbar-menubar = ["menubar-items"];
              TabsToolbar = [
                "firefox-view-button"
                "tabbrowser-tabs"
                "new-tab-button"
                "alltabs-button"
              ];
              vertical-tabs = [];
              PersonalToolbar = [
                "import-button"
                "personal-bookmarks"
              ];
              nora-statusbar = [
                "screenshot-button"
                "fullscreen-button"
                "status-text"
              ];
            };
            seen = [
              "undo-closed-tab"
              "developer-button"
              "workspaces-toolbar-button"
              "screenshot-button"
              "78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action"
              "ublock0_raymondhill_net-browser-action"
            ];
            dirtyAreaCache = [
              "nav-bar"
              "TabsToolbar"
              "vertical-tabs"
              "nora-statusbar"
              "PersonalToolbar"
              "unified-extensions-area"
              "toolbar-menubar"
            ];
            currentVersion = 23;
            newElementCount = 0;
          };

          browser.uiCustomization.horizontalTabstrip = [
            "tabbrowser-tabs"
            "alltabs-button"
          ];

          browser.uiCustomization.navBarWhenVerticalTabs = [
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

          signon.rememberSignons = false;

          floorp = {
            browser = {
              deletedWidgets = [];
              splitView.working = false;
              ssb.config = {
              };
              showToolbar = true;
              ssb.enabled = true;
              tabs.openNewTabPosition = 1;
              welcome.page.shown = true;
            };

            design.configs = {
              globalConfigs = {
                faviconColor = false;
                userInterface = "lepton";
                appliedUserJs = "";
              };
              tabbar = {
                tabbarStyle = "horizontal";
                tabbarPosition = "default";
                multiRowTabBar = {
                  maxRowEnabled = false;
                  maxRow = 3;
                };
              };
              tab = {
                tabScroll = {
                  enabled = true;
                  reverse = false;
                  wrap = true;
                };
                tabMinHeight = 30;
                tabMinWidth = 76;
                tabPinTitle = false;
                tabDubleClickToClose = false;
                tabOpenPosition = 1;
              };
              uiCustomization = {
                navbar = {
                  position = "top";
                  searchBarTop = false;
                };
                display = {
                  disableFullscreenNotification = true;
                  deleteBrowserBorder = true;
                  hideUnifiedExtensionsButton = false;
                };
                special = {
                  optimizeForTreeStyleTab = false;
                  hideForwardBackwardButton = false;
                  stgLikeWorkspaces = true;
                };
                multirowTab = {
                  newtabInsideEnabled = false;
                };
                bookmarkBar = {
                  focusExpand = false;
                };
                qrCode = {
                  disableButton = true;
                };
                disableFloorpStart = false;
              };
            };

            keyboardshortcut.config = {
              enabled = true;
              shortcuts = {};
            };

            keyboardshortcut.enabled = true;
          };

          floorp.mousegesture.config = {
            enabled = false;
            sensitivity = 40;
            showTrail = true;
            showLabel = true;
            trailColor = "#37ff00";
            trailWidth = 6;
            contextMenu = {
              minDistance = 5;
              preventionTimeout = 200;
            };
            actions = [
              {
                pattern = ["left"];
                action = "gecko-back";
              }
              {
                pattern = ["right"];
                action = "gecko-forward";
              }
              {
                pattern = ["up" "down"];
                action = "gecko-reload";
              }
              {
                pattern = ["down" "right"];
                action = "gecko-close-tab";
              }
              {
                pattern = ["down" "up"];
                action = "gecko-open-new-tab";
              }
              {
                pattern = ["up"];
                action = "gecko-scroll-to-top";
              }
              {
                pattern = ["down"];
                action = "gecko-scroll-to-bottom";
              }
              {
                pattern = ["left" "down"];
                action = "gecko-scroll-up";
              }
              {
                pattern = ["right" "down"];
                action = "gecko-scroll-down";
              }
            ];
          };
          floorp.mousegesture.enabled = false;

          floorp.panelSidebar.config = {
            globalWidth = 400;
            autoUnload = false;
            position_start = true;
            displayed = true;
            webExtensionRunningEnabled = false;
          };

          floorp.panelSidebar.data = {
            data = [
              {
                id = "default-panel-bookmarks";
                type = "static";
                width = 0;
                url = "floorp//bookmarks";
              }
              {
                id = "default-panel-history";
                type = "static";
                width = 0;
                url = "floorp//history";
              }
              {
                id = "default-panel-downloads";
                type = "static";
                width = 0;
                url = "floorp//downloads";
              }
              {
                id = "default-panel-notes";
                type = "static";
                width = 0;
                url = "floorp//notes";
              }
              {
                id = "default-panel-translate-google-com";
                type = "web";
                width = 0;
                url = "https://translate.google.com";
                userContextId = null;
                zoomLevel = null;
              }
              {
                id = "default-panel-docs-floorp-app";
                type = "web";
                width = 0;
                url = "https://docs.floorp.app/docs/features/";
                userContextId = null;
                zoomLevel = null;
              }
            ];
          };

          floorp.panelSidebar.enabled = false;

          floorp.startup.oldVersion = "143.0.1@12.2.0";

          floorp.workspaces.enabled = true;

          floorp.workspaces.v4.config = {
            manageOnBms = false;
            showWorkspaceNameOnToolbar = true;
            closePopupAfterClick = false;
          };

          floorp.workspaces.v4.store = {
            defaultID = "82445e2e-70c8-45cc-8450-3bbaf6cc7b3d";
            data = [
              [
                "82445e2e-70c8-45cc-8450-3bbaf6cc7b3d"
                {
                  name = "Main";
                  icon = "Fingerprint";
                  userContextId = 0;
                }
              ]
            ];
            order = ["82445e2e-70c8-45cc-8450-3bbaf6cc7b3d"];
          };

          floorp.newtab.configs = {
            components = {
              topSites = false;
              clock = false;
              searchBar = false;
            };
            background = {
              type = "custom";
              customImage =
                "data:image/jpeg;base64,"
                + (builtins.readFile (pkgs.runCommand "browser-wallpaper.b64" {} ''
                  base64 -w 0 ${./assets/browser-wallpaper.png} > $out
                ''));
            };
          };
        };
      };
    };
  };
}
