{
  programs.projman.templates.HaskellReanimate = {
    icon = ./icon.svg;

    dir_structure = [
      {
        name = "src";
        sub_dirs = [];
      }
    ];
    files = [
      {
        path = "flake.nix";
        contents = builtins.readFile ./_files/flake.nix;
      }
      {
        path = "#{name}.cabal";
        contents =
          /*
          haskell
          */
          ''
            name:               #{name}
            version:            0.1.0.0
            license:            #{license}
            license-file:       LICENSE
            build-type:         Simple
            cabal-version:      >=1.10
            extra-source-files: README.md

            executable animate
              hs-source-dirs:   src
              main-is:          Main.hs
              default-language: GHC2024
              build-depends:
                  base           >=4.7     && <5
                , JuicyPixels
                , linear
                , reanimate      >=1.1.3.1
                , reanimate-svg
                , text
          '';
      }
      {
        path = "stack.yaml";
        contents =
          /*
          yaml
          */
          ''
            resolver: lts-17.0

            allow-newer: false

            packages:
            - .

            extra-deps: []
          '';
      }
      {
        path = "src/Main.hs";
        contents =
          /*
          haskell
          */
          ''
            module Main (main) where

            import Reanimate

            main :: IO ()
            main = reanimate $ pause 1
          '';
      }
      {
        path = ".rgignore";
        contents = ''
          *
          !src/
          !src/**
        '';
      }
      {
        path = ".envrc";
        contents = ''
          use flake
        '';
      }
      {
        path = ".gitignore";
        contents = ''
          /dist-newstyle
          .direnv
        '';
      }
      {
        path = ".justfile";
        contents =
          /*
          just
          */
          ''
            default: view

            view:
              @cabal run animate -- view

            render:
              @cabal run animate -- render

            check:
              @cabal run animate -- check
          '';
      }
    ];
    build = [
      {
        program = "git";
        args = [
          "add"
          "-A"
        ];
      }
      {
        program = "nix";
        args = [
          "develop"
        ];
      }
      {
        program = "direnv";
        args = [
          "allow"
        ];
      }
    ];
    run = [
      {
        program = "kitty";
        args = [
          "--class"
          "console"
        ];
      }
      {
        program = "direnv";
        args = [
          "exec"
          "."
          "neovide"
          "--wayland_app_id"
          "editor"
        ];
      }
    ];
    included_paths = ["src"];
    excluded_paths = [];
  };
}
