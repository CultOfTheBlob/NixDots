{
  pkgs,
  lib,
  ...
}: {
  programs.nvf.settings.vim.lazy.plugins = {
    "nabla.nvim" = {
      package = pkgs.vimPlugins.nabla-nvim;

      before =
        /*
        lua
        */
        ''
          require("nvim-treesitter.configs"):setup(${
            lib.generators.toLua {}
            {
              ensure_installed = ["latex"];
              auto_install = true;
              sync_install = false;
            }
          })
        '';

      keys = [
        {
          key = "<leader>lp";
          mode = "n";
          action = ":lua require('nabla').popup({border = rounded})<CR>";
          desc = "Preview Latex";
        }
      ];
    };
  };
}
