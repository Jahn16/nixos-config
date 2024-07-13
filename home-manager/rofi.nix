{config, pkgs, ...}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "drun,run,filebrowser,window";
      show-icons = true;
      display-drun = "";
      display-run = "";
      display-filebrowser = "";
      display-window = "";
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";

    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          font = "JetBrains Mono Nerd Font 10";
        };
        "*" = {
          background = mkLiteral "#1E1F29FF";
          background-alt = mkLiteral "#282A36FF";
          foreground = mkLiteral "#FFFFFFFF";
          selected = mkLiteral "#BD93F9FF";
          active = mkLiteral "#50FA7BFF";
          urgent = mkLiteral "#FF5555FF";
        };
        "*" = {
          border-colour = mkLiteral "var(selected)";
          handle-colour = mkLiteral "var(selected)";
          background-colour = mkLiteral "var(background)";
          foreground-colour = mkLiteral "var(foreground)";
          alternate-background = mkLiteral "var(background-alt)";
          normal-background = mkLiteral "var(background)";
          normal-foreground = mkLiteral "var(foreground)";
          urgent-background = mkLiteral "var(urgent)";
          urgent-foreground = mkLiteral "var(background)";
          active-background = mkLiteral "var(active)";
          active-foreground = mkLiteral "var(background)";
          selected-normal-background = mkLiteral "var(selected)";
          selected-normal-foreground = mkLiteral "var(background)";
          selected-urgent-background = mkLiteral "var(active)";
          selected-urgent-foreground = mkLiteral "var(background)";
          selected-active-background = mkLiteral "var(urgent)";
          selected-active-foreground = mkLiteral "var(background)";
          alternate-normal-background = mkLiteral "var(background)";
          alternate-normal-foreground = mkLiteral "var(foreground)";
          alternate-urgent-background = mkLiteral "var(urgent)";
          alternate-urgent-foreground = mkLiteral "var(background)";
          alternate-active-background = mkLiteral "var(active)";
          alternate-active-foreground = mkLiteral "var(background)";
        };

        "window" = {

          transparency = "real";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = mkLiteral "false";
          width = mkLiteral "600px";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";

          enabled = mkLiteral "true";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "@border-colour";
          cursor = "default";

          background-color = mkLiteral "@background-colour";

        };

        "mainbox" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "30px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px 0px 0px 0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "transparent";
          children = map mkLiteral [ "inputbar" "message" "listview" ];
        };

        "inputbar" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground-colour";
          children = map mkLiteral [ "textbox-prompt-colon" "entry" "mode-switcher" ];
        };

        "prompt" = {
          enabled = mkLiteral "true";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "textbox-prompt-colon" = {
          enabled = mkLiteral "true";
          padding = mkLiteral "5px 0px";
          expand = mkLiteral "false";
          str = "";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "entry" = {
          enabled = mkLiteral "true";
          padding = mkLiteral "5px 0px";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "text";
          placeholder = "Search...";
          placeholder-color = mkLiteral "inherit";
        };
        "num-filtered-rows" = {
          enabled = mkLiteral "true";
          expand = mkLiteral "false";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "textbox-num-sep" = {
          enabled = mkLiteral "true";
          expand = mkLiteral "false";
          str = "/";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "num-rows" = {
          enabled = mkLiteral "true";
          expand = mkLiteral "false";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "case-indicator" = {
          enabled = mkLiteral "true";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        "listview" = {
          enabled = mkLiteral "true";
          columns = mkLiteral "1";
          lines = mkLiteral "8";
          cycle = mkLiteral "true";
          dynamic = mkLiteral "true";
          scrollbar = mkLiteral "true";
          layout = mkLiteral "vertical";
          reverse = mkLiteral "false";
          fixed-height = mkLiteral "true";
          fixed-columns = mkLiteral "true";

          spacing = mkLiteral "5px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground-colour";
          cursor = "default";
        };
        "scrollbar" = {
          handle-width = mkLiteral "5px ";
          handle-color = mkLiteral "@handle-colour";
          border-radius = mkLiteral "10px";
          background-color = mkLiteral "@alternate-background";
        };

        "element" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "5px 10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground-colour";
          cursor = mkLiteral "pointer";
        };
        "element normal.normal" = {
          background-color = mkLiteral "var(normal-background)";
          text-color = mkLiteral "var(normal-foreground)";
        };
        "element normal.urgent" = {
          background-color = mkLiteral "var(urgent-background)";
          text-color = mkLiteral "var(urgent-foreground)";
        };
        "element normal.active" = {
          background-color = mkLiteral "var(active-background)";
          text-color = mkLiteral "var(active-foreground)";
        };
        "element selected.normal" = {
          background-color = mkLiteral "var(selected-normal-background)";
          text-color = mkLiteral "var(selected-normal-foreground)";
        };
        "element selected.urgent" = {
          background-color = mkLiteral "var(selected-urgent-background)";
          text-color = mkLiteral "var(selected-urgent-foreground)";
        };
        "element selected.active" = {
          background-color = mkLiteral "var(selected-active-background)";
          text-color = mkLiteral "var(selected-active-foreground)";
        };
        "element alternate.normal" = {
          background-color = mkLiteral "var(alternate-normal-background)";
          text-color = mkLiteral "var(alternate-normal-foreground)";
        };
        "element alternate.urgent" = {
          background-color = mkLiteral "var(alternate-urgent-background)";
          text-color = mkLiteral "var(alternate-urgent-foreground)";
        };
        "element alternate.active" = {
          background-color = mkLiteral "var(alternate-active-background)";
          text-color = mkLiteral "var(alternate-active-foreground)";
        };
        "element-icon" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          size = mkLiteral "24px";
          cursor = mkLiteral "inherit";
        };
        "element-text" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          highlight = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };

        "mode-switcher" = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground-colour";
        };
        "button" = {
          padding = mkLiteral "5px 10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "@alternate-background";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "pointer";
        };
        "button selected" = {
          background-color = mkLiteral "var(selected-normal-background)";
          text-color = mkLiteral "var(selected-normal-foreground)";
        };

        "message" = {
          enabled = mkLiteral "true";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px 0px 0px 0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground-colour";
        };
        "textbox" = {
          padding = mkLiteral "8px 10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "@alternate-background";
          text-color = mkLiteral "@foreground-colour";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
          highlight = mkLiteral "none";
          placeholder-color = mkLiteral "@foreground-colour";
          blink = mkLiteral "true";
          markup = mkLiteral "true";
        };
        "error-message" = {
          padding = mkLiteral "10px";
          border = mkLiteral "2px solid";
          border-radius = mkLiteral "10px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "@background-colour";
          text-color = mkLiteral "@foreground-colour";
        };
      };

  };
}
