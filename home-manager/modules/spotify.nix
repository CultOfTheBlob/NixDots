{
  inputs,
  pkgs,
  ...
}: {
  programs = {
    spotify-player = {
      enable = true;
    };

    spicetify = {
      enable = true;

      enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.extensions; [
        fullAppDisplay
        hidePodcasts
        adblock
      ];
    };
  };
}
