{
  programs.niri.settings.animations = {
    enable = true;

    window-open.kind.spring = {
      damping-ratio = 0.75;
      stiffness = 600;
      epsilon = 0.0001;
    };
    window-close.kind.spring = {
      damping-ratio = 0.75;
      stiffness = 600;
      epsilon = 0.0001;
    };
    window-movement.kind.spring = {
      damping-ratio = 0.8;
      stiffness = 600;
      epsilon = 0.0001;
    };
    window-resize.kind.spring = {
      damping-ratio = 0.8;
      stiffness = 600;
      epsilon = 0.0001;
    };
    horizontal-view-movement.kind.spring = {
      damping-ratio = 0.8;
      stiffness = 600;
      epsilon = 0.0001;
    };
    workspace-switch.kind.spring = {
      damping-ratio = 0.8;
      stiffness = 600;
      epsilon = 0.0001;
    };
    overview-open-close.kind.spring = {
      damping-ratio = 0.8;
      stiffness = 600;
      epsilon = 0.0001;
    };
  };
}
