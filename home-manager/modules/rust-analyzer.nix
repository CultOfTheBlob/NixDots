{pkgs, ...}: {
  xdg.configFile.rust-analyzer = {
    target = "rust-analyzer/rust-analyzer.toml";

    source = (pkgs.formats.toml {}).generate "rust-analyzer.toml" {
      inlayHints = {
        closingBraceHints.enable = false;
      };
    };
  };
}
