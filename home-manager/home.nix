{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./rofi.nix
    ./waybar.nix
    ./starship.nix
    ./nixvim.nix
    ./gtk.nix
  ];
  home.username = "jahn";
  home.homeDirectory = "/home/jahn";
  home.stateVersion = "24.11";

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    librewolf
    spotube
    candy-icons
    bat
    ripgrep
    nixpkgs-fmt
    localsend
    wl-clipboard
    hyprshot
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };


  programs.kitty = {
    enable = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };
  programs.eza = {
    enable = true;
    icons = true;
  };
  services.blueman-applet.enable = true;
  programs.git = {
    enable = true;
    userEmail = "jpdeoliveiraferreira@gmail.com";
    userName = "Jahn16";
  };
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];
  };
  programs.direnv.enable = true;
  programs.wpaperd = {
    enable = true;
    settings = {
      DP-1 = {
        path = "/home/jahn/Pictures/Wallpapers";
      };
    };
  };
  programs.wlogout = {
    enable = true;
  };
}

