{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.yazi = {
    enable = true;

    enableZshIntegration = true;

    shellWrapperName = "yy";

    flavors = {inherit (pkgs.yaziPlugins) nord;};

    plugins = with pkgs.yaziPlugins; {
      inherit
        nord
        yatline
        full-border
        yatline-githead
        wl-clipboard
        smart-enter
        rich-preview
        restore
        piper
        ouch
        git
        mount
        lazygit
        chmod
        mediainfo
        duckdb
        ;
    };

    theme = {
      flavor = {
        light = "nord";
        dark = "nord";
      };

      mgr = {
        border_style = {
          fg = "#${config.colors.base03}";
        };
      };
    };

    settings = {
      mgr = {
        ratio = [1 2 5];
      };

      tasks = {
        image_alloc = 1073741824;
      };

      opener = {
        extract = [
          {
            run = "ouch d -y $@";
            for = "unix";
          }
        ];
      };

      plugin = {
        prepend_previewers = [
          {
            name = "*/";
            run = "piper -- ${pkgs.eza}/bin/eza -TL=3 --color=always --icons=always --group-directories-first --no-quotes $1";
          }
          {
            name = "*.tar*";
            run = "piper -- ouch list --tree --gitignore $1";
          }
          {
            name = "*.md";
            run = "rich-preview";
          }
          {
            name = "*.rst";
            run = "rich-preview";
          }
          {
            name = "*.ipynb";
            run = "rich-preview";
          }
          {
            name = "*.csv";
            run = "duckdb";
          }
          {
            name = "*.tsv";
            run = "duckdb";
          }
          {
            name = "*.json";
            run = "duckdb";
          }
          {
            name = "*.parquet";
            run = "duckdb";
          }
          {
            name = "*.xlsx";
            run = "duckdb";
          }
          {
            name = "*.db";
            run = "duckdb";
          }
          {
            name = "*.duckdb";
            run = "duckdb";
          }
          {
            mime = "{audio,video,image}/*";
            run = "mediainfo";
          }
          {
            mime = "application/subrip";
            run = "mediainfo";
          }
          {
            mime = "application/postscript";
            run = "mediainfo";
          }
        ];

        prepend_preloaders = [
          {
            name = "*.csv";
            run = "duckdb";
            multi = false;
          }
          {
            name = "*.tsv";
            run = "duckdb";
            multi = false;
          }
          {
            name = "*.json";
            run = "duckdb";
            multi = false;
          }
          {
            name = "*.parquet";
            run = "duckdb";
            multi = false;
          }
          {
            name = "*.xlsx";
            run = "duckdb";
            multi = false;
          }
          {
            mime = "{audio,video,image}/*";
            run = "mediainfo";
          }
          {
            mime = "application/subrip";
            run = "mediainfo";
          }
          {
            mime = "application/postscript";
            run = "mediainfo";
          }
        ];

        prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
      };
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          on = "<C-y>";
          run = "plugin wl-clipboard";
        }
        {
          on = "l";
          run = "plugin smart-enter";
        }

        {
          on = "<C-l>";
          run = "shell --block -- bat --paging=always $0";
        }

        {
          on = "<C-]>";
          run = "tab_switch --relative +1";
        }
        {
          on = "<C-[>";
          run = "tab_switch --relative -1";
        }

        {
          on = "u";
          run = "plugin restore";
          desc = "undo";
        }

        {
          on = "C";
          run = "plugin ouch";
        }

        {
          on = "M";
          run = "plugin mount";
        }

        {
          on = ["g" "i"];
          run = "plugin lazygit";
          desc = "lazygit";
        }

        {
          on = ["D"];
          run = "shell --block -- diff -Naur $1 $0 | bat --paging=always";
          desc = "create diff";
        }

        {
          on = ["c" "m"];
          run = "plugin chmod";
          desc = "chmod selected files";
        }

        {
          on = "H";
          run = "plugin duckdb -1";
          desc = "scroll one column to the left";
        }
        {
          on = "L";
          run = "plugin duckdb +1";
          desc = "scroll one column to the right";
        }
      ];
    };

    initLua = with lib.generators;
    /*
    lua
    */
      ''
        require("yatline"):setup(${
          toLua {}
          {
            theme = mkLuaInline "require('nord'):setup()";

            show_background = false;

            header_line = {
              left = {
                section_a = [
                  {
                    type = "line";
                    custom = false;
                    name = "tabs";
                    params = ["left"];
                  }
                ];
                section_b = [];
                section_c = [];
              };
              right = {
                section_a = [
                  {
                    type = "coloreds";
                    custom = true;
                    name = [[" 󰇥 " "#3c3836"]];
                  }
                ];
                section_b = [
                  {
                    type = "coloreds";
                    custom = false;
                    name = "githead";
                  }
                ];
                section_c = [
                  {
                    type = "coloreds";
                    custom = false;
                    name = "count";
                  }
                ];
              };
            };

            status_line = {
              left = {
                section_a = [
                  {
                    type = "string";
                    custom = false;
                    name = "tab_mode";
                  }
                ];
                section_b = [
                  {
                    type = "string";
                    custom = false;
                    name = "hovered_size";
                  }
                ];
                section_c = [
                  {
                    type = "string";
                    custom = false;
                    name = "hovered_path";
                  }
                  {
                    type = "coloreds";
                    custom = false;
                    name = "count";
                  }
                ];
              };
              right = {
                section_a = [
                  {
                    type = "string";
                    custom = false;
                    name = "cursor_position";
                  }
                ];
                section_b = [
                  {
                    type = "string";
                    custom = false;
                    name = "cursor_percentage";
                  }
                ];
                section_c = [
                  {
                    type = "string";
                    custom = false;
                    name = "hovered_file_extension";
                    params = [true];
                  }
                  {
                    type = "coloreds";
                    custom = false;
                    name = "permissions";
                  }
                ];
              };
            };
          }
        })

        require("full-border"):setup(${
          toLua {}
          {
            type = mkLuaInline "ui.Border.ROUNDED";
          }
        })

        require("yatline-githead"):setup(${
          toLua {}
          {
            show_branch = true;
            branch_prefix = "on";
            prefix_color = "white";
            branch_color = "blue";
            branch_symbol = "";
            branch_borders = "()";

            commit_color = "bright magenta";
            commit_symbol = "@";

            show_behind_ahead = true;
            behind_color = "bright magenta";
            behind_symbol = "⇣";
            ahead_color = "bright magenta";
            ahead_symbol = "⇡";

            show_stashes = true;
            stashes_color = "bright magenta";
            stashes_symbol = "$";

            show_state = true;
            show_state_prefix = true;
            state_color = "red";
            state_symbol = "~";

            show_staged = true;
            staged_color = "bright yellow";
            staged_symbol = "+";

            show_unstaged = true;
            unstaged_color = "bright yellow";
            unstaged_symbol = "!";

            show_untracked = true;
            untracked_color = "blue";
            untracked_symbol = "?";
          }
        })

        require("smart-enter"):setup(${
          toLua {}
          {
            open_multi = true;
          }
        })

        require("restore"):setup(${
          toLua {}
          {
            show_confirm = false;

            theme = {
              title = "#${config.colors.base08}";
              header = "#${config.colors.base0B}";
              header_warning = "#${config.colors.base0A}";

              list_item = {
                odd = "#${config.colors.base08}";
                even = "#${config.colors.base08}";
              };
            };
          }
        })

        require("git"):setup(${
          toLua {}
          {
            "th.git.modified_sign" = "";
            "th.git.added_sign" = "";
            "th.git.untracked_sign" = "";
            "th.git.ignored_sign" = "";
            "th.git.deleted_sign" = "";
            "th.git.updated_sign" = "󰚰";
          }
        })

        require("duckdb"):setup(${
          toLua {}
          {
            mode = "summarized";
            cache_size = 1000;
            row_id = "dynamic";
            minmax_column_width = 21;
            culomn_fit_fator = 10.0;
          }
        })
      '';
  };
}
