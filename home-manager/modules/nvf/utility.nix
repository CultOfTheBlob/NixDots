{pkgs, ...}: {
  programs.nvf.settings.vim = {
    utility = {
      ccc = {
        enable = true;

        mappings = {
          decrease10 = "<H>";
          increase10 = "<L>";
          quit = "<Esc>";
        };
      };

      yanky-nvim = {
        enable = true;

        setupOpts = {
          ring.storage = "sqlite";
        };
      };
    };

    lazy.plugins = {
      "dial.nvim" = {
        package = pkgs.vimPlugins.dial-nvim;

        after =
          /*
          lua
          */
          ''
            local augend = require("dial.augend")
            require("dial.config").augends:register_group {
              default = {
                augend.integer.alias.decimal,
                augend.integer.alias.hex,
                augend.date.alias["%Y/%m/%d"],
                augend.constant.alias.bool,
                augend.constant.new{
                  elements = {"&&", "||"},
                  word = false,
                  cyclic = true,
                },
              },
            }
          '';

        keys = [
          {
            key = "<C-a>";
            mode = "n";
            action = ":lua require('dial.map').manipulate('increment', 'normal')<cr>";
          }
          {
            key = "<C-x>";
            mode = "n";
            action = ":lua require('dial.map').manipulate('decrement', 'normal')<cr>";
          }
          {
            key = "<C-a>";
            mode = "v";
            action = ":lua require('dial.map').manipulate('increment', 'visual')<cr>";
          }
          {
            key = "<C-x>";
            mode = "v";
            action = ":lua require('dial.map').manipulate('decrement', 'visual')<cr>";
          }
        ];
      };
    };
  };
}
