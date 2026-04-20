{pkgs, ...}: {
  programs.nvf.settings.vim = {
    ui = {
      noice = {
        enable = true;

        setupOpts = {
          lsp = {
            override = {
              "cmp.entry.get_documentation" = true;
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
            };

            signature.enable = true;
          };

          presets = {
            bottom_search = true;
            command_palette = true;
            long_message_to_split = true;
            inc_rename = false;
            lsp_doc_border = false;
          };
        };
      };

      colorful-menu-nvim = {
        enable = true;
      };

      breadcrumbs.navbuddy = {
        enable = true;
      };

      nvim-ufo = {
        enable = true;

        setupOpts = {
          close_fold_kinds_for_ft = {
            default = ["comment"];
          };
        };
      };

      fastaction = {
        enable = true;
      };
    };

    notify.nvim-notify = {
      enable = true;

      setupOpts = {
        timeout = 100;
      };
    };

    lazy.plugins = {
      "tiny-glimmer.nvim" = {
        package = pkgs.vimPlugins.tiny-glimmer-nvim;

        setupModule = "tiny-glimmer";

        setupOpts = {
          enabled = true;

          overwrite = {
            auto_map = true;

            yank = {
              enabled = true;
              default_animation = "fade";
            };
            search = {
              enabled = true;
              default_animation = "pulse";

              next_mapping = "n";

              prev_mapping = "N";
            };
            paste = {
              enabled = true;
              default_animation = "reverse_fade";

              paste_mapping = "p";

              Paste_mapping = "P";
            };
            undo = {
              enabled = true;

              default_animation = {
                name = "fade";

                settings = {
                  from_color = "DiffDelete";

                  max_duration = 500;
                  min_duration = 500;
                };
              };
              undo_mapping = "u";
            };
            redo = {
              enabled = true;

              default_animation = {
                name = "fade";

                settings = {
                  from_color = "DiffAdd";

                  max_duration = 500;
                  min_duration = 500;
                };
              };

              redo_mapping = "<c-r>";
            };
          };
        };

        event = ["BufReadPost" "BufNewFile" "BufWritePre"];
      };
    };

    lazy.plugins = {
      "outline.nvim" = {
        package = pkgs.vimPlugins.outline-nvim;

        setupModule = "outline";

        setupOpts = {
          symbol_folding = {
            autofold_depth = false;
          };

          preview_window = {
            auto_preview = true;
          };
        };

        event = ["BufReadPost" "BufNewFile" "BufWritePre"];
      };
    };
  };
}
