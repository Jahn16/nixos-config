{ config, pkgs, inputs, lib, ... }:
{
  imports = [
    ./starship.nix
    ./nixvim.nix
    ./firefox.nix
    ./hyprland.nix
    ./waybar.nix
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
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
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

}
