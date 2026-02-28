{
  services.udev.extraRules = ''
    # Moonlander — Oryx web flashing & live training
    KERNEL=="hidraw*", ATTRS{idVendor}=="3297", MODE="0664", GROUP="plugdev"

    # Moonlander — Legacy WebUSB (older firmware)
    SUBSYSTEM=="usb", ATTR{idVendor}=="3297", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTR{idVendor}=="3297", ATTR{idProduct}=="1969", GROUP="plugdev"

    # Moonlander — Keymapp / Wally flashing (STM32 DFU)
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE:="0666", SYMLINK+="stm32_dfu"

  '';
}
# Xbox
# SUBSYSTEM=="input", ATTRS{name}=="*Xbox*|*X-Box*", MODE="0666", ENV{ID_INPUT_JOYSTICK_="1"}

