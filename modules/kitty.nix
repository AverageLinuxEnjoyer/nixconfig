{ config, pkgs, inputs, lib, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      # dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      background_opacity = lib.mkForce "0.6";

      map = "ctrl+backspace send_text all \\x17";
    };
  };
}
