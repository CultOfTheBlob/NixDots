{
  programs.projman.templates.GodotRust = {
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
          {
            name = "components";
            sub_dirs = [];
          }
          {
            name = "objects";
            sub_dirs = [];
          }
          {
            name = "scenes";
            sub_dirs = [];
          }
        ];
      }
      {
        name = "target";
        sub_dirs = [
          {
            name = "debug";
            sub_dirs = [];
          }
        ];
      }
      {
        name = "tests";
        sub_dirs = [];
      }
      {
        name = "bin";
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
        path = "src/lib.rs";
        contents =
          /*
          rust
          */
          ''
            //! `GDExtension` module.

            use godot::prelude::*;

            mod error;
            mod prelude;
            mod utils;

            struct GDExtension;

            ///SAFETY: This is a zero sized marker struct and thus always safe.
            #[gdextension]
            unsafe impl ExtensionLibrary for GDExtension {}
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

            #[expect(unused)]
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
        path = "src/components/mod.rs";
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
        path = "src/objects/mod.rs";
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
        path = "src/scenes/mod.rs";
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
        path = "project.godot";
        contents =
          /*
          toml
          */
          ''
            config_version=5

            [application]
              config/name="#{name}"
              config/features=PackedStringArray("4.6", "Forward Plus")

            [dotnet]
              project/assembly_name="#{name}"


            [file_customization]

            folder_colors={
            "res://assets/": "yellow",
              "res://bin/": "gray",
              "res://src/": "purple",
              "res://src/components/": "blue",
              "res://src/objects/": "teal",
              "res://src/scenes/": "red",
              "res://src/utils/": "orange",
              "res://tests/": "green"
            }
          '';
      }
      {
        path = "#{name}.gdextension";
        contents =
          /*
          toml
          */
          ''
            [configuration]
            entry_symbol = "gdext_rust_init"
            compatibility_minimum = 4.6
            reloadable = true

            [libraries]
            linux.debug.x86_64 =     "res://target/debug/lib#{name}.so"
            linux.release.x86_64 =   "res://target/release/lib#{name}.so"
            windows.release.x86_64 = "res://target/release/#{name}.dll"
            macos.release =          "res://target/release/lib#{name}.dylib"
            macos.release.arm64 =    "res://target/release/lib#{name}.dylib"
          '';
      }
      {
        path = "target/.gdignore";
        contents = "";
      }
      {
        path = ".rgignore";
        contents = ''
          *

          !src/
          !src/**

          src/**/*.*

          !*.rs
          !*.gd
          !*.gdshader
          !*.glsl
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
          .godot/
          .nomedia/
          .import/
          export.cfg
          export_credentials.cfg
          *.translation
          data_*/
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
            default:
              @cargo build

            fmt:
              @gdformat .
              @cargo fmt

            lint: fmt
              @gdlint .
              @cargo clippy -- -D warnings

            test: lint
              @cargo test

            build: test
              @cargo build
          '';
      }
      {
        path = "assets/godot_icon.svg";
        contents = builtins.readFile ./_files/godotIcon.svg;
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
          "exec"
          "."
          "just"
          "build"
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
        program = "godot4.6-mono";
        args = [
          "--editor"
          "--path ."
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
          "--"
          "--listen"
          "/tmp/godot.pipe"
        ];
      }
    ];
    included_paths = ["src" "tests"];
    excluded_paths = ["bin" ".godot" "target"];
  };
}
