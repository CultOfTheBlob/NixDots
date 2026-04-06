{
  description = "Rust development environment.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    naersk = {
      url = "github:nix-community/naersk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    naersk,
    rust-overlay,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      overlays = [(import rust-overlay)];
      pkgs = import nixpkgs {inherit system overlays;};
      naerskLib = pkgs.callPackage naersk {};
    in {
      packages.default = import ./nix/package.nix {inherit pkgs naerskLib;};

      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          (rust-bin.selectLatestNightlyWith (toolchain:
            toolchain.default.override {
              extensions = ["rust-src" "rust-analyzer" "rustfmt"];
            }))
          cargo
          clippy
          glib
        ];
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
          pkgs.wayland
          pkgs.libxkbcommon
          pkgs.libGL
          pkgs.mesa
          pkgs.vulkan-loader
        ];
        nativeBuildInputs = [pkgs.pkg-config];
        env.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
        shellHook = ''
          alias run="cargo run"
          alias add="cargo add"
          alias build="nix build"
        '';
      };
    })
    // (import ./nix/outputs.nix {inherit self;});
}
