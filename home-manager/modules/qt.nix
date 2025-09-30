{lib, ...}: {
  qt = {
    enable = true;

    platformTheme = {
      name = "kde";
    };

    style = {
      name = "kvantum";
    };
  };

  xdg.configFile = {
    kdeglobals = {
      target = "kdeglobals";
      text = lib.generators.toINI {} {
        Icons.Theme = "Nordzy-dark";

        General = {
          TerminalApplication = "kitty";
        };

        KDE = {
          ShowDeleteCommand = false;
        };

        KFileDialog_Settings = {
          Allow_Expansion = false;
          Automatically_select_filename_extension = true;
          Breadcrumb_Navigation = true;
          Decoration_position = 2;
          LocationCombo_Completionmode = 5;
          PathCombo_Completionmode = 5;
          Show_Bookmarks = false;
          Show_Full_Path = false;
          Show_Inline_Previews = true;
          Show_Preview = false;
          Show_Speedbar = true;
          Show_hidden_files = false;
          Sort_by = "Name";
          Sort_directories_first = true;
          Sort_hidden_files_last = false;
          Sort_reversed = false;
          Speedbar_Width = 157;
          View_Style = "DetailTree";
        };

        PreviewSettings = {
          EnableRemoteFolderThumbnail = false;
          MaximumRemoteSize = 0;
        };
      };
    };

    kvantum = {
      target = "Kvantum/kvantum.kvconfig";
      text = lib.generators.toINI {} {
        General.theme = "Nordic-bluish";
      };
    };

    qt5ct = {
      target = "qt5ct/qt5ct.conf";
      text = lib.generators.toINI {} {
        Appearance = {
          icon_theme = "Nordzy-dark";
        };
      };
    };

    qt6ct = {
      target = "qt6ct/qt6ct.conf";
      text = lib.generators.toINI {} {
        Appearance = {
          icon_theme = "Nordzy-dark";
        };
      };
    };
  };
}
