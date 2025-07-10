{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      # inputs.hy3.packages.${pkgs.system}.hy3
      # pkgs.hyprlandPlugins.hy3
      # inputs.hyprchroma.packages.${pkgs.system}.Hypr-DarkWindow
    ];

    settings = {
      monitor = "eDP-1,2560x1440@120,0x0,1";

      exec-once = [
        "waybar"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      env = [
        "XCURSOR_SIZE,24"
      ];

      misc = {
        disable_hyprland_logo = "true";
      };

      input = {
        kb_layout = "us";

        follow_mouse = "1";

        touchpad = {
            natural_scroll = "no";
        };

        sensitivity = "0"; # -1.0 - 1.0, 0 means no modification.

        repeat_rate = 50;
        repeat_delay = 200;
      };

      general = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          gaps_in = "5";
          gaps_out = "20";
          border_size = "2";
          # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          # "col.inactive_border" = "rgba(595959aa)";

          # layout = "hy3";
      };

      decoration = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          rounding = "10";

          blur = {
            noise = 0;
            size = 14;
          };
          # blur = yes
          # blur_size = 24
          # blur_passes = 1
          # blur_new_optimizations = on

          # drop_shadow = "yes";
          # shadow_range = "4";
          # shadow_render_power = "3";
          # "col.shadow" = "rgba(1a1a1aee)";
          # screen_shader = '~/.config/hypr/shaders/retro.frag'
          # screen_shader = "$HOME/.config/hypr/shaders/blue_light_filter.frag"
      };

      layerrule = "blur,rofi";

      windowrulev2 = [
        "opacity 0.85 0.85,class:^(discord)$"
        "opacity 0.95 0.95,class:^(firefox)$"
        "opacity 0.95 0.95,class:^(teams)$"
        "opacity 0.90 0.90,class:^(Slack)$"
        "opacity 0.90 0.90,class:^(Insomnia)$"
        # "plugin:chromakey,fullscreen:0"
      ];

      # 25,25,27 -> probably gitlab
      # 49,51,56 -> discord
      # 30,33,38 -> slack
      # 36,18,40 -> slack 2
      # 14,17,19 -> reddit
      # chromakey_background = "25,25,27;49,51,56;30,33,38;36,18,40;14,17,19";
      # chromakey_background = "14,14,18";

      animations = {
          enabled = "yes";

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = "myBezier, 0.05, 0.9, 0.1, 1.00";

          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes"; # you probably want this
      };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, RETURN, exec, kitty ~"
        "$mainMod, Q, killactive, "
        "$mainMod, F, fullscreen"
        # "$mainMod, C, togglechromakey"

        # bind = $mainMod, V, togglefloating, 
        "$mainMod, R, exec, wofi --show drun"
        "$mainMod, S, togglesplit,"  # dwindle

        "$mainMod, P, exec, hyprshot -m region --silent --clipboard-only"
        "$mainMod SHIFT, P, exec, hyprshot -m region --silent --clipboard-only --freeze"

        # Move focus with mainMod + arrow keys
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 92"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 92"

        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"

        "$mainMod CTRL, H, resizeactive, -240 0"
        "$mainMod CTRL, L, resizeactive, 240 0"
        "$mainMod CTRL, K, resizeactive, 0 -240"
        "$mainMod CTRL, J, resizeactive, 0 240"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        "$mainMod, D, exec, rofi -show drun -show-icons"
        "$mainMod, T, exec, rofi -show window -show-icons"

        # mute, check binde for volume up and down
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # brightness
        ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
        ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
