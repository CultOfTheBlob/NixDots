{
  programs.projman.templates.Rust = {
    dir_structure = [
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
    ];
    files = [
      {
        path = "flake.nix";
        content = builtins.readFile ./_files/flake.nix;
        tracked = false;
      }
      {
        path = "Cargo.toml";
        content = builtins.readFile ./_files/cargo.toml;
        tracked = false;
      }
      {
        path = "src/main.rs";
        content =
          /*
          rust
          */
          ''
            //!---

            use crate::prelude::*;

            mod error;
            mod prelude;
            mod utils;

            #[expect(clippy::unnecessary_wraps)]
            fn main() -> Result<()> {
                Ok(())
            }
          '';
        tracked = false;
      }
      {
        path = "src/error.rs";
        content =
          /*
          rust
          */
          ''
            #[derive(thiserror::Error, Debug)]
            pub enum Error {}
          '';
        tracked = false;
      }
      {
        path = "src/prelude.rs";
        content =
          /*
          rust
          */
          ''
            pub use crate::error::Error;

            pub type Result<T> = core::result::Result<T, Error>;
          '';
        tracked = false;
      }
      {
        path = "src/utils/mod.rs";
        content =
          /*
          rust
          */
          ''
            #[expect(unused_imports)]
            use crate::prelude::*;
          '';
        tracked = false;
      }
      {
        path = ".rgignore";
        content = ''
          *
          !src/
          !src/**
          !tests/
          !tests/**
        '';
        tracked = true;
      }
      {
        path = ".envrc";
        content = ''
          use flake
        '';
        tracked = true;
      }
      {
        path = ".gitignore";
        content = ''
          debug
          target
          **/*.rs.bk
          *.pdb
          **/mutants.out*/
          result
          .direnv
        '';
        tracked = true;
      }
      {
        path = ".justfile";
        content =
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

            push: build
              @git push
          '';
        tracked = true;
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
  };
}
