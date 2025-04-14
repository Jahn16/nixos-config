{ config, pkgs, inputs, lib, ... }:
{
  imports = [
    ./starship.nix
    ./nixvim.nix
  ];

  home.username = "jahn";
  home.homeDirectory = "/home/jahn";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    nerd-fonts.hack
    nixpkgs-fmt
    localsend
    spotify
    tree
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
  programs.eza = {
    enable = true;
    icons = "auto";
  };
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
    tmuxp.enable = true;
  };
  programs.direnv.enable = true;
  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
}

