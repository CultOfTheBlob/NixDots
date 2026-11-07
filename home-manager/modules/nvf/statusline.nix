{
  programs.nvf.settings.vim.statusline = {
    lualine = {
      enable = true;

      integrations = {
        breadcrumbs.navbuddy = {
          enable = true;
        };
      };

      setupOpts = {
        options = {
          component_separator = {
            left = "";
            right = "";
          };

          section_separator = {
            left = "";
            right = "";
          };

          globalstatus = false;
        };

        sections = {
          lualine_a = [
            ''
              {
                "mode",
                icons_enabled = true,
                separator = {
                  left = "",
                  right = "",
                },
                right_padding = 2,
              }
            ''
          ];

          lualine_b = [
            ''
              {
                "filename",
                icons_enabled = true,
                separator = {
                  right = "",
                },
              }
            ''
            ''
              {
                "branch",
                icons_enabled = true,
                separator = {
                  right = "",
                },
              }
            ''
            ''
              {
                "diff",
                icons_enabled = true,
                separator = {
                  right = "",
                },
              }
            ''
          ];

          lualine_c = [
            ''
              {
                "%=",
                icons_enabled = true,
              }
            ''
            ''
              {
                "lsp_status",
                icons_enabled = true,
              }
            ''
            ''
              {
                "diagnostic",
                icons_enabled = true,
              }
            ''
          ];

          lualine_x = [ ];

          lualine_y = [
            ''
              {
                "filetype",
                icons_enabled = true,
                separator = {
                  left = "",
                },
              }
            ''
            ''
              {
                "filesize",
                icons_enabled = true,
                separator = {
                  left = "",
                },
              }
            ''
          ];

          lualine_z = [
            ''
              {
                "location",
                icons_enabled = true,
                separator = {
                  left = "",
                  right = "",
                },
                right_padding = 2,
              }
            ''
          ];
        };

        inactive_section = {
          lualine_a = [
            ''
              { "filename" }
            ''
          ];

          lualine_b = [
          ];

          lualine_c = [
          ];

          lualine_x = [
          ];

          lualine_y = [
          ];

          lualine_z = [
            ''
              { "location" }
            ''
          ];
        };
      };
    };
  };
}
