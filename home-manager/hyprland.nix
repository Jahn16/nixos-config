{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$browser" = "librewolf";
      monitor = [
        "DP-1,1920x1080@144,0x0,1"
        "Unknown-1,disable"
      ];
      exec-once = [ "waybar" "wpaperd -d" ];
      windowrulev2 = [
        "opacity 0.80 0.80,class:^(kitty)$"
        "opacity 0.90 0.90,class:^(librewolf)$"
      ];
      bind =
        [
          "$mod, Q, exec, $terminal"
          "$mod, W, exec, $browser"
          "$mod, C, killactive,"
          "$mod, M, exit,"
          "$mod, F, fullscreen, 1"
          "$mod, A, exec, rofi -show drun"
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
