{
  programs.nvf.settings.vim.lsp = {
    enable = true;

    formatOnSave = true;

    lspkind = {
      enable = true;
    };

    lspsaga = {
      enable = true;

      setupOpts = {
        lightbulb = {
          enable = false;
        };
      };
    };

    null-ls = {
      enable = true;

      setupOpts = {
        debug = true;
      };
    };

    nvim-docs-view = {
      enable = true;

      setupOpts = {
        position = "right";
        width = 50;
      };

      mappings = {
        viewToggle = "<leader>cv";

        viewUpdate = null;
      };
    };

    lspconfig = {
      enable = true;

      sources = {
        gdscript =
          /*
          lua
          */
          ''
            vim.lsp.enable("gdscript")
          '';
        gdshader =
          /*
          lua
          */
          ''
            vim.lsp.enable("gdshader_lsp")
          '';
      };
    };

    mappings = {
      codeAction = "<leader>ca";
      format = "<leader>cf";
      goToDeclaration = "<leader>cD";
      goToDefinition = "<leader>cd";
      goToType = "<leader>ct";
      hover = "<leader>ch";
      listDocumentSymbols = "<leader>cS";
      listImplementations = "<leader>ci";
      listReferences = "<leader>cr";
      nextDiagnostic = "<leader>cn";
      openDiagnosticFloat = "<leader>ce";
      previousDiagnostic = "<leader>cp";
      renameSymbol = "<leader>cs";

      addWorkspaceFolder = null;
      documentHighlight = null;
      listWorkspaceSymbols = null;
      listWorkspaceFolders = null;
      removeWorkspaceFolder = null;
      signatureHelp = null;
      toggleFormatOnSave = null;
    };
  };
}
