{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "nv" ''
      if [[ -f "project.godot" ]]; then
          rm -rf /tmp/godot.pipe
          nvim -n --listen /tmp/godot.pipe
      else
          nvim -n
      fi
    '')
  ];
}
