{
  pkgs,
  nvim-dev,
}:
pkgs.mkShell {
  name = "nvim-plugin-dev";

  packages = with pkgs; [
    nvim-dev
    just
  ];
}
