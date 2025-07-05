{ pkgs, inputs, ... }:
{
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
                name = "Dash";
                url = "https://dash.jahn16.com/";
              }
              {
                name = "GitHub";
                url = "https://github.com/";
              }
              {
                name = "PUC";
                url = "https://pucminas.instructure.com";
              }
              {
                name = "Google";
                bookmarks = [
                  {
                    name = "Gmail";
                    url = "https://mail.google.com/";
                  }
                  {
                    name = "Sheets";
                    url = "https://sheets.google.com/";
                  }
                  {
                    name = "Drive";
                    url = "https://drive.google.com/";
                  }
                ];
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
          linkhints
          leechblock-ng
        ];
      };
      settings = {
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.sessionstore.resume_from_crash" = false;
        "extensions.autoDisableScopes" = 0;
        "signon.rememberSignons" = false;
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
          "Nix Options" = {
            urls = [{
              template = "https://search.nixos.org/options?query={searchTerms}";
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
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
