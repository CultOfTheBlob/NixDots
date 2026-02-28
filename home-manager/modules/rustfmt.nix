{
  xdg.configFile.rustfmt = {
    target = "rustfmt/rustfmt.toml";

    text = ''
      brace_style = "AlwaysNextLine"
      control_brace_style = "AlwaysNextLine"
    '';
  };
}
