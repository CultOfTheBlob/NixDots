{
  pkgs,
  naerskLib,
}:
naerskLib.buildPackage {
  src = ../.;
  buildInputs = with pkgs; [glib openssl];
  nativeBuildInputs = with pkgs; [pkg-config makeWrapper];
  OPENSSL_NO_VENDOR = 1;
  postInstall = ''
    wrapProgram $out/bin/#{name} \
      --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath (with pkgs; [
      wayland
      libxkbcommon
      libGL
      mesa
      vulkan-loader
    ])}
  '';
}
