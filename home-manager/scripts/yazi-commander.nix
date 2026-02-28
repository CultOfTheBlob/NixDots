{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "yazi-commander" ''
      hyprctl dispatch exec "[workspace 3] kitty --session <(cat <<'EOF'
      layout horizontal
      launch yazi
      launch yazi
      EOF
      )"
    '')
  ];
}
