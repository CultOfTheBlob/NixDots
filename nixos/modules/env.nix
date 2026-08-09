{user, ...}: {
  environment.sessionVariables = {
    TERMINAL = "kitty";
    EDITOR = "neovide";
    BROWSER = "zen-beta";

    NIXOS_OZONE_WL = "1";

    QT_QPA_PLATFORM = "wayland";
    GODOT_WAYLAND_DISABLE_LIBDECOR = "1";

    NIRI_CONFIG = "/home/${user}/.config/niri/main.kdl";

    GTK_USE_PORTAL = "1";
  };
}
