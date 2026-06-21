{
  description = "Odin development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            odin
            ols
            glsl_analyzer

            glfw

            just
          ];
        };

        OLS_BUILTIN_FOLDER = "./builtin/";

        packages.default = pkgs.stdenv.mkDerivation {
          pname = "odin-project";
          version = "0.1.0";
          src = ./src;

          buildInputs = [pkgs.odin];

          buildPhase = ''
            odin build . -out:app
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp app $out/bin/
          '';
        };
      }
    );
}
