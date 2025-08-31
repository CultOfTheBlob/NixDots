{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "gdadd" ''
      CHECK=$(${pkgs.fd}/bin/fd --type=f --glob 'project.godot' .)
      if [ -n "$CHECK" ]; then
        EXCLUDE="'*.uid|*.import|Icons'"

        DIR=$(pwd)
        cd /home/blob/Projects/GodotComponents

        COMPONENTS=$(${pkgs.fd}/bin/fd --type=d --hidden --glob '.git' .)
        COMPONENTS=$(echo "$COMPONENTS" | grep -Ff <(fd flake.nix -tf . | sed 's|/flake.nix||'))
        COMPONENTS=$(echo "$COMPONENTS" | sed 's|/.git||' | sort -u)

        PREVIEW="${pkgs.eza}/bin/eza --tree --git-ignore --color=always --ignore-glob "$EXCLUDE" {}"
        SELECTED=$(echo "$COMPONENTS"Components | ${pkgs.fzf}/bin/fzf --preview "$PREVIEW")

        if [ -n "$SELECTED" ]; then
          cd "$SELECTED"

          COMPONENTS=$(fd --type=d --maxdepth=1 .)

          while true; do
            COMPONENT=$(echo "$COMPONENTS" | ${pkgs.fzf}/bin/fzf --preview "$PREVIEW")
            COMPONENTS=$(echo "$COMPONENTS" | grep -vxF "$COMPONENT" | sort -u)

            if [[ -z "$COMPONENT" ]]; then
              break
            fi

            cp -r "$COMPONENT" "$DIR"/Components
          done
        fi
      fi
    '')
  ];
}
