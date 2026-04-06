{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "nv" ''
      if [[ -f "project.godot" ]]; then
          rm -rf /tmp/godot.pipe
          neovide -- -n --listen /tmp/godot.pipe
      else
          neovide -- -n
      fi
    '')
  ];
}
