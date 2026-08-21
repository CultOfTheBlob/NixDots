{
  programs.projman.templates.RustSlint = {
    icon = ./icon.svg;

    dir_structure = [
      {
        name = ".github";
        sub_dirs = [
          {
            name = "workflows";
            sub_dirs = [];
          }
        ];
      }
      {
        name = "assets";
        sub_dirs = [];
      }
      {
        name = "src";
        sub_dirs = [
          {
            name = "utils";
            sub_dirs = [];
          }
        ];
      }
      {
        name = "tests";
        sub_dirs = [];
      }
      {
        name = "ui";
        sub_dirs = [];
      }
    ];
    files = [
      {
        path = ".github/workflows/ci.yml";
        contents =
          /*
          yaml
          */
          ''

            name: CI

            on:
              push:
                branches: [ main ]
              pull_request:
                branches: [ main ]

            jobs:
              build:
                runs-on: ubuntu-latest

                steps:
                  - name: Checkout Code
                    uses: actions/checkout@v4

                  - name: Install Nix
                    uses: DeterminateSystems/nix-installer-action@v14

                  - name: Setup Cache
                    uses: DeterminateSystems/magic-nix-cache-action@v9

                  - name: Check Formatting
                    run: nix develop --command cargo fmt --check

                  - name: Lint
                    run: nix develop --command cargo clippy -- -D warnings

                  - name: Test
                    run: nix develop --command cargo test

                  - name: Build
                    run: nix build
          '';
      }
      {
        path = "flake.nix";
        contents = builtins.readFile ./_files/flake.nix;
      }
      {
        path = "Cargo.toml";
        contents = builtins.readFile ./_files/cargo.toml;
      }
      {
        path = "build.rs";
        contents =
          /*
          rust
          */
          ''
            //! Builds all slint ui components into rust code.
            #![allow(clippy::expect_used)]
            fn main() {
                slint_build::compile("ui/main-window.slint").expect("Slint build failed");
            }
          '';
      }
      {
        path = "src/main.rs";
        contents =
          /*
          rust
          */
          ''
            //!---
            #![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

            use crate::prelude::*;

            mod error;
            mod prelude;
            mod utils;


            #[allow(missing_docs, clippy::all, clippy::unwrap_used)]
            mod ui {
                slint::include_modules!();
            }
            pub use ui::*;

            #[expect(clippy::unnecessary_wraps)]
            fn main() -> Result<()> {
                Ok(())
            }
          '';
      }
      {
        path = "src/error.rs";
        contents =
          /*
          rust
          */
          ''
            #[derive(thiserror::Error, Debug)]
            pub enum Error {}
          '';
      }
      {
        path = "src/prelude.rs";
        contents =
          /*
          rust
          */
          ''
            pub use crate::error::Error;

            pub type Result<T> = core::result::Result<T, Error>;
          '';
      }
      {
        path = "src/utils/mod.rs";
        contents =
          /*
          rust
          */
          ''
            #[expect(unused_imports)]
            use crate::prelude::*;
          '';
      }
      {
        path = "ui/main-window.slint";
        contents =
          /*
          slint
          */
          ''
            export component MainWindow inherits Window {}
          '';
      }
      {
        path = ".rgignore";
        contents = ''
          *
          !src/
          !src/**
          !tests/
          !tests/**
          !ui/
          !ui/**
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
          debug
          target
          **/*.rs.bk
          *.pdb
          **/mutants.out*/
          result
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
            default: run

            run:
              @cargo run

            fmt:
              @cargo fmt

            lint: fmt
              @cargo clippy -- -D warnings

            test: lint
              @cargo test

            build: test
              @nix build
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
        program = "nix";
        args = [
          "develop"
          "--command"
          "cargo"
          "fmt"
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
    included_paths = ["src" "tests" "ui"];
    excluded_paths = ["target"];
  };
}
