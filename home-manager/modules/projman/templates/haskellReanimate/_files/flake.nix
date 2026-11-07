{
  description = "Haskell development environment for Reanimate.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        hpkgs = pkgs.haskellPackages;

        haskellApp = hpkgs.callCabal2nix "#{name}" ./. { };

        systemDeps = with pkgs; [
          ffmpeg-full
          librsvg
          povray
          potrace
          (texliveSmall.withPackages (
            ps: with ps; [
              dvisvgm
              preview
              amsmath
              babel
              ctex
              standalone
              type1cm
              cm
              gensymb
            ]
          ))
        ];
      in
      {
        packages.default = haskellApp;

        devShells.default = hpkgs.shellFor {
          packages = _: [ haskellApp ];

          nativeBuildInputs =
            with hpkgs;
            [
              stack
              cabal-install
              haskell-language-server
              ghcid
              fourmolu
            ]
            ++ systemDeps;

          buildInputs = with pkgs; [ just ] ++ systemDeps;

          withHoogle = true;
        };
      }
    );
}
