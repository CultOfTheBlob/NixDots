{
  pkgs,
  user,
  ...
}: {
  home.packages = [
    (pkgs.writeShellScriptBin "pj" ''
      EXCLUDE="'flake.nix|LICENSE|*.uid|*.import|Builds|media|Assets|target'"

      cd /home/${user}/Projects/

      PROJECTS=$(find . -type d -path '*/.git')

      PROJECTS=$(echo "$PROJECTS" | grep -Ff <( find . -type f -name 'flake.nix' | sed 's|/flake.nix||'))
      PROJECTS=$(echo "$PROJECTS" | sed 's|/.git||' | sort -u)

      PREVIEW="${pkgs.eza}/bin/eza --tree --git-ignore --color=always --ignore-glob "$EXCLUDE" {}"
      SELECTED=$(echo "$PROJECTS" | ${pkgs.fzf}/bin/fzf --preview "$PREVIEW")

      if [ -n "$SELECTED" ]; then
        cd "$SELECTED" || exit
        nix develop
      fi
    '')
  ];
}
