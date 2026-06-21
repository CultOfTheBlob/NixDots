{pkgs, ...}: {
  xdg.configFile.rustfmt = {
    target = "rustfmt/rustfmt.toml";

    source = (pkgs.formats.toml {}).generate "rustfmt.toml" {
      brace_style = "AlwaysNextLine";
      control_brace_style = "AlwaysNextLine";
    };
  };
}
