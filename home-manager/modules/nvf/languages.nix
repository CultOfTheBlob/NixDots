{pkgs, ...}: {
  programs.nvf.settings.vim.languages = {
    enableTreesitter = true;
    enableDAP = true;
    enableFormat = true;
    enableExtraDiagnostics = true;

    nix = {
      enable = true;

      format = {
        type = ["alejandra"];
      };

      lsp = {
        enable = true;

        servers = ["nixd"];
      };
    };

    csharp = {
      enable = true;

      lsp = {
        enable = true;

        servers = ["roslyn_ls"];
      };
    };

    markdown = {
      enable = true;

      extensions = {
        markview-nvim = {
          enable = true;
        };
      };

      format = {
        enable = true;

        type = ["prettierd"];
      };

      lsp = {
        enable = true;

        servers = ["marksman"];
      };
    };

    python = {
      enable = true;

      lsp = {
        enable = true;

        servers = ["pyright"];
      };
    };

    clang = {
      enable = true;

      cHeader = true;

      lsp = {
        enable = true;

        servers = ["clangd"];
      };
    };

    rust = {
      enable = true;

      lsp = {
        enable = true;

        package = pkgs.rust-analyzer;
      };
    };
  };
}
