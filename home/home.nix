{ config, pkgs, inputs, lib, ... }:
{
  imports = [
    ./starship.nix
    ./nixvim.nix
    ./firefox.nix
    ./hyprland.nix
    ./waybar.nix
    ./launcher.nix
    inputs.hyprdock.homeManagerModules.hyprdock
  ];

  home.username = "jahn";
  home.homeDirectory = "/home/jahn";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    inter
    nerd-fonts.hack
    nixpkgs-fmt
    localsend
    spotify
    tree
    discord
    jellyfin-media-player
    kubectl
    k9s
    teams-for-linux
    ripgrep
    wl-clipboard
    hyprshot
    playerctl
    nwg-look
    syshud
    pavucontrol
    nwg-bar
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      filter_mode_shell_up_key_binding = "session";
    };
  };
  programs.eza = {
    enable = true;
    icons = "auto";
  };
  programs.git = {
    enable = true;
    userEmail = "jpdeoliveiraferreira@gmail.com";
    userName = "Jahn16";
    delta.enable = true;
  };
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    mouse = true;
    terminal = "tmux-256color";
    extraConfig = "set -ag terminal-overrides \",xterm-256color:RGB\"";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];
    tmuxinator.enable = true;
  };
  programs.direnv.enable = true;
  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
  };
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      background_opacity = 0.8;
      hide_window_decorations = true;
    };
  };
  programs.hyprdock = {
    enable = true;
    settings = {
      monitor_name = "eDP-1";
      default_external_mode = "mirror";
      enable_internal_monitor_command = {
        base = "hyprctl";
        args = [ "keyword" "monitor" "eDP-1, highres, auto, 1, mirror, HDMI-A-1" ];
      };
    };
  };
  programs.hyprlock = {
    enable = true;
  };
  programs.bat.enable = true;
  gtk = {
    enable = true;
    theme = {
      name = "Graphite-Dark";
      package = pkgs.graphite-gtk-theme;
    };
    iconTheme = {
      name = "BeautyLine";
      package = pkgs.beauty-line-icon-theme;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
