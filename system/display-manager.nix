{ pkgs, ... }:
{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "sddm-astronaut-theme";
        package = pkgs.kdePackages.sddm;
        extraPackages = [ pkgs.sddm-astronaut ];
      };
      defaultSession = "hyprland";
    };
    xserver.xkb.layout = "us";
  };
  environment.systemPackages = [
    (pkgs.sddm-astronaut.override {
      themeConfig = {
        FormPosition = "left";
        Background = "Backgrounds/hyprland_kath.mp4";
        BackgroundPlaceholder = "Backgrounds/hyprland_kath.png";
        BackgroundSpeed = "1.0";
        HeaderTextColor = "#b4d8ff";
        DateTextColor = "#b4d8ff";
        TimeTextColor = "#b4d8ff";
        FormBackgroundColor = "#242455";
        BackgroundColor = "#242455";
        DimBackgroundColor = "#242455";
        LoginFieldBackgroundColor = "#111111";
        PasswordFieldBackgroundColor = "#111111";
        LoginFieldTextColor = "#b4d8ff";
        PasswordFieldTextColor = "#b4d8ff";
        UserIconColor = "#b4d8ff";
        PasswordIconColor = "#b4d8ff";
        PlaceholderTextColor = "#bbbbbb";
        WarningColor = "#b4d8ff";
        LoginButtonTextColor = "#000055";
        LoginButtonBackgroundColor = "#b4d8ff";
        SystemButtonsIconsColor = "#b4d8ff";
        SessionButtonTextColor = "#b4d8ff";
        VirtualKeyboardButtonTextColor = "#b4d8ff";
        DropdownTextColor = "#000055";
        DropdownSelectedBackgroundColor = "#b4d8ff";
        DropdownBackgroundColor = "#90b4ff";
        HighlightTextColor = "#000055";
        HighlightBackgroundColor = "#b4d8ff";
        HighlightBorderColor = "transparent";
        HoverUserIconColor = "#fcfcff";
        HoverPasswordIconColor = "#fcfcff";
        HoverSystemButtonsIconsColor = "#fcfcff";
        HoverSessionButtonTextColor = "#fcfcff";
        HoverVirtualKeyboardButtonTextColor = "#fcfcff";
        BlurMax = "8";
        Blur = "2.0";
        HaveFormBackground = "true";
        VirtualKeyboardPosition = "left";
        HideSystemButtons = "true";
      };
    })
  ];
}
