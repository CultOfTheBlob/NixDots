{pkgs, ...}: {
  xdg.configFile.rustfmt = {
    target = "rustfmt/rustfmt.toml";

    source = (pkgs.formats.toml {}).generate "rustfmt.toml" {
      max_width = 90;
    };
  };
}
