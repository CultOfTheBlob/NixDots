{
  programs.nvf.settings.vim.binds.whichKey = {
    enable = true;

    setupOpts = {
      preset = "helix";

      replace = {
        "<leader>" = "SPACE";
      };

      spec = [
        {
          lhs = "<leader>e";
          icon = "󰙅";
        }

        {
          lhs = "<leader>l";
          icon = "󰿈";
        }

        {
          lhs = "<leader>p";
          group = "+Pick";
          icon = "";
        }
        {
          lhs = "<leader>pf";
          icon = "";
        }
        {
          lhs = "<leader>pb";
          icon = "";
        }

        {
          lhs = "<leader>c";
          group = "+Code Actions";
          icon = "";
        }

        {
          lhs = "<leader>s";
          group = "+Split";
          icon = "󰃻";
        }
        {
          lhs = "<leader>sv";
          group = "+Split";
          icon = "";
        }
        {
          lhs = "<leader>sh";
          group = "+Split";
          icon = "";
        }

        {
          lhs = "<leader>g";
          group = "+Git";
          icon = "";
        }

        {
          lhs = "<leader>d";
          group = "+Debug";
          icon = "";
        }

        {
          lhs = "<leader>bsi";
          hidden = true;
        }
      ];
    };
  };
}
