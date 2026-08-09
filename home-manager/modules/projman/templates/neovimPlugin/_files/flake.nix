{
  description = "Neovim plugin development environment.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};

      testRc =
        pkgs.writeText "nvim-dev-init.lua"
        /*
        lua
        */
        ''
          vim.opt.rtp:prepend(".")
          require("#{name}").setup({})
        '';

      nvim-dev = pkgs.writeShellScriptBin "nvim-dev" ''
        exec ${pkgs.neovim}/bin/nvim -u ${testRc} "$@"
      '';
    in {
      packages.default = pkgs.vimUtils.buildVimPlugin {
        pname = "#{name}.nvim";
        version = self.shortRev or "dev";
        src = self;
      };

      devShells.default = pkgs.mkShell {
        name = "nvim-plugin-dev";

        packages = with pkgs; [
          nvim-dev
          just
        ];
      };
    });
}
