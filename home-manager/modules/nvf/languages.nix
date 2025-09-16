{pkgs, ...}: {
  programs.nvf.settings.vim.languages = {
    enableTreesitter = true;
    enableDAP = true;
    enableFormat = true;
    enableExtraDiagnostics = true;

    nix = {
      enable = true;

      format = {
        type = "alejandra";
      };

      lsp = {
        enable = true;

        server = "nixd";
      };
    };

    csharp = {
      enable = true;

      lsp = {
        enable = true;

        server = "omnisharp";
        package = pkgs.omnisharp-roslyn;
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

        type = "prettierd";
      };

      lsp = {
        enable = true;

        server = "marksman";
      };
    };

    python = {
      enable = true;

      lsp = {
        enable = true;

        server = "pyright";
      };
    };

    clang = {
      enable = true;

      cHeader = true;

      lsp = {
        enable = true;

        server = "clangd";
      };
    };
  };
}
