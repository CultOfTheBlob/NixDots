{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs.nvf.lib.nvim.dag) entryAnywhere;
  qml-ls = inputs.qml-language-server.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  programs.nvf = {
    enable = true;

    settings.vim = {
      extraPackages = [qml-ls];

      theme = {
        enable = true;
        name = "nord";
      };

      globals = {
        mapleader = " ";
      };

      lineNumberMode = "relNumber";

      undoFile.enable = true;

      options = {
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
        mouse = "";
        clipboard = "unnamedplus";
        foldlevel = 99;
        foldlevelstart = 99;
      };

      autocmds = [
        {
          enable = true;

          desc = "Change tab width to 4 in c# file.";

          command = "setlocal tabstop=4 shiftwidth=4";
          event = ["FileType"];
          pattern = ["cs"];
        }

        {
          enable = true;

          desc = "Setup comments for gdshader.";

          command = "set commentstring=//%s";
          event = ["FileType"];
          pattern = ["gdshader"];
        }
      ];

      highlight = {
        LspInlayHint = {
          fg = "#5f6b95";
          italic = true;
        };
      };

      luaConfigRC = {
        lazydev =
          /*
          lua
          */
          ''
            local lsp = require("lazydev.lsp")
            local orig = lsp.supports
            lsp.supports = function(client)
              if client and client.name == "lua-language-server" then return true end
              return orig(client)
            end
          '';

        qml-lsp =
          entryAnywhere
          /*
          lua
          */
          ''
            vim.lsp.config("qml_ls", {
              cmd = { "qml-language-server" },
              filetypes = { "qml" },
              root_markers = { ".git", "qmldir" },
            })
            vim.lsp.enable("qml_ls")
          '';

        qml-indent =
          entryAnywhere
          /*
          lua
          */
          ''
            vim.api.nvim_create_autocmd("FileType", {
              pattern = "qml",
              callback = function()
                vim.bo.indentexpr = ""
                vim.bo.smartindent = true
              end
            })
          '';

        mini-pairs-rust =
          entryAnywhere
          /*
          lua
          */
          ''
            vim.api.nvim_create_autocmd("FileType", {
              pattern = "rust",
              callback = function()
                vim.keymap.set('i', "'", "'", { buffer = true, remap = false, silent = true })
              end,
            })
          '';

        # treesitter-indent = entryAnywhere ''
        #   vim.api.nvim_create_autocmd("FileType", {
        #     pattern = { "nix" },
        #     callback = function()
        #       local ts_indent = require("nvim-treesitter.indent")
        #       vim.bo.indentexpr = "v:lua.require'nvim-treesitter.indent'.get_indent(v:lnum)"
        #     end,
        #   })
        # '';
      };
    };
  };
}
