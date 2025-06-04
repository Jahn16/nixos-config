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
    discord
    jellyfin-media-player
    kubectl
    k9s
    teams-for-linux
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

  programs.firefox = {
    enable = true;
    profiles.default = {
      bookmarks = {
        force = true;
        settings = [
          {
            toolbar = true;
            bookmarks = [
              {
                name = "GitHub";
                url = "https://github.com/";
              }
              {
                name = "PUC";
                url = "https://pucminas.instructure.com";
              }
            ];
          }
        ];
      };
      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          ublock-origin
          sponsorblock
          darkreader
          remove-youtube-s-suggestions
        ];
      };
      settings = {
        "extensions.autoDisableScopes" = 0;
      };
      search = {
        force = true;
        default = "SearXNG";
        engines = {
          "SearXNG" = {
            urls = [{
              template = "https://searxng.jahn16.com/search?q={searchTerms}";
            }];
            icon = "https://searxng.jahn16.com/favicon.ico";
            definedAliases = [ "@sx" ];
          };
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages?query={searchTerms}";
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "HomeManager Options" = {
            urls = [{
              template = "https://home-manager-options.extranix.com/?query={searchTerms}";
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@hm" ];
          };
          bing.metaData.hidden = true;
          ddg.metaData.hidden = true;
          wikipedia.metaData.hidden = true;
        };
        order = [ "SearXNG" "google" "Nix Packages" "HomeManager Options" ];
      };
    };
  };
}


