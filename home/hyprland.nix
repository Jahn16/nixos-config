{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$browser" = "firefox";
      monitor = [
        ", highres, auto, 1"
      ];
      exec-once = [ "waybar" "hyprdock --server" ];
      decoration = {
        rounding = 5;
      };
      windowrulev2 = [
        "opacity 0.80 0.80,class:^(kitty)$"
        "opacity 0.90 0.90,class:^(firefox)$"
      ];
      input = {
        kb_layout = "us,br";
        kb_options = "grp:win_space_toggle";
      };
      bind =
        [
          "$mod, Q, exec, $terminal"
          "$mod, W, exec, $browser"
          "$mod, C, killactive,"
          "$mod, M, exit,"
          "$mod, F, fullscreen, 1"
          "$mod, A, exec, walker --modules applications"
          # Screenshot
          ", PRINT, exec, hyprshot -m output"
          "$mod, PRINT, exec, hyprshot -m output"
          "$mod SHIFT, PRINT, exec, hyprshot -m region"
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
          "$mod+Shift+Ctrl, left, movewindow, l"
          "$mod+Shift+Ctrl, right, movewindow, r"
          "$mod+Shift+Ctrl, up, movewindow, u"
          "$mod+Shift+Ctrl, down, movewindow, d"
          # Audio Control
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          # Media Control
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList
            (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );

    };
  };
}
